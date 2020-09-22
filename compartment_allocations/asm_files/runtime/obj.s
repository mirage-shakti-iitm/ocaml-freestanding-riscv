	.file	"obj.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.caml_static_alloc,"ax",@progbits
	.align	1
	.globl	caml_static_alloc
	.type	caml_static_alloc, @function
caml_static_alloc:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a0,a0,1
	call	caml_stat_alloc
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_static_alloc, .-caml_static_alloc
	.section	.text.caml_static_free,"ax",@progbits
	.align	1
	.globl	caml_static_free
	.type	caml_static_free, @function
caml_static_free:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_stat_free
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_static_free, .-caml_static_free
	.section	.text.caml_static_resize,"ax",@progbits
	.align	1
	.globl	caml_static_resize
	.type	caml_static_resize, @function
caml_static_resize:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a1,a1,1
	call	caml_stat_resize
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_static_resize, .-caml_static_resize
	.section	.text.caml_obj_is_block,"ax",@progbits
	.align	1
	.globl	caml_obj_is_block
	.type	caml_obj_is_block, @function
caml_obj_is_block:
	andi	a0,a0,1
	beq	a0,zero,.L10
	li	a0,1
	ret
.L10:
	li	a0,3
	ret
	.size	caml_obj_is_block, .-caml_obj_is_block
	.section	.text.caml_obj_tag,"ax",@progbits
	.align	1
	.globl	caml_obj_tag
	.type	caml_obj_tag, @function
caml_obj_tag:
	andi	a5,a0,1
	bne	a5,zero,.L13
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	andi	a5,a0,7
	bne	a5,zero,.L14
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L15
	lbu	a0,-8(s0)
	slli	a0,a0,1
	addi	a0,a0,1
.L11:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L13:
	li	a0,2001
	ret
.L14:
	li	a0,2005
	j	.L11
.L15:
	li	a0,2003
	j	.L11
	.size	caml_obj_tag, .-caml_obj_tag
	.section	.text.caml_obj_set_tag,"ax",@progbits
	.align	1
	.globl	caml_obj_set_tag
	.type	caml_obj_set_tag, @function
caml_obj_set_tag:
	srai	a1,a1,1
	sb	a1,-8(a0)
	li	a0,1
	ret
	.size	caml_obj_set_tag, .-caml_obj_set_tag
	.section	.text.caml_obj_make_forward,"ax",@progbits
	.align	1
	.globl	caml_obj_make_forward
	.type	caml_obj_make_forward, @function
caml_obj_make_forward:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	call	caml_modify
	li	a5,-6
	sb	a5,-8(s0)
	li	a0,1
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_obj_make_forward, .-caml_obj_make_forward
	.section	.text.caml_obj_block,"ax",@progbits
	.align	1
	.globl	caml_obj_block
	.type	caml_obj_block, @function
caml_obj_block:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	srai	s0,a1,1
	srai	a0,a0,1
	bne	s0,zero,.L24
	slli	a0,a0,32
	srli	a0,a0,32
	addi	a0,a0,1
	slli	a5,a0,3
	ld	a0,caml_atom_table
	add	a0,a0,a5
.L23:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L24:
	sext.w	a1,a0
	mv	a0,s0
	call	caml_alloc
	li	a5,0
	j	.L26
.L27:
	slli	a4,a5,3
	add	a4,a4,a0
	li	a3,1
	sd	a3,0(a4)
	addi	a5,a5,1
.L26:
	bltu	a5,s0,.L27
	j	.L23
	.size	caml_obj_block, .-caml_obj_block
	.section	.text.caml_obj_with_tag,"ax",@progbits
	.align	1
	.globl	caml_obj_with_tag
	.type	caml_obj_with_tag, @function
caml_obj_with_tag:
	addi	sp,sp,-192
	sd	ra,184(sp)
	sd	s0,176(sp)
	sd	s1,168(sp)
	sd	s2,160(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	ld	a4,Caml_state
	ld	s2,280(a4)
	sd	s2,96(sp)
	li	a5,1
	sd	a5,112(sp)
	li	a3,2
	sd	a3,104(sp)
	addi	a3,sp,8
	sd	a3,120(sp)
	sd	sp,128(sp)
	sd	a5,88(sp)
	addi	a3,sp,96
	sd	a3,24(sp)
	addi	a3,sp,24
	sd	a3,280(a4)
	sd	a5,40(sp)
	sd	a5,32(sp)
	addi	a5,sp,88
	sd	a5,48(sp)
	ld	s0,-8(a1)
	srli	s0,s0,10
	srai	a0,a0,1
	beq	s0,zero,.L40
	sext.w	a1,a0
	li	a5,250
	bgtu	a1,a5,.L41
	li	a5,256
	bgtu	s0,a5,.L34
	li	a2,0
	mv	a0,s0
	call	caml_alloc_small_with_my_or_given_profinfo
	sd	a0,88(sp)
	li	a5,0
	j	.L35
.L40:
	slli	a0,a0,32
	srli	a0,a0,32
	addi	a0,a0,1
	slli	a0,a0,3
	ld	a5,caml_atom_table
	add	a0,a5,a0
	sd	s2,280(a4)
	j	.L29
.L41:
	mv	a0,s0
	call	caml_alloc
	sd	a0,88(sp)
	slli	a2,s0,3
	ld	a1,0(sp)
	call	memcpy
	j	.L33
.L36:
	slli	a2,a5,3
	ld	a4,88(sp)
	add	a4,a2,a4
	ld	a3,0(sp)
	add	a3,a3,a2
	ld	a3,0(a3)
	sd	a3,0(a4)
	addi	a5,a5,1
.L35:
	bltu	a5,s0,.L36
	j	.L33
.L34:
	mv	a0,s0
	call	caml_alloc_shr
	sd	a0,88(sp)
	li	s1,0
	j	.L37
.L38:
	slli	a4,s1,3
	ld	a5,0(sp)
	add	a5,a4,a5
	ld	a1,0(a5)
	ld	a0,88(sp)
	add	a0,a4,a0
	call	caml_initialize
	addi	s1,s1,1
.L37:
	bltu	s1,s0,.L38
	call	caml_process_pending_actions
.L33:
	ld	a0,88(sp)
	ld	a5,Caml_state
	sd	s2,280(a5)
.L29:
	ld	ra,184(sp)
	ld	s0,176(sp)
	ld	s1,168(sp)
	ld	s2,160(sp)
	addi	sp,sp,192
	jr	ra
	.size	caml_obj_with_tag, .-caml_obj_with_tag
	.section	.text.caml_obj_dup,"ax",@progbits
	.align	1
	.globl	caml_obj_dup
	.type	caml_obj_dup, @function
caml_obj_dup:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a1,a0
	lbu	a0,-8(a0)
	slli	a0,a0,1
	addi	a0,a0,1
	call	caml_obj_with_tag
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_obj_dup, .-caml_obj_dup
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Obj.truncate"
	.section	.text.caml_obj_truncate,"ax",@progbits
	.align	1
	.globl	caml_obj_truncate
	.type	caml_obj_truncate, @function
caml_obj_truncate:
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
	mv	s3,a0
	srai	s2,a1,1
	mv	s7,a0
	ld	s0,-8(a0)
	andi	s4,s0,0xff
	andi	s5,s0,768
	ld	a5,Caml_state
	ld	a4,40(a5)
	bleu	a4,a0,.L52
	ld	a5,32(a5)
	bgtu	a0,a5,.L53
	li	s6,768
	j	.L45
.L52:
	li	s6,768
.L45:
	srli	s0,s0,10
	beq	s2,zero,.L46
	bgtu	s2,s0,.L46
	beq	s2,s0,.L48
	li	a5,250
	bleu	s4,a5,.L54
.L50:
	sub	a5,s0,s2
	addi	a5,a5,-1
	slli	a5,a5,10
	add	a5,a5,s6
	slli	a4,s2,3
	add	a4,a4,s3
	addi	a5,a5,251
	sd	a5,0(a4)
	slli	s2,s2,10
	add	s2,s2,s5
	add	s2,s4,s2
	sd	s2,-8(s3)
.L48:
	li	a0,1
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
.L53:
	li	s6,0
	j	.L45
.L46:
	lla	a0,.LC0
	call	caml_invalid_argument
.L51:
	slli	a0,s1,3
	li	a1,1
	add	a0,a0,s7
	call	caml_modify
	addi	s1,s1,1
.L49:
	bltu	s1,s0,.L51
	j	.L50
.L54:
	mv	s1,s2
	j	.L49
	.size	caml_obj_truncate, .-caml_obj_truncate
	.section	.text.caml_obj_add_offset,"ax",@progbits
	.align	1
	.globl	caml_obj_add_offset
	.type	caml_obj_add_offset, @function
caml_obj_add_offset:
	lw	a5,8(a1)
	add	a0,a0,a5
	ret
	.size	caml_obj_add_offset, .-caml_obj_add_offset
	.section	.text.caml_lazy_follow_forward,"ax",@progbits
	.align	1
	.globl	caml_lazy_follow_forward
	.type	caml_lazy_follow_forward, @function
caml_lazy_follow_forward:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	andi	a5,a0,1
	beq	a5,zero,.L61
.L58:
	mv	a0,s0
.L57:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L61:
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L58
	lbu	a4,-8(s0)
	li	a5,250
	bne	a4,a5,.L58
	ld	a0,0(s0)
	j	.L57
	.size	caml_lazy_follow_forward, .-caml_lazy_follow_forward
	.section	.text.caml_lazy_make_forward,"ax",@progbits
	.align	1
	.globl	caml_lazy_make_forward
	.type	caml_lazy_make_forward, @function
caml_lazy_make_forward:
	addi	sp,sp,-192
	sd	ra,184(sp)
	sd	s0,176(sp)
	sd	s1,168(sp)
	sd	a0,8(sp)
	lla	s1,Caml_state
	ld	a4,0(s1)
	ld	s0,280(a4)
	sd	s0,96(sp)
	li	a5,1
	sd	a5,112(sp)
	sd	a5,104(sp)
	addi	a3,sp,8
	sd	a3,120(sp)
	sd	a5,88(sp)
	addi	a3,sp,96
	sd	a3,24(sp)
	addi	a3,sp,24
	sd	a3,280(a4)
	sd	a5,40(sp)
	sd	a5,32(sp)
	addi	a5,sp,88
	sd	a5,48(sp)
	li	a1,250
	li	a0,1
	call	caml_alloc_small
	sd	a0,88(sp)
	ld	a5,8(sp)
	sd	a5,0(a0)
	ld	a5,0(s1)
	sd	s0,280(a5)
	ld	a0,88(sp)
	ld	ra,184(sp)
	ld	s0,176(sp)
	ld	s1,168(sp)
	addi	sp,sp,192
	jr	ra
	.size	caml_lazy_make_forward, .-caml_lazy_make_forward
	.section	.text.caml_get_public_method,"ax",@progbits
	.align	1
	.globl	caml_get_public_method
	.type	caml_get_public_method, @function
caml_get_public_method:
	ld	a0,0(a0)
	lw	a2,0(a0)
	li	a3,3
.L66:
	bge	a3,a2,.L71
	addw	a5,a3,a2
	sraiw	a5,a5,1
	ori	a5,a5,1
	slli	a4,a5,3
	add	a4,a4,a0
	ld	a4,0(a4)
	bgt	a4,a1,.L72
	mv	a3,a5
	j	.L66
.L72:
	addiw	a2,a5,-2
	j	.L66
.L71:
	slli	a3,a3,3
	add	a3,a3,a0
	ld	a5,0(a3)
	beq	a5,a1,.L73
	li	a0,0
	ret
.L73:
	ld	a0,-8(a3)
	ret
	.size	caml_get_public_method, .-caml_get_public_method
	.section	.text.caml_set_oo_id,"ax",@progbits
	.align	1
	.globl	caml_set_oo_id
	.type	caml_set_oo_id, @function
caml_set_oo_id:
	lla	a4,oo_last_id
	ld	a5,0(a4)
	sd	a5,8(a0)
	addi	a5,a5,2
	sd	a5,0(a4)
	ret
	.size	caml_set_oo_id, .-caml_set_oo_id
	.section	.text.caml_fresh_oo_id,"ax",@progbits
	.align	1
	.globl	caml_fresh_oo_id
	.type	caml_fresh_oo_id, @function
caml_fresh_oo_id:
	lla	a5,oo_last_id
	ld	a0,0(a5)
	addi	a4,a0,2
	sd	a4,0(a5)
	ret
	.size	caml_fresh_oo_id, .-caml_fresh_oo_id
	.section	.text.caml_int_as_pointer,"ax",@progbits
	.align	1
	.globl	caml_int_as_pointer
	.type	caml_int_as_pointer, @function
caml_int_as_pointer:
	addi	a0,a0,-1
	ret
	.size	caml_int_as_pointer, .-caml_int_as_pointer
	.section	.text.caml_obj_reachable_words,"ax",@progbits
	.align	1
	.globl	caml_obj_reachable_words
	.type	caml_obj_reachable_words, @function
caml_obj_reachable_words:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	sd	s1,72(sp)
	sd	s2,64(sp)
	sd	s3,56(sp)
	sd	s4,48(sp)
	sd	s5,40(sp)
	sd	s6,32(sp)
	sd	s7,24(sp)
	sd	s8,16(sp)
	sd	s9,8(sp)
	sd	s10,0(sp)
	andi	s2,a0,1
	beq	s2,zero,.L101
.L78:
	li	a0,1
.L77:
	ld	ra,88(sp)
	ld	s0,80(sp)
	ld	s1,72(sp)
	ld	s2,64(sp)
	ld	s3,56(sp)
	ld	s4,48(sp)
	ld	s5,40(sp)
	ld	s6,32(sp)
	ld	s7,24(sp)
	ld	s8,16(sp)
	ld	s9,8(sp)
	ld	s10,0(sp)
	addi	sp,sp,96
	jr	ra
.L101:
	mv	s0,a0
	call	caml_page_table_lookup
	andi	a5,a0,3
	beq	a5,zero,.L78
	ld	a5,-8(s0)
	andi	a3,a5,0xff
	li	a4,249
	beq	a3,a4,.L102
.L81:
	ld	a5,-8(s0)
	srli	a4,a5,8
	andi	a4,a4,3
	or	a4,s0,a4
	lla	s4,first_chunk.2605
	sd	a4,8(s4)
	andi	a5,a5,-769
	ori	a5,a5,512
	sd	a5,-8(s0)
	li	a5,0
	li	s3,1
	mv	s6,s4
	j	.L82
.L102:
	srli	a5,a5,10
	slli	a5,a5,3
	sub	s0,s0,a5
	j	.L81
.L83:
	addiw	s5,a5,1
	slli	a5,a5,3
	add	a5,s4,a5
	ld	s7,8(a5)
	andi	s7,s7,-4
	ld	a5,-8(s7)
	srli	s8,a5,10
	add	s2,s2,s8
	addi	s2,s2,1
	andi	a5,a5,0xff
	li	a4,250
	bleu	a5,a4,.L103
.L85:
	mv	a5,s5
.L82:
	beq	s3,a5,.L104
.L91:
	li	a4,4096
	bne	a5,a4,.L83
	ld	s4,0(s4)
	li	a5,0
	j	.L83
.L105:
	srli	a5,a5,10
	slli	a5,a5,3
	sub	s1,s1,a5
	j	.L87
.L88:
	srli	a5,s1,8
	andi	a5,a5,3
	or	s10,s10,a5
	slli	a5,s3,3
	add	a5,s6,a5
	sd	s10,8(a5)
	andi	s1,s1,-769
	ori	s1,s1,512
	sd	s1,0(s9)
	addiw	s3,s3,1
.L86:
	addiw	s0,s0,1
.L84:
	bgeu	s0,s8,.L85
	slli	a5,s0,3
	add	a5,a5,s7
	ld	s1,0(a5)
	andi	a5,s1,1
	bne	a5,zero,.L86
	mv	a0,s1
	call	caml_page_table_lookup
	andi	a0,a0,3
	beq	a0,zero,.L86
	ld	a5,-8(s1)
	andi	a3,a5,0xff
	li	a4,249
	beq	a3,a4,.L105
.L87:
	mv	s10,s1
	addi	s9,s1,-8
	ld	s1,-8(s1)
	andi	a4,s1,768
	li	a5,512
	beq	a4,a5,.L86
	li	a5,4096
	bne	s3,a5,.L88
	li	a0,32768
	addi	a0,a0,8
	call	malloc
	beq	a0,zero,.L98
	sd	a0,0(s6)
	mv	s6,a0
	li	s3,0
	j	.L88
.L103:
	li	s0,0
	j	.L84
.L104:
	bne	s4,s6,.L91
.L89:
	li	a3,0
	lla	a0,first_chunk.2605
	j	.L92
.L98:
	li	s2,-1
	j	.L89
.L107:
	call	free
	mv	a0,s0
	li	a3,0
.L93:
	slli	a5,a3,3
	add	a5,a0,a5
	ld	a5,8(a5)
	andi	a2,a5,-4
	ld	a4,-8(a2)
	andi	a4,a4,-769
	slli	a5,a5,8
	andi	a5,a5,768
	or	a5,a4,a5
	sd	a5,-8(a2)
	addiw	a3,a3,1
.L92:
	beq	s3,a3,.L106
.L94:
	li	a5,4096
	bne	a3,a5,.L93
	ld	s0,0(a0)
	lla	a5,first_chunk.2605
	bne	a0,a5,.L107
	mv	a0,s0
	li	a3,0
	j	.L93
.L106:
	bne	a0,s6,.L94
	lla	a5,first_chunk.2605
	beq	a0,a5,.L95
	call	free
.L95:
	blt	s2,zero,.L108
	slli	a0,s2,1
	addi	a0,a0,1
	j	.L77
.L108:
	call	caml_raise_out_of_memory
	.size	caml_obj_reachable_words, .-caml_obj_reachable_words
	.bss
	.align	3
	.type	first_chunk.2605, @object
	.size	first_chunk.2605, 32776
first_chunk.2605:
	.zero	32776
	.section	.sdata,"aw"
	.align	3
	.type	oo_last_id, @object
	.size	oo_last_id, 8
oo_last_id:
	.dword	1
	.ident	"GCC: (GNU) 9.2.0"
