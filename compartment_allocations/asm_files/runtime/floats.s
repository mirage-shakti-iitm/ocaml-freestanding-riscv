	.file	"floats.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.caml_float_of_hex,"ax",@progbits
	.align	1
	.type	caml_float_of_hex, @function
caml_float_of_hex:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	sd	s1,56(sp)
	sd	s2,48(sp)
	sd	s3,40(sp)
	sd	s4,32(sp)
	sd	s5,24(sp)
	sd	s6,16(sp)
	mv	a5,a0
	mv	s0,a1
	mv	s6,a2
	li	a2,0
	li	s3,-1
	li	s5,0
	li	s4,0
	li	s1,0
	li	s2,0
	j	.L2
.L32:
	bge	s3,zero,.L22
	mv	s3,s1
.L6:
	mv	a5,a0
.L2:
	bgeu	a5,s0,.L31
	addi	a0,a5,1
	lbu	a5,0(a5)
	sext.w	a4,a5
	li	a3,80
	beq	a5,a3,.L3
	li	a3,112
	beq	a5,a3,.L3
	li	a3,46
	beq	a5,a3,.L32
	addiw	a3,a5,-48
	andi	a3,a3,0xff
	li	a1,9
	bgtu	a3,a1,.L10
	addiw	a4,a4,-48
.L11:
	addiw	s1,s1,4
	bne	a4,zero,.L13
	beq	s2,zero,.L6
.L13:
	li	a5,59
	bgt	s4,a5,.L14
	slli	s2,s2,4
	add	s2,s2,a4
	addiw	s4,s4,4
	j	.L6
.L3:
	lbu	a5,0(a0)
	beq	a5,zero,.L23
	li	a2,10
	addi	a1,sp,8
	call	strtol
	mv	a5,a0
	ld	a0,8(sp)
	bne	a0,s0,.L24
	li	a4,-2147483648
	ble	a5,a4,.L33
	li	a4,-2147483648
	xori	a4,a4,-2
	bgt	a5,a4,.L34
	sext.w	a2,a5
	j	.L6
.L33:
	sd	zero,0(s6)
	li	a0,0
	j	.L5
.L34:
	bne	s2,zero,.L25
	fmv.d.x	fa5,zero
.L9:
	fsd	fa5,0(s6)
	li	a0,0
	j	.L5
.L25:
	fld	fa5,.LC0,a5
	j	.L9
.L10:
	addiw	a3,a5,-65
	andi	a3,a3,0xff
	li	a1,5
	bgtu	a3,a1,.L12
	addiw	a4,a4,-55
	j	.L11
.L12:
	addiw	a5,a5,-97
	andi	a5,a5,0xff
	li	a3,5
	bgtu	a5,a3,.L26
	addiw	a4,a4,-87
	j	.L11
.L14:
	beq	a4,zero,.L15
	ori	s2,s2,1
.L15:
	addiw	s5,s5,4
	j	.L6
.L31:
	beq	s1,zero,.L27
	fcvt.d.l	fa0,s2
	blt	s3,zero,.L17
	subw	s1,s3,s1
	addw	s5,s1,s5
.L17:
	ble	s5,zero,.L18
	li	a5,-2147483648
	xori	a5,a5,-1
	subw	a5,a5,s5
	blt	a5,a2,.L28
.L18:
	blt	s5,zero,.L35
.L20:
	addw	a0,a2,s5
	beq	a0,zero,.L21
	j	.L19
.L35:
	li	a5,-2147483648
	subw	a5,a5,s5
	ble	a5,a2,.L20
	li	a0,-2147483648
	j	.L19
.L28:
	li	a2,-2147483648
	xori	a0,a2,-1
.L19:
	call	ldexp
.L21:
	fsd	fa0,0(s6)
	li	a0,0
.L5:
	ld	ra,72(sp)
	ld	s0,64(sp)
	ld	s1,56(sp)
	ld	s2,48(sp)
	ld	s3,40(sp)
	ld	s4,32(sp)
	ld	s5,24(sp)
	ld	s6,16(sp)
	addi	sp,sp,80
	jr	ra
.L22:
	li	a0,-1
	j	.L5
.L23:
	li	a0,-1
	j	.L5
.L24:
	li	a0,-1
	j	.L5
.L26:
	li	a0,-1
	j	.L5
.L27:
	li	a0,-1
	j	.L5
	.size	caml_float_of_hex, .-caml_float_of_hex
	.section	.text.caml_init_locale,"ax",@progbits
	.align	1
	.globl	caml_init_locale
	.type	caml_init_locale, @function
caml_init_locale:
	ret
	.size	caml_init_locale, .-caml_init_locale
	.section	.text.caml_free_locale,"ax",@progbits
	.align	1
	.globl	caml_free_locale
	.type	caml_free_locale, @function
caml_free_locale:
	ret
	.size	caml_free_locale, .-caml_free_locale
	.section	.text.caml_copy_double,"ax",@progbits
	.align	1
	.globl	caml_copy_double
	.type	caml_copy_double, @function
caml_copy_double:
	addi	sp,sp,-32
	sd	ra,24(sp)
	fsd	fs0,8(sp)
	fmv.d	fs0,fa0
	lla	a4,Caml_state
	ld	a3,0(a4)
	ld	a5,0(a3)
	addi	a5,a5,-16
	sd	a5,0(a3)
	ld	a5,0(a4)
	ld	a4,0(a5)
	ld	a5,8(a5)
	bltu	a4,a5,.L41
.L39:
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
.L41:
	li	a3,0
	li	a2,1
	li	a1,1
	li	a0,1
	call	caml_alloc_small_dispatch
	j	.L39
	.size	caml_copy_double, .-caml_copy_double
	.section	.text.caml_format_float,"ax",@progbits
	.align	1
	.globl	caml_format_float
	.type	caml_format_float, @function
caml_format_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a1,0(a1)
	call	caml_alloc_sprintf
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_format_float, .-caml_format_float
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC1:
	.string	"nan"
	.align	3
.LC2:
	.string	"infinity"
	.align	3
.LC3:
	.string	"%sp%+d"
	.section	.text.caml_hexstring_of_float,"ax",@progbits
	.align	1
	.globl	caml_hexstring_of_float
	.type	caml_hexstring_of_float, @function
caml_hexstring_of_float:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	s2,80(sp)
	sd	s3,72(sp)
	mv	s3,a0
	mv	s2,a2
	srai	s0,a1,1
	addi	a0,s0,12
	li	a5,64
	bgt	a0,a5,.L73
	mv	s1,sp
.L45:
	ld	a4,0(s3)
	srli	a2,a4,52
	andi	a2,a2,2047
	li	a5,-1
	srli	a5,a5,12
	and	a5,a5,a4
	bge	a4,zero,.L46
	addi	s2,s1,1
	li	a4,45
	sb	a4,0(s1)
.L47:
	li	a4,2047
	beq	a2,a4,.L74
	li	a4,48
	sb	a4,0(s2)
	li	a4,120
	sb	a4,1(s2)
	bne	a2,zero,.L52
	beq	a5,zero,.L53
	li	a2,-1022
	j	.L53
.L73:
	call	caml_stat_alloc
	mv	s1,a0
	j	.L45
.L46:
	srai	s2,s2,1
	sext.w	s2,s2
	li	a4,32
	beq	s2,a4,.L48
	li	a4,43
	bne	s2,a4,.L69
	addi	s2,s1,1
	sb	a4,0(s1)
	j	.L47
.L48:
	addi	s2,s1,1
	li	a4,32
	sb	a4,0(s1)
	j	.L47
.L69:
	mv	s2,s1
	j	.L47
.L74:
	bne	a5,zero,.L70
	lla	s0,.LC2
.L50:
	mv	a0,s0
	call	strlen
	mv	a2,a0
	mv	a1,s0
	mv	a0,s2
	call	memcpy
	mv	a0,s0
	call	strlen
	add	s2,s2,a0
	sb	zero,0(s2)
	mv	a0,s1
	call	caml_copy_string
	mv	s0,a0
	j	.L51
.L70:
	lla	s0,.LC1
	j	.L50
.L52:
	addiw	a2,a2,-1023
	li	a4,1
	slli	a4,a4,52
	or	a5,a5,a4
.L53:
	li	a4,12
	bgtu	s0,a4,.L54
	li	a4,13
	sub	a4,a4,s0
	slliw	a3,a4,2
	li	a4,1
	sll	a4,a4,a3
	srli	a1,a4,1
	addi	a3,a4,-1
	and	a3,a5,a3
	neg	a0,a4
	and	a5,a5,a0
	bltu	a1,a3,.L55
	bne	a1,a3,.L54
	and	a3,a4,a5
	beq	a3,zero,.L54
.L55:
	add	a5,a5,a4
.L54:
	srli	a4,a5,52
	li	a1,9
	bgt	a4,a1,.L56
	addiw	a4,a4,48
	andi	a4,a4,0xff
.L57:
	addi	a1,s2,3
	sb	a4,2(s2)
	slli	a5,a5,4
	li	a4,-1
	srli	a4,a4,8
	and	a5,a5,a4
	blt	s0,zero,.L58
	sgt	a4,s0,zero
.L59:
	beq	a4,zero,.L60
	addi	a1,s2,4
	li	a4,46
	sb	a4,3(s2)
	j	.L61
.L56:
	addiw	a4,a4,87
	andi	a4,a4,0xff
	j	.L57
.L58:
	snez	a4,a5
	j	.L59
.L62:
	addi	a4,a4,87
.L63:
	sb	a4,0(a1)
	slli	a5,a5,4
	li	a4,-1
	srli	a4,a4,8
	and	a5,a5,a4
	addi	s0,s0,-1
	addi	a1,a1,1
.L61:
	blt	s0,zero,.L64
	sgt	a4,s0,zero
.L65:
	beq	a4,zero,.L60
	srli	a4,a5,52
	li	a0,9
	bgt	a4,a0,.L62
	addi	a4,a4,48
	j	.L63
.L64:
	snez	a4,a5
	j	.L65
.L60:
	sb	zero,0(a1)
	mv	a1,s1
	lla	a0,.LC3
	call	caml_alloc_sprintf
	mv	s0,a0
.L51:
	mv	a5,sp
	beq	s1,a5,.L44
	mv	a0,s1
	call	caml_stat_free
.L44:
	mv	a0,s0
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	ld	s2,80(sp)
	ld	s3,72(sp)
	addi	sp,sp,112
	jr	ra
	.size	caml_hexstring_of_float, .-caml_hexstring_of_float
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"float_of_string"
	.section	.text.caml_float_of_string,"ax",@progbits
	.align	1
	.globl	caml_float_of_string
	.type	caml_float_of_string, @function
caml_float_of_string:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	s2,80(sp)
	mv	s1,a0
	call	caml_string_length
	mv	s0,a0
	li	a5,63
	bgtu	a0,a5,.L92
	addi	s2,sp,16
.L76:
	mv	a0,s1
	mv	s1,s2
	j	.L77
.L92:
	addi	a0,a0,1
	call	caml_stat_alloc
	mv	s2,a0
	j	.L76
.L94:
	sb	a5,0(s1)
	addi	s1,s1,1
.L78:
	mv	s0,a4
	mv	a0,a3
.L77:
	addi	a4,s0,-1
	beq	s0,zero,.L93
	addi	a3,a0,1
	lbu	a5,0(a0)
	li	a2,95
	bne	a5,a2,.L94
	j	.L78
.L93:
	sb	zero,0(s1)
	beq	s1,s2,.L80
	lbu	a5,0(s2)
	li	a4,45
	beq	a5,a4,.L95
	li	a4,43
	beq	a5,a4,.L96
	mv	a0,s2
	li	s0,1
.L82:
	lbu	a4,0(a0)
	li	a5,48
	bne	a4,a5,.L83
	lbu	a5,1(a0)
	li	a4,120
	beq	a5,a4,.L84
	li	a4,88
	beq	a5,a4,.L84
.L83:
	addi	a1,sp,8
	mv	a0,s2
	call	strtod
	fsd	fa0,0(sp)
	ld	a5,8(sp)
	bne	a5,s1,.L80
.L85:
	addi	a5,sp,16
	beq	s2,a5,.L86
	mv	a0,s2
	call	caml_stat_free
.L86:
	fld	fa0,0(sp)
	call	caml_copy_double
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	ld	s2,80(sp)
	addi	sp,sp,112
	jr	ra
.L95:
	addi	a0,s2,1
	li	s0,-1
	j	.L82
.L96:
	addi	a0,s2,1
	li	s0,1
	j	.L82
.L84:
	mv	a2,sp
	mv	a1,s1
	addi	a0,a0,2
	call	caml_float_of_hex
	li	a5,-1
	beq	a0,a5,.L80
	bge	s0,zero,.L85
	fld	fa5,0(sp)
	fneg.d	fa5,fa5
	fsd	fa5,0(sp)
	j	.L85
.L80:
	addi	a5,sp,16
	beq	s2,a5,.L87
	mv	a0,s2
	call	caml_stat_free
.L87:
	lla	a0,.LC4
	call	caml_failwith
	.size	caml_float_of_string, .-caml_float_of_string
	.section	.text.caml_int_of_float,"ax",@progbits
	.align	1
	.globl	caml_int_of_float
	.type	caml_int_of_float, @function
caml_int_of_float:
	fld	fa5,0(a0)
	fcvt.l.d a0,fa5,rtz
	slli	a0,a0,1
	addi	a0,a0,1
	ret
	.size	caml_int_of_float, .-caml_int_of_float
	.section	.text.caml_float_of_int,"ax",@progbits
	.align	1
	.globl	caml_float_of_int
	.type	caml_float_of_int, @function
caml_float_of_int:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a0,a0,1
	fcvt.d.l	fa0,a0
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_float_of_int, .-caml_float_of_int
	.section	.text.caml_neg_float,"ax",@progbits
	.align	1
	.globl	caml_neg_float
	.type	caml_neg_float, @function
caml_neg_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	fneg.d	fa0,fa0
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_neg_float, .-caml_neg_float
	.section	.text.caml_abs_float,"ax",@progbits
	.align	1
	.globl	caml_abs_float
	.type	caml_abs_float, @function
caml_abs_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	fabs.d	fa0,fa0
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_abs_float, .-caml_abs_float
	.section	.text.caml_add_float,"ax",@progbits
	.align	1
	.globl	caml_add_float
	.type	caml_add_float, @function
caml_add_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	fld	fa5,0(a1)
	fadd.d	fa0,fa0,fa5
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_add_float, .-caml_add_float
	.section	.text.caml_sub_float,"ax",@progbits
	.align	1
	.globl	caml_sub_float
	.type	caml_sub_float, @function
caml_sub_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	fld	fa5,0(a1)
	fsub.d	fa0,fa0,fa5
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_sub_float, .-caml_sub_float
	.section	.text.caml_mul_float,"ax",@progbits
	.align	1
	.globl	caml_mul_float
	.type	caml_mul_float, @function
caml_mul_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	fld	fa5,0(a1)
	fmul.d	fa0,fa0,fa5
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_mul_float, .-caml_mul_float
	.section	.text.caml_div_float,"ax",@progbits
	.align	1
	.globl	caml_div_float
	.type	caml_div_float, @function
caml_div_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	fld	fa5,0(a1)
	fdiv.d	fa0,fa0,fa5
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_div_float, .-caml_div_float
	.section	.text.caml_exp_float,"ax",@progbits
	.align	1
	.globl	caml_exp_float
	.type	caml_exp_float, @function
caml_exp_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	exp
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_exp_float, .-caml_exp_float
	.section	.text.caml_trunc,"ax",@progbits
	.align	1
	.globl	caml_trunc
	.type	caml_trunc, @function
caml_trunc:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	trunc
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_trunc, .-caml_trunc
	.section	.text.caml_trunc_float,"ax",@progbits
	.align	1
	.globl	caml_trunc_float
	.type	caml_trunc_float, @function
caml_trunc_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	caml_trunc
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_trunc_float, .-caml_trunc_float
	.section	.text.caml_round,"ax",@progbits
	.align	1
	.globl	caml_round
	.type	caml_round, @function
caml_round:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	round
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_round, .-caml_round
	.section	.text.caml_round_float,"ax",@progbits
	.align	1
	.globl	caml_round_float
	.type	caml_round_float, @function
caml_round_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	caml_round
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_round_float, .-caml_round_float
	.section	.text.caml_floor_float,"ax",@progbits
	.align	1
	.globl	caml_floor_float
	.type	caml_floor_float, @function
caml_floor_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	floor
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_floor_float, .-caml_floor_float
	.section	.text.caml_nextafter,"ax",@progbits
	.align	1
	.globl	caml_nextafter
	.type	caml_nextafter, @function
caml_nextafter:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	nextafter
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nextafter, .-caml_nextafter
	.section	.text.caml_nextafter_float,"ax",@progbits
	.align	1
	.globl	caml_nextafter_float
	.type	caml_nextafter_float, @function
caml_nextafter_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa1,0(a1)
	fld	fa0,0(a0)
	call	caml_nextafter
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nextafter_float, .-caml_nextafter_float
	.section	.text.caml_fma,"ax",@progbits
	.align	1
	.globl	caml_fma
	.type	caml_fma, @function
caml_fma:
	fmv.x.d	a0,fa0
	fmv.x.d	a5,fa1
	fmv.x.d	a6,fa2
	mv	t3,a0
	srli	a4,a0,52
	andi	a4,a4,2047
	mv	t1,a5
	srli	a3,a5,52
	andi	a3,a3,2047
	add	a7,a4,a3
	li	a2,4096
	addi	a2,a2,-1080
	bgtu	a7,a2,.L129
	li	a2,1993
	bgtu	a4,a2,.L129
	bgtu	a3,a2,.L129
	srli	a2,a6,52
	andi	a2,a2,2047
	li	a1,1993
	bgtu	a2,a1,.L129
	li	a2,1076
	bgtu	a7,a2,.L160
.L129:
	srli	a2,a6,52
	andi	a2,a2,2047
	li	a1,2047
	beq	a2,a1,.L164
.L131:
	fmv.d.x	fa5,zero
	fmv.d.x	fa4,a6
	feq.d	a1,fa4,fa5
	beq	a1,zero,.L133
	fmv.d.x	fa4,a0
	feq.d	a1,fa4,fa5
	bne	a1,zero,.L133
	fmv.d.x	fa4,a5
	feq.d	a1,fa4,fa5
	beq	a1,zero,.L165
.L133:
	li	a1,2047
	beq	a4,a1,.L134
	beq	a3,a1,.L134
	beq	a2,a1,.L134
	fmv.d.x	fa5,zero
	fmv.d.x	fa4,a0
	feq.d	a1,fa4,fa5
	bne	a1,zero,.L134
	fmv.d.x	fa4,a5
	feq.d	a1,fa4,fa5
	bne	a1,zero,.L134
	li	a1,4096
	addi	a1,a1,-1026
	bgtu	a7,a1,.L166
	li	a1,967
	bgtu	a7,a1,.L137
	slti	t3,t3,0
	slti	t1,t1,0
	beq	t3,t1,.L161
	fld	fa5,.LC6,a5
.L138:
	li	a4,2
	bleu	a2,a4,.L139
	fmv.d.x	fa4,a6
	fadd.d	fa0,fa5,fa4
	ret
.L164:
	beq	a4,a1,.L131
	beq	a3,a1,.L131
	fmv.d.x	fa5,a0
	fmv.d.x	fa4,a6
	fadd.d	fa0,fa5,fa4
	fmv.d.x	fa5,a5
	fadd.d	fa0,fa0,fa5
	ret
.L165:
	fmv.d.x	fa5,a0
	fmul.d	fa0,fa5,fa4
	ret
.L134:
	fmv.d.x	fa5,a0
	fmv.d.x	fa4,a5
	fmul.d	fa0,fa5,fa4
	fmv.d.x	fa5,a6
	fadd.d	fa0,fa0,fa5
	ret
.L166:
	fmv.d.x	fa5,a0
	fmul.d	fa0,fa5,fa4
	ret
.L161:
	fld	fa5,.LC5,a5
	j	.L138
.L139:
	fld	fa0,.LC7,a5
	fmv.d.x	fa4,a6
	fmul.d	fa0,fa4,fa0
	fadd.d	fa0,fa0,fa5
	fld	fa5,.LC8,a5
	fmul.d	fa0,fa0,fa5
	ret
.L137:
	li	a1,4096
	addi	a1,a1,-1080
	bleu	a7,a1,.L140
	bleu	a4,a3,.L141
	fld	fa5,.LC9,a4
	fmv.d.x	fa4,a0
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a0,fa5
.L142:
	li	a4,53
	bleu	a2,a4,.L162
	fld	fa5,.LC9,a4
	fmv.d.x	fa4,a6
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a6,fa5
	li	a3,1
	j	.L130
.L141:
	fld	fa5,.LC9,a4
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a5,fa5
	j	.L142
.L140:
	li	a1,1993
	bleu	a2,a1,.L143
	li	a2,1129
	bgtu	a7,a2,.L144
	bleu	a4,a3,.L145
	fld	fa5,.LC10,a4
	fmv.d.x	fa4,a0
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a0,fa5
.L146:
	fld	fa5,.LC9,a4
	fmv.d.x	fa4,a6
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a6,fa5
	li	a3,1
	j	.L130
.L145:
	fld	fa5,.LC10,a4
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a5,fa5
	j	.L146
.L144:
	bleu	a4,a3,.L147
	li	a3,53
	bleu	a4,a3,.L146
	fld	fa5,.LC9,a4
	fmv.d.x	fa4,a0
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a0,fa5
	j	.L146
.L147:
	li	a4,53
	bleu	a3,a4,.L146
	fld	fa5,.LC9,a4
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a5,fa5
	j	.L146
.L143:
	li	a1,1993
	bleu	a4,a1,.L148
	fld	fa5,.LC9,a4
	fmv.d.x	fa4,a0
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a0,fa5
	fld	fa5,.LC11,a4
	fmv.d.x	fa4,a5
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a5,fa5
	li	a3,0
	j	.L130
.L148:
	li	a1,1993
	bleu	a3,a1,.L149
	fld	fa5,.LC9,a4
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a5,fa5
	fld	fa5,.LC11,a4
	fmv.d.x	fa4,a0
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a0,fa5
	li	a3,0
	j	.L130
.L149:
	bleu	a4,a3,.L150
	fld	fa5,.LC10,a4
	fmv.d.x	fa4,a0
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a0,fa5
.L151:
	li	a4,218
	bgtu	a2,a4,.L163
	fld	fa5,.LC10,a4
	fmv.d.x	fa4,a6
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a6,fa5
	li	a3,-1
	j	.L130
.L150:
	fld	fa5,.LC10,a4
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a5,fa5
	j	.L151
.L160:
	li	a3,0
.L130:
	fmv.d.x	fa5,zero
	fmv.d.x	fa4,a0
	feq.d	a4,fa4,fa5
	bne	a4,zero,.L152
	fmv.d.x	fa4,a5
	feq.d	a4,fa4,fa5
	beq	a4,zero,.L153
.L152:
	fmv.d.x	fa5,zero
	fmv.d.x	fa4,a6
	feq.d	a4,fa4,fa5
	bne	a4,zero,.L167
.L153:
	fmv.d.x	fa5,a0
	fmv.d.x	fa4,a5
	fmul.d	ft0,fa5,fa4
	fld	fa3,.LC12,a4
	fmul.d	fa2,fa5,fa3
	fsub.d	fa5,fa2,fa5
	fsub.d	fa2,fa2,fa5
	fmv.d.x	fa5,a0
	fsub.d	fa4,fa5,fa2
	fmv.d.x	fa5,a5
	fmul.d	fa3,fa5,fa3
	fsub.d	fa5,fa3,fa5
	fsub.d	fa3,fa3,fa5
	fmv.d.x	fa5,a5
	fsub.d	fa5,fa5,fa3
	fmul.d	fa0,fa4,fa5
	fmul.d	fa1,fa2,fa3
	fsub.d	fa1,ft0,fa1
	fmul.d	fa4,fa4,fa3
	fsub.d	fa4,fa1,fa4
	fmul.d	fa2,fa2,fa5
	fsub.d	fa2,fa4,fa2
	fsub.d	fa2,fa0,fa2
	fmv.d.x	fa5,a6
	fadd.d	fa0,fa5,ft0
	fsub.d	fa4,fa0,fa5
	fsub.d	fa5,fa0,fa4
	fmv.d.x	fa3,a6
	fsub.d	fa5,fa3,fa5
	fsub.d	ft0,ft0,fa4
	fadd.d	fa5,fa5,ft0
	fmv.d.x	fa4,zero
	feq.d	a5,fa0,fa4
	beq	a5,zero,.L154
	feq.d	a5,fa2,fa4
	bne	a5,zero,.L128
.L154:
	fadd.d	fa4,fa2,fa5
	fsub.d	fa3,fa4,fa5
	fsub.d	fa1,fa4,fa3
	fsub.d	fa5,fa5,fa1
	fsub.d	fa2,fa2,fa3
	fadd.d	fa5,fa5,fa2
	fadd.d	fa3,fa0,fa4
	fsub.d	fa2,fa3,fa0
	fsub.d	fa1,fa3,fa2
	fsub.d	fa0,fa0,fa1
	fsub.d	fa4,fa4,fa2
	fadd.d	fa0,fa0,fa4
	fadd.d	fa4,fa5,fa0
	fmv.x.d	a5,fa4
	fsub.d	fa0,fa0,fa4
	fadd.d	fa0,fa0,fa5
	fmv.d.x	fa4,zero
	feq.d	a4,fa0,fa4
	bne	a4,zero,.L155
	mv	a2,a5
	andi	a4,a5,1
	bne	a4,zero,.L155
	fmv.d	fa5,fa4
	fgt.d	a4,fa0,fa4
	fmv.d.x	fa4,a5
	flt.d	a5,fa4,fa5
	beq	a4,a5,.L156
	addi	a5,a2,1
.L155:
	bgt	a3,zero,.L168
	blt	a3,zero,.L169
	fmv.d.x	fa5,a5
	fadd.d	fa0,fa5,fa3
.L128:
	ret
.L162:
	li	a3,1
	j	.L130
.L163:
	li	a3,0
	j	.L130
.L167:
	fmv.d.x	fa5,a0
	fmv.d.x	fa4,a5
	fmul.d	fa0,fa5,fa4
	fmv.d.x	fa5,a6
	fadd.d	fa0,fa0,fa5
	ret
.L156:
	addi	a5,a2,-1
	j	.L155
.L168:
	fmv.d.x	fa5,a5
	fadd.d	fa3,fa5,fa3
	fld	fa0,.LC11,a5
	fmul.d	fa0,fa3,fa0
	ret
.L169:
	fmv.d.x	fa5,a5
	fadd.d	fa3,fa5,fa3
	fld	fa0,.LC13,a5
	fmul.d	fa0,fa3,fa0
	ret
	.size	caml_fma, .-caml_fma
	.section	.text.caml_fma_float,"ax",@progbits
	.align	1
	.globl	caml_fma_float
	.type	caml_fma_float, @function
caml_fma_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa2,0(a2)
	fld	fa1,0(a1)
	fld	fa0,0(a0)
	call	caml_fma
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_fma_float, .-caml_fma_float
	.section	.text.caml_fmod_float,"ax",@progbits
	.align	1
	.globl	caml_fmod_float
	.type	caml_fmod_float, @function
caml_fmod_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa1,0(a1)
	fld	fa0,0(a0)
	call	fmod
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_fmod_float, .-caml_fmod_float
	.section	.text.caml_frexp_float,"ax",@progbits
	.align	1
	.globl	caml_frexp_float
	.type	caml_frexp_float, @function
caml_frexp_float:
	addi	sp,sp,-208
	sd	ra,200(sp)
	sd	s0,192(sp)
	sd	s1,184(sp)
	sd	a0,8(sp)
	lla	s1,Caml_state
	ld	a4,0(s1)
	ld	s0,280(a4)
	sd	s0,112(sp)
	li	a5,1
	sd	a5,128(sp)
	sd	a5,120(sp)
	addi	a3,sp,8
	sd	a3,136(sp)
	sd	a5,104(sp)
	sd	a5,96(sp)
	addi	a3,sp,112
	sd	a3,32(sp)
	addi	a3,sp,32
	sd	a3,280(a4)
	sd	a5,48(sp)
	li	a5,2
	sd	a5,40(sp)
	addi	a5,sp,104
	sd	a5,56(sp)
	addi	a5,sp,96
	sd	a5,64(sp)
	mv	a5,a0
	addi	a0,sp,28
	fld	fa0,0(a5)
	call	frexp
	call	caml_copy_double
	sd	a0,96(sp)
	li	a0,2
	call	caml_alloc_tuple
	sd	a0,104(sp)
	ld	a5,96(sp)
	sd	a5,0(a0)
	lw	a5,28(sp)
	slli	a5,a5,1
	addi	a5,a5,1
	ld	a4,104(sp)
	sd	a5,8(a4)
	ld	a5,0(s1)
	sd	s0,280(a5)
	ld	a0,104(sp)
	ld	ra,200(sp)
	ld	s0,192(sp)
	ld	s1,184(sp)
	addi	sp,sp,208
	jr	ra
	.size	caml_frexp_float, .-caml_frexp_float
	.section	.text.caml_ldexp_float_unboxed,"ax",@progbits
	.align	1
	.globl	caml_ldexp_float_unboxed
	.type	caml_ldexp_float_unboxed, @function
caml_ldexp_float_unboxed:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sext.w	a0,a0
	call	ldexp
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ldexp_float_unboxed, .-caml_ldexp_float_unboxed
	.section	.text.caml_ldexp_float,"ax",@progbits
	.align	1
	.globl	caml_ldexp_float
	.type	caml_ldexp_float, @function
caml_ldexp_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a5,a0
	srai	a0,a1,1
	sext.w	a0,a0
	fld	fa0,0(a5)
	call	ldexp
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ldexp_float, .-caml_ldexp_float
	.section	.text.caml_log_float,"ax",@progbits
	.align	1
	.globl	caml_log_float
	.type	caml_log_float, @function
caml_log_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	log
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_log_float, .-caml_log_float
	.section	.text.caml_log10_float,"ax",@progbits
	.align	1
	.globl	caml_log10_float
	.type	caml_log10_float, @function
caml_log10_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	log10
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_log10_float, .-caml_log10_float
	.section	.text.caml_modf_float,"ax",@progbits
	.align	1
	.globl	caml_modf_float
	.type	caml_modf_float, @function
caml_modf_float:
	addi	sp,sp,-208
	sd	ra,200(sp)
	sd	s0,192(sp)
	sd	s1,184(sp)
	sd	a0,8(sp)
	lla	s1,Caml_state
	ld	a4,0(s1)
	ld	s0,280(a4)
	sd	s0,104(sp)
	li	a5,1
	sd	a5,120(sp)
	sd	a5,112(sp)
	addi	a3,sp,8
	sd	a3,128(sp)
	sd	a5,96(sp)
	sd	a5,88(sp)
	sd	a5,80(sp)
	addi	a3,sp,104
	sd	a3,16(sp)
	addi	a3,sp,16
	sd	a3,280(a4)
	sd	a5,32(sp)
	li	a5,3
	sd	a5,24(sp)
	addi	a5,sp,96
	sd	a5,40(sp)
	addi	a5,sp,88
	sd	a5,48(sp)
	addi	a5,sp,80
	sd	a5,56(sp)
	mv	a5,a0
	addi	a0,sp,168
	fld	fa0,0(a5)
	call	modf
	call	caml_copy_double
	sd	a0,88(sp)
	fld	fa0,168(sp)
	call	caml_copy_double
	sd	a0,80(sp)
	li	a0,2
	call	caml_alloc_tuple
	sd	a0,96(sp)
	ld	a5,88(sp)
	sd	a5,0(a0)
	ld	a4,80(sp)
	ld	a5,96(sp)
	sd	a4,8(a5)
	ld	a5,0(s1)
	sd	s0,280(a5)
	ld	a0,96(sp)
	ld	ra,200(sp)
	ld	s0,192(sp)
	ld	s1,184(sp)
	addi	sp,sp,208
	jr	ra
	.size	caml_modf_float, .-caml_modf_float
	.section	.text.caml_sqrt_float,"ax",@progbits
	.align	1
	.globl	caml_sqrt_float
	.type	caml_sqrt_float, @function
caml_sqrt_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	sqrt
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_sqrt_float, .-caml_sqrt_float
	.section	.text.caml_power_float,"ax",@progbits
	.align	1
	.globl	caml_power_float
	.type	caml_power_float, @function
caml_power_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa1,0(a1)
	fld	fa0,0(a0)
	call	pow
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_power_float, .-caml_power_float
	.section	.text.caml_sin_float,"ax",@progbits
	.align	1
	.globl	caml_sin_float
	.type	caml_sin_float, @function
caml_sin_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	sin
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_sin_float, .-caml_sin_float
	.section	.text.caml_sinh_float,"ax",@progbits
	.align	1
	.globl	caml_sinh_float
	.type	caml_sinh_float, @function
caml_sinh_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	sinh
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_sinh_float, .-caml_sinh_float
	.section	.text.caml_cos_float,"ax",@progbits
	.align	1
	.globl	caml_cos_float
	.type	caml_cos_float, @function
caml_cos_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	cos
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_cos_float, .-caml_cos_float
	.section	.text.caml_cosh_float,"ax",@progbits
	.align	1
	.globl	caml_cosh_float
	.type	caml_cosh_float, @function
caml_cosh_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	cosh
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_cosh_float, .-caml_cosh_float
	.section	.text.caml_tan_float,"ax",@progbits
	.align	1
	.globl	caml_tan_float
	.type	caml_tan_float, @function
caml_tan_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	tan
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_tan_float, .-caml_tan_float
	.section	.text.caml_tanh_float,"ax",@progbits
	.align	1
	.globl	caml_tanh_float
	.type	caml_tanh_float, @function
caml_tanh_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	tanh
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_tanh_float, .-caml_tanh_float
	.section	.text.caml_asin_float,"ax",@progbits
	.align	1
	.globl	caml_asin_float
	.type	caml_asin_float, @function
caml_asin_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	asin
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_asin_float, .-caml_asin_float
	.section	.text.caml_acos_float,"ax",@progbits
	.align	1
	.globl	caml_acos_float
	.type	caml_acos_float, @function
caml_acos_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	acos
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_acos_float, .-caml_acos_float
	.section	.text.caml_atan_float,"ax",@progbits
	.align	1
	.globl	caml_atan_float
	.type	caml_atan_float, @function
caml_atan_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	atan
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_atan_float, .-caml_atan_float
	.section	.text.caml_atan2_float,"ax",@progbits
	.align	1
	.globl	caml_atan2_float
	.type	caml_atan2_float, @function
caml_atan2_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa1,0(a1)
	fld	fa0,0(a0)
	call	atan2
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_atan2_float, .-caml_atan2_float
	.section	.text.caml_ceil_float,"ax",@progbits
	.align	1
	.globl	caml_ceil_float
	.type	caml_ceil_float, @function
caml_ceil_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	ceil
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ceil_float, .-caml_ceil_float
	.section	.text.caml_hypot,"ax",@progbits
	.align	1
	.globl	caml_hypot
	.type	caml_hypot, @function
caml_hypot:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	hypot
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_hypot, .-caml_hypot
	.section	.text.caml_hypot_float,"ax",@progbits
	.align	1
	.globl	caml_hypot_float
	.type	caml_hypot_float, @function
caml_hypot_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa1,0(a1)
	fld	fa0,0(a0)
	call	caml_hypot
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_hypot_float, .-caml_hypot_float
	.section	.text.caml_expm1,"ax",@progbits
	.align	1
	.globl	caml_expm1
	.type	caml_expm1, @function
caml_expm1:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	expm1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_expm1, .-caml_expm1
	.section	.text.caml_log1p,"ax",@progbits
	.align	1
	.globl	caml_log1p
	.type	caml_log1p, @function
caml_log1p:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	log1p
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_log1p, .-caml_log1p
	.section	.text.caml_expm1_float,"ax",@progbits
	.align	1
	.globl	caml_expm1_float
	.type	caml_expm1_float, @function
caml_expm1_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	caml_expm1
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_expm1_float, .-caml_expm1_float
	.section	.text.caml_log1p_float,"ax",@progbits
	.align	1
	.globl	caml_log1p_float
	.type	caml_log1p_float, @function
caml_log1p_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	caml_log1p
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_log1p_float, .-caml_log1p_float
	.section	.text.caml_copysign,"ax",@progbits
	.align	1
	.globl	caml_copysign
	.type	caml_copysign, @function
caml_copysign:
	fsgnj.d	fa0,fa0,fa1
	ret
	.size	caml_copysign, .-caml_copysign
	.section	.text.caml_copysign_float,"ax",@progbits
	.align	1
	.globl	caml_copysign_float
	.type	caml_copysign_float, @function
caml_copysign_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa1,0(a1)
	fld	fa0,0(a0)
	call	caml_copysign
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_copysign_float, .-caml_copysign_float
	.section	.text.caml_signbit,"ax",@progbits
	.align	1
	.globl	caml_signbit
	.type	caml_signbit, @function
caml_signbit:
	fmv.x.d	a5,fa0
	blt	a5,zero,.L230
	li	a0,1
	ret
.L230:
	li	a0,3
	ret
	.size	caml_signbit, .-caml_signbit
	.section	.text.caml_signbit_float,"ax",@progbits
	.align	1
	.globl	caml_signbit_float
	.type	caml_signbit_float, @function
caml_signbit_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	caml_signbit
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_signbit_float, .-caml_signbit_float
	.section	.text.caml_neq_float,"ax",@progbits
	.align	1
	.globl	caml_neq_float
	.type	caml_neq_float, @function
caml_neq_float:
	fld	fa5,0(a0)
	fld	fa4,0(a1)
	feq.d	a5,fa5,fa4
	beq	a5,zero,.L236
	li	a0,1
	ret
.L236:
	li	a0,3
	ret
	.size	caml_neq_float, .-caml_neq_float
	.section	.text.caml_float_compare_unboxed,"ax",@progbits
	.align	1
	.globl	caml_float_compare_unboxed
	.type	caml_float_compare_unboxed, @function
caml_float_compare_unboxed:
	fgt.d	a5,fa0,fa1
	flt.d	a0,fa0,fa1
	sub	a5,a5,a0
	feq.d	a0,fa0,fa0
	add	a5,a5,a0
	feq.d	a0,fa1,fa1
	sub	a0,a5,a0
	ret
	.size	caml_float_compare_unboxed, .-caml_float_compare_unboxed
	.section	.text.caml_eq_float,"ax",@progbits
	.align	1
	.globl	caml_eq_float
	.type	caml_eq_float, @function
caml_eq_float:
	fld	fa5,0(a0)
	fld	fa4,0(a1)
	feq.d	a5,fa5,fa4
	bne	a5,zero,.L241
	li	a0,1
	ret
.L241:
	li	a0,3
	ret
	.size	caml_eq_float, .-caml_eq_float
	.section	.text.caml_le_float,"ax",@progbits
	.align	1
	.globl	caml_le_float
	.type	caml_le_float, @function
caml_le_float:
	fld	fa5,0(a0)
	fld	fa4,0(a1)
	fle.d	a5,fa5,fa4
	bne	a5,zero,.L248
	li	a0,1
	ret
.L248:
	li	a0,3
	ret
	.size	caml_le_float, .-caml_le_float
	.section	.text.caml_lt_float,"ax",@progbits
	.align	1
	.globl	caml_lt_float
	.type	caml_lt_float, @function
caml_lt_float:
	fld	fa5,0(a0)
	fld	fa4,0(a1)
	flt.d	a5,fa5,fa4
	bne	a5,zero,.L255
	li	a0,1
	ret
.L255:
	li	a0,3
	ret
	.size	caml_lt_float, .-caml_lt_float
	.section	.text.caml_ge_float,"ax",@progbits
	.align	1
	.globl	caml_ge_float
	.type	caml_ge_float, @function
caml_ge_float:
	fld	fa5,0(a0)
	fld	fa4,0(a1)
	fge.d	a5,fa5,fa4
	bne	a5,zero,.L262
	li	a0,1
	ret
.L262:
	li	a0,3
	ret
	.size	caml_ge_float, .-caml_ge_float
	.section	.text.caml_gt_float,"ax",@progbits
	.align	1
	.globl	caml_gt_float
	.type	caml_gt_float, @function
caml_gt_float:
	fld	fa5,0(a0)
	fld	fa4,0(a1)
	fgt.d	a5,fa5,fa4
	bne	a5,zero,.L269
	li	a0,1
	ret
.L269:
	li	a0,3
	ret
	.size	caml_gt_float, .-caml_gt_float
	.section	.text.caml_float_compare,"ax",@progbits
	.align	1
	.globl	caml_float_compare
	.type	caml_float_compare, @function
caml_float_compare:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa1,0(a1)
	fld	fa0,0(a0)
	call	caml_float_compare_unboxed
	slli	a0,a0,1
	addi	a0,a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_float_compare, .-caml_float_compare
	.section	.text.caml_classify_float_unboxed,"ax",@progbits
	.align	1
	.globl	caml_classify_float_unboxed
	.type	caml_classify_float_unboxed, @function
caml_classify_float_unboxed:
	fmv.x.d	a4,fa0
	slli	a5,a4,1
	beq	a5,zero,.L274
	srli	a5,a5,53
	beq	a5,zero,.L275
	li	a3,2047
	beq	a5,a3,.L278
	li	a0,1
	ret
.L278:
	slli	a4,a4,12
	bne	a4,zero,.L277
	li	a0,7
	ret
.L274:
	li	a0,5
	ret
.L275:
	li	a0,3
	ret
.L277:
	li	a0,9
	ret
	.size	caml_classify_float_unboxed, .-caml_classify_float_unboxed
	.section	.text.caml_classify_float,"ax",@progbits
	.align	1
	.globl	caml_classify_float
	.type	caml_classify_float, @function
caml_classify_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	caml_classify_float_unboxed
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_classify_float, .-caml_classify_float
	.section	.text.caml_init_ieee_floats,"ax",@progbits
	.align	1
	.globl	caml_init_ieee_floats
	.type	caml_init_ieee_floats, @function
caml_init_ieee_floats:
	ret
	.size	caml_init_ieee_floats, .-caml_init_ieee_floats
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	0
	.word	2146435072
	.align	3
.LC5:
	.word	1
	.word	0
	.align	3
.LC6:
	.word	1
	.word	-2147483648
	.align	3
.LC7:
	.word	0
	.word	1129316352
	.align	3
.LC8:
	.word	0
	.word	1016070144
	.align	3
.LC9:
	.word	0
	.word	1017118720
	.align	3
.LC10:
	.word	0
	.word	1185939456
	.align	3
.LC11:
	.word	0
	.word	1128267776
	.align	3
.LC12:
	.word	33554432
	.word	1101004800
	.align	3
.LC13:
	.word	0
	.word	959447040
	.ident	"GCC: (GNU) 9.2.0"
