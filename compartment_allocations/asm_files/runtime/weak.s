	.file	"weak.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.do_check_key_clean,"ax",@progbits
	.align	1
	.type	do_check_key_clean, @function
do_check_key_clean:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	lw	s1,caml_gc_phase
	li	a5,1
	beq	s1,a5,.L7
.L1:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L7:
	mv	s2,a0
	slli	a1,a1,3
	add	s0,a1,a0
	ld	s3,0(s0)
	ld	a5,caml_ephe_none
	beq	a5,s3,.L1
	andi	a5,s3,1
	beq	a5,zero,.L8
	li	a0,0
.L3:
	beq	a0,zero,.L1
	ld	a5,caml_ephe_none
	sd	a5,0(s0)
	sd	a5,8(s2)
	j	.L1
.L8:
	mv	a0,s3
	call	caml_page_table_lookup
	andi	a0,a0,1
	beq	a0,zero,.L3
	ld	a5,-8(s3)
	andi	a5,a5,768
	bne	a5,zero,.L5
	mv	a0,s1
	j	.L3
.L5:
	li	a0,0
	j	.L3
	.size	do_check_key_clean, .-do_check_key_clean
	.section	.text.do_set,"ax",@progbits
	.align	1
	.type	do_set, @function
do_set:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s1,a0
	mv	s0,a1
	andi	a5,a2,1
	bne	a5,zero,.L10
	ld	a5,Caml_state
	ld	a4,40(a5)
	bleu	a4,a2,.L10
	ld	a5,32(a5)
	bleu	a2,a5,.L10
	slli	a5,a1,3
	add	a5,a5,a0
	ld	a4,0(a5)
	sd	a2,0(a5)
	andi	a5,a4,1
	bne	a5,zero,.L11
	ld	a5,Caml_state
	ld	a3,40(a5)
	bleu	a3,a4,.L11
	ld	a5,32(a5)
	bgtu	a4,a5,.L9
.L11:
	ld	a5,Caml_state
	ld	s2,112(a5)
	ld	a4,24(s2)
	ld	a5,32(s2)
	bgeu	a4,a5,.L15
.L13:
	ld	a5,24(s2)
	addi	a4,a5,16
	sd	a4,24(s2)
	sd	s1,0(a5)
	sd	s0,8(a5)
	j	.L9
.L15:
	mv	a0,s2
	call	caml_realloc_ephe_ref_table
	j	.L13
.L10:
	slli	s0,s0,3
	add	a0,s0,s1
	sd	a2,0(a0)
.L9:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	do_set, .-do_set
	.section	.text.optionalize,"ax",@progbits
	.align	1
	.type	optionalize, @function
optionalize:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	ld	a4,Caml_state
	ld	s0,280(a4)
	li	a5,1
	sd	a5,72(sp)
	sd	a5,64(sp)
	sd	s0,0(sp)
	sd	sp,280(a4)
	sd	a5,16(sp)
	li	a5,2
	sd	a5,8(sp)
	addi	a5,sp,72
	sd	a5,24(sp)
	addi	a5,sp,64
	sd	a5,32(sp)
	bne	a0,zero,.L19
.L17:
	call	caml_process_pending_actions
	ld	a5,Caml_state
	sd	s0,280(a5)
	ld	a0,72(sp)
	ld	ra,88(sp)
	ld	s0,80(sp)
	addi	sp,sp,96
	jr	ra
.L19:
	ld	a5,0(a1)
	sd	a5,64(sp)
	li	a1,0
	li	a0,1
	call	caml_alloc_small
	sd	a0,72(sp)
	ld	a5,64(sp)
	sd	a5,0(a0)
	j	.L17
	.size	optionalize, .-optionalize
	.section	.text.caml_ephemeron_num_keys,"ax",@progbits
	.align	1
	.globl	caml_ephemeron_num_keys
	.type	caml_ephemeron_num_keys, @function
caml_ephemeron_num_keys:
	ld	a0,-8(a0)
	srli	a0,a0,10
	addi	a0,a0,-2
	ret
	.size	caml_ephemeron_num_keys, .-caml_ephemeron_num_keys
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Weak.create"
	.section	.text.caml_ephemeron_create,"ax",@progbits
	.align	1
	.globl	caml_ephemeron_create
	.type	caml_ephemeron_create, @function
caml_ephemeron_create:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	li	a5,-1025
	srli	a5,a5,10
	bgeu	a0,a5,.L26
	addi	s0,a0,2
	li	a1,251
	mv	a0,s0
	call	caml_alloc_shr
	li	a5,1
	j	.L23
.L26:
	lla	a0,.LC0
	call	caml_invalid_argument
.L24:
	slli	a4,a5,3
	add	a4,a4,a0
	ld	a3,caml_ephe_none
	sd	a3,0(a4)
	addi	a5,a5,1
.L23:
	bltu	a5,s0,.L24
	lla	a5,caml_ephe_list_head
	ld	a4,0(a5)
	sd	a4,0(a0)
	sd	a0,0(a5)
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ephemeron_create, .-caml_ephemeron_create
	.section	.text.caml_ephe_create,"ax",@progbits
	.align	1
	.globl	caml_ephe_create
	.type	caml_ephe_create, @function
caml_ephe_create:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a0,a0,1
	call	caml_ephemeron_create
	call	caml_process_pending_actions_with_root
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ephe_create, .-caml_ephe_create
	.section	.text.caml_weak_create,"ax",@progbits
	.align	1
	.globl	caml_weak_create
	.type	caml_weak_create, @function
caml_weak_create:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_ephe_create
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_weak_create, .-caml_weak_create
	.section	.text.caml_ephemeron_set_key,"ax",@progbits
	.align	1
	.globl	caml_ephemeron_set_key
	.type	caml_ephemeron_set_key, @function
caml_ephemeron_set_key:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s1,a0
	mv	s2,a2
	addi	s0,a1,2
	mv	a1,s0
	call	do_check_key_clean
	mv	a2,s2
	mv	a1,s0
	mv	a0,s1
	call	do_set
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_ephemeron_set_key, .-caml_ephemeron_set_key
	.section	.text.caml_ephe_set_key,"ax",@progbits
	.align	1
	.globl	caml_ephe_set_key
	.type	caml_ephe_set_key, @function
caml_ephe_set_key:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a1,a1,1
	call	caml_ephemeron_set_key
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ephe_set_key, .-caml_ephe_set_key
	.section	.text.caml_ephemeron_unset_key,"ax",@progbits
	.align	1
	.globl	caml_ephemeron_unset_key
	.type	caml_ephemeron_unset_key, @function
caml_ephemeron_unset_key:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a0
	addi	s0,a1,2
	mv	a1,s0
	call	do_check_key_clean
	slli	s0,s0,3
	add	a0,s0,s1
	ld	a5,caml_ephe_none
	sd	a5,0(a0)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_ephemeron_unset_key, .-caml_ephemeron_unset_key
	.section	.text.caml_ephe_unset_key,"ax",@progbits
	.align	1
	.globl	caml_ephe_unset_key
	.type	caml_ephe_unset_key, @function
caml_ephe_unset_key:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a1,a1,1
	call	caml_ephemeron_unset_key
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ephe_unset_key, .-caml_ephe_unset_key
	.section	.text.caml_ephe_set_key_option,"ax",@progbits
	.align	1
	.globl	caml_ephe_set_key_option
	.type	caml_ephe_set_key_option, @function
caml_ephe_set_key_option:
	addi	sp,sp,-16
	sd	ra,8(sp)
	andi	a5,a2,1
	bne	a5,zero,.L40
	ld	a2,0(a2)
	call	caml_ephe_set_key
.L41:
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L40:
	call	caml_ephe_unset_key
	j	.L41
	.size	caml_ephe_set_key_option, .-caml_ephe_set_key_option
	.section	.text.caml_weak_set,"ax",@progbits
	.align	1
	.globl	caml_weak_set
	.type	caml_weak_set, @function
caml_weak_set:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_ephe_set_key_option
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_weak_set, .-caml_weak_set
	.section	.text.caml_ephemeron_set_data,"ax",@progbits
	.align	1
	.globl	caml_ephemeron_set_data
	.type	caml_ephemeron_set_data, @function
caml_ephemeron_set_data:
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
	mv	s1,a0
	mv	s5,a1
	lw	s6,caml_gc_phase
	li	a5,1
	beq	s6,a5,.L57
.L46:
	mv	a2,s5
	li	a1,1
	mv	a0,s1
	call	do_set
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
.L57:
	ld	s7,-8(a0)
	srli	s7,s7,10
	li	s4,2
	li	s8,0
	j	.L47
.L58:
	mv	a0,s2
	call	caml_realloc_ephe_ref_table
.L52:
	ld	a5,24(s2)
	addi	a4,a5,16
	sd	a4,24(s2)
	sd	s1,0(a5)
	sd	s4,8(a5)
.L48:
	ld	a5,caml_ephe_none
	beq	a5,s0,.L49
	andi	a5,s0,1
	bne	a5,zero,.L49
	mv	s2,s0
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,3
	beq	a0,zero,.L49
	addi	s10,s0,-8
	lbu	a4,-8(s0)
	li	a5,250
	bne	a4,a5,.L50
	ld	s0,0(s0)
	andi	a5,s0,1
	bne	a5,zero,.L50
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L50
	lbu	a5,-8(s0)
	li	a4,250
	beq	a5,a4,.L50
	li	a4,246
	beq	a5,a4,.L50
	li	a4,253
	beq	a5,a4,.L50
	sd	s0,0(s3)
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s0,a4,.L48
	ld	a4,32(a5)
	bleu	s0,a4,.L48
	ld	s2,112(a5)
	ld	a4,24(s2)
	ld	a5,32(s2)
	bltu	a4,a5,.L52
	j	.L58
.L50:
	ld	a5,0(s10)
	andi	a5,a5,768
	bne	a5,zero,.L49
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s2,a4,.L53
	ld	a5,32(a5)
	bgtu	s2,a5,.L49
.L53:
	ld	a5,caml_ephe_none
	sd	a5,0(s3)
	mv	s8,s6
.L49:
	addi	s4,s4,1
.L47:
	bleu	s7,s4,.L59
	slli	s3,s4,3
	add	s3,s3,s1
	ld	s0,0(s3)
	j	.L48
.L59:
	ld	a4,8(s1)
	ld	a5,caml_ephe_none
	beq	a4,a5,.L46
	beq	s8,zero,.L46
	sd	a5,8(s1)
	j	.L46
	.size	caml_ephemeron_set_data, .-caml_ephemeron_set_data
	.section	.text.caml_ephe_set_data,"ax",@progbits
	.align	1
	.globl	caml_ephe_set_data
	.type	caml_ephe_set_data, @function
caml_ephe_set_data:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_ephemeron_set_data
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ephe_set_data, .-caml_ephe_set_data
	.section	.text.caml_ephemeron_unset_data,"ax",@progbits
	.align	1
	.globl	caml_ephemeron_unset_data
	.type	caml_ephemeron_unset_data, @function
caml_ephemeron_unset_data:
	ld	a5,caml_ephe_none
	sd	a5,8(a0)
	ret
	.size	caml_ephemeron_unset_data, .-caml_ephemeron_unset_data
	.section	.text.caml_ephe_unset_data,"ax",@progbits
	.align	1
	.globl	caml_ephe_unset_data
	.type	caml_ephe_unset_data, @function
caml_ephe_unset_data:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_ephemeron_unset_data
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ephe_unset_data, .-caml_ephe_unset_data
	.section	.text.caml_ephemeron_get_key,"ax",@progbits
	.align	1
	.globl	caml_ephemeron_get_key
	.type	caml_ephemeron_get_key, @function
caml_ephemeron_get_key:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	sd	s4,16(sp)
	sd	s5,8(sp)
	mv	s3,a0
	mv	s4,a2
	addi	s0,a1,2
	slli	s1,s0,3
	add	s1,s1,a0
	ld	s2,0(s1)
	ld	a5,caml_ephe_none
	beq	s2,a5,.L71
	lw	s5,caml_gc_phase
	li	a5,1
	beq	s5,a5,.L76
.L67:
	li	a5,0
.L66:
	bne	a5,zero,.L74
	slli	s0,s0,3
	add	s0,s0,s3
	ld	s0,0(s0)
	lw	a5,caml_gc_phase
	bne	a5,zero,.L70
	andi	a5,s0,1
	beq	a5,zero,.L77
.L70:
	sd	s0,0(s4)
	li	a0,1
	j	.L69
.L76:
	andi	a5,s2,1
	beq	a5,zero,.L78
	li	a5,0
.L68:
	beq	a5,zero,.L67
	ld	a4,caml_ephe_none
	sd	a4,0(s1)
	sd	a4,8(s3)
	j	.L66
.L78:
	mv	a0,s2
	call	caml_page_table_lookup
	andi	a5,a0,1
	beq	a5,zero,.L68
	ld	a5,-8(s2)
	andi	a5,a5,768
	bne	a5,zero,.L73
	mv	a5,s5
	j	.L68
.L73:
	li	a5,0
	j	.L68
.L71:
	li	a5,1
	j	.L66
.L77:
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,1
	beq	a0,zero,.L70
	li	a1,0
	mv	a0,s0
	call	caml_darken
	j	.L70
.L74:
	li	a0,0
.L69:
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	ld	s4,16(sp)
	ld	s5,8(sp)
	addi	sp,sp,64
	jr	ra
	.size	caml_ephemeron_get_key, .-caml_ephemeron_get_key
	.section	.text.caml_ephe_get_key,"ax",@progbits
	.align	1
	.globl	caml_ephe_get_key
	.type	caml_ephe_get_key, @function
caml_ephe_get_key:
	addi	sp,sp,-32
	sd	ra,24(sp)
	addi	a2,sp,8
	srai	a1,a1,1
	call	caml_ephemeron_get_key
	addi	a1,sp,8
	call	optionalize
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_ephe_get_key, .-caml_ephe_get_key
	.section	.text.caml_weak_get,"ax",@progbits
	.align	1
	.globl	caml_weak_get
	.type	caml_weak_get, @function
caml_weak_get:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_ephe_get_key
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_weak_get, .-caml_weak_get
	.section	.text.caml_ephemeron_get_data,"ax",@progbits
	.align	1
	.globl	caml_ephemeron_get_data
	.type	caml_ephemeron_get_data, @function
caml_ephemeron_get_data:
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
	mv	s1,a0
	mv	s5,a1
	lw	s6,caml_gc_phase
	li	a5,1
	beq	s6,a5,.L98
.L84:
	ld	s0,8(s1)
	ld	a5,caml_ephe_none
	beq	a5,s0,.L96
	lw	a5,caml_gc_phase
	bne	a5,zero,.L95
	andi	a5,s0,1
	beq	a5,zero,.L99
.L95:
	sd	s0,0(s5)
	li	a0,1
.L94:
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
.L98:
	ld	s7,-8(a0)
	srli	s7,s7,10
	li	s4,2
	li	s8,0
	j	.L85
.L100:
	mv	a0,s2
	call	caml_realloc_ephe_ref_table
.L90:
	ld	a5,24(s2)
	addi	a4,a5,16
	sd	a4,24(s2)
	sd	s1,0(a5)
	sd	s4,8(a5)
.L86:
	ld	a5,caml_ephe_none
	beq	a5,s0,.L87
	andi	a5,s0,1
	bne	a5,zero,.L87
	mv	s2,s0
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,3
	beq	a0,zero,.L87
	addi	s10,s0,-8
	lbu	a4,-8(s0)
	li	a5,250
	bne	a4,a5,.L88
	ld	s0,0(s0)
	andi	a5,s0,1
	bne	a5,zero,.L88
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L88
	lbu	a5,-8(s0)
	li	a4,250
	beq	a5,a4,.L88
	li	a4,246
	beq	a5,a4,.L88
	li	a4,253
	beq	a5,a4,.L88
	sd	s0,0(s3)
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s0,a4,.L86
	ld	a4,32(a5)
	bleu	s0,a4,.L86
	ld	s2,112(a5)
	ld	a4,24(s2)
	ld	a5,32(s2)
	bltu	a4,a5,.L90
	j	.L100
.L88:
	ld	a5,0(s10)
	andi	a5,a5,768
	bne	a5,zero,.L87
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s2,a4,.L91
	ld	a5,32(a5)
	bgtu	s2,a5,.L87
.L91:
	ld	a5,caml_ephe_none
	sd	a5,0(s3)
	mv	s8,s6
.L87:
	addi	s4,s4,1
.L85:
	bleu	s7,s4,.L101
	slli	s3,s4,3
	add	s3,s3,s1
	ld	s0,0(s3)
	j	.L86
.L101:
	ld	a4,8(s1)
	ld	a5,caml_ephe_none
	beq	a4,a5,.L84
	beq	s8,zero,.L84
	sd	a5,8(s1)
	j	.L84
.L99:
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,1
	beq	a0,zero,.L95
	li	a1,0
	mv	a0,s0
	call	caml_darken
	j	.L95
.L96:
	li	a0,0
	j	.L94
	.size	caml_ephemeron_get_data, .-caml_ephemeron_get_data
	.section	.text.caml_ephe_get_data,"ax",@progbits
	.align	1
	.globl	caml_ephe_get_data
	.type	caml_ephe_get_data, @function
caml_ephe_get_data:
	addi	sp,sp,-32
	sd	ra,24(sp)
	addi	a1,sp,8
	call	caml_ephemeron_get_data
	addi	a1,sp,8
	call	optionalize
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_ephe_get_data, .-caml_ephe_get_data
	.section	.text.caml_ephemeron_get_key_copy,"ax",@progbits
	.align	1
	.globl	caml_ephemeron_get_key_copy
	.type	caml_ephemeron_get_key_copy, @function
caml_ephemeron_get_key_copy:
	addi	sp,sp,-160
	sd	ra,152(sp)
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	a0,8(sp)
	mv	s4,a2
	ld	a5,Caml_state
	ld	s5,280(a5)
	sd	s5,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	addi	s3,a1,2
	li	s1,1
	li	s2,0
	j	.L121
.L131:
	andi	a5,s6,1
	beq	a5,zero,.L128
	li	a0,0
.L107:
	beq	a0,zero,.L106
	ld	a5,caml_ephe_none
	sd	a5,0(s0)
	sd	a5,8(s7)
	j	.L105
.L128:
	mv	a0,s6
	call	caml_page_table_lookup
	andi	a0,a0,1
	beq	a0,zero,.L107
	ld	a5,-8(s6)
	andi	a5,a5,768
	bne	a5,zero,.L124
	mv	a0,s8
	j	.L107
.L124:
	li	a0,0
	j	.L107
.L122:
	li	a0,1
	j	.L105
.L132:
	ld	a5,Caml_state
	sd	s5,280(a5)
	li	a0,0
	j	.L109
.L110:
	lw	a5,caml_gc_phase
	bne	a5,zero,.L112
	beq	s6,zero,.L129
.L112:
	sd	s0,0(s4)
	ld	a5,Caml_state
	sd	s5,280(a5)
	li	a0,1
.L109:
	ld	ra,152(sp)
	ld	s0,144(sp)
	ld	s1,136(sp)
	ld	s2,128(sp)
	ld	s3,120(sp)
	ld	s4,112(sp)
	ld	s5,104(sp)
	ld	s6,96(sp)
	ld	s7,88(sp)
	ld	s8,80(sp)
	addi	sp,sp,160
	jr	ra
.L129:
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a5,a0,1
	beq	a5,zero,.L112
	li	a1,0
	mv	a0,s0
	call	caml_darken
	j	.L112
.L116:
	mv	a1,s3
	add	a0,s1,s2
	call	caml_modify
	addi	s0,s0,1
.L114:
	ld	a5,0(s6)
	srli	a5,a5,10
	bgeu	s0,a5,.L118
	slli	s2,s0,3
	add	a5,s7,s2
	ld	s3,0(a5)
	lw	a5,caml_gc_phase
	bne	a5,zero,.L116
	andi	a5,s3,1
	bne	a5,zero,.L116
	mv	a0,s3
	call	caml_page_table_lookup
	andi	a5,a0,1
	beq	a5,zero,.L116
	li	a1,0
	mv	a0,s3
	call	caml_darken
	j	.L116
.L133:
	ld	a2,-8(s0)
	srli	a2,a2,10
	slli	a2,a2,3
	mv	a1,s0
	mv	a0,s1
	call	memmove
.L118:
	sd	s1,0(s4)
	ld	a5,Caml_state
	sd	s5,280(a5)
	li	a0,1
	j	.L109
.L113:
	li	a5,8
	beq	s2,a5,.L130
	ld	a0,-8(s0)
	srli	a0,a0,10
	call	caml_alloc
	mv	s1,a0
.L120:
	addi	s2,s2,1
.L121:
	ld	s7,8(sp)
	slli	s0,s3,3
	add	s0,s0,s7
	ld	s6,0(s0)
	ld	a5,caml_ephe_none
	beq	s6,a5,.L122
	lw	s8,caml_gc_phase
	li	a5,1
	beq	s8,a5,.L131
.L106:
	li	a0,0
.L105:
	bne	a0,zero,.L132
	slli	a5,s3,3
	ld	a4,8(sp)
	add	a5,a5,a4
	ld	s0,0(a5)
	andi	s6,s0,1
	bne	s6,zero,.L110
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,3
	beq	a0,zero,.L110
	lbu	a1,-8(s0)
	li	a5,255
	beq	a1,a5,.L110
	li	a5,1
	beq	s1,a5,.L113
	ld	a4,-8(s0)
	srli	a4,a4,10
	ld	a5,-8(s1)
	srli	a5,a5,10
	bne	a4,a5,.L113
	lbu	a5,-8(s1)
	bne	a1,a5,.L113
	mv	s7,s0
	addi	s6,s0,-8
	lbu	a4,-8(s0)
	li	a5,250
	bgtu	a4,a5,.L133
	li	s0,0
	j	.L114
.L130:
	call	caml_minor_collection
	li	s1,1
	j	.L120
	.size	caml_ephemeron_get_key_copy, .-caml_ephemeron_get_key_copy
	.section	.text.caml_ephe_get_key_copy,"ax",@progbits
	.align	1
	.globl	caml_ephe_get_key_copy
	.type	caml_ephe_get_key_copy, @function
caml_ephe_get_key_copy:
	addi	sp,sp,-32
	sd	ra,24(sp)
	addi	a2,sp,8
	srai	a1,a1,1
	call	caml_ephemeron_get_key_copy
	addi	a1,sp,8
	call	optionalize
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_ephe_get_key_copy, .-caml_ephe_get_key_copy
	.section	.text.caml_weak_get_copy,"ax",@progbits
	.align	1
	.globl	caml_weak_get_copy
	.type	caml_weak_get_copy, @function
caml_weak_get_copy:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_ephe_get_key_copy
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_weak_get_copy, .-caml_weak_get_copy
	.section	.text.caml_ephemeron_get_data_copy,"ax",@progbits
	.align	1
	.globl	caml_ephemeron_get_data_copy
	.type	caml_ephemeron_get_data_copy, @function
caml_ephemeron_get_data_copy:
	addi	sp,sp,-208
	sd	ra,200(sp)
	sd	s0,192(sp)
	sd	s1,184(sp)
	sd	s2,176(sp)
	sd	s3,168(sp)
	sd	s4,160(sp)
	sd	s5,152(sp)
	sd	s6,144(sp)
	sd	s7,136(sp)
	sd	s8,128(sp)
	sd	s9,120(sp)
	sd	s10,112(sp)
	sd	s11,104(sp)
	sd	a0,24(sp)
	sd	a1,16(sp)
	ld	a5,Caml_state
	ld	s11,280(a5)
	sd	s11,32(sp)
	addi	a4,sp,32
	sd	a4,280(a5)
	li	a5,1
	sd	a5,48(sp)
	sd	a5,40(sp)
	addi	a5,sp,24
	sd	a5,56(sp)
	li	s3,1
	li	s5,0
	j	.L162
.L170:
	ld	s7,24(sp)
	ld	s10,-8(s7)
	srli	s10,s10,10
	li	s2,2
	sd	zero,8(sp)
	j	.L140
.L166:
	mv	a0,s4
	call	caml_realloc_ephe_ref_table
.L145:
	ld	a5,24(s4)
	addi	a4,a5,16
	sd	a4,24(s4)
	sd	s7,0(a5)
	sd	s2,8(a5)
.L141:
	ld	a5,caml_ephe_none
	beq	a5,s0,.L142
	andi	a5,s0,1
	bne	a5,zero,.L142
	mv	s6,s0
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,3
	beq	a0,zero,.L142
	addi	s9,s0,-8
	lbu	a4,-8(s0)
	li	a5,250
	bne	a4,a5,.L143
	ld	s0,0(s0)
	andi	a5,s0,1
	bne	a5,zero,.L143
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L143
	lbu	a5,-8(s0)
	li	a4,250
	beq	a5,a4,.L143
	li	a4,246
	beq	a5,a4,.L143
	li	a4,253
	beq	a5,a4,.L143
	sd	s0,0(s1)
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s0,a4,.L141
	ld	a4,32(a5)
	bleu	s0,a4,.L141
	ld	s4,112(a5)
	ld	a4,24(s4)
	ld	a5,32(s4)
	bltu	a4,a5,.L145
	j	.L166
.L143:
	ld	a5,0(s9)
	andi	a5,a5,768
	bne	a5,zero,.L142
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s6,a4,.L146
	ld	a5,32(a5)
	bgtu	s6,a5,.L142
.L146:
	ld	a5,caml_ephe_none
	sd	a5,0(s1)
	sd	s8,8(sp)
.L142:
	addi	s2,s2,1
.L140:
	bleu	s10,s2,.L167
	slli	s1,s2,3
	add	s1,s1,s7
	ld	s0,0(s1)
	j	.L141
.L167:
	ld	a4,8(s7)
	ld	a5,caml_ephe_none
	beq	a4,a5,.L139
	ld	a4,8(sp)
	beq	a4,zero,.L139
	sd	a5,8(s7)
	j	.L139
.L171:
	ld	a5,Caml_state
	sd	s11,280(a5)
	li	a0,0
	j	.L150
.L151:
	lw	a5,caml_gc_phase
	bne	a5,zero,.L153
	beq	s1,zero,.L168
.L153:
	ld	a5,16(sp)
	sd	s0,0(a5)
	ld	a5,Caml_state
	sd	s11,280(a5)
	li	a0,1
.L150:
	ld	ra,200(sp)
	ld	s0,192(sp)
	ld	s1,184(sp)
	ld	s2,176(sp)
	ld	s3,168(sp)
	ld	s4,160(sp)
	ld	s5,152(sp)
	ld	s6,144(sp)
	ld	s7,136(sp)
	ld	s8,128(sp)
	ld	s9,120(sp)
	ld	s10,112(sp)
	ld	s11,104(sp)
	addi	sp,sp,208
	jr	ra
.L168:
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a5,a0,1
	beq	a5,zero,.L153
	li	a1,0
	mv	a0,s0
	call	caml_darken
	j	.L153
.L157:
	mv	a1,s2
	add	a0,s3,s1
	call	caml_modify
	addi	s0,s0,1
.L155:
	ld	a5,0(s4)
	srli	a5,a5,10
	bgeu	s0,a5,.L159
	slli	s1,s0,3
	add	a5,s5,s1
	ld	s2,0(a5)
	lw	a5,caml_gc_phase
	bne	a5,zero,.L157
	andi	a5,s2,1
	bne	a5,zero,.L157
	mv	a0,s2
	call	caml_page_table_lookup
	andi	a5,a0,1
	beq	a5,zero,.L157
	li	a1,0
	mv	a0,s2
	call	caml_darken
	j	.L157
.L172:
	ld	a2,-8(s0)
	srli	a2,a2,10
	slli	a2,a2,3
	mv	a1,s0
	mv	a0,s3
	call	memmove
.L159:
	ld	a5,16(sp)
	sd	s3,0(a5)
	ld	a5,Caml_state
	sd	s11,280(a5)
	li	a0,1
	j	.L150
.L154:
	li	a5,8
	beq	s5,a5,.L169
	ld	a0,-8(s0)
	srli	a0,a0,10
	call	caml_alloc
	mv	s3,a0
.L161:
	addi	s5,s5,1
.L162:
	lw	s8,caml_gc_phase
	li	a5,1
	beq	s8,a5,.L170
.L139:
	ld	a5,24(sp)
	ld	s0,8(a5)
	ld	a5,caml_ephe_none
	beq	a5,s0,.L171
	andi	s1,s0,1
	bne	s1,zero,.L151
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,3
	beq	a0,zero,.L151
	lbu	a1,-8(s0)
	li	a5,255
	beq	a1,a5,.L151
	li	a5,1
	beq	s3,a5,.L154
	ld	a4,-8(s0)
	srli	a4,a4,10
	ld	a5,-8(s3)
	srli	a5,a5,10
	bne	a4,a5,.L154
	lbu	a5,-8(s3)
	bne	a1,a5,.L154
	mv	s5,s0
	addi	s4,s0,-8
	lbu	a4,-8(s0)
	li	a5,250
	bgtu	a4,a5,.L172
	li	s0,0
	j	.L155
.L169:
	call	caml_minor_collection
	li	s3,1
	j	.L161
	.size	caml_ephemeron_get_data_copy, .-caml_ephemeron_get_data_copy
	.section	.text.caml_ephe_get_data_copy,"ax",@progbits
	.align	1
	.globl	caml_ephe_get_data_copy
	.type	caml_ephe_get_data_copy, @function
caml_ephe_get_data_copy:
	addi	sp,sp,-32
	sd	ra,24(sp)
	addi	a1,sp,8
	call	caml_ephemeron_get_data_copy
	addi	a1,sp,8
	call	optionalize
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_ephe_get_data_copy, .-caml_ephe_get_data_copy
	.section	.text.caml_ephemeron_key_is_set,"ax",@progbits
	.align	1
	.globl	caml_ephemeron_key_is_set
	.type	caml_ephemeron_key_is_set, @function
caml_ephemeron_key_is_set:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	addi	s0,a1,2
	slli	s0,s0,3
	add	s0,s0,a0
	ld	s2,0(s0)
	ld	a5,caml_ephe_none
	beq	s2,a5,.L179
	mv	s1,a0
	lw	s3,caml_gc_phase
	li	a5,1
	beq	s3,a5,.L183
.L177:
	li	a0,0
.L176:
	seqz	a0,a0
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L183:
	andi	a5,s2,1
	beq	a5,zero,.L184
	li	a0,0
.L178:
	beq	a0,zero,.L177
	ld	a5,caml_ephe_none
	sd	a5,0(s0)
	sd	a5,8(s1)
	j	.L176
.L184:
	mv	a0,s2
	call	caml_page_table_lookup
	andi	a0,a0,1
	beq	a0,zero,.L178
	ld	a5,-8(s2)
	andi	a5,a5,768
	bne	a5,zero,.L181
	mv	a0,s3
	j	.L178
.L181:
	li	a0,0
	j	.L178
.L179:
	li	a0,1
	j	.L176
	.size	caml_ephemeron_key_is_set, .-caml_ephemeron_key_is_set
	.section	.text.caml_ephe_check_key,"ax",@progbits
	.align	1
	.globl	caml_ephe_check_key
	.type	caml_ephe_check_key, @function
caml_ephe_check_key:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a1,a1,1
	call	caml_ephemeron_key_is_set
	bne	a0,zero,.L189
	li	a0,1
.L185:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L189:
	li	a0,3
	j	.L185
	.size	caml_ephe_check_key, .-caml_ephe_check_key
	.section	.text.caml_weak_check,"ax",@progbits
	.align	1
	.globl	caml_weak_check
	.type	caml_weak_check, @function
caml_weak_check:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_ephe_check_key
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_weak_check, .-caml_weak_check
	.section	.text.caml_ephemeron_data_is_set,"ax",@progbits
	.align	1
	.globl	caml_ephemeron_data_is_set
	.type	caml_ephemeron_data_is_set, @function
caml_ephemeron_data_is_set:
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
	mv	s1,a0
	lw	s5,caml_gc_phase
	li	a5,1
	beq	s5,a5,.L204
.L193:
	ld	a5,8(s1)
	ld	a0,caml_ephe_none
	sub	a0,a0,a5
	snez	a0,a0
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
	addi	sp,sp,96
	jr	ra
.L204:
	ld	s6,-8(a0)
	srli	s6,s6,10
	li	s4,2
	li	s7,0
	j	.L194
.L205:
	mv	a0,s2
	call	caml_realloc_ephe_ref_table
.L199:
	ld	a5,24(s2)
	addi	a4,a5,16
	sd	a4,24(s2)
	sd	s1,0(a5)
	sd	s4,8(a5)
.L195:
	ld	a5,caml_ephe_none
	beq	a5,s0,.L196
	andi	a5,s0,1
	bne	a5,zero,.L196
	mv	s2,s0
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,3
	beq	a0,zero,.L196
	addi	s9,s0,-8
	lbu	a4,-8(s0)
	li	a5,250
	bne	a4,a5,.L197
	ld	s0,0(s0)
	andi	a5,s0,1
	bne	a5,zero,.L197
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L197
	lbu	a5,-8(s0)
	li	a4,250
	beq	a5,a4,.L197
	li	a4,246
	beq	a5,a4,.L197
	li	a4,253
	beq	a5,a4,.L197
	sd	s0,0(s3)
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s0,a4,.L195
	ld	a4,32(a5)
	bleu	s0,a4,.L195
	ld	s2,112(a5)
	ld	a4,24(s2)
	ld	a5,32(s2)
	bltu	a4,a5,.L199
	j	.L205
.L197:
	ld	a5,0(s9)
	andi	a5,a5,768
	bne	a5,zero,.L196
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s2,a4,.L200
	ld	a5,32(a5)
	bgtu	s2,a5,.L196
.L200:
	ld	a5,caml_ephe_none
	sd	a5,0(s3)
	mv	s7,s5
.L196:
	addi	s4,s4,1
.L194:
	bleu	s6,s4,.L206
	slli	s3,s4,3
	add	s3,s3,s1
	ld	s0,0(s3)
	j	.L195
.L206:
	ld	a4,8(s1)
	ld	a5,caml_ephe_none
	beq	a4,a5,.L193
	beq	s7,zero,.L193
	sd	a5,8(s1)
	j	.L193
	.size	caml_ephemeron_data_is_set, .-caml_ephemeron_data_is_set
	.section	.text.caml_ephe_check_data,"ax",@progbits
	.align	1
	.globl	caml_ephe_check_data
	.type	caml_ephe_check_data, @function
caml_ephe_check_data:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_ephemeron_data_is_set
	bne	a0,zero,.L211
	li	a0,1
.L207:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L211:
	li	a0,3
	j	.L207
	.size	caml_ephe_check_data, .-caml_ephe_check_data
	.section	.text.caml_ephemeron_blit_key,"ax",@progbits
	.align	1
	.globl	caml_ephemeron_blit_key
	.type	caml_ephemeron_blit_key, @function
caml_ephemeron_blit_key:
	beq	a4,zero,.L241
	addi	sp,sp,-128
	sd	ra,120(sp)
	sd	s0,112(sp)
	sd	s1,104(sp)
	sd	s2,96(sp)
	sd	s3,88(sp)
	sd	s4,80(sp)
	sd	s5,72(sp)
	sd	s6,64(sp)
	sd	s7,56(sp)
	sd	s8,48(sp)
	sd	s9,40(sp)
	sd	s10,32(sp)
	sd	s11,24(sp)
	mv	s2,a0
	mv	s5,a2
	mv	s1,a4
	addi	s3,a1,2
	addi	s4,a3,2
	lw	s11,caml_gc_phase
	li	a5,1
	beq	s11,a5,.L244
.L214:
	bgtu	s3,s4,.L238
	addi	s1,s1,-1
	j	.L236
.L244:
	add	a5,a4,s3
	sd	a5,0(sp)
	mv	s9,s3
	sd	zero,8(sp)
	j	.L215
.L245:
	mv	a0,s6
	call	caml_realloc_ephe_ref_table
.L220:
	ld	a5,24(s6)
	addi	a4,a5,16
	sd	a4,24(s6)
	sd	s2,0(a5)
	sd	s9,8(a5)
.L216:
	ld	a5,caml_ephe_none
	beq	a5,s0,.L217
	andi	a5,s0,1
	bne	a5,zero,.L217
	mv	s8,s0
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,3
	beq	a0,zero,.L217
	addi	s10,s0,-8
	lbu	a4,-8(s0)
	li	a5,250
	bne	a4,a5,.L218
	ld	s0,0(s0)
	andi	a5,s0,1
	bne	a5,zero,.L218
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L218
	lbu	a5,-8(s0)
	li	a4,250
	beq	a5,a4,.L218
	li	a4,246
	beq	a5,a4,.L218
	li	a4,253
	beq	a5,a4,.L218
	sd	s0,0(s7)
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s0,a4,.L216
	ld	a4,32(a5)
	bleu	s0,a4,.L216
	ld	s6,112(a5)
	ld	a4,24(s6)
	ld	a5,32(s6)
	bltu	a4,a5,.L220
	j	.L245
.L218:
	ld	a5,0(s10)
	andi	a5,a5,768
	bne	a5,zero,.L217
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s8,a4,.L221
	ld	a5,32(a5)
	bgtu	s8,a5,.L217
.L221:
	ld	a5,caml_ephe_none
	sd	a5,0(s7)
	sd	s11,8(sp)
.L217:
	addi	s9,s9,1
.L215:
	ld	a5,0(sp)
	bleu	a5,s9,.L246
	slli	s7,s9,3
	add	s7,s7,s2
	ld	s0,0(s7)
	j	.L216
.L246:
	ld	a4,8(s2)
	ld	a5,caml_ephe_none
	beq	a4,a5,.L223
	ld	a4,8(sp)
	beq	a4,zero,.L223
	sd	a5,8(s2)
.L223:
	ld	a4,8(s5)
	ld	a5,caml_ephe_none
	beq	a4,a5,.L214
	add	a5,s1,s4
	sd	a5,0(sp)
	mv	s10,s4
	sd	zero,8(sp)
	j	.L224
.L247:
	mv	a0,s6
	call	caml_realloc_ephe_ref_table
.L229:
	ld	a5,24(s6)
	addi	a4,a5,16
	sd	a4,24(s6)
	sd	s5,0(a5)
	sd	s10,8(a5)
.L225:
	ld	a5,caml_ephe_none
	beq	a5,s0,.L226
	andi	a5,s0,1
	bne	a5,zero,.L226
	mv	s7,s0
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,3
	beq	a0,zero,.L226
	addi	s9,s0,-8
	lbu	a4,-8(s0)
	li	a5,250
	bne	a4,a5,.L227
	ld	s0,0(s0)
	andi	a5,s0,1
	bne	a5,zero,.L227
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L227
	lbu	a5,-8(s0)
	li	a4,250
	beq	a5,a4,.L227
	li	a4,246
	beq	a5,a4,.L227
	li	a4,253
	beq	a5,a4,.L227
	sd	s0,0(s8)
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s0,a4,.L225
	ld	a4,32(a5)
	bleu	s0,a4,.L225
	ld	s6,112(a5)
	ld	a4,24(s6)
	ld	a5,32(s6)
	bltu	a4,a5,.L229
	j	.L247
.L227:
	ld	a5,0(s9)
	andi	a5,a5,768
	bne	a5,zero,.L226
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s7,a4,.L230
	ld	a5,32(a5)
	bgtu	s7,a5,.L226
.L230:
	ld	a5,caml_ephe_none
	sd	a5,0(s8)
	sd	s11,8(sp)
.L226:
	addi	s10,s10,1
.L224:
	ld	a5,0(sp)
	bleu	a5,s10,.L248
	slli	s8,s10,3
	add	s8,s8,s5
	ld	s0,0(s8)
	j	.L225
.L248:
	ld	a4,8(s5)
	ld	a5,caml_ephe_none
	beq	a4,a5,.L214
	ld	a4,8(sp)
	beq	a4,zero,.L214
	sd	a5,8(s5)
	j	.L214
.L235:
	add	a5,s0,s3
	slli	a5,a5,3
	add	a5,a5,s2
	ld	a2,0(a5)
	add	a1,s0,s4
	mv	a0,s5
	call	do_set
	addi	s0,s0,1
.L233:
	bltu	s0,s1,.L235
.L212:
	ld	ra,120(sp)
	ld	s0,112(sp)
	ld	s1,104(sp)
	ld	s2,96(sp)
	ld	s3,88(sp)
	ld	s4,80(sp)
	ld	s5,72(sp)
	ld	s6,64(sp)
	ld	s7,56(sp)
	ld	s8,48(sp)
	ld	s9,40(sp)
	ld	s10,32(sp)
	ld	s11,24(sp)
	addi	sp,sp,128
	jr	ra
.L238:
	li	s0,0
	j	.L233
.L237:
	add	a5,s1,s3
	slli	a5,a5,3
	add	a5,a5,s2
	ld	a2,0(a5)
	add	a1,s1,s4
	mv	a0,s5
	call	do_set
	addi	s1,s1,-1
.L236:
	bge	s1,zero,.L237
	j	.L212
.L241:
	ret
	.size	caml_ephemeron_blit_key, .-caml_ephemeron_blit_key
	.section	.text.caml_ephe_blit_key,"ax",@progbits
	.align	1
	.globl	caml_ephe_blit_key
	.type	caml_ephe_blit_key, @function
caml_ephe_blit_key:
	srai	a4,a4,1
	bne	a4,zero,.L255
	li	a0,1
	ret
.L255:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a3,a3,1
	srai	a1,a1,1
	call	caml_ephemeron_blit_key
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ephe_blit_key, .-caml_ephe_blit_key
	.section	.text.caml_weak_blit,"ax",@progbits
	.align	1
	.globl	caml_weak_blit
	.type	caml_weak_blit, @function
caml_weak_blit:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_ephe_blit_key
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_weak_blit, .-caml_weak_blit
	.section	.text.caml_ephemeron_blit_data,"ax",@progbits
	.align	1
	.globl	caml_ephemeron_blit_data
	.type	caml_ephemeron_blit_data, @function
caml_ephemeron_blit_data:
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
	mv	s2,a0
	mv	s1,a1
	lw	s6,caml_gc_phase
	li	a5,1
	beq	s6,a5,.L279
.L259:
	ld	a2,8(s2)
	li	a1,1
	mv	a0,s1
	call	do_set
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
.L279:
	ld	s7,-8(a0)
	srli	s7,s7,10
	li	s5,2
	li	s8,0
	j	.L260
.L280:
	mv	a0,s3
	call	caml_realloc_ephe_ref_table
.L265:
	ld	a5,24(s3)
	addi	a4,a5,16
	sd	a4,24(s3)
	sd	s2,0(a5)
	sd	s5,8(a5)
.L261:
	ld	a5,caml_ephe_none
	beq	a5,s0,.L262
	andi	a5,s0,1
	bne	a5,zero,.L262
	mv	s3,s0
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,3
	beq	a0,zero,.L262
	addi	s10,s0,-8
	lbu	a4,-8(s0)
	li	a5,250
	bne	a4,a5,.L263
	ld	s0,0(s0)
	andi	a5,s0,1
	bne	a5,zero,.L263
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L263
	lbu	a5,-8(s0)
	li	a4,250
	beq	a5,a4,.L263
	li	a4,246
	beq	a5,a4,.L263
	li	a4,253
	beq	a5,a4,.L263
	sd	s0,0(s4)
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s0,a4,.L261
	ld	a4,32(a5)
	bleu	s0,a4,.L261
	ld	s3,112(a5)
	ld	a4,24(s3)
	ld	a5,32(s3)
	bltu	a4,a5,.L265
	j	.L280
.L263:
	ld	a5,0(s10)
	andi	a5,a5,768
	bne	a5,zero,.L262
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s3,a4,.L266
	ld	a5,32(a5)
	bgtu	s3,a5,.L262
.L266:
	ld	a5,caml_ephe_none
	sd	a5,0(s4)
	mv	s8,s6
.L262:
	addi	s5,s5,1
.L260:
	bleu	s7,s5,.L281
	slli	s4,s5,3
	add	s4,s4,s2
	ld	s0,0(s4)
	j	.L261
.L281:
	ld	a4,8(s2)
	ld	a5,caml_ephe_none
	beq	a4,a5,.L268
	beq	s8,zero,.L268
	sd	a5,8(s2)
.L268:
	ld	s7,-8(s1)
	srli	s7,s7,10
	li	s5,2
	li	s8,0
	j	.L269
.L282:
	mv	a0,s3
	call	caml_realloc_ephe_ref_table
.L274:
	ld	a5,24(s3)
	addi	a4,a5,16
	sd	a4,24(s3)
	sd	s1,0(a5)
	sd	s5,8(a5)
.L270:
	ld	a5,caml_ephe_none
	beq	a5,s0,.L271
	andi	a5,s0,1
	bne	a5,zero,.L271
	mv	s3,s0
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,3
	beq	a0,zero,.L271
	addi	s10,s0,-8
	lbu	a4,-8(s0)
	li	a5,250
	bne	a4,a5,.L272
	ld	s0,0(s0)
	andi	a5,s0,1
	bne	a5,zero,.L272
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L272
	lbu	a5,-8(s0)
	li	a4,250
	beq	a5,a4,.L272
	li	a4,246
	beq	a5,a4,.L272
	li	a4,253
	beq	a5,a4,.L272
	sd	s0,0(s4)
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s0,a4,.L270
	ld	a4,32(a5)
	bleu	s0,a4,.L270
	ld	s3,112(a5)
	ld	a4,24(s3)
	ld	a5,32(s3)
	bltu	a4,a5,.L274
	j	.L282
.L272:
	ld	a5,0(s10)
	andi	a5,a5,768
	bne	a5,zero,.L271
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s3,a4,.L275
	ld	a5,32(a5)
	bgtu	s3,a5,.L271
.L275:
	ld	a5,caml_ephe_none
	sd	a5,0(s4)
	mv	s8,s6
.L271:
	addi	s5,s5,1
.L269:
	bleu	s7,s5,.L283
	slli	s4,s5,3
	add	s4,s4,s1
	ld	s0,0(s4)
	j	.L270
.L283:
	ld	a4,8(s1)
	ld	a5,caml_ephe_none
	beq	a4,a5,.L259
	beq	s8,zero,.L259
	sd	a5,8(s1)
	j	.L259
	.size	caml_ephemeron_blit_data, .-caml_ephemeron_blit_data
	.section	.text.caml_ephe_blit_data,"ax",@progbits
	.align	1
	.globl	caml_ephe_blit_data
	.type	caml_ephe_blit_data, @function
caml_ephe_blit_data:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_ephemeron_blit_data
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ephe_blit_data, .-caml_ephe_blit_data
	.globl	caml_ephe_none
	.globl	caml_ephe_list_head
	.section	.sbss,"aw",@nobits
	.align	3
	.type	ephe_dummy, @object
	.size	ephe_dummy, 8
ephe_dummy:
	.zero	8
	.type	caml_ephe_list_head, @object
	.size	caml_ephe_list_head, 8
caml_ephe_list_head:
	.zero	8
	.section	.sdata,"aw"
	.align	3
	.type	caml_ephe_none, @object
	.size	caml_ephe_none, 8
caml_ephe_none:
	.dword	ephe_dummy
	.ident	"GCC: (GNU) 9.2.0"
