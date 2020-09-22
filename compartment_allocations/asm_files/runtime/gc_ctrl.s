	.file	"gc_ctrl.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.norm_pfree,"ax",@progbits
	.align	1
	.type	norm_pfree, @function
norm_pfree:
	bne	a0,zero,.L1
	li	a0,1
.L1:
	ret
	.size	norm_pfree, .-norm_pfree
	.section	.text.norm_pmax,"ax",@progbits
	.align	1
	.type	norm_pmax, @function
norm_pmax:
	ret
	.size	norm_pmax, .-norm_pmax
	.section	.text.norm_minsize,"ax",@progbits
	.align	1
	.type	norm_minsize, @function
norm_minsize:
	li	a5,4096
	blt	a0,a5,.L7
	li	a5,268435456
	ble	a0,a5,.L6
	li	a0,268435456
	j	.L6
.L7:
	li	a0,4096
.L6:
	addi	a0,a0,511
	srai	a5,a0,63
	andi	a5,a5,511
	add	a0,a5,a0
	andi	a0,a0,-512
	ret
	.size	norm_minsize, .-norm_minsize
	.section	.text.norm_window,"ax",@progbits
	.align	1
	.type	norm_window, @function
norm_window:
	ble	a0,zero,.L11
	li	a5,50
	bgt	a0,a5,.L12
	ret
.L11:
	li	a0,1
	ret
.L12:
	li	a0,50
	ret
	.size	norm_window, .-norm_window
	.section	.text.norm_custom_maj,"ax",@progbits
	.align	1
	.type	norm_custom_maj, @function
norm_custom_maj:
	bne	a0,zero,.L13
	li	a0,1
.L13:
	ret
	.size	norm_custom_maj, .-norm_custom_maj
	.section	.text.norm_custom_min,"ax",@progbits
	.align	1
	.type	norm_custom_min, @function
norm_custom_min:
	bne	a0,zero,.L16
	li	a0,1
.L16:
	ret
	.size	norm_custom_min, .-norm_custom_min
	.section	.text.heap_stats,"ax",@progbits
	.align	1
	.type	heap_stats, @function
heap_stats:
	addi	sp,sp,-240
	sd	ra,232(sp)
	sd	s0,224(sp)
	sd	s1,216(sp)
	sd	s2,208(sp)
	sd	s3,200(sp)
	sd	s4,192(sp)
	sd	s5,184(sp)
	sd	s6,176(sp)
	sd	s7,168(sp)
	sd	s8,160(sp)
	sd	s9,152(sp)
	sd	s10,144(sp)
	sd	s11,136(sp)
	fsd	fs0,120(sp)
	fsd	fs1,112(sp)
	fsd	fs2,104(sp)
	ld	a6,Caml_state
	ld	s7,280(a6)
	ld	a7,caml_heap_start
	li	s6,0
	li	s5,0
	li	s4,0
	li	s3,0
	li	s0,0
	li	s1,0
	li	s2,0
	j	.L20
.L23:
	li	a2,768
	beq	a4,a2,.L25
.L26:
	srli	a5,a5,10
	addi	a5,a5,1
	slli	a5,a5,3
	add	a3,a3,a5
.L21:
	bgeu	a3,a1,.L34
	ld	a5,0(a3)
	andi	a4,a5,768
	li	a2,512
	beq	a4,a2,.L22
	bgtu	a4,a2,.L23
	beq	a4,zero,.L24
	li	a2,256
	bne	a4,a2,.L26
.L25:
	addi	s1,s1,1
	srli	a4,a5,10
	add	s2,s2,a4
	addi	s2,s2,1
	j	.L26
.L24:
	srli	a4,a5,10
	bne	a4,zero,.L27
	addi	s5,s5,1
	j	.L26
.L27:
	lw	t1,caml_gc_phase
	li	a2,2
	beq	t1,a2,.L35
.L28:
	addi	s1,s1,1
	add	s2,s2,a4
	addi	s2,s2,1
	j	.L26
.L35:
	ld	a2,caml_gc_sweep_hp
	bgtu	a2,a3,.L28
	addi	s3,s3,1
	add	s0,s0,a4
	addi	s0,s0,1
	addi	a4,a4,1
	bleu	a4,s4,.L26
	mv	s4,a4
	j	.L26
.L22:
	addi	s3,s3,1
	srli	a4,a5,10
	add	s0,s0,a4
	addi	s0,s0,1
	addi	a4,a4,1
	bleu	a4,s4,.L26
	mv	s4,a4
	j	.L26
.L34:
	ld	a7,-8(a7)
.L20:
	beq	a7,zero,.L36
	addi	s6,s6,1
	ld	a1,-16(a7)
	add	a1,a7,a1
	mv	a3,a7
	j	.L21
.L36:
	bne	a0,zero,.L37
	li	a0,1
.L19:
	ld	ra,232(sp)
	ld	s0,224(sp)
	ld	s1,216(sp)
	ld	s2,208(sp)
	ld	s3,200(sp)
	ld	s4,192(sp)
	ld	s5,184(sp)
	ld	s6,176(sp)
	ld	s7,168(sp)
	ld	s8,160(sp)
	ld	s9,152(sp)
	ld	s10,144(sp)
	ld	s11,136(sp)
	fld	fs0,120(sp)
	fld	fs1,112(sp)
	fld	fs2,104(sp)
	addi	sp,sp,240
	jr	ra
.L37:
	li	a5,1
	sd	a5,24(sp)
	sd	s7,32(sp)
	addi	a4,sp,32
	sd	a4,280(a6)
	sd	a5,48(sp)
	sd	a5,40(sp)
	addi	a5,sp,24
	sd	a5,56(sp)
	fld	fs1,288(a6)
	ld	a5,56(a6)
	ld	a4,0(a6)
	sub	a5,a5,a4
	srai	a5,a5,3
	fcvt.d.l	fa5,a5
	fadd.d	fs1,fs1,fa5
	fld	fs2,296(a6)
	fld	fs0,304(a6)
	ld	a5,caml_allocated_words
	fcvt.d.lu	fa5,a5
	fadd.d	fs0,fs0,fa5
	ld	s11,312(a6)
	ld	s10,320(a6)
	ld	s9,328(a6)
	ld	s8,344(a6)
	ld	a5,336(a6)
	sd	a5,8(sp)
	li	a0,16
	call	caml_alloc_tuple
	sd	a0,24(sp)
	fmv.d	fa0,fs1
	call	caml_copy_double
	mv	a1,a0
	ld	a0,24(sp)
	call	caml_modify
	fmv.d	fa0,fs2
	call	caml_copy_double
	mv	a1,a0
	ld	a0,24(sp)
	addi	a0,a0,8
	call	caml_modify
	fmv.d	fa0,fs0
	call	caml_copy_double
	mv	a1,a0
	ld	a0,24(sp)
	addi	a0,a0,16
	call	caml_modify
	slli	a1,s11,1
	addi	a1,a1,1
	ld	a0,24(sp)
	addi	a0,a0,24
	call	caml_modify
	slli	a1,s10,1
	addi	a1,a1,1
	ld	a0,24(sp)
	addi	a0,a0,32
	call	caml_modify
	slli	a1,s9,1
	addi	a1,a1,1
	ld	a0,24(sp)
	addi	a0,a0,40
	call	caml_modify
	slli	a1,s6,1
	addi	a1,a1,1
	ld	a0,24(sp)
	addi	a0,a0,48
	call	caml_modify
	slli	a1,s2,1
	addi	a1,a1,1
	ld	a0,24(sp)
	addi	a0,a0,56
	call	caml_modify
	slli	a1,s1,1
	addi	a1,a1,1
	ld	a0,24(sp)
	addi	a0,a0,64
	call	caml_modify
	slli	a1,s0,1
	addi	a1,a1,1
	ld	a0,24(sp)
	addi	a0,a0,72
	call	caml_modify
	slli	a1,s3,1
	addi	a1,a1,1
	ld	a0,24(sp)
	addi	a0,a0,80
	call	caml_modify
	slli	a1,s4,1
	addi	a1,a1,1
	ld	a0,24(sp)
	addi	a0,a0,88
	call	caml_modify
	slli	a1,s5,1
	addi	a1,a1,1
	ld	a0,24(sp)
	addi	a0,a0,96
	call	caml_modify
	slli	a1,s8,1
	addi	a1,a1,1
	ld	a0,24(sp)
	addi	a0,a0,104
	call	caml_modify
	ld	a5,8(sp)
	slli	a1,a5,1
	addi	a1,a1,1
	ld	a0,24(sp)
	addi	a0,a0,112
	call	caml_modify
	call	caml_stack_usage
	slli	a1,a0,1
	addi	a1,a1,1
	ld	a0,24(sp)
	addi	a0,a0,120
	call	caml_modify
	ld	a0,24(sp)
	ld	a5,Caml_state
	sd	s7,280(a5)
	j	.L19
	.size	heap_stats, .-heap_stats
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC2:
	.string	"Estimated overhead (lower bound) = %lu%%\n"
	.align	3
.LC3:
	.string	"Automatic compaction triggered.\n"
	.section	.text.test_and_compact,"ax",@progbits
	.align	1
	.type	test_and_compact, @function
test_and_compact:
	addi	sp,sp,-32
	sd	ra,24(sp)
	fsd	fs0,8(sp)
	ld	a4,caml_fl_cur_wsz
	fcvt.d.lu	fs0,a4
	fld	fa5,.LC1,a5
	fmul.d	fs0,fs0,fa5
	ld	a5,Caml_state
	ld	a5,328(a5)
	sub	a5,a5,a4
	fcvt.d.lu	fa5,a5
	fdiv.d	fs0,fs0,fa5
	fld	fa5,.LC0,a5
	fgt.d	a5,fs0,fa5
	beq	a5,zero,.L39
	fmv.d	fs0,fa5
.L39:
	fcvt.lu.d a2,fs0,rtz
	lla	a1,.LC2
	li	a0,512
	call	caml_gc_message
	ld	a5,caml_percent_max
	fcvt.d.lu	fa5,a5
	fle.d	a5,fa5,fs0
	bne	a5,zero,.L45
.L38:
	ld	ra,24(sp)
	fld	fs0,8(sp)
	addi	sp,sp,32
	jr	ra
.L45:
	lla	a1,.LC3
	li	a0,512
	call	caml_gc_message
	li	a0,-1
	call	caml_compact_heap
	j	.L38
	.size	test_and_compact, .-test_and_compact
	.section	.text.caml_gc_stat,"ax",@progbits
	.align	1
	.globl	caml_gc_stat
	.type	caml_gc_stat, @function
caml_gc_stat:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a0,1
	call	heap_stats
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_gc_stat, .-caml_gc_stat
	.section	.text.caml_gc_quick_stat,"ax",@progbits
	.align	1
	.globl	caml_gc_quick_stat
	.type	caml_gc_quick_stat, @function
caml_gc_quick_stat:
	addi	sp,sp,-192
	sd	ra,184(sp)
	sd	s0,176(sp)
	sd	s1,168(sp)
	sd	s2,160(sp)
	sd	s3,152(sp)
	sd	s4,144(sp)
	sd	s5,136(sp)
	sd	s6,128(sp)
	sd	s7,120(sp)
	fsd	fs0,104(sp)
	fsd	fs1,96(sp)
	fsd	fs2,88(sp)
	lla	s3,Caml_state
	ld	a5,0(s3)
	ld	s2,280(a5)
	li	a4,1
	sd	a4,72(sp)
	sd	s2,8(sp)
	addi	a3,sp,8
	sd	a3,280(a5)
	sd	a4,24(sp)
	sd	a4,16(sp)
	addi	a4,sp,72
	sd	a4,32(sp)
	fld	fs1,288(a5)
	ld	a4,56(a5)
	ld	a3,0(a5)
	sub	a4,a4,a3
	srai	a4,a4,3
	fcvt.d.l	fa5,a4
	fadd.d	fs1,fs1,fa5
	fld	fs2,296(a5)
	fld	fs0,304(a5)
	ld	a4,caml_allocated_words
	fcvt.d.lu	fa5,a4
	fadd.d	fs0,fs0,fa5
	ld	s7,312(a5)
	ld	s6,320(a5)
	ld	s5,328(a5)
	ld	s0,336(a5)
	ld	s1,344(a5)
	ld	s4,352(a5)
	li	a0,16
	call	caml_alloc_tuple
	sd	a0,72(sp)
	fmv.d	fa0,fs1
	call	caml_copy_double
	mv	a1,a0
	ld	a0,72(sp)
	call	caml_modify
	fmv.d	fa0,fs2
	call	caml_copy_double
	mv	a1,a0
	ld	a0,72(sp)
	addi	a0,a0,8
	call	caml_modify
	fmv.d	fa0,fs0
	call	caml_copy_double
	mv	a1,a0
	ld	a0,72(sp)
	addi	a0,a0,16
	call	caml_modify
	slli	a1,s7,1
	addi	a1,a1,1
	ld	a0,72(sp)
	addi	a0,a0,24
	call	caml_modify
	slli	a1,s6,1
	addi	a1,a1,1
	ld	a0,72(sp)
	addi	a0,a0,32
	call	caml_modify
	slli	a1,s5,1
	addi	a1,a1,1
	ld	a0,72(sp)
	addi	a0,a0,40
	call	caml_modify
	slli	a1,s4,1
	addi	a1,a1,1
	ld	a0,72(sp)
	addi	a0,a0,48
	call	caml_modify
	li	a1,1
	ld	a0,72(sp)
	addi	a0,a0,56
	call	caml_modify
	li	a1,1
	ld	a0,72(sp)
	addi	a0,a0,64
	call	caml_modify
	li	a1,1
	ld	a0,72(sp)
	addi	a0,a0,72
	call	caml_modify
	li	a1,1
	ld	a0,72(sp)
	addi	a0,a0,80
	call	caml_modify
	li	a1,1
	ld	a0,72(sp)
	addi	a0,a0,88
	call	caml_modify
	li	a1,1
	ld	a0,72(sp)
	addi	a0,a0,96
	call	caml_modify
	slli	a1,s1,1
	addi	a1,a1,1
	ld	a0,72(sp)
	addi	a0,a0,104
	call	caml_modify
	slli	a1,s0,1
	addi	a1,a1,1
	ld	a0,72(sp)
	addi	a0,a0,112
	call	caml_modify
	call	caml_stack_usage
	slli	a1,a0,1
	addi	a1,a1,1
	ld	a0,72(sp)
	addi	a0,a0,120
	call	caml_modify
	ld	a5,0(s3)
	sd	s2,280(a5)
	ld	a0,72(sp)
	ld	ra,184(sp)
	ld	s0,176(sp)
	ld	s1,168(sp)
	ld	s2,160(sp)
	ld	s3,152(sp)
	ld	s4,144(sp)
	ld	s5,136(sp)
	ld	s6,128(sp)
	ld	s7,120(sp)
	fld	fs0,104(sp)
	fld	fs1,96(sp)
	fld	fs2,88(sp)
	addi	sp,sp,192
	jr	ra
	.size	caml_gc_quick_stat, .-caml_gc_quick_stat
	.section	.text.caml_gc_minor_words_unboxed,"ax",@progbits
	.align	1
	.globl	caml_gc_minor_words_unboxed
	.type	caml_gc_minor_words_unboxed, @function
caml_gc_minor_words_unboxed:
	ld	a4,Caml_state
	fld	fa0,288(a4)
	ld	a5,56(a4)
	ld	a4,0(a4)
	sub	a5,a5,a4
	srai	a5,a5,3
	fcvt.d.l	fa5,a5
	fadd.d	fa0,fa0,fa5
	ret
	.size	caml_gc_minor_words_unboxed, .-caml_gc_minor_words_unboxed
	.section	.text.caml_gc_minor_words,"ax",@progbits
	.align	1
	.globl	caml_gc_minor_words
	.type	caml_gc_minor_words, @function
caml_gc_minor_words:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	lla	s0,Caml_state
	ld	a5,0(s0)
	ld	s1,280(a5)
	call	caml_gc_minor_words_unboxed
	call	caml_copy_double
	ld	a5,0(s0)
	sd	s1,280(a5)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_gc_minor_words, .-caml_gc_minor_words
	.section	.text.caml_gc_counters,"ax",@progbits
	.align	1
	.globl	caml_gc_counters
	.type	caml_gc_counters, @function
caml_gc_counters:
	addi	sp,sp,-144
	sd	ra,136(sp)
	sd	s0,128(sp)
	sd	s1,120(sp)
	fsd	fs0,104(sp)
	fsd	fs1,96(sp)
	fsd	fs2,88(sp)
	lla	s1,Caml_state
	ld	a5,0(s1)
	ld	s0,280(a5)
	li	a4,1
	sd	a4,72(sp)
	sd	s0,8(sp)
	addi	a3,sp,8
	sd	a3,280(a5)
	sd	a4,24(sp)
	sd	a4,16(sp)
	addi	a4,sp,72
	sd	a4,32(sp)
	fld	fs1,288(a5)
	ld	a4,56(a5)
	ld	a3,0(a5)
	sub	a4,a4,a3
	srai	a4,a4,3
	fcvt.d.l	fa5,a4
	fadd.d	fs1,fs1,fa5
	fld	fs2,296(a5)
	fld	fs0,304(a5)
	ld	a5,caml_allocated_words
	fcvt.d.lu	fa5,a5
	fadd.d	fs0,fs0,fa5
	li	a0,3
	call	caml_alloc_tuple
	sd	a0,72(sp)
	fmv.d	fa0,fs1
	call	caml_copy_double
	mv	a1,a0
	ld	a0,72(sp)
	call	caml_modify
	fmv.d	fa0,fs2
	call	caml_copy_double
	mv	a1,a0
	ld	a0,72(sp)
	addi	a0,a0,8
	call	caml_modify
	fmv.d	fa0,fs0
	call	caml_copy_double
	mv	a1,a0
	ld	a0,72(sp)
	addi	a0,a0,16
	call	caml_modify
	ld	a5,0(s1)
	sd	s0,280(a5)
	ld	a0,72(sp)
	ld	ra,136(sp)
	ld	s0,128(sp)
	ld	s1,120(sp)
	fld	fs0,104(sp)
	fld	fs1,96(sp)
	fld	fs2,88(sp)
	addi	sp,sp,144
	jr	ra
	.size	caml_gc_counters, .-caml_gc_counters
	.section	.text.caml_gc_huge_fallback_count,"ax",@progbits
	.align	1
	.globl	caml_gc_huge_fallback_count
	.type	caml_gc_huge_fallback_count, @function
caml_gc_huge_fallback_count:
	lw	a0,caml_huge_fallback_count
	slli	a0,a0,1
	addi	a0,a0,1
	ret
	.size	caml_gc_huge_fallback_count, .-caml_gc_huge_fallback_count
	.section	.text.caml_gc_get,"ax",@progbits
	.align	1
	.globl	caml_gc_get
	.type	caml_gc_get, @function
caml_gc_get:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	lla	s0,Caml_state
	ld	a4,0(s0)
	ld	s1,280(a4)
	li	a5,1
	sd	a5,72(sp)
	sd	s1,8(sp)
	addi	a3,sp,8
	sd	a3,280(a4)
	sd	a5,24(sp)
	sd	a5,16(sp)
	addi	a5,sp,72
	sd	a5,32(sp)
	li	a0,11
	call	caml_alloc_tuple
	sd	a0,72(sp)
	ld	a5,0(s0)
	ld	a1,80(a5)
	slli	a1,a1,1
	addi	a1,a1,1
	call	caml_modify
	ld	a1,caml_major_heap_increment
	slli	a1,a1,1
	addi	a1,a1,1
	ld	a0,72(sp)
	addi	a0,a0,8
	call	caml_modify
	ld	a1,caml_percent_free
	slli	a1,a1,1
	addi	a1,a1,1
	ld	a0,72(sp)
	addi	a0,a0,16
	call	caml_modify
	ld	a1,caml_verb_gc
	slli	a1,a1,1
	addi	a1,a1,1
	ld	a0,72(sp)
	addi	a0,a0,24
	call	caml_modify
	ld	a1,caml_percent_max
	slli	a1,a1,1
	addi	a1,a1,1
	ld	a0,72(sp)
	addi	a0,a0,32
	call	caml_modify
	li	a1,1
	ld	a0,72(sp)
	addi	a0,a0,40
	call	caml_modify
	ld	a1,caml_allocation_policy
	slli	a1,a1,1
	addi	a1,a1,1
	ld	a0,72(sp)
	addi	a0,a0,48
	call	caml_modify
	lw	a1,caml_major_window
	slli	a1,a1,1
	addi	a1,a1,1
	ld	a0,72(sp)
	addi	a0,a0,56
	call	caml_modify
	ld	a1,caml_custom_major_ratio
	slli	a1,a1,1
	addi	a1,a1,1
	ld	a0,72(sp)
	addi	a0,a0,64
	call	caml_modify
	ld	a1,caml_custom_minor_ratio
	slli	a1,a1,1
	addi	a1,a1,1
	ld	a0,72(sp)
	addi	a0,a0,72
	call	caml_modify
	ld	a1,caml_custom_minor_max_bsz
	slli	a1,a1,1
	addi	a1,a1,1
	ld	a0,72(sp)
	addi	a0,a0,80
	call	caml_modify
	ld	a5,0(s0)
	sd	s1,280(a5)
	ld	a0,72(sp)
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	addi	sp,sp,112
	jr	ra
	.size	caml_gc_get, .-caml_gc_get
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"New space overhead: %lu%%\n"
	.align	3
.LC5:
	.string	"New max overhead: %lu%%\n"
	.align	3
.LC6:
	.string	"New heap increment size: %luk words\n"
	.align	3
.LC7:
	.string	"New heap increment size: %lu%%\n"
	.align	3
.LC8:
	.string	"New smoothing window size: %d\n"
	.align	3
.LC9:
	.string	"New custom major ratio: %lu%%\n"
	.align	3
.LC10:
	.string	"New custom minor ratio: %lu%%\n"
	.align	3
.LC11:
	.string	"New custom minor size limit: %lu%%\n"
	.align	3
.LC12:
	.string	"New allocation policy: %lu\n"
	.align	3
.LC13:
	.string	"New minor heap size: %zuk words\n"
	.section	.text.caml_gc_set,"ax",@progbits
	.align	1
	.globl	caml_gc_set
	.type	caml_gc_set, @function
caml_gc_set:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s0,a0
	ld	a5,24(a0)
	srai	a5,a5,1
	sd	a5,caml_verb_gc,a4
	ld	a0,16(a0)
	srai	a0,a0,1
	call	norm_pfree
	ld	a5,caml_percent_free
	bne	a5,a0,.L70
.L59:
	ld	a0,32(s0)
	srai	a0,a0,1
	call	norm_pmax
	ld	a5,caml_percent_max
	bne	a5,a0,.L71
.L60:
	ld	a2,8(s0)
	srai	a2,a2,1
	ld	a5,caml_major_heap_increment
	beq	a5,a2,.L61
	sd	a2,caml_major_heap_increment,a5
	li	a5,1000
	bleu	a2,a5,.L62
	srli	a2,a2,10
	lla	a1,.LC6
	li	a0,32
	call	caml_gc_message
.L61:
	ld	a5,-8(s0)
	srli	a5,a5,10
	li	a4,7
	bgtu	a5,a4,.L72
.L63:
	ld	a5,-8(s0)
	srli	a5,a5,10
	li	a4,10
	bleu	a5,a4,.L64
	ld	a0,64(s0)
	call	norm_custom_maj
	ld	a5,caml_custom_major_ratio
	bne	a5,a0,.L73
.L65:
	ld	a0,72(s0)
	call	norm_custom_min
	ld	a5,caml_custom_minor_ratio
	bne	a5,a0,.L74
.L66:
	ld	a2,80(s0)
	ld	a5,caml_custom_minor_max_bsz
	bne	a5,a2,.L75
.L64:
	ld	a0,0(s0)
	srai	a0,a0,1
	call	norm_minsize
	mv	s1,a0
	ld	s0,48(s0)
	srai	s0,s0,1
	ld	a5,caml_allocation_policy
	bne	a5,s0,.L76
.L67:
	ld	a5,Caml_state
	ld	a5,80(a5)
	bne	a5,s1,.L77
.L68:
	call	caml_process_pending_actions
	li	a0,1
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L70:
	sd	a0,caml_percent_free,a5
	mv	a2,a0
	lla	a1,.LC4
	li	a0,32
	call	caml_gc_message
	j	.L59
.L71:
	sd	a0,caml_percent_max,a5
	mv	a2,a0
	lla	a1,.LC5
	li	a0,32
	call	caml_gc_message
	j	.L60
.L62:
	lla	a1,.LC7
	li	a0,32
	call	caml_gc_message
	j	.L61
.L72:
	lla	s1,caml_major_window
	lw	s2,0(s1)
	ld	a0,56(s0)
	srai	a0,a0,1
	call	norm_window
	sext.w	a0,a0
	call	caml_set_major_window
	lw	a2,0(s1)
	beq	a2,s2,.L63
	lla	a1,.LC8
	li	a0,32
	call	caml_gc_message
	j	.L63
.L73:
	sd	a0,caml_custom_major_ratio,a5
	mv	a2,a0
	lla	a1,.LC9
	li	a0,32
	call	caml_gc_message
	j	.L65
.L74:
	sd	a0,caml_custom_minor_ratio,a5
	mv	a2,a0
	lla	a1,.LC10
	li	a0,32
	call	caml_gc_message
	j	.L66
.L75:
	sd	a2,caml_custom_minor_max_bsz,a5
	lla	a1,.LC11
	li	a0,32
	call	caml_gc_message
	j	.L64
.L76:
	call	caml_empty_minor_heap
	call	caml_finish_major_cycle
	call	caml_finish_major_cycle
	mv	a0,s0
	call	caml_compact_heap
	mv	a2,s0
	lla	a1,.LC12
	li	a0,32
	call	caml_gc_message
	j	.L67
.L77:
	srli	a2,s1,10
	lla	a1,.LC13
	li	a0,32
	call	caml_gc_message
	slli	a0,s1,3
	call	caml_set_minor_heap_size
	j	.L68
	.size	caml_gc_set, .-caml_gc_set
	.section	.text.caml_gc_minor,"ax",@progbits
	.align	1
	.globl	caml_gc_minor
	.type	caml_gc_minor, @function
caml_gc_minor:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_request_minor_gc
	call	caml_process_pending_actions_exn
	call	caml_raise_if_exception
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_gc_minor, .-caml_gc_minor
	.section	.rodata.str1.8
	.align	3
.LC14:
	.string	"Major GC cycle requested\n"
	.section	.text.caml_gc_major,"ax",@progbits
	.align	1
	.globl	caml_gc_major
	.type	caml_gc_major, @function
caml_gc_major:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a1,.LC14
	li	a0,1
	call	caml_gc_message
	call	caml_empty_minor_heap
	call	caml_finish_major_cycle
	call	test_and_compact
	call	caml_process_pending_actions_exn
	call	caml_raise_if_exception
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_gc_major, .-caml_gc_major
	.section	.rodata.str1.8
	.align	3
.LC15:
	.string	"Full major GC cycle requested\n"
	.section	.text.caml_gc_full_major,"ax",@progbits
	.align	1
	.globl	caml_gc_full_major
	.type	caml_gc_full_major, @function
caml_gc_full_major:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a1,.LC15
	li	a0,1
	call	caml_gc_message
	call	caml_empty_minor_heap
	call	caml_finish_major_cycle
	call	caml_process_pending_actions_exn
	andi	a4,a0,3
	li	a5,2
	beq	a4,a5,.L83
	call	caml_empty_minor_heap
	call	caml_finish_major_cycle
	call	test_and_compact
	call	caml_process_pending_actions_exn
.L83:
	call	caml_raise_if_exception
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_gc_full_major, .-caml_gc_full_major
	.section	.text.caml_gc_major_slice,"ax",@progbits
	.align	1
	.globl	caml_gc_major_slice
	.type	caml_gc_major_slice, @function
caml_gc_major_slice:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a0,a0,1
	call	caml_major_collection_slice
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_gc_major_slice, .-caml_gc_major_slice
	.section	.rodata.str1.8
	.align	3
.LC16:
	.string	"Heap compaction requested\n"
	.section	.text.caml_gc_compaction,"ax",@progbits
	.align	1
	.globl	caml_gc_compaction
	.type	caml_gc_compaction, @function
caml_gc_compaction:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a1,.LC16
	li	a0,16
	call	caml_gc_message
	call	caml_empty_minor_heap
	call	caml_finish_major_cycle
	call	caml_process_pending_actions_exn
	andi	a4,a0,3
	li	a5,2
	beq	a4,a5,.L88
	call	caml_empty_minor_heap
	call	caml_finish_major_cycle
	li	a0,-1
	call	caml_compact_heap
	call	caml_process_pending_actions_exn
.L88:
	call	caml_raise_if_exception
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_gc_compaction, .-caml_gc_compaction
	.section	.text.caml_get_minor_free,"ax",@progbits
	.align	1
	.globl	caml_get_minor_free
	.type	caml_get_minor_free, @function
caml_get_minor_free:
	ld	a5,Caml_state
	ld	a0,0(a5)
	ld	a5,48(a5)
	sub	a0,a0,a5
	srai	a0,a0,3
	slli	a0,a0,1
	addi	a0,a0,1
	ret
	.size	caml_get_minor_free, .-caml_get_minor_free
	.section	.rodata.str1.8
	.align	3
.LC17:
	.string	"Gc.get_bucket"
	.section	.text.caml_get_major_bucket,"ax",@progbits
	.align	1
	.globl	caml_get_major_bucket
	.type	caml_get_major_bucket, @function
caml_get_major_bucket:
	blt	a0,zero,.L99
	srai	a3,a0,1
	lw	a4,caml_major_window
	ble	a4,a3,.L95
	lw	a5,caml_major_ring_index
	add	a5,a5,a3
	bgt	a4,a5,.L94
	sub	a5,a5,a4
.L94:
	slli	a5,a5,3
	lla	a4,caml_major_ring
	add	a5,a4,a5
	fld	fa5,0(a5)
	fld	fa4,.LC18,a5
	fmul.d	fa5,fa5,fa4
	fcvt.l.d a0,fa5,rtz
	slli	a0,a0,1
	addi	a0,a0,1
	ret
.L99:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,.LC17
	call	caml_invalid_argument
.L95:
	li	a0,1
	ret
	.size	caml_get_major_bucket, .-caml_get_major_bucket
	.section	.text.caml_get_major_credit,"ax",@progbits
	.align	1
	.globl	caml_get_major_credit
	.type	caml_get_major_credit, @function
caml_get_major_credit:
	fld	fa5,caml_major_work_credit,a5
	fld	fa4,.LC18,a5
	fmul.d	fa5,fa5,fa4
	fcvt.l.d a0,fa5,rtz
	slli	a0,a0,1
	addi	a0,a0,1
	ret
	.size	caml_get_major_credit, .-caml_get_major_credit
	.section	.rodata.str1.8
	.align	3
.LC19:
	.string	"cannot initialize page table"
	.align	3
.LC20:
	.string	"Initial minor heap size: %zuk words\n"
	.align	3
.LC21:
	.string	"Initial major heap size: %luk bytes\n"
	.align	3
.LC22:
	.string	"Initial space overhead: %lu%%\n"
	.align	3
.LC23:
	.string	"Initial max overhead: %lu%%\n"
	.align	3
.LC24:
	.string	"Initial heap increment: %luk words\n"
	.align	3
.LC25:
	.string	"Initial heap increment: %lu%%\n"
	.align	3
.LC26:
	.string	"Initial allocation policy: %lu\n"
	.align	3
.LC27:
	.string	"Initial smoothing window: %d\n"
	.section	.text.caml_init_gc,"ax",@progbits
	.align	1
	.globl	caml_init_gc
	.type	caml_init_gc, @function
caml_init_gc:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	sd	s1,56(sp)
	sd	s2,48(sp)
	sd	s3,40(sp)
	sd	s4,32(sp)
	sd	s5,24(sp)
	sd	s6,16(sp)
	sd	s7,8(sp)
	mv	s1,a0
	mv	s7,a2
	mv	s6,a3
	mv	s5,a4
	mv	s4,a5
	mv	s3,a6
	mv	s2,a7
	li	a5,61440
	bgeu	a1,a5,.L102
	li	a1,61440
.L102:
	slli	s0,a1,3
	li	a1,4096
	addi	a1,a1,-1
	add	s0,s0,a1
	li	a5,-4096
	and	s0,s0,a5
	slli	a0,s1,3
	add	a0,a0,s0
	call	caml_page_table_initialize
	bne	a0,zero,.L108
	mv	a0,s1
	call	norm_minsize
	slli	a0,a0,3
	call	caml_set_minor_heap_size
	lla	s1,caml_major_heap_increment
	sd	s7,0(s1)
	mv	a0,s6
	call	norm_pfree
	lla	s6,caml_percent_free
	sd	a0,0(s6)
	mv	a0,s5
	call	norm_pmax
	lla	s5,caml_percent_max
	sd	a0,0(s5)
	mv	a0,s0
	call	caml_init_major_heap
	mv	a0,s4
	call	norm_window
	sw	a0,caml_major_window,a5
	mv	a0,s3
	call	norm_custom_maj
	sd	a0,caml_custom_major_ratio,a5
	mv	a0,s2
	call	norm_custom_min
	sd	a0,caml_custom_minor_ratio,a5
	ld	a5,80(sp)
	sd	a5,caml_custom_minor_max_bsz,a4
	ld	a5,Caml_state
	ld	a2,80(a5)
	srli	a2,a2,10
	lla	a1,.LC20
	li	a0,32
	call	caml_gc_message
	srli	a2,s0,10
	lla	a1,.LC21
	li	a0,32
	call	caml_gc_message
	ld	a2,0(s6)
	lla	a1,.LC22
	li	a0,32
	call	caml_gc_message
	ld	a2,0(s5)
	lla	a1,.LC23
	li	a0,32
	call	caml_gc_message
	ld	a2,0(s1)
	li	a5,1000
	bleu	a2,a5,.L104
	srli	a2,a2,10
	lla	a1,.LC24
	li	a0,32
	call	caml_gc_message
.L105:
	ld	a2,caml_allocation_policy
	lla	a1,.LC26
	li	a0,32
	call	caml_gc_message
	lw	a2,caml_major_window
	lla	a1,.LC27
	li	a0,32
	call	caml_gc_message
	ld	ra,72(sp)
	ld	s0,64(sp)
	ld	s1,56(sp)
	ld	s2,48(sp)
	ld	s3,40(sp)
	ld	s4,32(sp)
	ld	s5,24(sp)
	ld	s6,16(sp)
	ld	s7,8(sp)
	addi	sp,sp,80
	jr	ra
.L108:
	lla	a0,.LC19
	call	caml_fatal_error
.L104:
	lla	a1,.LC25
	li	a0,32
	call	caml_gc_message
	j	.L105
	.size	caml_init_gc, .-caml_init_gc
	.section	.rodata.str1.8
	.align	3
.LC28:
	.string	""
	.section	.text.caml_runtime_variant,"ax",@progbits
	.align	1
	.globl	caml_runtime_variant
	.type	caml_runtime_variant, @function
caml_runtime_variant:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,.LC28
	call	caml_copy_string
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_runtime_variant, .-caml_runtime_variant
	.section	.rodata.str1.8
	.align	3
.LC29:
	.string	"a=%d,b=%d,H=%lu,i=%lu,l=%lu,o=%lu,O=%lu,p=%d,s=%zu,t=%lu,v=%lu,w=%d,W=%lu"
	.section	.text.caml_runtime_parameters,"ax",@progbits
	.align	1
	.globl	caml_runtime_parameters
	.type	caml_runtime_parameters, @function
caml_runtime_parameters:
	addi	sp,sp,-64
	sd	ra,56(sp)
	ld	a5,Caml_state
	lw	a2,224(a5)
	ld	a4,caml_runtime_warnings
	sd	a4,40(sp)
	lw	a4,caml_major_window
	sd	a4,32(sp)
	ld	a4,caml_verb_gc
	sd	a4,24(sp)
	ld	a4,caml_trace_level
	sd	a4,16(sp)
	ld	a5,80(a5)
	sd	a5,8(sp)
	lw	a5,caml_parser_trace
	sd	a5,0(sp)
	ld	a7,caml_percent_max
	ld	a6,caml_percent_free
	li	a5,0
	ld	a4,caml_major_heap_increment
	ld	a3,caml_use_huge_pages
	lw	a1,caml_allocation_policy
	lla	a0,.LC29
	call	caml_alloc_sprintf
	ld	ra,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	caml_runtime_parameters, .-caml_runtime_parameters
	.section	.text.caml_ml_enable_runtime_warnings,"ax",@progbits
	.align	1
	.globl	caml_ml_enable_runtime_warnings
	.type	caml_ml_enable_runtime_warnings, @function
caml_ml_enable_runtime_warnings:
	srai	a0,a0,1
	sext.w	a0,a0
	sd	a0,caml_runtime_warnings,a5
	li	a0,1
	ret
	.size	caml_ml_enable_runtime_warnings, .-caml_ml_enable_runtime_warnings
	.section	.text.caml_ml_runtime_warnings_enabled,"ax",@progbits
	.align	1
	.globl	caml_ml_runtime_warnings_enabled
	.type	caml_ml_runtime_warnings_enabled, @function
caml_ml_runtime_warnings_enabled:
	ld	a5,caml_runtime_warnings
	bne	a5,zero,.L117
	li	a0,1
	ret
.L117:
	li	a0,3
	ret
	.size	caml_ml_runtime_warnings_enabled, .-caml_ml_runtime_warnings_enabled
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	0
	.word	1093567614
	.align	3
.LC1:
	.word	0
	.word	1079574528
	.align	3
.LC18:
	.word	0
	.word	1093567616
	.ident	"GCC: (GNU) 9.2.0"
