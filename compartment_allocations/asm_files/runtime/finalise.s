	.file	"finalise.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.gen_final_invariant_check,"ax",@progbits
	.align	1
	.type	gen_final_invariant_check, @function
gen_final_invariant_check:
	li	a4,0
.L2:
	ld	a5,8(a0)
	bleu	a5,a4,.L4
	addi	a4,a4,1
	j	.L2
.L5:
	addi	a5,a5,1
.L4:
	ld	a4,16(a0)
	bgtu	a4,a5,.L5
	ret
	.size	gen_final_invariant_check, .-gen_final_invariant_check
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"out of memory"
	.section	.text.alloc_to_do,"ax",@progbits
	.align	1
	.type	alloc_to_do, @function
alloc_to_do:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	slli	a5,a0,1
	add	a5,a5,a0
	slli	a5,a5,3
	addi	a0,a5,40
	call	caml_stat_alloc_noexc
	beq	a0,zero,.L11
	sd	zero,0(a0)
	sw	s0,8(a0)
	ld	a5,to_do_tl
	beq	a5,zero,.L12
	sd	a0,0(a5)
	sd	a0,to_do_tl,a5
.L6:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L11:
	lla	a0,.LC0
	call	caml_fatal_error
.L12:
	sd	a0,to_do_hd,a5
	sd	a0,to_do_tl,a5
	lw	a5,running_finalisation_function
	bne	a5,zero,.L6
	call	caml_set_action_pending
	j	.L6
	.size	alloc_to_do, .-alloc_to_do
	.section	.text.generic_final_update,"ax",@progbits
	.align	1
	.type	generic_final_update, @function
generic_final_update:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s0,a0
	mv	s1,a1
	li	a0,0
	li	a4,0
	j	.L14
.L15:
	addi	a4,a4,1
.L14:
	ld	a5,8(s0)
	bleu	a5,a4,.L29
	ld	a3,0(s0)
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,3
	add	a5,a3,a5
	ld	a5,8(a5)
	ld	a5,-8(a5)
	andi	a5,a5,768
	bne	a5,zero,.L15
	addi	a0,a0,1
	j	.L15
.L29:
	bne	a0,zero,.L30
.L13:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L30:
	sext.w	a0,a0
	call	alloc_to_do
	li	s2,0
	li	a2,0
	li	a4,0
	j	.L18
.L20:
	addi	s2,s2,1
.L21:
	addi	a4,a4,1
.L18:
	ld	a5,8(s0)
	bleu	a5,a4,.L31
	ld	a3,0(s0)
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,3
	add	a5,a3,a5
	ld	a1,8(a5)
	ld	a1,-8(a1)
	andi	a1,a1,768
	bne	a1,zero,.L19
	ld	a1,to_do_tl
	slli	a3,s2,1
	add	a3,a3,s2
	slli	a3,a3,3
	add	a3,a1,a3
	ld	a0,0(a5)
	sd	a0,16(a3)
	ld	a0,8(a5)
	sd	a0,24(a3)
	ld	a5,16(a5)
	sd	a5,32(a3)
	bne	s1,zero,.L20
	li	a5,1
	sd	a5,24(a3)
	sw	zero,32(a3)
	j	.L20
.L19:
	slli	a1,a2,1
	add	a1,a1,a2
	slli	a1,a1,3
	add	a3,a3,a1
	ld	a1,0(a5)
	sd	a1,0(a3)
	ld	a1,8(a5)
	sd	a1,8(a3)
	ld	a5,16(a5)
	sd	a5,16(a3)
	addi	a2,a2,1
	j	.L21
.L31:
	sd	a2,8(s0)
.L23:
	ld	a5,16(s0)
	bleu	a5,a4,.L32
	ld	a3,0(s0)
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,3
	add	a5,a3,a5
	slli	a1,a2,1
	add	a1,a1,a2
	slli	a1,a1,3
	add	a3,a3,a1
	ld	a1,0(a5)
	sd	a1,0(a3)
	ld	a1,8(a5)
	sd	a1,8(a3)
	ld	a5,16(a5)
	sd	a5,16(a3)
	addi	a4,a4,1
	addi	a2,a2,1
	j	.L23
.L32:
	sd	a2,16(s0)
	ld	a5,to_do_tl
	sw	s2,8(a5)
	beq	s1,zero,.L13
	li	s0,0
	j	.L25
.L26:
	slli	a5,s0,1
	add	a5,a5,s0
	slli	a5,a5,3
	ld	a4,to_do_tl
	add	a5,a4,a5
	li	a1,0
	ld	a0,24(a5)
	call	caml_darken
	addi	s0,s0,1
.L25:
	bltu	s0,s2,.L26
	j	.L13
	.size	generic_final_update, .-generic_final_update
	.section	.text.generic_final_minor_update,"ax",@progbits
	.align	1
	.type	generic_final_minor_update, @function
generic_final_minor_update:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	ld	a4,8(a0)
	li	s1,0
	j	.L34
.L35:
	addi	a4,a4,1
.L34:
	ld	a5,16(s0)
	bleu	a5,a4,.L48
	ld	a3,0(s0)
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,3
	add	a5,a3,a5
	ld	a5,8(a5)
	ld	a3,Caml_state
	ld	a2,40(a3)
	bgeu	a5,a2,.L35
	ld	a3,32(a3)
	bleu	a5,a3,.L35
	ld	a5,-8(a5)
	beq	a5,zero,.L35
	addi	s1,s1,1
	j	.L35
.L48:
	bne	s1,zero,.L49
.L37:
	ld	a4,8(s0)
	j	.L42
.L49:
	sext.w	s1,s1
	mv	a0,s1
	call	alloc_to_do
	ld	a3,8(s0)
	mv	a1,a3
	li	t1,0
	j	.L38
.L39:
	slli	a2,a1,1
	add	a2,a2,a1
	slli	a2,a2,3
	add	a4,a4,a2
	ld	a2,0(a5)
	sd	a2,0(a4)
	ld	a2,8(a5)
	sd	a2,8(a4)
	ld	a5,16(a5)
	sd	a5,16(a4)
	addi	a1,a1,1
.L40:
	addi	a3,a3,1
.L38:
	ld	a5,16(s0)
	bleu	a5,a3,.L50
	ld	a4,0(s0)
	slli	a5,a3,1
	add	a5,a5,a3
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a2,8(a5)
	ld	a0,Caml_state
	ld	a6,40(a0)
	bgeu	a2,a6,.L39
	ld	a0,32(a0)
	bleu	a2,a0,.L39
	ld	a2,-8(a2)
	beq	a2,zero,.L39
	slli	a4,t1,1
	add	a4,a4,t1
	slli	a2,a4,3
	ld	a4,to_do_tl
	add	a4,a4,a2
	ld	a2,0(a5)
	sd	a2,16(a4)
	ld	a2,8(a5)
	sd	a2,24(a4)
	ld	a5,16(a5)
	sd	a5,32(a4)
	li	a5,1
	sd	a5,24(a4)
	sw	zero,32(a4)
	addi	t1,t1,1
	j	.L40
.L50:
	sd	a1,16(s0)
	ld	a5,to_do_tl
	sw	s1,8(a5)
	j	.L37
.L43:
	addi	a4,a4,1
.L42:
	ld	a5,16(s0)
	bleu	a5,a4,.L51
	ld	a3,0(s0)
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,3
	add	a5,a3,a5
	ld	a3,8(a5)
	ld	a2,Caml_state
	ld	a1,40(a2)
	bgeu	a3,a1,.L43
	ld	a2,32(a2)
	bleu	a3,a2,.L43
	ld	a3,0(a3)
	sd	a3,8(a5)
	j	.L43
.L51:
	li	a4,0
	j	.L45
.L46:
	addi	a4,a4,1
.L45:
	bgtu	a5,a4,.L46
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	generic_final_minor_update, .-generic_final_minor_update
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"Gc.finalise"
	.section	.text.generic_final_register,"ax",@progbits
	.align	1
	.type	generic_final_register, @function
generic_final_register:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	andi	a5,a2,1
	bne	a5,zero,.L53
	mv	s0,a0
	mv	s2,a1
	mv	s1,a2
	mv	a0,a2
	call	caml_page_table_lookup
	andi	a0,a0,3
	beq	a0,zero,.L53
	lbu	a5,-8(s1)
	li	a4,246
	beq	a5,a4,.L53
	li	a4,253
	beq	a5,a4,.L53
	li	a4,250
	beq	a5,a4,.L53
	ld	a5,16(s0)
	ld	a1,24(s0)
	bltu	a5,a1,.L55
	ld	a0,0(s0)
	beq	a0,zero,.L60
	slli	s3,a1,1
	add	a1,s3,a1
	slli	a1,a1,4
	call	caml_stat_resize
	sd	a0,0(s0)
	sd	s3,24(s0)
.L55:
	ld	a4,0(s0)
	ld	a3,16(s0)
	slli	a5,a3,1
	add	a5,a5,a3
	slli	a5,a5,3
	add	a5,a4,a5
	sd	s2,0(a5)
	lbu	a4,-8(s1)
	li	a5,249
	beq	a4,a5,.L61
	ld	a4,0(s0)
	ld	a3,16(s0)
	slli	a5,a3,1
	add	a5,a5,a3
	slli	a5,a5,3
	add	a5,a4,a5
	sw	zero,16(a5)
	ld	a4,0(s0)
	ld	a3,16(s0)
	slli	a5,a3,1
	add	a5,a5,a3
	slli	a5,a5,3
	add	a5,a4,a5
	sd	s1,8(a5)
.L58:
	ld	a5,16(s0)
	addi	a5,a5,1
	sd	a5,16(s0)
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L53:
	lla	a0,.LC1
	call	caml_invalid_argument
.L60:
	li	a0,720
	call	caml_stat_alloc
	sd	a0,0(s0)
	li	a5,30
	sd	a5,24(s0)
	j	.L55
.L61:
	ld	a5,-8(s1)
	srli	a5,a5,10
	ld	a3,0(s0)
	ld	a2,16(s0)
	slli	a4,a2,1
	add	a4,a4,a2
	slli	a4,a4,3
	add	a4,a3,a4
	slliw	a5,a5,3
	sw	a5,16(a4)
	ld	a2,-8(s1)
	srli	a2,a2,10
	slli	a2,a2,3
	ld	a4,0(s0)
	ld	a3,16(s0)
	slli	a5,a3,1
	add	a5,a5,a3
	slli	a5,a5,3
	add	a5,a4,a5
	sub	s1,s1,a2
	sd	s1,8(a5)
	j	.L58
	.size	generic_final_register, .-generic_final_register
	.section	.text.caml_final_update_mark_phase,"ax",@progbits
	.align	1
	.globl	caml_final_update_mark_phase
	.type	caml_final_update_mark_phase, @function
caml_final_update_mark_phase:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a1,1
	lla	a0,.LANCHOR0
	call	generic_final_update
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_final_update_mark_phase, .-caml_final_update_mark_phase
	.section	.text.caml_final_update_clean_phase,"ax",@progbits
	.align	1
	.globl	caml_final_update_clean_phase
	.type	caml_final_update_clean_phase, @function
caml_final_update_clean_phase:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a1,0
	lla	a0,.LANCHOR0+32
	call	generic_final_update
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_final_update_clean_phase, .-caml_final_update_clean_phase
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"Calling finalisation functions.\n"
	.align	3
.LC3:
	.string	"Done calling finalisation functions.\n"
	.section	.text.caml_final_do_calls_exn,"ax",@progbits
	.align	1
	.globl	caml_final_do_calls_exn
	.type	caml_final_do_calls_exn, @function
caml_final_do_calls_exn:
	lw	a5,running_finalisation_function
	bne	a5,zero,.L74
	ld	a5,to_do_hd
	beq	a5,zero,.L75
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	ld	a5,caml_finalise_begin_hook
	beq	a5,zero,.L68
	jalr	a5
.L68:
	lla	a1,.LC2
	li	a0,128
	call	caml_gc_message
	j	.L69
.L71:
	beq	a0,zero,.L73
	lw	a4,8(a0)
	addiw	a4,a4,-1
	sext.w	a3,a4
	sw	a4,8(a0)
	slli	a5,a3,1
	add	a5,a5,a3
	slli	a5,a5,3
	add	a5,a0,a5
	ld	a0,16(a5)
	sd	a0,8(sp)
	ld	a1,24(a5)
	sd	a1,16(sp)
	ld	a5,32(a5)
	sd	a5,24(sp)
	lla	s0,running_finalisation_function
	li	a4,1
	sw	a4,0(s0)
	sext.w	a5,a5
	add	a1,a1,a5
	call	caml_callback_exn
	sw	zero,0(s0)
	andi	a4,a0,3
	li	a5,2
	beq	a4,a5,.L66
.L69:
	ld	a0,to_do_hd
	beq	a0,zero,.L71
	lw	a5,8(a0)
	bne	a5,zero,.L71
	ld	s0,0(a0)
	call	caml_stat_free
	sd	s0,to_do_hd,a5
	bne	s0,zero,.L69
	sd	zero,to_do_tl,a5
	j	.L69
.L73:
	lla	a1,.LC3
	li	a0,128
	call	caml_gc_message
	ld	a5,caml_finalise_end_hook
	beq	a5,zero,.L76
	jalr	a5
	li	a0,1
.L66:
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
.L74:
	li	a0,1
	ret
.L75:
	li	a0,1
	ret
.L76:
	li	a0,1
	j	.L66
	.size	caml_final_do_calls_exn, .-caml_final_do_calls_exn
	.section	.text.caml_final_do_roots,"ax",@progbits
	.align	1
	.globl	caml_final_do_roots
	.type	caml_final_do_roots, @function
caml_final_do_roots:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	sd	s4,0(sp)
	mv	s4,a0
	li	s0,0
.L82:
	ld	a5,.LANCHOR0+16
	bleu	a5,s0,.L91
	slli	a1,s0,1
	add	a1,a1,s0
	slli	a1,a1,3
	ld	a5,.LANCHOR0
	add	a1,a5,a1
	ld	a0,0(a1)
	jalr	s4
	addi	s0,s0,1
	j	.L82
.L91:
	li	s0,0
	j	.L84
.L85:
	slli	a1,s0,1
	add	a1,a1,s0
	slli	a1,a1,3
	ld	a5,.LANCHOR0+32
	add	a1,a5,a1
	ld	a0,0(a1)
	jalr	s4
	addi	s0,s0,1
.L84:
	ld	a5,.LANCHOR0+48
	bgtu	a5,s0,.L85
	ld	s3,to_do_hd
	j	.L86
.L87:
	slli	s0,s2,1
	add	s1,s0,s2
	slli	s1,s1,3
	addi	s1,s1,16
	add	s1,s3,s1
	add	s0,s0,s2
	slli	s0,s0,3
	add	s0,s3,s0
	mv	a1,s1
	ld	a0,16(s0)
	jalr	s4
	addi	a1,s1,8
	ld	a0,24(s0)
	jalr	s4
	addi	s2,s2,1
.L88:
	lw	a5,8(s3)
	bgtu	a5,s2,.L87
	ld	s3,0(s3)
.L86:
	beq	s3,zero,.L92
	li	s2,0
	j	.L88
.L92:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	ld	s4,0(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_final_do_roots, .-caml_final_do_roots
	.section	.text.caml_final_invert_finalisable_values,"ax",@progbits
	.align	1
	.globl	caml_final_invert_finalisable_values
	.type	caml_final_invert_finalisable_values, @function
caml_final_invert_finalisable_values:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	li	s0,0
.L94:
	ld	a5,.LANCHOR0+16
	bleu	a5,s0,.L99
	slli	a4,s0,1
	add	a4,a4,s0
	slli	a3,a4,3
	ld	a5,.LANCHOR0
	add	a5,a5,a3
	addi	a1,a5,8
	ld	a0,8(a5)
	call	caml_invert_root
	addi	s0,s0,1
	j	.L94
.L99:
	li	s0,0
	j	.L96
.L97:
	slli	a4,s0,1
	add	a4,a4,s0
	slli	a3,a4,3
	ld	a5,.LANCHOR0+32
	add	a5,a5,a3
	addi	a1,a5,8
	ld	a0,8(a5)
	call	caml_invert_root
	addi	s0,s0,1
.L96:
	ld	a5,.LANCHOR0+48
	bgtu	a5,s0,.L97
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_final_invert_finalisable_values, .-caml_final_invert_finalisable_values
	.section	.text.caml_final_oldify_young_roots,"ax",@progbits
	.align	1
	.globl	caml_final_oldify_young_roots
	.type	caml_final_oldify_young_roots, @function
caml_final_oldify_young_roots:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	ld	s0,.LANCHOR0+8
.L101:
	ld	a5,.LANCHOR0+16
	bleu	a5,s0,.L106
	lla	s2,.LANCHOR0
	ld	a1,0(s2)
	slli	a5,s0,1
	add	a5,a5,s0
	slli	s1,a5,3
	add	a1,a1,s1
	ld	a0,0(a1)
	call	caml_oldify_one
	ld	a5,0(s2)
	add	a5,a5,s1
	addi	a1,a5,8
	ld	a0,8(a5)
	call	caml_oldify_one
	addi	s0,s0,1
	j	.L101
.L106:
	ld	s0,.LANCHOR0+40
	j	.L103
.L104:
	slli	a5,s0,1
	add	a5,a5,s0
	slli	a4,a5,3
	ld	a1,.LANCHOR0+32
	add	a1,a1,a4
	ld	a0,0(a1)
	call	caml_oldify_one
	addi	s0,s0,1
.L103:
	ld	a5,.LANCHOR0+48
	bgtu	a5,s0,.L104
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_final_oldify_young_roots, .-caml_final_oldify_young_roots
	.section	.text.caml_final_update_minor_roots,"ax",@progbits
	.align	1
	.globl	caml_final_update_minor_roots
	.type	caml_final_update_minor_roots, @function
caml_final_update_minor_roots:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,.LANCHOR0+32
	call	generic_final_minor_update
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_final_update_minor_roots, .-caml_final_update_minor_roots
	.section	.text.caml_final_empty_young,"ax",@progbits
	.align	1
	.globl	caml_final_empty_young
	.type	caml_final_empty_young, @function
caml_final_empty_young:
	lla	a5,.LANCHOR0
	ld	a4,16(a5)
	sd	a4,8(a5)
	ld	a4,48(a5)
	sd	a4,40(a5)
	ret
	.size	caml_final_empty_young, .-caml_final_empty_young
	.section	.text.caml_final_register,"ax",@progbits
	.align	1
	.globl	caml_final_register
	.type	caml_final_register, @function
caml_final_register:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a2,a1
	mv	a1,a0
	lla	a0,.LANCHOR0
	call	generic_final_register
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_final_register, .-caml_final_register
	.section	.text.caml_final_register_called_without_value,"ax",@progbits
	.align	1
	.globl	caml_final_register_called_without_value
	.type	caml_final_register_called_without_value, @function
caml_final_register_called_without_value:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a2,a1
	mv	a1,a0
	lla	a0,.LANCHOR0+32
	call	generic_final_register
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_final_register_called_without_value, .-caml_final_register_called_without_value
	.section	.text.caml_final_release,"ax",@progbits
	.align	1
	.globl	caml_final_release
	.type	caml_final_release, @function
caml_final_release:
	sw	zero,running_finalisation_function,a5
	ld	a5,to_do_tl
	beq	a5,zero,.L117
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_set_action_pending
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L117:
	li	a0,1
	ret
	.size	caml_final_release, .-caml_final_release
	.section	.text.caml_final_invariant_check,"ax",@progbits
	.align	1
	.globl	caml_final_invariant_check
	.type	caml_final_invariant_check, @function
caml_final_invariant_check:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,.LANCHOR0
	call	gen_final_invariant_check
	lla	a0,.LANCHOR0+32
	call	gen_final_invariant_check
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_final_invariant_check, .-caml_final_invariant_check
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	finalisable_first, @object
	.size	finalisable_first, 32
finalisable_first:
	.zero	32
	.type	finalisable_last, @object
	.size	finalisable_last, 32
finalisable_last:
	.zero	32
	.section	.sbss,"aw",@nobits
	.align	3
	.type	running_finalisation_function, @object
	.size	running_finalisation_function, 4
running_finalisation_function:
	.zero	4
	.zero	4
	.type	to_do_tl, @object
	.size	to_do_tl, 8
to_do_tl:
	.zero	8
	.type	to_do_hd, @object
	.size	to_do_hd, 8
to_do_hd:
	.zero	8
	.ident	"GCC: (GNU) 9.2.0"
