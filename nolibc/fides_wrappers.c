#include <stdlib.h>
#include <stdio.h>
#include <fides/wrappers.h>
#include <stdlib.h>
#include <stdio.h>

#define IV 0xdeadbeef1ee7c0d3;

#define NUM_ENTRIES 64*1024
extern uint64_t __fides_bounds_table[NUM_ENTRIES*2];
extern uint64_t max_index = 0;
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

inline void* craft_fides_pointer(uint64_t ptr, uint64_t index, uint64_t temporal_id);
{
	// printf("Called craft ptr = %x, base = %x, bound = %x, id = %x\n",ptr, base, bound, id);
	uint64_t metadata = (index << 16) + (temporal_id & 0xffff);
	uint64_t fides_ptr = (metadata << 32) + ptr;
	return (void*)fides_ptr;
}

void* __fides_malloc(uint64_t s)
{
	void *ptr = malloc(s);
	register uint64_t cook_hash;
	register uint64_t* bounds_table_loc = (uint64_t*)((uint64_t*)__fides_bounds_table+next_free_index*2+1);
	__asm__ __volatile__("hash %0, %1" : "=r" (cook_hash) : "r" (bounds_table_loc));
	void* fides_ptr = craft_fides_pointer((uint64_t)ptr, next_free_index, cook_hash);
	uint64_t new_next_free_index = __fides_bounds_table[next_free_index*2];
	__fides_bounds_table[next_free_index*2] = ((uint64_t)ptr << 32) + ((uint64_t)ptr+s);
	if((new_next_free_index == 0) && (next_free_index == max_index)){
		max_index++;
		next_free_index = max_index;
	}
	else{
		next_free_index = new_next_free_index;
	}
	return fides_ptr;
}

void __fides_free(void* p)
{
	register uint64_t index  = ((uint64_t)p>>48);
	register uint64_t base = (__fides_bounds_table[index*2]) >> 32;
	register uint64_t temporal_id = (__fides_bounds_table[index*2+1]) & 0xffff;
	register uint64_t p_temporal_id = ((uint64_t)p>>32) & 0xffff;
	void *ptr = (void *)((unsigned long long)p & 0xffffffff);// fpr;
	if((base == ptr) && (temporal_id == p_temporal_id)){
		free(ptr);	
	}
	__fides_bounds_table[index*2] = next_free_index;
	__fides_bounds_table[index*2+1] = 0;
	next_free_index = index;
	return;
}