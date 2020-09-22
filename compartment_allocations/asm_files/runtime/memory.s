	.file	"memory.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.get_pool_block,"ax",@progbits
	.align	1
	.type	get_pool_block, @function
get_pool_block:
	beq	a0,zero,.L1
	addi	a0,a0,-16
.L1:
	ret
	.size	get_pool_block, .-get_pool_block
	.section	.text.caml_page_table_lookup,"ax",@progbits
	.align	1
	.globl	caml_page_table_lookup
	.type	caml_page_table_lookup, @function
caml_page_table_lookup:
	srli	a5,a0,12
	ld	a4,.LC0
	mul	a5,a5,a4
	lla	a4,.LANCHOR0
	lw	a3,8(a4)
	srl	a5,a5,a3
	ld	a1,32(a4)
	slli	a4,a5,3
	add	a4,a1,a4
	ld	a3,0(a4)
	xor	a4,a0,a3
	li	a2,-4096
	and	a4,a4,a2
	beq	a4,zero,.L8
.L5:
	beq	a3,zero,.L7
	addi	a5,a5,1
	ld	a4,.LANCHOR0+16
	and	a5,a5,a4
	slli	a4,a5,3
	add	a4,a1,a4
	ld	a3,0(a4)
	xor	a4,a0,a3
	li	a2,-4096
	and	a4,a4,a2
	bne	a4,zero,.L5
	andi	a0,a3,0xff
	ret
.L8:
	andi	a0,a3,0xff
	ret
.L7:
	li	a0,0
	ret
	.size	caml_page_table_lookup, .-caml_page_table_lookup
	.section	.text.caml_disown_for_heap,"ax",@progbits
	.align	1
	.globl	caml_disown_for_heap
	.type	caml_disown_for_heap, @function
caml_disown_for_heap:
	ret
	.size	caml_disown_for_heap, .-caml_disown_for_heap
	.section	.text.caml_allocation_color,"ax",@progbits
	.align	1
	.globl	caml_allocation_color
	.type	caml_allocation_color, @function
caml_allocation_color:
	lw	a5,caml_gc_phase
	sext.w	a3,a5
	li	a4,1
	bleu	a3,a4,.L12
	li	a4,2
	bne	a5,a4,.L13
	ld	a5,caml_gc_sweep_hp
	bleu	a5,a0,.L14
	li	a0,0
	ret
.L12:
	li	a0,768
	ret
.L13:
	li	a0,0
	ret
.L14:
	li	a0,768
	ret
	.size	caml_allocation_color, .-caml_allocation_color
	.section	.text.caml_alloc_dependent_memory,"ax",@progbits
	.align	1
	.globl	caml_alloc_dependent_memory
	.type	caml_alloc_dependent_memory, @function
caml_alloc_dependent_memory:
	srli	a0,a0,3
	lla	a4,caml_dependent_size
	ld	a5,0(a4)
	add	a5,a5,a0
	sd	a5,0(a4)
	lla	a4,caml_dependent_allocated
	ld	a5,0(a4)
	add	a0,a5,a0
	sd	a0,0(a4)
	ret
	.size	caml_alloc_dependent_memory, .-caml_alloc_dependent_memory
	.section	.text.caml_free_dependent_memory,"ax",@progbits
	.align	1
	.globl	caml_free_dependent_memory
	.type	caml_free_dependent_memory, @function
caml_free_dependent_memory:
	srli	a0,a0,3
	ld	a5,caml_dependent_size
	bleu	a0,a5,.L17
	sd	zero,caml_dependent_size,a5
	ret
.L17:
	sub	a0,a5,a0
	sd	a0,caml_dependent_size,a5
	ret
	.size	caml_free_dependent_memory, .-caml_free_dependent_memory
	.section	.text.caml_adjust_gc_speed,"ax",@progbits
	.align	1
	.globl	caml_adjust_gc_speed
	.type	caml_adjust_gc_speed, @function
caml_adjust_gc_speed:
	bne	a1,zero,.L20
	li	a1,1
.L20:
	bgeu	a1,a0,.L21
	mv	a0,a1
.L21:
	fcvt.d.lu	fa5,a0
	fcvt.d.lu	fa4,a1
	fdiv.d	fa5,fa5,fa4
	lla	a5,caml_extra_heap_resources
	fld	fa4,0(a5)
	fadd.d	fa5,fa5,fa4
	fsd	fa5,0(a5)
	fld	fa4,.LC1,a5
	fgt.d	a0,fa5,fa4
	bne	a0,zero,.L31
	ret
.L31:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fsd	fa4,caml_extra_heap_resources,a5
	call	caml_request_major_slice
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_adjust_gc_speed, .-caml_adjust_gc_speed
	.section	.text.caml_initialize,"ax",@progbits
	.align	1
	.weak	caml_initialize
	.type	caml_initialize, @function
caml_initialize:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	sd	a1,0(a0)
	ld	a5,Caml_state
	ld	a4,40(a5)
	bleu	a4,a0,.L33
	ld	a3,32(a5)
	bltu	a3,a0,.L32
.L33:
	andi	a3,a1,1
	bne	a3,zero,.L32
	bleu	a4,a1,.L32
	ld	a4,32(a5)
	bleu	a1,a4,.L32
	ld	s1,104(a5)
	ld	a4,24(s1)
	ld	a5,32(s1)
	bgeu	a4,a5,.L37
.L35:
	ld	a5,24(s1)
	addi	a4,a5,8
	sd	a4,24(s1)
	sd	s0,0(a5)
.L32:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L37:
	mv	a0,s1
	call	caml_realloc_ref_table
	j	.L35
	.size	caml_initialize, .-caml_initialize
	.section	.text.caml_modify,"ax",@progbits
	.align	1
	.weak	caml_modify
	.type	caml_modify, @function
caml_modify:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	mv	s1,a1
	ld	a5,Caml_state
	ld	a4,40(a5)
	bleu	a4,a0,.L39
	ld	a5,32(a5)
	bgeu	a5,a0,.L39
	sd	a1,0(s0)
.L38:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L39:
	ld	a0,0(s0)
	sd	s1,0(s0)
	andi	a5,a0,1
	bne	a5,zero,.L41
	ld	a5,Caml_state
	ld	a4,40(a5)
	bleu	a4,a0,.L42
	ld	a5,32(a5)
	bgtu	a0,a5,.L38
.L42:
	lw	a5,caml_gc_phase
	beq	a5,zero,.L45
.L41:
	andi	a5,s1,1
	bne	a5,zero,.L38
	ld	a5,Caml_state
	ld	a4,40(a5)
	bleu	a4,s1,.L38
	ld	a4,32(a5)
	bleu	s1,a4,.L38
	ld	s1,104(a5)
	ld	a4,24(s1)
	ld	a5,32(s1)
	bgeu	a4,a5,.L46
.L43:
	ld	a5,24(s1)
	addi	a4,a5,8
	sd	a4,24(s1)
	sd	s0,0(a5)
	j	.L38
.L45:
	li	a1,0
	call	caml_darken
	j	.L41
.L46:
	mv	a0,s1
	call	caml_realloc_ref_table
	j	.L43
	.size	caml_modify, .-caml_modify
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC2:
	.string	"out of memory"
	.section	.text.caml_stat_create_pool,"ax",@progbits
	.align	1
	.globl	caml_stat_create_pool
	.type	caml_stat_create_pool, @function
caml_stat_create_pool:
	ld	a5,pool
	beq	a5,zero,.L54
	ret
.L54:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a0,16
	call	malloc
	sd	a0,pool,a5
	beq	a0,zero,.L55
	sd	a0,0(a0)
	sd	a0,8(a0)
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L55:
	lla	a0,.LC2
	call	caml_fatal_error
	.size	caml_stat_create_pool, .-caml_stat_create_pool
	.section	.text.caml_stat_destroy_pool,"ax",@progbits
	.align	1
	.globl	caml_stat_destroy_pool
	.type	caml_stat_destroy_pool, @function
caml_stat_destroy_pool:
	ld	a5,pool
	beq	a5,zero,.L61
	ld	a5,8(a5)
	sd	zero,0(a5)
	ld	a0,pool
	beq	a0,zero,.L66
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
.L59:
	ld	s0,0(a0)
	call	free
	sd	s0,pool,a5
	ld	a0,pool
	bne	a0,zero,.L59
	sd	zero,pool,a5
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L66:
	sd	zero,pool,a5
	ret
.L61:
	ret
	.size	caml_stat_destroy_pool, .-caml_stat_destroy_pool
	.section	.text.caml_stat_alloc_noexc,"ax",@progbits
	.align	1
	.globl	caml_stat_alloc_noexc
	.type	caml_stat_alloc_noexc, @function
caml_stat_alloc_noexc:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	ld	s0,pool
	beq	s0,zero,.L71
	addi	a0,a0,16
	call	malloc
	beq	a0,zero,.L67
	ld	a5,0(s0)
	sd	a5,0(a0)
	sd	s0,8(a0)
	ld	a5,0(s0)
	sd	a0,8(a5)
	sd	a0,0(s0)
	addi	a0,a0,16
.L67:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L71:
	call	malloc
	j	.L67
	.size	caml_stat_alloc_noexc, .-caml_stat_alloc_noexc
	.section	.text.caml_stat_alloc_aligned_noexc,"ax",@progbits
	.align	1
	.globl	caml_stat_alloc_aligned_noexc
	.type	caml_stat_alloc_aligned_noexc, @function
caml_stat_alloc_aligned_noexc:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a1
	mv	s1,a2
	li	a5,4096
	add	a0,a0,a5
	call	caml_stat_alloc_noexc
	beq	a0,zero,.L72
	sd	a0,0(s1)
	add	a0,a0,s0
	srli	a0,a0,12
	addi	a0,a0,1
	slli	a0,a0,12
	sub	a0,a0,s0
.L72:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_stat_alloc_aligned_noexc, .-caml_stat_alloc_aligned_noexc
	.section	.text.caml_alloc_for_heap,"ax",@progbits
	.align	1
	.globl	caml_alloc_for_heap
	.type	caml_alloc_for_heap, @function
caml_alloc_for_heap:
	ld	a5,caml_use_huge_pages
	bne	a5,zero,.L78
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	li	s0,4096
	addi	s0,s0,-1
	add	a0,a0,s0
	li	s0,-4096
	and	s0,a0,s0
	addi	a2,sp,8
	li	a1,32
	addi	a0,s0,32
	call	caml_stat_alloc_aligned_noexc
	mv	a5,a0
	beq	a0,zero,.L75
	addi	a0,a0,32
	sd	s0,16(a5)
	ld	a4,8(sp)
	sd	a4,0(a5)
.L75:
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
.L78:
	li	a0,0
	ret
	.size	caml_alloc_for_heap, .-caml_alloc_for_heap
	.section	.text.caml_stat_alloc_aligned,"ax",@progbits
	.align	1
	.globl	caml_stat_alloc_aligned
	.type	caml_stat_alloc_aligned, @function
caml_stat_alloc_aligned:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	call	caml_stat_alloc_aligned_noexc
	beq	a0,zero,.L87
.L84:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L87:
	beq	s0,zero,.L84
	call	caml_raise_out_of_memory
	.size	caml_stat_alloc_aligned, .-caml_stat_alloc_aligned
	.section	.text.caml_stat_alloc,"ax",@progbits
	.align	1
	.globl	caml_stat_alloc
	.type	caml_stat_alloc, @function
caml_stat_alloc:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	call	caml_stat_alloc_noexc
	beq	a0,zero,.L91
.L88:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L91:
	beq	s0,zero,.L88
	call	caml_raise_out_of_memory
	.size	caml_stat_alloc, .-caml_stat_alloc
	.section	.text.caml_stat_free,"ax",@progbits
	.align	1
	.globl	caml_stat_free
	.type	caml_stat_free, @function
caml_stat_free:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a5,pool
	beq	a5,zero,.L96
	call	get_pool_block
	beq	a0,zero,.L92
	ld	a4,8(a0)
	ld	a5,0(a0)
	sd	a5,0(a4)
	ld	a4,8(a0)
	sd	a4,8(a5)
	call	free
.L92:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L96:
	call	free
	j	.L92
	.size	caml_stat_free, .-caml_stat_free
	.section	.text.caml_free_for_heap,"ax",@progbits
	.align	1
	.globl	caml_free_for_heap
	.type	caml_free_for_heap, @function
caml_free_for_heap:
	ld	a5,caml_use_huge_pages
	beq	a5,zero,.L103
	ret
.L103:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,-32(a0)
	call	caml_stat_free
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_free_for_heap, .-caml_free_for_heap
	.section	.text.caml_stat_resize_noexc,"ax",@progbits
	.align	1
	.globl	caml_stat_resize_noexc
	.type	caml_stat_resize_noexc, @function
caml_stat_resize_noexc:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a1
	beq	a0,zero,.L109
	ld	a5,pool
	beq	a5,zero,.L110
	call	get_pool_block
	addi	a1,s0,16
	call	realloc
	beq	a0,zero,.L104
	ld	a5,8(a0)
	sd	a0,0(a5)
	ld	a5,0(a0)
	sd	a0,8(a5)
	addi	a0,a0,16
.L104:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L109:
	mv	a0,a1
	call	caml_stat_alloc_noexc
	j	.L104
.L110:
	call	realloc
	j	.L104
	.size	caml_stat_resize_noexc, .-caml_stat_resize_noexc
	.section	.text.caml_stat_resize,"ax",@progbits
	.align	1
	.globl	caml_stat_resize
	.type	caml_stat_resize, @function
caml_stat_resize:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_stat_resize_noexc
	beq	a0,zero,.L114
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L114:
	call	caml_raise_out_of_memory
	.size	caml_stat_resize, .-caml_stat_resize
	.section	.text.caml_stat_calloc_noexc,"ax",@progbits
	.align	1
	.globl	caml_stat_calloc_noexc
	.type	caml_stat_calloc_noexc, @function
caml_stat_calloc_noexc:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	li	a5,0
	mul	s1,a1,a0
	mulhu	a1,a1,a0
	bne	a1,zero,.L122
.L116:
	bne	a5,zero,.L120
	mv	a0,s1
	call	caml_stat_alloc_noexc
	mv	s0,a0
	beq	a0,zero,.L115
	mv	a2,s1
	li	a1,0
	call	memset
	j	.L115
.L122:
	li	a5,1
	j	.L116
.L120:
	li	s0,0
.L115:
	mv	a0,s0
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_stat_calloc_noexc, .-caml_stat_calloc_noexc
	.section	.text.caml_page_table_initialize,"ax",@progbits
	.align	1
	.globl	caml_page_table_initialize
	.type	caml_page_table_initialize, @function
caml_page_table_initialize:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	srli	a3,a0,12
	lla	a5,.LANCHOR0
	li	a4,1
	sd	a4,0(a5)
	li	a4,64
	sw	a4,8(a5)
.L124:
	ld	a0,.LANCHOR0
	slli	a5,a3,1
	bgeu	a0,a5,.L129
	lla	a5,.LANCHOR0
	slli	a0,a0,1
	sd	a0,0(a5)
	lw	a4,8(a5)
	addiw	a4,a4,-1
	sw	a4,8(a5)
	j	.L124
.L129:
	addi	a5,a0,-1
	lla	s0,.LANCHOR0
	sd	a5,16(s0)
	sd	zero,24(s0)
	li	a1,8
	call	caml_stat_calloc_noexc
	sd	a0,32(s0)
	beq	a0,zero,.L130
	li	a0,0
.L126:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L130:
	li	a0,-1
	j	.L126
	.size	caml_page_table_initialize, .-caml_page_table_initialize
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"Growing page table to %lu entries\n"
	.align	3
.LC4:
	.string	"No room for growing page table\n"
	.section	.text.caml_page_table_resize,"ax",@progbits
	.align	1
	.type	caml_page_table_resize, @function
caml_page_table_resize:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	sd	s1,56(sp)
	lla	a5,.LANCHOR0
	ld	s0,0(a5)
	ld	a2,8(a5)
	ld	a3,16(a5)
	ld	a4,24(a5)
	ld	a5,32(a5)
	sd	s0,8(sp)
	sd	a2,16(sp)
	sd	a3,24(sp)
	sd	a4,32(sp)
	sd	a5,40(sp)
	mv	s1,s0
	mv	a2,s0
	lla	a1,.LC3
	li	a0,8
	call	caml_gc_message
	slli	s0,s0,1
	li	a1,8
	mv	a0,s0
	call	caml_stat_calloc_noexc
	beq	a0,zero,.L140
	lla	a5,.LANCHOR0
	sd	s0,0(a5)
	lw	a4,16(sp)
	addiw	a4,a4,-1
	sext.w	a7,a4
	sw	a4,8(a5)
	addi	a2,s0,-1
	sd	a2,16(a5)
	ld	a4,32(sp)
	sd	a4,24(a5)
	sd	a0,32(a5)
	li	a1,0
	j	.L134
.L140:
	lla	a1,.LC4
	li	a0,8
	call	caml_gc_message
	li	a0,-1
	j	.L133
.L137:
	addi	a5,a5,1
	and	a5,a2,a5
.L136:
	slli	a4,a5,3
	add	a4,a0,a4
	ld	a3,0(a4)
	bne	a3,zero,.L137
	sd	a6,0(a4)
.L135:
	addi	a1,a1,1
.L134:
	bleu	s1,a1,.L141
	slli	a5,a1,3
	ld	a4,40(sp)
	add	a5,a4,a5
	ld	a6,0(a5)
	beq	a6,zero,.L135
	srli	a5,a6,12
	ld	a4,.LC0
	mul	a5,a5,a4
	srl	a5,a5,a7
	j	.L136
.L141:
	ld	a0,40(sp)
	call	caml_stat_free
	li	a0,0
.L133:
	ld	ra,72(sp)
	ld	s0,64(sp)
	ld	s1,56(sp)
	addi	sp,sp,80
	jr	ra
	.size	caml_page_table_resize, .-caml_page_table_resize
	.section	.text.caml_page_table_modify,"ax",@progbits
	.align	1
	.type	caml_page_table_modify, @function
caml_page_table_modify:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s0,a0
	mv	s2,a1
	mv	s1,a2
	lla	a4,.LANCHOR0
	ld	a5,24(a4)
	slli	a5,a5,1
	ld	a4,0(a4)
	bgeu	a5,a4,.L150
.L143:
	srli	a5,s0,12
	ld	a4,.LC0
	mul	a5,a5,a4
	lw	a4,.LANCHOR0+8
	srl	a5,a5,a4
.L147:
	slli	a4,a5,3
	ld	a3,.LANCHOR0+32
	add	a4,a3,a4
	ld	a2,0(a4)
	beq	a2,zero,.L151
	xor	a3,a2,s0
	li	a1,-4096
	and	a3,a3,a1
	beq	a3,zero,.L152
	addi	a5,a5,1
	ld	a4,.LANCHOR0+16
	and	a5,a5,a4
	j	.L147
.L150:
	call	caml_page_table_resize
	beq	a0,zero,.L143
	li	a0,-1
	j	.L144
.L151:
	or	s0,s1,s0
	sd	s0,0(a4)
	lla	a4,.LANCHOR0
	ld	a5,24(a4)
	addi	a5,a5,1
	sd	a5,24(a4)
	li	a0,0
.L144:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L152:
	not	s2,s2
	and	a2,a2,s2
	or	a2,s1,a2
	sd	a2,0(a4)
	li	a0,0
	j	.L144
	.size	caml_page_table_modify, .-caml_page_table_modify
	.section	.text.caml_page_table_add,"ax",@progbits
	.align	1
	.globl	caml_page_table_add
	.type	caml_page_table_add, @function
caml_page_table_add:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s2,a0
	li	s1,-4096
	and	s0,a1,s1
	addi	a2,a2,-1
	and	s1,a2,s1
.L154:
	bgtu	s0,s1,.L159
	mv	a2,s2
	li	a1,0
	mv	a0,s0
	call	caml_page_table_modify
	bne	a0,zero,.L157
	li	a5,4096
	add	s0,s0,a5
	j	.L154
.L159:
	li	a0,0
.L155:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L157:
	li	a0,-1
	j	.L155
	.size	caml_page_table_add, .-caml_page_table_add
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	"Growing heap to %luk bytes\n"
	.section	.text.caml_add_to_heap,"ax",@progbits
	.align	1
	.globl	caml_add_to_heap
	.type	caml_add_to_heap, @function
caml_add_to_heap:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	ld	a5,Caml_state
	ld	a2,328(a5)
	slli	a2,a2,3
	ld	a5,-16(a0)
	add	a2,a2,a5
	srli	a2,a2,10
	lla	a1,.LC5
	li	a0,4
	call	caml_gc_message
	ld	a2,-16(s0)
	add	a2,s0,a2
	mv	a1,s0
	li	a0,1
	call	caml_page_table_add
	bne	a0,zero,.L165
	lla	a4,caml_heap_start
	ld	a5,0(a4)
	j	.L162
.L164:
	addi	a4,a5,-8
	ld	a5,-8(a5)
.L162:
	beq	a5,zero,.L163
	bltu	a5,s0,.L164
.L163:
	sd	a5,-8(s0)
	sd	s0,0(a4)
	ld	a4,Caml_state
	ld	a5,352(a4)
	addi	a5,a5,1
	sd	a5,352(a4)
	ld	a5,-16(s0)
	srli	a5,a5,3
	ld	a3,328(a4)
	add	a5,a5,a3
	sd	a5,328(a4)
	ld	a3,336(a4)
	ble	a5,a3,.L161
	sd	a5,336(a4)
.L161:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L165:
	li	a0,-1
	j	.L161
	.size	caml_add_to_heap, .-caml_add_to_heap
	.section	.rodata.str1.8
	.align	3
.LC6:
	.string	"No room for growing heap\n"
	.section	.text.expand_heap,"ax",@progbits
	.align	1
	.type	expand_heap, @function
expand_heap:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	li	a5,100
	divu	a5,a0,a5
	ld	a4,caml_percent_free
	mul	a5,a5,a4
	add	a0,a5,a0
	call	caml_clip_heap_chunk_wsz
	slli	a0,a0,3
	call	caml_alloc_for_heap
	mv	s0,a0
	beq	a0,zero,.L176
	ld	a2,-16(a0)
	srli	a2,a2,3
	mv	a5,a0
	j	.L170
.L176:
	lla	a1,.LC6
	li	a0,4
	call	caml_gc_message
	j	.L167
.L171:
	li	a4,-512
	sd	a4,0(a5)
	li	a4,1
	slli	a4,a4,57
	li	a3,-1
	slli	a3,a3,54
	add	a2,a2,a3
	addi	a3,a4,8
	add	a3,a5,a3
	sd	a3,8(a5)
	sd	a3,16(s0)
	add	a5,a5,a4
.L170:
	addi	a3,a2,-1
	li	a4,-1
	srli	a4,a4,10
	bgtu	a3,a4,.L171
	li	a4,1
	bleu	a2,a4,.L172
	slli	a3,a3,10
	addi	a3,a3,512
	sd	a3,0(a5)
	addi	a4,a5,8
	sd	a4,16(s0)
	sd	zero,8(a5)
.L173:
	mv	a0,s0
	call	caml_add_to_heap
	bne	a0,zero,.L177
	addi	s0,s0,8
.L167:
	mv	a0,s0
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L172:
	sd	zero,8(a5)
	li	a4,1
	bne	a2,a4,.L173
	sd	zero,0(a5)
	j	.L173
.L177:
	mv	a0,s0
	call	caml_free_for_heap
	li	s0,0
	j	.L167
	.size	expand_heap, .-expand_heap
	.section	.text.caml_alloc_shr,"ax",@progbits
	.align	1
	.globl	caml_alloc_shr
	.type	caml_alloc_shr, @function
caml_alloc_shr:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	li	a5,-1
	srli	a5,a5,10
	bleu	a0,a5,.L179
	call	caml_raise_out_of_memory
.L179:
	mv	s0,a0
	mv	s2,a1
	ld	a5,caml_fl_p_allocate
	jalr	a5
	mv	s1,a0
	beq	a0,zero,.L188
.L180:
	lw	a5,caml_gc_phase
	sext.w	a3,a5
	li	a4,1
	bleu	a3,a4,.L183
	li	a4,2
	beq	a5,a4,.L189
.L184:
	slli	a5,s0,10
	slli	a1,s2,32
	srli	a1,a1,32
	add	a1,a5,a1
	sd	a1,0(s1)
	j	.L185
.L188:
	mv	a0,s0
	call	expand_heap
	beq	a0,zero,.L190
	ld	a5,caml_fl_p_add_blocks
	jalr	a5
	mv	a0,s0
	ld	a5,caml_fl_p_allocate
	jalr	a5
	mv	s1,a0
	j	.L180
.L190:
	ld	a5,Caml_state
	ld	a5,88(a5)
	beq	a5,zero,.L182
	lla	a0,.LC2
	call	caml_fatal_error
.L182:
	call	caml_raise_out_of_memory
.L189:
	ld	a5,caml_gc_sweep_hp
	bgtu	a5,s1,.L184
.L183:
	slli	a1,s0,10
	slli	s2,s2,32
	srli	s2,s2,32
	add	a1,a1,s2
	addi	a1,a1,768
	sd	a1,0(s1)
.L185:
	lla	a5,caml_allocated_words
	ld	a0,0(a5)
	add	s0,s0,a0
	addi	s0,s0,1
	sd	s0,0(a5)
	ld	a5,Caml_state
	ld	a5,80(a5)
	bgtu	s0,a5,.L191
.L186:
	addi	s1,s1,8
	mv	a0,s1
	call	caml_memprof_track_alloc_shr
	mv	a0,s1
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L191:
	call	caml_request_major_slice
	j	.L186
	.size	caml_alloc_shr, .-caml_alloc_shr
	.section	.text.caml_alloc_shr_no_track_noexc,"ax",@progbits
	.align	1
	.globl	caml_alloc_shr_no_track_noexc
	.type	caml_alloc_shr_no_track_noexc, @function
caml_alloc_shr_no_track_noexc:
	li	a5,-1
	srli	a5,a5,10
	bgtu	a0,a5,.L199
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s0,a0
	mv	s2,a1
	ld	a5,caml_fl_p_allocate
	jalr	a5
	mv	s1,a0
	beq	a0,zero,.L205
.L194:
	lw	a5,caml_gc_phase
	sext.w	a3,a5
	li	a4,1
	bleu	a3,a4,.L195
	li	a4,2
	beq	a5,a4,.L206
.L196:
	slli	a5,s0,10
	slli	a1,s2,32
	srli	a1,a1,32
	add	a1,a5,a1
	sd	a1,0(s1)
	j	.L197
.L205:
	mv	a0,s0
	call	expand_heap
	beq	a0,zero,.L200
	ld	a5,caml_fl_p_add_blocks
	jalr	a5
	mv	a0,s0
	ld	a5,caml_fl_p_allocate
	jalr	a5
	mv	s1,a0
	j	.L194
.L206:
	ld	a5,caml_gc_sweep_hp
	bgtu	a5,s1,.L196
.L195:
	slli	a1,s0,10
	slli	s2,s2,32
	srli	s2,s2,32
	add	a1,a1,s2
	addi	a1,a1,768
	sd	a1,0(s1)
.L197:
	lla	a5,caml_allocated_words
	ld	a0,0(a5)
	add	s0,s0,a0
	addi	s0,s0,1
	sd	s0,0(a5)
	ld	a5,Caml_state
	ld	a5,80(a5)
	bgtu	s0,a5,.L207
.L198:
	addi	a0,s1,8
.L192:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L207:
	call	caml_request_major_slice
	j	.L198
.L199:
	li	a0,0
	ret
.L200:
	li	a0,0
	j	.L192
	.size	caml_alloc_shr_no_track_noexc, .-caml_alloc_shr_no_track_noexc
	.section	.text.caml_alloc_shr_for_minor_gc,"ax",@progbits
	.align	1
	.globl	caml_alloc_shr_for_minor_gc
	.type	caml_alloc_shr_for_minor_gc, @function
caml_alloc_shr_for_minor_gc:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	li	a5,-1
	srli	a5,a5,10
	bleu	a0,a5,.L209
	call	caml_raise_out_of_memory
.L209:
	mv	s0,a0
	mv	s1,a1
	ld	a5,caml_fl_p_allocate
	jalr	a5
	mv	s2,a0
	beq	a0,zero,.L218
.L210:
	lw	a5,caml_gc_phase
	sext.w	a3,a5
	li	a4,1
	bleu	a3,a4,.L213
	li	a4,2
	beq	a5,a4,.L219
.L214:
	slli	a5,s0,10
	slli	a1,s1,32
	srli	a1,a1,32
	add	a1,a5,a1
	sd	a1,0(s2)
	j	.L215
.L218:
	mv	a0,s0
	call	expand_heap
	beq	a0,zero,.L220
	ld	a5,caml_fl_p_add_blocks
	jalr	a5
	mv	a0,s0
	ld	a5,caml_fl_p_allocate
	jalr	a5
	mv	s2,a0
	j	.L210
.L220:
	ld	a5,Caml_state
	ld	a5,88(a5)
	beq	a5,zero,.L212
	lla	a0,.LC2
	call	caml_fatal_error
.L212:
	call	caml_raise_out_of_memory
.L219:
	ld	a5,caml_gc_sweep_hp
	bgtu	a5,s2,.L214
.L213:
	slli	a1,s0,10
	slli	s1,s1,32
	srli	s1,s1,32
	add	a1,a1,s1
	addi	a1,a1,768
	sd	a1,0(s2)
.L215:
	lla	a5,caml_allocated_words
	ld	a0,0(a5)
	add	s0,s0,a0
	addi	s0,s0,1
	sd	s0,0(a5)
	ld	a5,Caml_state
	ld	a5,80(a5)
	bgtu	s0,a5,.L221
.L216:
	addi	a0,s2,8
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L221:
	call	caml_request_major_slice
	j	.L216
	.size	caml_alloc_shr_for_minor_gc, .-caml_alloc_shr_for_minor_gc
	.section	.text.caml_page_table_remove,"ax",@progbits
	.align	1
	.globl	caml_page_table_remove
	.type	caml_page_table_remove, @function
caml_page_table_remove:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s2,a0
	li	s1,-4096
	and	s0,a1,s1
	addi	a2,a2,-1
	and	s1,a2,s1
.L223:
	bgtu	s0,s1,.L228
	li	a2,0
	mv	a1,s2
	mv	a0,s0
	call	caml_page_table_modify
	bne	a0,zero,.L226
	li	a5,4096
	add	s0,s0,a5
	j	.L223
.L228:
	li	a0,0
.L224:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L226:
	li	a0,-1
	j	.L224
	.size	caml_page_table_remove, .-caml_page_table_remove
	.section	.rodata.str1.8
	.align	3
.LC7:
	.string	"Shrinking heap to %luk words\n"
	.section	.text.caml_shrink_heap,"ax",@progbits
	.align	1
	.globl	caml_shrink_heap
	.type	caml_shrink_heap, @function
caml_shrink_heap:
	ld	a5,caml_heap_start
	beq	a5,a0,.L234
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	lla	s1,Caml_state
	ld	a4,0(s1)
	ld	a5,-16(a0)
	srli	a5,a5,3
	ld	a2,328(a4)
	sub	a5,a2,a5
	sd	a5,328(a4)
	srai	a2,a5,63
	andi	a2,a2,1023
	add	a2,a2,a5
	srai	a2,a2,10
	lla	a1,.LC7
	li	a0,4
	call	caml_gc_message
	ld	a4,0(s1)
	ld	a5,352(a4)
	addi	a5,a5,-1
	sd	a5,352(a4)
	lla	a4,caml_heap_start
.L231:
	ld	a5,0(a4)
	beq	a5,s0,.L237
	addi	a4,a5,-8
	j	.L231
.L237:
	ld	a5,-8(s0)
	sd	a5,0(a4)
	ld	a2,-16(s0)
	add	a2,s0,a2
	mv	a1,s0
	li	a0,1
	call	caml_page_table_remove
	mv	a0,s0
	call	caml_free_for_heap
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L234:
	ret
	.size	caml_shrink_heap, .-caml_shrink_heap
	.section	.text.caml_stat_strdup_noexc,"ax",@progbits
	.align	1
	.globl	caml_stat_strdup_noexc
	.type	caml_stat_strdup_noexc, @function
caml_stat_strdup_noexc:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s2,a0
	call	strlen
	addi	s1,a0,1
	mv	a0,s1
	call	caml_stat_alloc_noexc
	mv	s0,a0
	beq	a0,zero,.L238
	mv	a2,s1
	mv	a1,s2
	call	memcpy
.L238:
	mv	a0,s0
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_stat_strdup_noexc, .-caml_stat_strdup_noexc
	.section	.text.caml_stat_strdup,"ax",@progbits
	.align	1
	.globl	caml_stat_strdup
	.type	caml_stat_strdup, @function
caml_stat_strdup:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_stat_strdup_noexc
	beq	a0,zero,.L244
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L244:
	call	caml_raise_out_of_memory
	.size	caml_stat_strdup, .-caml_stat_strdup
	.section	.text.caml_stat_strconcat,"ax",@progbits
	.align	1
	.globl	caml_stat_strconcat
	.type	caml_stat_strconcat, @function
caml_stat_strconcat:
	addi	sp,sp,-144
	sd	ra,72(sp)
	sd	s0,64(sp)
	sd	s1,56(sp)
	sd	s2,48(sp)
	sd	s3,40(sp)
	sd	s4,32(sp)
	sd	s5,24(sp)
	mv	s4,a0
	sd	a1,88(sp)
	sd	a2,96(sp)
	sd	a3,104(sp)
	sd	a4,112(sp)
	sd	a5,120(sp)
	sd	a6,128(sp)
	sd	a7,136(sp)
	addi	a5,sp,88
	sd	a5,8(sp)
	li	s0,0
	li	s1,0
.L246:
	bge	s0,s4,.L251
	ld	a5,8(sp)
	addi	a4,a5,8
	sd	a4,8(sp)
	ld	a0,0(a5)
	call	strlen
	add	s1,s1,a0
	addiw	s0,s0,1
	j	.L246
.L251:
	addi	a0,s1,1
	call	caml_stat_alloc
	mv	s5,a0
	addi	a5,sp,88
	sd	a5,8(sp)
	mv	s1,a0
	li	s2,0
	j	.L248
.L249:
	ld	a5,8(sp)
	addi	a4,a5,8
	sd	a4,8(sp)
	ld	s3,0(a5)
	mv	a0,s3
	call	strlen
	mv	s0,a0
	mv	a2,a0
	mv	a1,s3
	mv	a0,s1
	call	memcpy
	add	s1,s1,s0
	addiw	s2,s2,1
.L248:
	blt	s2,s4,.L249
	sb	zero,0(s1)
	mv	a0,s5
	ld	ra,72(sp)
	ld	s0,64(sp)
	ld	s1,56(sp)
	ld	s2,48(sp)
	ld	s3,40(sp)
	ld	s4,32(sp)
	ld	s5,24(sp)
	addi	sp,sp,144
	jr	ra
	.size	caml_stat_strconcat, .-caml_stat_strconcat
	.globl	caml_use_huge_pages
	.globl	caml_huge_fallback_count
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.dword	-7046029254386353130
	.align	3
.LC1:
	.word	0
	.word	1072693248
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	caml_page_table, @object
	.size	caml_page_table, 40
caml_page_table:
	.zero	40
	.section	.sbss,"aw",@nobits
	.align	3
	.type	pool, @object
	.size	pool, 8
pool:
	.zero	8
	.type	caml_use_huge_pages, @object
	.size	caml_use_huge_pages, 8
caml_use_huge_pages:
	.zero	8
	.type	caml_huge_fallback_count, @object
	.size	caml_huge_fallback_count, 4
caml_huge_fallback_count:
	.zero	4
	.ident	"GCC: (GNU) 9.2.0"
