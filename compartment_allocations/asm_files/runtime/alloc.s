	.file	"alloc.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.caml_alloc,"ax",@progbits
	.align	1
	.globl	caml_alloc
	.type	caml_alloc, @function
caml_alloc:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	mv	s1,a1
	li	a5,256
	bgtu	a0,a5,.L2
	bne	a0,zero,.L3
	slli	s1,a1,32
	srli	s1,s1,32
	addi	a0,s1,1
	slli	s1,a0,3
	ld	a0,caml_atom_table
	add	a0,a0,s1
.L1:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L3:
	lla	a3,Caml_state
	ld	a2,0(a3)
	slli	a4,a0,3
	li	a5,-8
	sub	a4,a5,a4
	ld	a5,0(a2)
	add	a5,a5,a4
	sd	a5,0(a2)
	ld	a5,0(a3)
	ld	a4,0(a5)
	ld	a5,8(a5)
	bltu	a4,a5,.L14
.L5:
	slli	a5,s0,10
	slli	a2,s1,32
	srli	a2,a2,32
	lla	a4,Caml_state
	ld	a3,0(a4)
	ld	a3,0(a3)
	add	a5,a5,a2
	sd	a5,0(a3)
	ld	a5,0(a4)
	ld	a2,0(a5)
	addi	a2,a2,8
	mv	a0,a2
	li	a5,250
	bgtu	s1,a5,.L1
	li	a5,0
	j	.L6
.L14:
	li	a3,0
	li	a2,1
	li	a1,1
	call	caml_alloc_small_dispatch
	j	.L5
.L7:
	slli	a4,a5,3
	add	a4,a2,a4
	li	a3,1
	sd	a3,0(a4)
	addi	a5,a5,1
.L6:
	bltu	a5,s0,.L7
	j	.L1
.L2:
	call	caml_alloc_shr
	li	a5,250
	bleu	s1,a5,.L12
.L9:
	call	caml_check_urgent_gc
	j	.L1
.L12:
	li	a5,0
.L8:
	bgeu	a5,s0,.L9
	slli	a4,a5,3
	add	a4,a4,a0
	li	a3,1
	sd	a3,0(a4)
	addi	a5,a5,1
	j	.L8
	.size	caml_alloc, .-caml_alloc
	.section	.text.caml_alloc_small,"ax",@progbits
	.align	1
	.globl	caml_alloc_small
	.type	caml_alloc_small, @function
caml_alloc_small:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	mv	s1,a1
	lla	a3,Caml_state
	ld	a2,0(a3)
	slli	a4,a0,3
	li	a5,-8
	sub	a4,a5,a4
	ld	a5,0(a2)
	add	a5,a5,a4
	sd	a5,0(a2)
	ld	a5,0(a3)
	ld	a4,0(a5)
	ld	a5,8(a5)
	bltu	a4,a5,.L18
.L16:
	slli	s0,s0,10
	slli	s1,s1,32
	srli	s1,s1,32
	lla	a5,Caml_state
	ld	a4,0(a5)
	ld	a4,0(a4)
	add	s0,s0,s1
	sd	s0,0(a4)
	ld	a5,0(a5)
	ld	a0,0(a5)
	addi	a0,a0,8
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L18:
	li	a3,0
	li	a2,1
	li	a1,1
	call	caml_alloc_small_dispatch
	j	.L16
	.size	caml_alloc_small, .-caml_alloc_small
	.section	.text.caml_alloc_small_with_my_or_given_profinfo,"ax",@progbits
	.align	1
	.globl	caml_alloc_small_with_my_or_given_profinfo
	.type	caml_alloc_small_with_my_or_given_profinfo, @function
caml_alloc_small_with_my_or_given_profinfo:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	mv	s1,a1
	beq	a2,zero,.L24
	lla	a3,Caml_state
	ld	a2,0(a3)
	slli	a4,a0,3
	li	a5,-8
	sub	a4,a5,a4
	ld	a5,0(a2)
	add	a5,a5,a4
	sd	a5,0(a2)
	ld	a5,0(a3)
	ld	a4,0(a5)
	ld	a5,8(a5)
	bltu	a4,a5,.L25
.L22:
	slli	s0,s0,10
	slli	s1,s1,32
	srli	s1,s1,32
	lla	a5,Caml_state
	ld	a4,0(a5)
	ld	a4,0(a4)
	add	s0,s0,s1
	sd	s0,0(a4)
	ld	a5,0(a5)
	ld	a0,0(a5)
	addi	a0,a0,8
.L19:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L24:
	call	caml_alloc_small
	j	.L19
.L25:
	li	a3,0
	li	a2,1
	li	a1,1
	call	caml_alloc_small_dispatch
	j	.L22
	.size	caml_alloc_small_with_my_or_given_profinfo, .-caml_alloc_small_with_my_or_given_profinfo
	.section	.text.caml_alloc_tuple,"ax",@progbits
	.align	1
	.globl	caml_alloc_tuple
	.type	caml_alloc_tuple, @function
caml_alloc_tuple:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a1,0
	call	caml_alloc
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_alloc_tuple, .-caml_alloc_tuple
	.section	.text.caml_alloc_string,"ax",@progbits
	.align	1
	.globl	caml_alloc_string
	.type	caml_alloc_string, @function
caml_alloc_string:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s1,a0
	addi	s0,a0,8
	srli	s2,s0,3
	li	a5,4096
	addi	a5,a5,-2041
	bgtu	s0,a5,.L29
	lla	a3,Caml_state
	ld	a2,0(a3)
	not	a5,s0
	andi	a4,a5,-8
	ld	a5,0(a2)
	add	a5,a5,a4
	sd	a5,0(a2)
	ld	a5,0(a3)
	ld	a4,0(a5)
	ld	a5,8(a5)
	bltu	a4,a5,.L33
.L30:
	slli	s2,s2,10
	lla	a5,Caml_state
	ld	a4,0(a5)
	ld	a4,0(a4)
	addi	s2,s2,252
	sd	s2,0(a4)
	ld	a5,0(a5)
	ld	a5,0(a5)
	addi	a0,a5,8
.L31:
	andi	s0,s0,-8
	add	a5,s0,a0
	sd	zero,-8(a5)
	addi	s0,s0,-1
	add	a5,a0,s0
	subw	s0,s0,s1
	sb	s0,0(a5)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L33:
	li	a3,0
	li	a2,1
	li	a1,1
	mv	a0,s2
	call	caml_alloc_small_dispatch
	j	.L30
.L29:
	li	a1,252
	mv	a0,s2
	call	caml_alloc_shr
	call	caml_check_urgent_gc
	j	.L31
	.size	caml_alloc_string, .-caml_alloc_string
	.section	.text.caml_alloc_initialized_string,"ax",@progbits
	.align	1
	.globl	caml_alloc_initialized_string
	.type	caml_alloc_initialized_string, @function
caml_alloc_initialized_string:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s2,a0
	mv	s1,a1
	call	caml_alloc_string
	mv	s0,a0
	mv	a2,s2
	mv	a1,s1
	call	memcpy
	mv	a0,s0
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_alloc_initialized_string, .-caml_alloc_initialized_string
	.section	.text.caml_copy_string,"ax",@progbits
	.align	1
	.globl	caml_copy_string
	.type	caml_copy_string, @function
caml_copy_string:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	call	strlen
	mv	a1,s0
	call	caml_alloc_initialized_string
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_copy_string, .-caml_copy_string
	.section	.text.caml_alloc_final,"ax",@progbits
	.align	1
	.globl	caml_alloc_final
	.type	caml_alloc_final, @function
caml_alloc_final:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s0,a0
	mv	s1,a2
	mv	s2,a3
	mv	a0,a1
	call	caml_final_custom_operations
	mv	a3,s2
	mv	a2,s1
	slli	a1,s0,3
	call	caml_alloc_custom
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_alloc_final, .-caml_alloc_final
	.section	.text.caml_alloc_array,"ax",@progbits
	.align	1
	.globl	caml_alloc_array
	.type	caml_alloc_array, @function
caml_alloc_array:
	addi	sp,sp,-144
	sd	ra,136(sp)
	sd	s0,128(sp)
	sd	s1,120(sp)
	sd	s2,112(sp)
	sd	s3,104(sp)
	sd	s4,96(sp)
	sd	s5,88(sp)
	mv	s4,a0
	mv	s3,a1
	ld	a4,Caml_state
	ld	s5,280(a4)
	li	a5,1
	sd	a5,72(sp)
	sd	a5,64(sp)
	sd	s5,0(sp)
	sd	sp,280(a4)
	sd	a5,16(sp)
	li	a5,2
	sd	a5,8(sp)
	addi	a5,sp,72
	sd	a5,24(sp)
	addi	a5,sp,64
	sd	a5,32(sp)
	li	s0,0
.L41:
	slli	a5,s0,3
	add	a5,s3,a5
	ld	a5,0(a5)
	beq	a5,zero,.L46
	addi	s0,s0,1
	j	.L41
.L46:
	li	a1,0
	mv	a0,s0
	call	caml_alloc
	sd	a0,64(sp)
	li	s1,0
	j	.L43
.L44:
	slli	s2,s1,3
	add	a5,s3,s2
	ld	a0,0(a5)
	jalr	s4
	mv	a1,a0
	sd	a0,72(sp)
	ld	a0,64(sp)
	add	a0,s2,a0
	call	caml_modify
	addi	s1,s1,1
.L43:
	bgtu	s0,s1,.L44
	ld	a5,Caml_state
	sd	s5,280(a5)
	ld	a0,64(sp)
	ld	ra,136(sp)
	ld	s0,128(sp)
	ld	s1,120(sp)
	ld	s2,112(sp)
	ld	s3,104(sp)
	ld	s4,96(sp)
	ld	s5,88(sp)
	addi	sp,sp,144
	jr	ra
	.size	caml_alloc_array, .-caml_alloc_array
	.section	.text.caml_alloc_float_array,"ax",@progbits
	.align	1
	.globl	caml_alloc_float_array
	.type	caml_alloc_float_array, @function
caml_alloc_float_array:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	li	a5,256
	bgtu	a0,a5,.L48
	beq	a0,zero,.L53
	lla	a3,Caml_state
	ld	a2,0(a3)
	slli	a4,a0,3
	li	a5,-8
	sub	a4,a5,a4
	ld	a5,0(a2)
	add	a5,a5,a4
	sd	a5,0(a2)
	ld	a5,0(a3)
	ld	a4,0(a5)
	ld	a5,8(a5)
	bltu	a4,a5,.L54
.L51:
	slli	s0,s0,10
	lla	a5,Caml_state
	ld	a4,0(a5)
	ld	a4,0(a4)
	addi	s0,s0,254
	sd	s0,0(a4)
	ld	a5,0(a5)
	ld	a0,0(a5)
	addi	a0,a0,8
.L47:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L53:
	ld	a0,caml_atom_table
	addi	a0,a0,8
	j	.L47
.L54:
	li	a3,0
	li	a2,1
	li	a1,1
	call	caml_alloc_small_dispatch
	j	.L51
.L48:
	li	a1,254
	call	caml_alloc_shr
	call	caml_check_urgent_gc
	j	.L47
	.size	caml_alloc_float_array, .-caml_alloc_float_array
	.section	.text.caml_copy_string_array,"ax",@progbits
	.align	1
	.globl	caml_copy_string_array
	.type	caml_copy_string_array, @function
caml_copy_string_array:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a1,a0
	lla	a0,caml_copy_string
	call	caml_alloc_array
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_copy_string_array, .-caml_copy_string_array
	.section	.text.caml_convert_flag_list,"ax",@progbits
	.align	1
	.globl	caml_convert_flag_list
	.type	caml_convert_flag_list, @function
caml_convert_flag_list:
	mv	a4,a0
	li	a0,0
.L58:
	li	a5,1
	beq	a4,a5,.L60
	ld	a5,0(a4)
	srai	a5,a5,1
	sext.w	a5,a5
	slli	a5,a5,2
	add	a5,a1,a5
	lw	a5,0(a5)
	or	a0,a5,a0
	ld	a4,8(a4)
	j	.L58
.L60:
	ret
	.size	caml_convert_flag_list, .-caml_convert_flag_list
	.section	.text.caml_alloc_dummy,"ax",@progbits
	.align	1
	.globl	caml_alloc_dummy
	.type	caml_alloc_dummy, @function
caml_alloc_dummy:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a1,0
	srai	a0,a0,1
	call	caml_alloc
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_alloc_dummy, .-caml_alloc_dummy
	.section	.text.caml_alloc_dummy_function,"ax",@progbits
	.align	1
	.globl	caml_alloc_dummy_function
	.type	caml_alloc_dummy_function, @function
caml_alloc_dummy_function:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_alloc_dummy
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_alloc_dummy_function, .-caml_alloc_dummy_function
	.section	.text.caml_alloc_dummy_float,"ax",@progbits
	.align	1
	.globl	caml_alloc_dummy_float
	.type	caml_alloc_dummy_float, @function
caml_alloc_dummy_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a1,0
	srai	a0,a0,1
	call	caml_alloc
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_alloc_dummy_float, .-caml_alloc_dummy_float
	.section	.text.caml_alloc_dummy_infix,"ax",@progbits
	.align	1
	.globl	caml_alloc_dummy_infix
	.type	caml_alloc_dummy_infix, @function
caml_alloc_dummy_infix:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	srai	s0,a1,1
	li	a1,247
	srai	a0,a0,1
	call	caml_alloc
	beq	s0,zero,.L67
	slli	a5,s0,3
	add	a0,a0,a5
	slli	s0,s0,10
	addi	s0,s0,249
	sd	s0,-8(a0)
.L67:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_alloc_dummy_infix, .-caml_alloc_dummy_infix
	.section	.text.caml_update_dummy,"ax",@progbits
	.align	1
	.globl	caml_update_dummy
	.type	caml_update_dummy, @function
caml_update_dummy:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	mv	s1,a1
	lbu	a4,-8(a1)
	sext.w	a5,a4
	li	a3,254
	beq	a5,a3,.L81
	li	a3,249
	beq	a5,a3,.L82
	mv	s3,a0
	sb	a4,-8(a0)
	ld	s2,-8(a1)
	srli	s2,s2,10
	li	s0,0
	j	.L78
.L81:
	mv	a1,a0
	li	a5,-2
	sb	a5,-8(a0)
	ld	a2,-8(s1)
	srli	a2,a2,10
	li	a4,0
.L72:
	bgeu	a4,a2,.L74
	slli	a5,a4,3
	add	a3,s1,a5
	fld	fa5,0(a3)
	add	a5,a1,a5
	fsd	fa5,0(a5)
	addi	a4,a4,1
	j	.L72
.L82:
	ld	s2,-8(a1)
	srli	s2,s2,10
	slli	s2,s2,3
	sub	s2,a1,s2
	ld	s1,-8(a0)
	srli	s1,s1,10
	slli	s1,s1,3
	sub	s1,a0,s1
	ld	s3,-8(s2)
	srli	s3,s3,10
	li	s0,0
.L76:
	bgeu	s0,s3,.L74
	slli	a0,s0,3
	add	a5,s2,a0
	ld	a1,0(a5)
	add	a0,s1,a0
	call	caml_modify
	addi	s0,s0,1
	j	.L76
.L79:
	slli	a0,s0,3
	add	a5,s1,a0
	ld	a1,0(a5)
	add	a0,s3,a0
	call	caml_modify
	addi	s0,s0,1
.L78:
	bltu	s0,s2,.L79
.L74:
	li	a0,1
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_update_dummy, .-caml_update_dummy
	.ident	"GCC: (GNU) 9.2.0"
