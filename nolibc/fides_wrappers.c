#include <stdlib.h>
#include <stdio.h>
#include <fides/wrappers.h>
#include <stdlib.h>
#include <stdio.h>

#define IV 0xdeadbeef1ee7c0d3;

#define NUM_ENTRIES 64*1024
#define FIDES_NO_INDEX (NUM_ENTRIES)      /* returned when the table is full */

extern uint64_t __fides_bounds_table[NUM_ENTRIES*2];
extern uint64_t max_index;                /* defined in startup_2.c */
uint64_t next_free_index = 0;

// __int128 saferealloc(__int128 fpr, unsigned long new_sz){
// 	// printf("Realloc got size %lu, pointer %llx\n", new_sz,(unsigned long long)fpr);
// 	new_sz += 8;
// 	register void* ptr_high = (void*)(fpr>>64);
// 	__asm__ __volatile__("val %0, %1" : : "r" (ptr_high), "r" (fpr));
// 	void *ptr = (void *)((unsigned long long)fpr & 0xffffffff);
// 	ptr = ptr - 8;
// 	register void *ptr_new = realloc(ptr, new_sz);
// 	register unsigned long long cook_hash;
// 	__asm__ __volatile__("hash %0, %1" : "=r" (cook_hash) : "r" (ptr_new));
// 	__int128 ret = craft((unsigned int)(ptr_new+8), (unsigned int)ptr_new, (unsigned int)(ptr_new+new_sz), cook_hash);
// 	return ret;
// }

static inline void* craft_fides_pointer(uint64_t ptr, uint64_t index, uint64_t temporal_id)
{
	// printf("Called craft ptr = %x, base = %x, bound = %x, id = %x\n",ptr, base, bound, id);
	uint64_t metadata = (index << 16) + (temporal_id & 0xffff);
	uint64_t fides_ptr = (metadata << 32) + ptr;
	return (void*)fides_ptr;
}

/* Take the next free metadata slot.

   Lifted out of __fides_malloc unchanged so that globals can come through
   the same door. Boot calls this once per global before any allocation
   happens, so globals and the heap share one cursor and one free list and
   two live objects can never be handed the same index. Nothing has to be
   reserved for globals and no caller has to skip over anyone else's slots.

   A free slot holds either a link to the next free one, or zero if it has
   never been used; an occupied slot holds a base address in its high half.
   That is the rule __fides_free writes and the hardware reads. */
uint64_t __fides_alloc_index(void)
{
	/* TEMPORARY (FIDES-RESERVE-INDEX0): keep index 0 free for untagged pointers. */
	if(max_index == 0){
		max_index = 1;
		next_free_index = 1;
	}

	uint64_t index = next_free_index;

	if(index >= NUM_ENTRIES){
		return FIDES_NO_INDEX;
	}

	uint64_t link = __fides_bounds_table[index*2];

	if((link == 0) && (index == max_index)){
		max_index++;
		next_free_index = max_index;
	}
	else{
		next_free_index = link;
	}
	return index;
}

/* nolibc's stdlib.h does not declare memalign; dlmalloc defines it unprefixed. */
extern void *memalign(size_t alignment, size_t n);

/* Give a block from the underlying allocator a metadata slot and return the
   fat pointer to it. Every FIDES allocator ends here, so a heap object is
   tagged the same way whichever call made it.

   A null block is passed straight through: tagging it would write a table
   entry whose high half is zero, which reads back as "free" and corrupts
   the free list. */
static void* fides_tag(void *ptr, uint64_t s)
{
	if(ptr == 0){
		return ptr;
	}

	uint64_t index = __fides_alloc_index();
	if(index == FIDES_NO_INDEX){
		return ptr;              /* unprotected, but correct */
	}

	/* hash generates a fresh cookie, stores it at the address it is given
	   -- this entry's temporal word -- and returns it. */
	register uint64_t cook_hash;
	register uint64_t* bounds_table_loc = (uint64_t*)((uint64_t*)__fides_bounds_table+index*2+1);
	__asm__ __volatile__("hash %0, %1" : "=r" (cook_hash) : "r" (bounds_table_loc));
	void* fides_ptr = craft_fides_pointer((uint64_t)ptr, index, cook_hash);

	__fides_bounds_table[index*2] = ((uint64_t)ptr << 32) + ((uint64_t)ptr+s);

	return fides_ptr;
}

/* Is p a live FIDES pointer? The test __fides_free has always made: the
   entry p's index names must hold p's address as its base, and the cookie
   stored there must match the temporal id p carries. A free entry's high
   half is a link below 2^32, never a base, so it cannot match -- except
   against a null address, which is ruled out first. */
static int fides_is_live(void *p, uint64_t *index, void **raw)
{
	*index = (uint64_t)p >> 48;
	*raw   = (void *)((uint64_t)p & 0xffffffff);

	uint64_t base          = __fides_bounds_table[*index*2] >> 32;
	uint64_t temporal_id   = __fides_bounds_table[*index*2+1] & 0xffff;
	uint64_t p_temporal_id = ((uint64_t)p >> 32) & 0xffff;

	return (*raw != 0) && (base == (uint64_t)*raw) && (temporal_id == p_temporal_id);
}

/* Return a slot to the free list. It now holds a link to the old head, and
   its zeroed cookie fails every pointer that still carries the old one. */
static void fides_release_index(uint64_t index)
{
	__fides_bounds_table[index*2] = next_free_index;
	__fides_bounds_table[index*2+1] = 0;
	next_free_index = index;
}

/* A pointer with nothing above bit 31 carries no metadata: it is NULL, or
   a block fides_tag returned untagged because the table was full. Addresses
   fit in 32 bits, and the hardware never issues a cookie whose low 16 bits
   -- the part a pointer carries -- are zero, so every pointer fides_tag does
   tag has a bit set up here and cannot be mistaken for one of these. */
static int fides_is_raw(void *p)
{
	return ((uint64_t)p >> 32) == 0;
}

void* __fides_malloc(uint64_t s)
{
	return fides_tag(malloc(s), s);
}

void* __fides_calloc(uint64_t n, uint64_t s)
{
	/* The bound is n*s, so it must not wrap. dlmalloc's calloc fails on
	   overflow too, but the bound should not rely on that. */
	if((n != 0) && (s > (uint64_t)-1 / n)){
		return 0;
	}
	return fides_tag(calloc(n, s), n*s);
}

void* __fides_memalign(uint64_t alignment, uint64_t s)
{
	/* The aligned address memalign returns is both the base of the object
	   and what free must later be given, so the entry has the same shape
	   as one malloc made. */
	return fides_tag(memalign(alignment, s), s);
}

void* __fides_realloc(void* p, uint64_t s)
{
	uint64_t index;
	void *raw;

	if(fides_is_live(p, &index, &raw)){
		void *ptr = realloc(raw, s);
		if(ptr == 0){
			return ptr;          /* p and its entry untouched, as C requires */
		}

		/* The old object is gone even if realloc grew it in place: C makes
		   every pointer to it indeterminate. Release its entry and tag the
		   result afresh -- exactly free followed by malloc -- so the new
		   object gets a new cookie and stale copies of p fail. */
		fides_release_index(index);
		return fides_tag(ptr, s);
	}

	/* No metadata at all: NULL, or a block malloc returned untagged because
	   the table was full. Plain realloc handles both. */
	if(fides_is_raw(p)){
		return fides_tag(realloc(p, s), s);
	}

	/* Tagged but not live: dangling, double-freed or forged. Touch nothing
	   -- neither the allocator nor the table -- and report failure. */
	return 0;
}

void __fides_free(void* p)
{
	uint64_t index;
	void *ptr;

	/* Live: free the block and retire its entry. */
	if(fides_is_live(p, &index, &ptr)){
		free(ptr);
		fides_release_index(index);
		return;
	}

	/* No metadata at all: NULL, or a block that was handed out untagged
	   because the table was full. It owns no entry, so only the allocator
	   is involved -- and free(NULL) is a no-op there. */
	if(fides_is_raw(p)){
		free(p);
		return;
	}

	/* Tagged but not live: freed already, or its index has since been
	   given to another object. The entry is not this pointer's to release
	   -- it may describe a live object -- so touch nothing. */
	return;
}
