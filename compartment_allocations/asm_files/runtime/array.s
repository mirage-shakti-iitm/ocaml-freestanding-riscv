	.file	"array.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Array.concat"
	.section	.text.caml_array_gather,"ax",@progbits
	.align	1
	.type	caml_array_gather, @function
caml_array_gather:
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
	sd	s9,72(sp)
	mv	a7,a0
	mv	s2,a1
	mv	s4,a2
	mv	s3,a3
	ld	a5,Caml_state
	ld	s5,280(a5)
	sd	s5,0(sp)
	sd	sp,280(a5)
	sd	a0,16(sp)
	li	a5,1
	sd	a5,8(sp)
	sd	a1,24(sp)
	li	a0,0
	li	a4,0
	li	a2,0
	j	.L2
.L23:
	lla	a0,.LC0
	call	caml_invalid_argument
.L4:
	addi	a4,a4,1
.L2:
	mv	s7,a7
	bleu	a7,a4,.L22
	slli	a5,a4,3
	add	a3,s3,a5
	ld	a6,0(a3)
	not	a3,a6
	bltu	a3,a0,.L23
	add	a0,a0,a6
	add	a5,s2,a5
	ld	a5,0(a5)
	lbu	a3,-8(a5)
	li	a5,254
	bne	a3,a5,.L4
	li	a2,1
	j	.L4
.L22:
	bne	a0,zero,.L6
	ld	s6,caml_atom_table
	addi	s6,s6,8
.L7:
	ld	a5,Caml_state
	sd	s5,280(a5)
	mv	a0,s6
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
	ld	s9,72(sp)
	addi	sp,sp,160
	jr	ra
.L6:
	beq	a2,zero,.L8
	li	a5,-1
	srli	a5,a5,10
	bgtu	a0,a5,.L24
	li	a1,254
	call	caml_alloc
	mv	s6,a0
	li	s8,0
	li	s1,0
	j	.L10
.L24:
	lla	a0,.LC0
	call	caml_invalid_argument
.L11:
	slli	a0,s8,3
	slli	a4,s1,3
	add	a5,s4,a4
	ld	a5,0(a5)
	add	a3,s2,a4
	ld	a1,0(a3)
	slli	a5,a5,3
	add	s0,s3,a4
	ld	a2,0(s0)
	slli	a2,a2,3
	add	a1,a5,a1
	add	a0,a0,s6
	call	memcpy
	ld	a5,0(s0)
	add	s8,s8,a5
	addi	s1,s1,1
.L10:
	bgtu	s7,s1,.L11
	j	.L7
.L8:
	li	a5,256
	bleu	a0,a5,.L25
	li	a5,-1
	srli	a5,a5,10
	bgtu	a0,a5,.L26
	li	a1,0
	call	caml_alloc_shr
	mv	s8,a0
	li	s6,0
	li	s9,0
	j	.L16
.L25:
	li	a1,0
	call	caml_alloc_small
	mv	s6,a0
	li	s8,0
	li	s1,0
	j	.L13
.L14:
	slli	a0,s8,3
	slli	a4,s1,3
	add	a5,s4,a4
	ld	a5,0(a5)
	add	a3,s2,a4
	ld	a1,0(a3)
	slli	a5,a5,3
	add	s0,s3,a4
	ld	a2,0(s0)
	slli	a2,a2,3
	add	a1,a5,a1
	add	a0,a0,s6
	call	memcpy
	ld	a5,0(s0)
	add	s8,s8,a5
	addi	s1,s1,1
.L13:
	bgtu	s7,s1,.L14
	j	.L7
.L26:
	lla	a0,.LC0
	call	caml_invalid_argument
.L28:
	addi	s9,s9,1
.L16:
	bleu	s7,s9,.L27
	slli	a5,s9,3
	add	a4,s4,a5
	ld	s0,0(a4)
	add	a4,s2,a5
	ld	a4,0(a4)
	slli	s0,s0,3
	add	s0,s0,a4
	add	a5,s3,a5
	ld	s1,0(a5)
.L17:
	beq	s1,zero,.L28
	slli	a0,s6,3
	ld	a1,0(s0)
	add	a0,a0,s8
	call	caml_initialize
	addi	s1,s1,-1
	addi	s0,s0,8
	addi	s6,s6,1
	j	.L17
.L27:
	mv	a0,s8
	call	caml_process_pending_actions_with_root
	mv	s6,a0
	j	.L7
	.size	caml_array_gather, .-caml_array_gather
	.section	.text.caml_array_length,"ax",@progbits
	.align	1
	.globl	caml_array_length
	.type	caml_array_length, @function
caml_array_length:
	lbu	a4,-8(a0)
	li	a5,254
	beq	a4,a5,.L32
	ld	a0,-8(a0)
	srli	a0,a0,10
	ret
.L32:
	ld	a0,-8(a0)
	srli	a0,a0,10
	ret
	.size	caml_array_length, .-caml_array_length
	.section	.text.caml_is_double_array,"ax",@progbits
	.align	1
	.globl	caml_is_double_array
	.type	caml_is_double_array, @function
caml_is_double_array:
	lbu	a0,-8(a0)
	addi	a0,a0,-254
	seqz	a0,a0
	ret
	.size	caml_is_double_array, .-caml_is_double_array
	.section	.text.caml_array_get_addr,"ax",@progbits
	.align	1
	.globl	caml_array_get_addr
	.type	caml_array_get_addr, @function
caml_array_get_addr:
	blt	a1,zero,.L35
	srai	a5,a1,1
	ld	a4,-8(a0)
	srli	a4,a4,10
	bleu	a4,a5,.L35
	slli	a5,a5,3
	add	a0,a5,a0
	ld	a0,0(a0)
	ret
.L35:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_array_bound_error
	.size	caml_array_get_addr, .-caml_array_get_addr
	.section	.text.caml_array_get_float,"ax",@progbits
	.align	1
	.globl	caml_array_get_float
	.type	caml_array_get_float, @function
caml_array_get_float:
	addi	sp,sp,-32
	sd	ra,24(sp)
	fsd	fs0,8(sp)
	blt	a1,zero,.L40
	srai	a5,a1,1
	ld	a4,-8(a0)
	srli	a4,a4,10
	bleu	a4,a5,.L40
	slli	a5,a5,3
	add	a0,a5,a0
	fld	fs0,0(a0)
	lla	a4,Caml_state
	ld	a3,0(a4)
	ld	a5,0(a3)
	addi	a5,a5,-16
	sd	a5,0(a3)
	ld	a5,0(a4)
	ld	a4,0(a5)
	ld	a5,8(a5)
	bltu	a4,a5,.L44
.L42:
	lla	a5,Caml_state
	ld	a4,0(a5)
	ld	a4,0(a4)
	li	a3,1277
	sd	a3,0(a4)
	ld	a5,0(a5)
	ld	a0,0(a5)
	fsd	fs0,8(a0)
	addi	a0,a0,8
	ld	ra,24(sp)
	fld	fs0,8(sp)
	addi	sp,sp,32
	jr	ra
.L40:
	call	caml_array_bound_error
.L44:
	li	a3,0
	li	a2,1
	li	a1,1
	li	a0,1
	call	caml_alloc_small_dispatch
	j	.L42
	.size	caml_array_get_float, .-caml_array_get_float
	.section	.text.caml_array_get,"ax",@progbits
	.align	1
	.globl	caml_array_get
	.type	caml_array_get, @function
caml_array_get:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lbu	a4,-8(a0)
	li	a5,254
	beq	a4,a5,.L49
	call	caml_array_get_addr
.L45:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L49:
	call	caml_array_get_float
	j	.L45
	.size	caml_array_get, .-caml_array_get
	.section	.text.caml_floatarray_get,"ax",@progbits
	.align	1
	.globl	caml_floatarray_get
	.type	caml_floatarray_get, @function
caml_floatarray_get:
	addi	sp,sp,-32
	sd	ra,24(sp)
	fsd	fs0,8(sp)
	blt	a1,zero,.L51
	srai	a5,a1,1
	ld	a4,-8(a0)
	srli	a4,a4,10
	bleu	a4,a5,.L51
	slli	a5,a5,3
	add	a0,a5,a0
	fld	fs0,0(a0)
	lla	a4,Caml_state
	ld	a3,0(a4)
	ld	a5,0(a3)
	addi	a5,a5,-16
	sd	a5,0(a3)
	ld	a5,0(a4)
	ld	a4,0(a5)
	ld	a5,8(a5)
	bltu	a4,a5,.L55
.L53:
	lla	a5,Caml_state
	ld	a4,0(a5)
	ld	a4,0(a4)
	li	a3,1277
	sd	a3,0(a4)
	ld	a5,0(a5)
	ld	a0,0(a5)
	fsd	fs0,8(a0)
	addi	a0,a0,8
	ld	ra,24(sp)
	fld	fs0,8(sp)
	addi	sp,sp,32
	jr	ra
.L51:
	call	caml_array_bound_error
.L55:
	li	a3,0
	li	a2,1
	li	a1,1
	li	a0,1
	call	caml_alloc_small_dispatch
	j	.L53
	.size	caml_floatarray_get, .-caml_floatarray_get
	.section	.text.caml_array_set_addr,"ax",@progbits
	.align	1
	.globl	caml_array_set_addr
	.type	caml_array_set_addr, @function
caml_array_set_addr:
	addi	sp,sp,-16
	sd	ra,8(sp)
	blt	a1,zero,.L57
	srai	a5,a1,1
	ld	a4,-8(a0)
	srli	a4,a4,10
	bleu	a4,a5,.L57
	slli	a5,a5,3
	mv	a1,a2
	add	a0,a5,a0
	call	caml_modify
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L57:
	call	caml_array_bound_error
	.size	caml_array_set_addr, .-caml_array_set_addr
	.section	.text.caml_array_set_float,"ax",@progbits
	.align	1
	.globl	caml_array_set_float
	.type	caml_array_set_float, @function
caml_array_set_float:
	fld	fa5,0(a2)
	blt	a1,zero,.L61
	srai	a5,a1,1
	ld	a4,-8(a0)
	srli	a4,a4,10
	bleu	a4,a5,.L61
	slli	a5,a5,3
	add	a0,a5,a0
	fsd	fa5,0(a0)
	li	a0,1
	ret
.L61:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_array_bound_error
	.size	caml_array_set_float, .-caml_array_set_float
	.section	.text.caml_array_set,"ax",@progbits
	.align	1
	.globl	caml_array_set
	.type	caml_array_set, @function
caml_array_set:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lbu	a4,-8(a0)
	li	a5,254
	beq	a4,a5,.L69
	call	caml_array_set_addr
.L65:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L69:
	call	caml_array_set_float
	j	.L65
	.size	caml_array_set, .-caml_array_set
	.section	.text.caml_floatarray_set,"ax",@progbits
	.align	1
	.globl	caml_floatarray_set
	.type	caml_floatarray_set, @function
caml_floatarray_set:
	fld	fa5,0(a2)
	blt	a1,zero,.L71
	srai	a5,a1,1
	ld	a4,-8(a0)
	srli	a4,a4,10
	bleu	a4,a5,.L71
	slli	a5,a5,3
	add	a0,a5,a0
	fsd	fa5,0(a0)
	li	a0,1
	ret
.L71:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_array_bound_error
	.size	caml_floatarray_set, .-caml_floatarray_set
	.section	.text.caml_array_unsafe_get_float,"ax",@progbits
	.align	1
	.globl	caml_array_unsafe_get_float
	.type	caml_array_unsafe_get_float, @function
caml_array_unsafe_get_float:
	addi	sp,sp,-32
	sd	ra,24(sp)
	fsd	fs0,8(sp)
	srai	a1,a1,1
	slli	a1,a1,3
	add	a1,a1,a0
	fld	fs0,0(a1)
	lla	a4,Caml_state
	ld	a3,0(a4)
	ld	a5,0(a3)
	addi	a5,a5,-16
	sd	a5,0(a3)
	ld	a5,0(a4)
	ld	a4,0(a5)
	ld	a5,8(a5)
	bltu	a4,a5,.L78
.L76:
	lla	a5,Caml_state
	ld	a4,0(a5)
	ld	a4,0(a4)
	li	a3,1277
	sd	a3,0(a4)
	ld	a5,0(a5)
	ld	a0,0(a5)
	fsd	fs0,8(a0)
	addi	a0,a0,8
	ld	ra,24(sp)
	fld	fs0,8(sp)
	addi	sp,sp,32
	jr	ra
.L78:
	li	a3,0
	li	a2,1
	li	a1,1
	li	a0,1
	call	caml_alloc_small_dispatch
	j	.L76
	.size	caml_array_unsafe_get_float, .-caml_array_unsafe_get_float
	.section	.text.caml_array_unsafe_get,"ax",@progbits
	.align	1
	.globl	caml_array_unsafe_get
	.type	caml_array_unsafe_get, @function
caml_array_unsafe_get:
	lbu	a4,-8(a0)
	li	a5,254
	beq	a4,a5,.L86
	srai	a1,a1,1
	slli	a1,a1,3
	add	a1,a1,a0
	ld	a0,0(a1)
	ret
.L86:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_array_unsafe_get_float
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_array_unsafe_get, .-caml_array_unsafe_get
	.section	.text.caml_floatarray_unsafe_get,"ax",@progbits
	.align	1
	.globl	caml_floatarray_unsafe_get
	.type	caml_floatarray_unsafe_get, @function
caml_floatarray_unsafe_get:
	addi	sp,sp,-32
	sd	ra,24(sp)
	fsd	fs0,8(sp)
	srai	a1,a1,1
	slli	a1,a1,3
	add	a1,a1,a0
	fld	fs0,0(a1)
	lla	a4,Caml_state
	ld	a3,0(a4)
	ld	a5,0(a3)
	addi	a5,a5,-16
	sd	a5,0(a3)
	ld	a5,0(a4)
	ld	a4,0(a5)
	ld	a5,8(a5)
	bltu	a4,a5,.L90
.L88:
	lla	a5,Caml_state
	ld	a4,0(a5)
	ld	a4,0(a4)
	li	a3,1277
	sd	a3,0(a4)
	ld	a5,0(a5)
	ld	a0,0(a5)
	fsd	fs0,8(a0)
	addi	a0,a0,8
	ld	ra,24(sp)
	fld	fs0,8(sp)
	addi	sp,sp,32
	jr	ra
.L90:
	li	a3,0
	li	a2,1
	li	a1,1
	li	a0,1
	call	caml_alloc_small_dispatch
	j	.L88
	.size	caml_floatarray_unsafe_get, .-caml_floatarray_unsafe_get
	.section	.text.caml_array_unsafe_set_addr,"ax",@progbits
	.align	1
	.globl	caml_array_unsafe_set_addr
	.type	caml_array_unsafe_set_addr, @function
caml_array_unsafe_set_addr:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a5,a1,1
	slli	a5,a5,3
	mv	a1,a2
	add	a0,a5,a0
	call	caml_modify
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_array_unsafe_set_addr, .-caml_array_unsafe_set_addr
	.section	.text.caml_array_unsafe_set_float,"ax",@progbits
	.align	1
	.globl	caml_array_unsafe_set_float
	.type	caml_array_unsafe_set_float, @function
caml_array_unsafe_set_float:
	srai	a1,a1,1
	fld	fa5,0(a2)
	slli	a1,a1,3
	add	a1,a1,a0
	fsd	fa5,0(a1)
	li	a0,1
	ret
	.size	caml_array_unsafe_set_float, .-caml_array_unsafe_set_float
	.section	.text.caml_array_unsafe_set,"ax",@progbits
	.align	1
	.globl	caml_array_unsafe_set
	.type	caml_array_unsafe_set, @function
caml_array_unsafe_set:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lbu	a4,-8(a0)
	li	a5,254
	beq	a4,a5,.L98
	call	caml_array_unsafe_set_addr
.L94:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L98:
	call	caml_array_unsafe_set_float
	j	.L94
	.size	caml_array_unsafe_set, .-caml_array_unsafe_set
	.section	.text.caml_floatarray_unsafe_set,"ax",@progbits
	.align	1
	.globl	caml_floatarray_unsafe_set
	.type	caml_floatarray_unsafe_set, @function
caml_floatarray_unsafe_set:
	srai	a1,a1,1
	fld	fa5,0(a2)
	slli	a1,a1,3
	add	a1,a1,a0
	fsd	fa5,0(a1)
	li	a0,1
	ret
	.size	caml_floatarray_unsafe_set, .-caml_floatarray_unsafe_set
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"Float.Array.create"
	.section	.text.caml_floatarray_create,"ax",@progbits
	.align	1
	.globl	caml_floatarray_create
	.type	caml_floatarray_create, @function
caml_floatarray_create:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	srai	s0,a0,1
	li	a5,256
	bgtu	s0,a5,.L101
	beq	s0,zero,.L108
	lla	a3,Caml_state
	ld	a2,0(a3)
	slli	a4,s0,3
	li	a5,-8
	sub	a4,a5,a4
	ld	a5,0(a2)
	add	a5,a5,a4
	sd	a5,0(a2)
	ld	a5,0(a3)
	ld	a4,0(a5)
	ld	a5,8(a5)
	bltu	a4,a5,.L109
.L104:
	slli	s0,s0,10
	lla	a5,Caml_state
	ld	a4,0(a5)
	ld	a4,0(a4)
	addi	s0,s0,254
	sd	s0,0(a4)
	ld	a5,0(a5)
	ld	a0,0(a5)
	addi	a0,a0,8
	j	.L105
.L108:
	ld	a0,caml_atom_table
	addi	a0,a0,8
	j	.L100
.L109:
	li	a3,0
	li	a2,1
	li	a1,1
	mv	a0,s0
	call	caml_alloc_small_dispatch
	j	.L104
.L101:
	li	a5,-1
	srli	a5,a5,10
	bgtu	s0,a5,.L110
	li	a1,254
	mv	a0,s0
	call	caml_alloc_shr
.L105:
	call	caml_process_pending_actions_with_root
.L100:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L110:
	lla	a0,.LC1
	call	caml_invalid_argument
	.size	caml_floatarray_create, .-caml_floatarray_create
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"Array.make"
	.section	.text.caml_make_vect,"ax",@progbits
	.align	1
	.globl	caml_make_vect
	.type	caml_make_vect, @function
caml_make_vect:
	addi	sp,sp,-208
	sd	ra,200(sp)
	sd	s0,192(sp)
	sd	s1,184(sp)
	fsd	fs0,168(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	ld	a4,Caml_state
	ld	s1,280(a4)
	sd	s1,96(sp)
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
	srai	s0,a0,1
	bne	s0,zero,.L112
	ld	a5,caml_atom_table
	addi	a5,a5,8
	sd	a5,88(sp)
.L113:
	call	caml_process_pending_actions
	ld	a5,Caml_state
	sd	s1,280(a5)
	ld	a0,88(sp)
	ld	ra,200(sp)
	ld	s0,192(sp)
	ld	s1,184(sp)
	fld	fs0,168(sp)
	addi	sp,sp,208
	jr	ra
.L112:
	ld	a0,0(sp)
	andi	a5,a0,1
	beq	a5,zero,.L126
.L114:
	li	a5,256
	bleu	s0,a5,.L127
	li	a5,-1
	srli	a5,a5,10
	bgtu	s0,a5,.L128
	ld	a5,0(sp)
	andi	a4,a5,1
	bne	a4,zero,.L122
	ld	a4,Caml_state
	ld	a3,40(a4)
	bleu	a3,a5,.L122
	ld	a4,32(a4)
	bgtu	a5,a4,.L129
.L122:
	li	a1,0
	mv	a0,s0
	call	caml_alloc_shr
	sd	a0,88(sp)
	li	a5,0
	j	.L123
.L126:
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L114
	ld	a5,0(sp)
	lbu	a3,-8(a5)
	li	a4,253
	bne	a3,a4,.L114
	fld	fs0,0(a5)
	li	a5,-1
	srli	a5,a5,10
	bgtu	s0,a5,.L130
	li	a1,254
	mv	a0,s0
	call	caml_alloc
	sd	a0,88(sp)
	li	a5,0
	j	.L116
.L130:
	lla	a0,.LC2
	call	caml_invalid_argument
.L117:
	slli	a4,a5,3
	ld	a3,88(sp)
	add	a4,a4,a3
	fsd	fs0,0(a4)
	addi	a5,a5,1
.L116:
	bltu	a5,s0,.L117
	j	.L113
.L127:
	li	a2,0
	li	a1,0
	mv	a0,s0
	call	caml_alloc_small_with_my_or_given_profinfo
	sd	a0,88(sp)
	li	a5,0
.L119:
	bgeu	a5,s0,.L113
	slli	a4,a5,3
	ld	a3,88(sp)
	add	a4,a4,a3
	ld	a3,0(sp)
	sd	a3,0(a4)
	addi	a5,a5,1
	j	.L119
.L128:
	lla	a0,.LC2
	call	caml_invalid_argument
.L129:
	call	caml_minor_collection
	j	.L122
.L124:
	slli	a4,a5,3
	ld	a3,88(sp)
	add	a4,a4,a3
	ld	a3,0(sp)
	sd	a3,0(a4)
	addi	a5,a5,1
.L123:
	bltu	a5,s0,.L124
	j	.L113
	.size	caml_make_vect, .-caml_make_vect
	.section	.text.caml_make_float_vect,"ax",@progbits
	.align	1
	.globl	caml_make_float_vect
	.type	caml_make_float_vect, @function
caml_make_float_vect:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_floatarray_create
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_make_float_vect, .-caml_make_float_vect
	.section	.text.caml_make_array,"ax",@progbits
	.align	1
	.globl	caml_make_array
	.type	caml_make_array, @function
caml_make_array:
	addi	sp,sp,-192
	sd	ra,184(sp)
	sd	s0,176(sp)
	sd	s1,168(sp)
	sd	a0,8(sp)
	ld	a4,Caml_state
	ld	s1,280(a4)
	sd	s1,96(sp)
	li	a5,1
	sd	a5,112(sp)
	sd	a5,104(sp)
	addi	a3,sp,8
	sd	a3,120(sp)
	sd	a5,88(sp)
	sd	a5,80(sp)
	addi	a3,sp,96
	sd	a3,16(sp)
	addi	a3,sp,16
	sd	a3,280(a4)
	sd	a5,32(sp)
	li	a5,2
	sd	a5,24(sp)
	addi	a5,sp,88
	sd	a5,40(sp)
	addi	a5,sp,80
	sd	a5,48(sp)
	ld	s0,-8(a0)
	srli	s0,s0,10
	beq	s0,zero,.L143
	ld	a0,0(a0)
	sd	a0,88(sp)
	andi	a5,a0,1
	beq	a5,zero,.L144
.L136:
	ld	a0,8(sp)
	ld	a5,Caml_state
	sd	s1,280(a5)
.L133:
	ld	ra,184(sp)
	ld	s0,176(sp)
	ld	s1,168(sp)
	addi	sp,sp,192
	jr	ra
.L143:
	sd	s1,280(a4)
	j	.L133
.L144:
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L136
	ld	a5,88(sp)
	lbu	a4,-8(a5)
	li	a5,253
	bne	a4,a5,.L136
	li	a5,256
	bgtu	s0,a5,.L138
	li	a1,254
	mv	a0,s0
	call	caml_alloc_small
	sd	a0,80(sp)
.L140:
	li	a4,0
.L139:
	bgeu	a4,s0,.L145
	slli	a5,a4,3
	ld	a3,8(sp)
	add	a3,a3,a5
	ld	a3,0(a3)
	fld	fa5,0(a3)
	ld	a3,80(sp)
	add	a5,a5,a3
	fsd	fa5,0(a5)
	addi	a4,a4,1
	j	.L139
.L138:
	li	a1,254
	mv	a0,s0
	call	caml_alloc_shr
	sd	a0,80(sp)
	j	.L140
.L145:
	call	caml_process_pending_actions
	ld	a0,80(sp)
	ld	a5,Caml_state
	sd	s1,280(a5)
	j	.L133
	.size	caml_make_array, .-caml_make_array
	.section	.text.caml_array_blit,"ax",@progbits
	.align	1
	.globl	caml_array_blit
	.type	caml_array_blit, @function
caml_array_blit:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	a6,a2
	lbu	a2,-8(a2)
	li	a5,254
	beq	a2,a5,.L157
	ld	a5,Caml_state
	ld	a2,40(a5)
	bleu	a2,a6,.L149
	ld	a5,32(a5)
	bgtu	a6,a5,.L158
.L149:
	srai	s0,a4,1
	beq	a6,a0,.L159
.L150:
	srai	s1,a3,1
	slli	s1,s1,3
	add	s1,s1,a6
	srai	s2,a1,1
	slli	s2,s2,3
	add	s2,s2,a0
	j	.L154
.L157:
	srai	a3,a3,1
	slli	a3,a3,3
	srai	a1,a1,1
	slli	a1,a1,3
	srai	a4,a4,1
	slli	a2,a4,3
	add	a1,a1,a0
	add	a0,a3,a6
	call	memmove
	j	.L148
.L158:
	srai	a5,a3,1
	slli	a5,a5,3
	srai	a1,a1,1
	slli	a1,a1,3
	srai	a4,a4,1
	slli	a2,a4,3
	add	a1,a1,a0
	add	a0,a5,a6
	call	memmove
	j	.L148
.L159:
	srai	a5,a1,1
	srai	a4,a3,1
	bge	a5,a4,.L150
	add	a4,a4,s0
	slli	s1,a4,3
	add	s1,s1,a6
	addi	s1,s1,-8
	add	a5,a5,s0
	slli	a5,a5,3
	add	s2,a5,a0
	addi	s2,s2,-8
	j	.L151
.L152:
	ld	a1,0(s2)
	mv	a0,s1
	call	caml_modify
	addi	s0,s0,-1
	addi	s2,s2,-8
	addi	s1,s1,-8
.L151:
	bgt	s0,zero,.L152
	j	.L153
.L155:
	ld	a1,0(s2)
	mv	a0,s1
	call	caml_modify
	addi	s0,s0,-1
	addi	s2,s2,8
	addi	s1,s1,8
.L154:
	bgt	s0,zero,.L155
.L153:
	li	a0,1
	call	caml_check_urgent_gc
.L148:
	li	a0,1
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_array_blit, .-caml_array_blit
	.section	.text.caml_array_sub,"ax",@progbits
	.align	1
	.globl	caml_array_sub
	.type	caml_array_sub, @function
caml_array_sub:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	a0,24(sp)
	srai	a1,a1,1
	sd	a1,16(sp)
	srai	a2,a2,1
	sd	a2,8(sp)
	addi	a3,sp,8
	addi	a2,sp,16
	addi	a1,sp,24
	li	a0,1
	call	caml_array_gather
	ld	ra,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_array_sub, .-caml_array_sub
	.section	.text.caml_array_append,"ax",@progbits
	.align	1
	.globl	caml_array_append
	.type	caml_array_append, @function
caml_array_append:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	mv	s0,a1
	sd	a0,32(sp)
	sd	a1,40(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	call	caml_array_length
	sd	a0,0(sp)
	mv	a0,s0
	call	caml_array_length
	sd	a0,8(sp)
	mv	a3,sp
	addi	a2,sp,16
	addi	a1,sp,32
	li	a0,2
	call	caml_array_gather
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	caml_array_append, .-caml_array_append
	.section	.text.caml_array_concat,"ax",@progbits
	.align	1
	.globl	caml_array_concat
	.type	caml_array_concat, @function
caml_array_concat:
	addi	sp,sp,-448
	sd	ra,440(sp)
	sd	s0,432(sp)
	sd	s1,424(sp)
	sd	s2,416(sp)
	sd	s3,408(sp)
	sd	s4,400(sp)
	sd	s5,392(sp)
	sd	s6,384(sp)
	mv	s1,a0
	mv	a5,a0
	li	s3,0
.L165:
	li	a4,1
	beq	a5,a4,.L174
	addi	s3,s3,1
	ld	a5,8(a5)
	j	.L165
.L174:
	li	a5,16
	bgt	s3,a5,.L175
	mv	s5,sp
	addi	s4,sp,128
	addi	s6,sp,256
.L167:
	li	s2,0
.L169:
	li	a5,1
	beq	s1,a5,.L176
	slli	s0,s2,3
	add	a5,s6,s0
	ld	a4,0(s1)
	sd	a4,0(a5)
	add	a5,s4,s0
	sd	zero,0(a5)
	ld	a0,0(s1)
	call	caml_array_length
	add	s0,s5,s0
	sd	a0,0(s0)
	ld	s1,8(s1)
	addi	s2,s2,1
	j	.L169
.L175:
	slli	s0,s3,3
	mv	a0,s0
	call	caml_stat_alloc
	mv	s6,a0
	mv	a0,s0
	call	caml_stat_alloc_noexc
	mv	s4,a0
	beq	a0,zero,.L177
	mv	a0,s0
	call	caml_stat_alloc_noexc
	mv	s5,a0
	bne	a0,zero,.L167
	mv	a0,s4
	call	caml_stat_free
	mv	a0,s6
	call	caml_stat_free
	call	caml_raise_out_of_memory
.L177:
	mv	a0,s6
	call	caml_stat_free
	call	caml_raise_out_of_memory
.L176:
	mv	a3,s5
	mv	a2,s4
	mv	a1,s6
	mv	a0,s3
	call	caml_array_gather
	mv	s0,a0
	li	a5,16
	bgt	s3,a5,.L178
.L164:
	mv	a0,s0
	ld	ra,440(sp)
	ld	s0,432(sp)
	ld	s1,424(sp)
	ld	s2,416(sp)
	ld	s3,408(sp)
	ld	s4,400(sp)
	ld	s5,392(sp)
	ld	s6,384(sp)
	addi	sp,sp,448
	jr	ra
.L178:
	mv	a0,s6
	call	caml_stat_free
	mv	a0,s4
	call	caml_stat_free
	mv	a0,s5
	call	caml_stat_free
	j	.L164
	.size	caml_array_concat, .-caml_array_concat
	.section	.text.caml_array_fill,"ax",@progbits
	.align	1
	.globl	caml_array_fill
	.type	caml_array_fill, @function
caml_array_fill:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	sd	s4,0(sp)
	mv	s2,a3
	srai	a1,a1,1
	srai	s1,a2,1
	lbu	a3,-8(a0)
	li	a5,254
	beq	a3,a5,.L198
	slli	a1,a1,3
	add	s0,a1,a0
	ld	a5,Caml_state
	ld	a4,40(a5)
	bleu	a4,a0,.L184
	ld	a3,32(a5)
	bgtu	a0,a3,.L185
.L184:
	andi	a3,s2,1
	beq	a3,zero,.L186
	li	s4,0
	j	.L189
.L198:
	mv	a4,a0
	fld	fa5,0(s2)
	j	.L181
.L182:
	slli	a5,a1,3
	add	a5,a5,a4
	fsd	fa5,0(a5)
	addi	s1,s1,-1
	addi	a1,a1,1
.L181:
	bgt	s1,zero,.L182
	j	.L183
.L188:
	sd	s2,0(s0)
	addi	s1,s1,-1
	addi	s0,s0,8
.L185:
	bgt	s1,zero,.L188
	j	.L183
.L186:
	bleu	a4,s2,.L195
	ld	a5,32(a5)
	bgtu	s2,a5,.L196
	li	s4,0
	j	.L189
.L195:
	li	s4,0
	j	.L189
.L196:
	li	s4,1
	j	.L189
.L192:
	lw	a5,caml_gc_phase
	beq	a5,zero,.L199
.L191:
	beq	s4,zero,.L190
	ld	a5,Caml_state
	ld	s3,104(a5)
	ld	a4,24(s3)
	ld	a5,32(s3)
	bgeu	a4,a5,.L200
.L193:
	ld	a5,24(s3)
	addi	a4,a5,8
	sd	a4,24(s3)
	sd	s0,0(a5)
.L190:
	addi	s1,s1,-1
	addi	s0,s0,8
.L189:
	ble	s1,zero,.L201
	ld	a0,0(s0)
	beq	s2,a0,.L190
	sd	s2,0(s0)
	andi	a5,a0,1
	bne	a5,zero,.L191
	ld	a5,Caml_state
	ld	a4,40(a5)
	bleu	a4,a0,.L192
	ld	a5,32(a5)
	bleu	a0,a5,.L192
	j	.L190
.L199:
	li	a1,0
	call	caml_darken
	j	.L191
.L200:
	mv	a0,s3
	call	caml_realloc_ref_table
	j	.L193
.L201:
	bne	s4,zero,.L202
.L183:
	li	a0,1
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	ld	s4,0(sp)
	addi	sp,sp,48
	jr	ra
.L202:
	li	a0,1
	call	caml_check_urgent_gc
	j	.L183
	.size	caml_array_fill, .-caml_array_fill
	.ident	"GCC: (GNU) 9.2.0"
