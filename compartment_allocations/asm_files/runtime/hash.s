	.file	"hash.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.hash_aux,"ax",@progbits
	.align	1
	.type	hash_aux, @function
hash_aux:
	ld	a5,8(a0)
	addi	a5,a5,-1
	sd	a5,8(a0)
	ld	a4,16(a0)
	blt	a4,zero,.L27
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	mv	s0,a0
	mv	s1,a1
	blt	a5,zero,.L1
.L3:
	andi	a5,s1,1
	bne	a5,zero,.L30
	mv	s3,s1
	mv	a0,s1
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L5
	mv	s2,s1
	addi	a0,s1,-8
	lbu	a4,-8(s1)
	addiw	a5,a4,8
	andi	a2,a5,0xff
	li	a3,7
	bgtu	a2,a3,.L6
	slli	a5,a2,2
	lla	a4,.L8
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L8:
	.word	.L15-.L8
	.word	.L14-.L8
	.word	.L13-.L8
	.word	.L1-.L8
	.word	.L11-.L8
	.word	.L10-.L8
	.word	.L9-.L8
	.word	.L7-.L8
	.section	.text.hash_aux
.L30:
	ld	a5,16(s0)
	addi	a5,a5,-1
	sd	a5,16(s0)
	ld	a4,0(s0)
	slli	a5,a4,10
	add	a5,a5,a4
	slli	a5,a5,6
	sub	a5,a5,a4
	srai	s1,s1,1
	add	a5,a5,s1
	sd	a5,0(s0)
	j	.L1
.L11:
	ld	a5,16(s0)
	addi	a5,a5,-1
	sd	a5,16(s0)
	mv	a0,s1
	call	caml_string_length
	j	.L16
.L17:
	ld	a4,0(s0)
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a5,a5,2
	sub	a5,a5,a4
	lbu	a4,0(s3)
	add	a5,a5,a4
	sd	a5,0(s0)
	addi	a0,a0,-1
	addi	s3,s3,1
.L16:
	bne	a0,zero,.L17
	j	.L1
.L10:
	ld	a5,16(s0)
	addi	a5,a5,-1
	sd	a5,16(s0)
	li	a3,8
	j	.L18
.L19:
	ld	a4,0(s0)
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a5,a5,2
	sub	a5,a5,a4
	lbu	a4,0(s3)
	add	a5,a5,a4
	sd	a5,0(s0)
	addi	s3,s3,1
	addi	a3,a3,-1
.L18:
	bne	a3,zero,.L19
.L1:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L9:
	ld	a5,16(s0)
	addi	a5,a5,-1
	sd	a5,16(s0)
	li	a1,0
	j	.L20
.L22:
	ld	a4,0(s0)
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a5,a5,2
	sub	a5,a5,a4
	lbu	a4,0(a2)
	add	a5,a5,a4
	sd	a5,0(s0)
	addi	a2,a2,1
	addi	a3,a3,-1
.L21:
	bne	a3,zero,.L22
	addi	a1,a1,8
.L20:
	ld	a5,0(a0)
	srli	a5,a5,10
	slli	a5,a5,3
	bleu	a5,a1,.L1
	add	a2,s2,a1
	li	a3,8
	j	.L21
.L14:
	ld	a1,0(a0)
	srli	a1,a1,10
	slli	a1,a1,3
	sub	a1,s1,a1
	mv	a0,s0
	call	hash_aux
	j	.L1
.L13:
	ld	s1,0(s1)
	j	.L3
.L15:
	ld	a5,16(s0)
	addi	a5,a5,-1
	sd	a5,16(s0)
	ld	a4,0(s0)
	slli	a5,a4,10
	add	a5,a5,a4
	slli	a5,a5,6
	sub	a5,a5,a4
	ld	a4,8(s1)
	srai	a4,a4,1
	add	a5,a5,a4
	sd	a5,0(s0)
	j	.L1
.L7:
	ld	a5,0(s1)
	ld	a5,24(a5)
	beq	a5,zero,.L1
	ld	a5,16(s0)
	addi	a5,a5,-1
	sd	a5,16(s0)
	ld	a5,0(s0)
	slli	s2,a5,10
	add	s2,s2,a5
	slli	s2,s2,6
	sub	s2,s2,a5
	ld	a5,0(s1)
	ld	a5,24(a5)
	mv	a0,s1
	jalr	a5
	add	s2,s2,a0
	sd	s2,0(s0)
	j	.L1
.L6:
	ld	a5,16(s0)
	addi	a5,a5,-1
	sd	a5,16(s0)
	ld	a3,0(s0)
	slli	a5,a3,2
	add	a5,a5,a3
	slli	a5,a5,2
	sub	a5,a5,a3
	add	a4,a4,a5
	sd	a4,0(s0)
	ld	s1,0(a0)
	srli	s1,s1,10
	j	.L24
.L25:
	addi	s1,s1,-1
	slli	a5,s1,3
	add	a5,a5,s2
	ld	a1,0(a5)
	mv	a0,s0
	call	hash_aux
.L24:
	bne	s1,zero,.L25
	j	.L1
.L5:
	ld	a4,0(s0)
	slli	a5,a4,10
	add	a5,a5,a4
	slli	a5,a5,6
	sub	a5,a5,a4
	add	s1,a5,s1
	sd	s1,0(s0)
	j	.L1
.L27:
	ret
	.size	hash_aux, .-hash_aux
	.section	.text.caml_hash_mix_uint32,"ax",@progbits
	.align	1
	.globl	caml_hash_mix_uint32
	.type	caml_hash_mix_uint32, @function
caml_hash_mix_uint32:
	li	a5,-862048256
	addiw	a5,a5,-687
	mulw	a1,a5,a1
	slliw	a5,a1,15
	srliw	a1,a1,17
	or	a5,a5,a1
	li	a1,461844480
	addiw	a1,a1,1427
	mulw	a1,a1,a5
	xor	a0,a0,a1
	slliw	a5,a0,13
	srliw	a0,a0,19
	or	a0,a5,a0
	slliw	a5,a0,2
	addw	a0,a5,a0
	li	a5,-430673920
	addiw	a5,a5,-1180
	addw	a0,a0,a5
	ret
	.size	caml_hash_mix_uint32, .-caml_hash_mix_uint32
	.section	.text.caml_hash_mix_intnat,"ax",@progbits
	.align	1
	.globl	caml_hash_mix_intnat
	.type	caml_hash_mix_intnat, @function
caml_hash_mix_intnat:
	srai	a5,a1,32
	srai	a4,a1,63
	xor	a5,a5,a4
	xor	a5,a5,a1
	li	a1,-862048256
	addiw	a1,a1,-687
	mulw	a1,a1,a5
	slliw	a5,a1,15
	srliw	a1,a1,17
	or	a5,a5,a1
	li	a1,461844480
	addiw	a1,a1,1427
	mulw	a1,a1,a5
	xor	a0,a0,a1
	slliw	a5,a0,13
	srliw	a0,a0,19
	or	a0,a5,a0
	slliw	a5,a0,2
	addw	a0,a5,a0
	li	a5,-430673920
	addiw	a5,a5,-1180
	addw	a0,a0,a5
	ret
	.size	caml_hash_mix_intnat, .-caml_hash_mix_intnat
	.section	.text.caml_hash_mix_int64,"ax",@progbits
	.align	1
	.globl	caml_hash_mix_int64
	.type	caml_hash_mix_int64, @function
caml_hash_mix_int64:
	srai	a3,a1,32
	li	a6,-862048256
	addiw	a6,a6,-687
	mulw	a1,a6,a1
	slliw	a5,a1,15
	srliw	a1,a1,17
	or	a1,a5,a1
	li	a4,461844480
	addiw	a4,a4,1427
	mulw	a1,a4,a1
	xor	a0,a0,a1
	slliw	a5,a0,13
	srliw	a0,a0,19
	or	a0,a5,a0
	slliw	a5,a0,2
	addw	a5,a5,a0
	li	a2,-430673920
	addiw	a2,a2,-1180
	addw	a5,a5,a2
	mulw	a3,a3,a6
	slliw	a1,a3,15
	srliw	a3,a3,17
	or	a3,a1,a3
	mulw	a4,a4,a3
	xor	a5,a5,a4
	slliw	a0,a5,13
	srliw	a5,a5,19
	or	a5,a0,a5
	slliw	a0,a5,2
	addw	a0,a0,a5
	addw	a0,a0,a2
	ret
	.size	caml_hash_mix_int64, .-caml_hash_mix_int64
	.section	.text.caml_hash_mix_double,"ax",@progbits
	.align	1
	.globl	caml_hash_mix_double
	.type	caml_hash_mix_double, @function
caml_hash_mix_double:
	fmv.x.d	a5,fa0
	mv	a3,a5
	srai	a5,a5,32
	sext.w	a3,a3
	li	a4,2146435072
	and	a4,a5,a4
	sext.w	a4,a4
	li	a2,2146435072
	beq	a4,a2,.L39
.L35:
	li	a4,-2147483648
	beq	a5,a4,.L40
.L36:
	li	a1,-862048256
	addiw	a1,a1,-687
	mulw	a3,a3,a1
	slliw	a4,a3,15
	srliw	a3,a3,17
	or	a3,a4,a3
	li	a2,461844480
	addiw	a2,a2,1427
	mulw	a3,a2,a3
	xor	a0,a0,a3
	slliw	a4,a0,13
	srliw	a0,a0,19
	or	a0,a4,a0
	slliw	a4,a0,2
	addw	a4,a4,a0
	li	a3,-430673920
	addiw	a3,a3,-1180
	addw	a4,a4,a3
	mulw	a5,a5,a1
	slliw	a1,a5,15
	srliw	a5,a5,17
	or	a5,a1,a5
	mulw	a5,a2,a5
	xor	a5,a4,a5
	slliw	a0,a5,13
	srliw	a5,a5,19
	or	a5,a0,a5
	slliw	a0,a5,2
	addw	a0,a0,a5
	addw	a0,a0,a3
	ret
.L39:
	li	a2,1048576
	addi	a2,a2,-1
	and	a2,a5,a2
	or	a2,a2,a3
	beq	a2,zero,.L35
	mv	a5,a4
	li	a3,1
	j	.L36
.L40:
	bne	a3,zero,.L36
	mv	a5,a3
	j	.L36
	.size	caml_hash_mix_double, .-caml_hash_mix_double
	.section	.text.caml_hash_mix_float,"ax",@progbits
	.align	1
	.globl	caml_hash_mix_float
	.type	caml_hash_mix_float, @function
caml_hash_mix_float:
	fmv.x.s	a5,fa0
	sext.w	a5,a5
	li	a4,2139095040
	and	a4,a5,a4
	sext.w	a4,a4
	li	a3,2139095040
	beq	a4,a3,.L46
.L42:
	li	a4,-2147483648
	beq	a5,a4,.L47
.L43:
	li	a4,-862048256
	addiw	a4,a4,-687
	mulw	a5,a5,a4
	slliw	a4,a5,15
	srliw	a5,a5,17
	or	a4,a4,a5
	li	a5,461844480
	addiw	a5,a5,1427
	mulw	a5,a5,a4
	xor	a0,a0,a5
	slliw	a5,a0,13
	srliw	a0,a0,19
	or	a0,a5,a0
	slliw	a5,a0,2
	addw	a0,a5,a0
	li	a5,-430673920
	addiw	a5,a5,-1180
	addw	a0,a0,a5
	ret
.L46:
	li	a4,8388608
	addi	a4,a4,-1
	and	a4,a5,a4
	beq	a4,zero,.L42
	li	a5,2139095040
	addi	a5,a5,1
	j	.L43
.L47:
	li	a5,0
	j	.L43
	.size	caml_hash_mix_float, .-caml_hash_mix_float
	.section	.text.caml_hash_mix_string,"ax",@progbits
	.align	1
	.globl	caml_hash_mix_string
	.type	caml_hash_mix_string, @function
caml_hash_mix_string:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	mv	s1,a1
	mv	a0,a1
	call	caml_string_length
	li	a5,0
.L49:
	addi	a3,a5,4
	bgtu	a3,a0,.L58
	add	a5,s1,a5
	lw	a4,0(a5)
	li	a5,-862048256
	addiw	a5,a5,-687
	mulw	a4,a4,a5
	slliw	a5,a4,15
	srliw	a4,a4,17
	or	a4,a5,a4
	li	a5,461844480
	addiw	a5,a5,1427
	mulw	a5,a5,a4
	xor	a5,s0,a5
	slliw	s0,a5,13
	srliw	a5,a5,19
	or	a5,s0,a5
	slliw	s0,a5,2
	addw	a5,s0,a5
	li	a4,-430673920
	addiw	a4,a4,-1180
	addw	s0,a5,a4
	mv	a5,a3
	j	.L49
.L58:
	andi	a4,a0,3
	li	a3,2
	beq	a4,a3,.L55
	li	a3,3
	beq	a4,a3,.L52
	li	a3,1
	bne	a4,a3,.L54
	li	a4,0
	j	.L53
.L52:
	add	a4,s1,a5
	lbu	a4,2(a4)
	slliw	a4,a4,16
.L51:
	add	a3,s1,a5
	lbu	a3,1(a3)
	slliw	a3,a3,8
	or	a4,a4,a3
	sext.w	a4,a4
.L53:
	add	a5,s1,a5
	lbu	a5,0(a5)
	or	a5,a4,a5
	li	a4,-862048256
	addiw	a4,a4,-687
	mulw	a4,a4,a5
	slliw	a5,a4,15
	srliw	a4,a4,17
	or	a4,a5,a4
	li	a5,461844480
	addiw	a5,a5,1427
	mulw	a5,a5,a4
	xor	a5,s0,a5
	slliw	s0,a5,13
	srliw	a5,a5,19
	or	a5,s0,a5
	slliw	s0,a5,2
	addw	a5,s0,a5
	li	a4,-430673920
	addiw	a4,a4,-1180
	addw	s0,a5,a4
.L54:
	sext.w	a0,a0
	xor	a0,a0,s0
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L55:
	li	a4,0
	j	.L51
	.size	caml_hash_mix_string, .-caml_hash_mix_string
	.section	.text.caml_hash,"ax",@progbits
	.align	1
	.globl	caml_hash
	.type	caml_hash, @function
caml_hash:
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
	addi	sp,sp,-2032
	srai	s6,a1,1
	li	a5,256
	bleu	s6,a5,.L60
	li	s6,256
.L60:
	srai	s2,a0,1
	srai	a0,a2,1
	sext.w	s1,a0
	sd	a3,0(sp)
	li	s3,1
	li	a5,0
	j	.L61
.L88:
	mv	a1,s0
	mv	a0,s1
	call	caml_hash_mix_intnat
	sext.w	s1,a0
	addi	s2,s2,-1
	j	.L65
.L72:
	mv	a1,s0
	mv	a0,s1
	call	caml_hash_mix_string
	sext.w	s1,a0
	addi	s2,s2,-1
.L65:
	mv	a5,s5
.L61:
	bge	a5,s3,.L83
	ble	s2,zero,.L83
	addi	s5,a5,1
	slli	a5,a5,3
	li	a4,4096
	addi	a4,a4,-2048
	add	a4,a4,sp
	add	a5,a4,a5
	ld	s0,-2048(a5)
.L63:
.L62:
	andi	a5,s0,1
	bne	a5,zero,.L88
	mv	s7,s0
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L66
	mv	s4,s0
	addi	a2,s0,-8
	lbu	a5,-8(s0)
	addiw	a5,a5,8
	andi	a3,a5,0xff
	li	a4,7
	bgtu	a3,a4,.L67
	slli	a5,a3,2
	lla	a4,.L69
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L69:
	.word	.L75-.L69
	.word	.L74-.L69
	.word	.L86-.L69
	.word	.L65-.L69
	.word	.L72-.L69
	.word	.L71-.L69
	.word	.L70-.L69
	.word	.L68-.L69
	.section	.text.caml_hash
.L71:
	fld	fa0,0(s0)
	mv	a0,s1
	call	caml_hash_mix_double
	sext.w	s1,a0
	addi	s2,s2,-1
	j	.L65
.L70:
	ld	s7,0(a2)
	srli	s7,s7,10
	li	s0,0
.L76:
	bgeu	s0,s7,.L65
	slli	a5,s0,3
	add	a5,a5,s4
	fld	fa0,0(a5)
	mv	a0,s1
	call	caml_hash_mix_double
	sext.w	s1,a0
	addi	s2,s2,-1
	ble	s2,zero,.L65
	addi	s0,s0,1
	j	.L76
.L74:
	ld	s0,0(a2)
	srli	s0,s0,10
	slliw	a1,s0,3
	mv	a0,s1
	call	caml_hash_mix_uint32
	sext.w	s1,a0
	slli	s0,s0,3
	sub	s0,s7,s0
	j	.L62
.L89:
	addi	s4,s4,-1
.L73:
	beq	s4,zero,.L65
	ld	s0,0(s0)
	andi	a5,s0,1
	bne	a5,zero,.L62
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L62
	lbu	a4,-8(s0)
	li	a5,250
	beq	a4,a5,.L89
	j	.L62
.L86:
	li	s4,1000
	j	.L73
.L75:
	ld	a1,8(s0)
	srai	a1,a1,1
	mv	a0,s1
	call	caml_hash_mix_intnat
	sext.w	s1,a0
	addi	s2,s2,-1
	j	.L65
.L68:
	ld	a5,0(s0)
	ld	a5,24(a5)
	beq	a5,zero,.L65
	mv	a0,s0
	jalr	a5
	sext.w	a1,a0
	mv	a0,s1
	call	caml_hash_mix_uint32
	sext.w	s1,a0
	addi	s2,s2,-1
	j	.L65
.L67:
	ld	s0,0(a2)
	andi	a1,s0,-769
	sext.w	a1,a1
	mv	a0,s1
	call	caml_hash_mix_uint32
	sext.w	s1,a0
	srli	a2,s0,10
	li	a5,0
.L81:
	bgeu	a5,a2,.L65
	bge	s3,s6,.L65
	slli	a4,a5,3
	add	a4,a4,s4
	ld	a3,0(a4)
	slli	a4,s3,3
	li	a1,4096
	addi	a1,a1,-2048
	add	a1,a1,sp
	add	a4,a1,a4
	sd	a3,-2048(a4)
	addi	a5,a5,1
	addi	s3,s3,1
	j	.L81
.L66:
	mv	a1,s0
	mv	a0,s1
	call	caml_hash_mix_intnat
	sext.w	s1,a0
	addi	s2,s2,-1
	j	.L65
.L83:
	srliw	a0,s1,16
	xor	a0,s1,a0
	li	s1,-2048143360
	addiw	s1,s1,-1429
	mulw	a0,s1,a0
	srliw	s1,a0,13
	xor	s1,s1,a0
	li	a0,-1028476928
	addiw	a0,a0,-459
	mulw	s1,a0,s1
	srliw	a0,s1,16
	xor	a0,a0,s1
	slli	a0,a0,32
	srli	a0,a0,32
	slli	a0,a0,1
	li	a5,-2147483648
	xori	a5,a5,-2
	and	a0,a0,a5
	addi	a0,a0,1
	addi	sp,sp,2032
	ld	ra,88(sp)
	ld	s0,80(sp)
	ld	s1,72(sp)
	ld	s2,64(sp)
	ld	s3,56(sp)
	ld	s4,48(sp)
	ld	s5,40(sp)
	ld	s6,32(sp)
	ld	s7,24(sp)
	addi	sp,sp,96
	jr	ra
	.size	caml_hash, .-caml_hash
	.section	.text.caml_hash_univ_param,"ax",@progbits
	.align	1
	.globl	caml_hash_univ_param
	.type	caml_hash_univ_param, @function
caml_hash_univ_param:
	addi	sp,sp,-48
	sd	ra,40(sp)
	srai	a5,a1,1
	sd	a5,16(sp)
	srai	a0,a0,1
	sd	a0,24(sp)
	sd	zero,8(sp)
	mv	a1,a2
	addi	a0,sp,8
	call	hash_aux
	ld	a0,8(sp)
	slli	a0,a0,1
	li	a5,-2147483648
	xori	a5,a5,-2
	and	a0,a0,a5
	addi	a0,a0,1
	ld	ra,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_hash_univ_param, .-caml_hash_univ_param
	.section	.text.caml_hash_variant,"ax",@progbits
	.align	1
	.globl	caml_hash_variant
	.type	caml_hash_variant, @function
caml_hash_variant:
	mv	a4,a0
	li	a0,1
.L93:
	lbu	a3,0(a4)
	beq	a3,zero,.L95
	srai	a0,a0,1
	slliw	a5,a0,3
	subw	a5,a5,a0
	slliw	a5,a5,5
	subw	a5,a5,a0
	addw	a5,a5,a3
	slli	a5,a5,1
	addi	a0,a5,1
	addi	a4,a4,1
	j	.L93
.L95:
	sext.w	a0,a0
	ret
	.size	caml_hash_variant, .-caml_hash_variant
	.ident	"GCC: (GNU) 9.2.0"
