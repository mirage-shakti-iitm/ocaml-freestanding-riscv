	.file	"ints.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.parse_sign_and_base,"ax",@progbits
	.align	1
	.type	parse_sign_and_base, @function
parse_sign_and_base:
	li	a5,1
	sw	a5,0(a3)
	lbu	a5,0(a0)
	li	a4,45
	beq	a5,a4,.L11
	li	a4,43
	beq	a5,a4,.L12
.L3:
	li	a5,10
	sw	a5,0(a1)
	li	a5,1
	sw	a5,0(a2)
	lbu	a4,0(a0)
	li	a5,48
	beq	a4,a5,.L13
.L1:
	ret
.L11:
	li	a5,-1
	sw	a5,0(a3)
	addi	a0,a0,1
	j	.L3
.L12:
	addi	a0,a0,1
	j	.L3
.L13:
	lbu	a5,1(a0)
	addiw	a5,a5,-66
	andi	a3,a5,0xff
	li	a4,54
	bgtu	a3,a4,.L1
	slli	a5,a3,2
	lla	a4,.L6
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L6:
	.word	.L9-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L8-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L7-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L5-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L9-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L8-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L7-.L6
	.word	.L1-.L6
	.word	.L1-.L6
	.word	.L5-.L6
	.section	.text.parse_sign_and_base
.L5:
	li	a5,16
	sw	a5,0(a1)
	sw	zero,0(a2)
	addi	a0,a0,2
	ret
.L8:
	li	a5,8
	sw	a5,0(a1)
	sw	zero,0(a2)
	addi	a0,a0,2
	ret
.L9:
	li	a5,2
	sw	a5,0(a1)
	sw	zero,0(a2)
	addi	a0,a0,2
	ret
.L7:
	sw	zero,0(a2)
	addi	a0,a0,2
	j	.L1
	.size	parse_sign_and_base, .-parse_sign_and_base
	.section	.text.parse_digit,"ax",@progbits
	.align	1
	.type	parse_digit, @function
parse_digit:
	addiw	a5,a0,-48
	andi	a5,a5,0xff
	li	a4,9
	bleu	a5,a4,.L19
	addiw	a5,a0,-65
	andi	a5,a5,0xff
	li	a4,5
	bleu	a5,a4,.L20
	addiw	a5,a0,-97
	andi	a5,a5,0xff
	li	a4,5
	bgtu	a5,a4,.L18
	addiw	a0,a0,-87
	ret
.L19:
	addiw	a0,a0,-48
	ret
.L20:
	addiw	a0,a0,-55
	ret
.L18:
	li	a0,-1
	ret
	.size	parse_digit, .-parse_digit
	.section	.text.int32_cmp,"ax",@progbits
	.align	1
	.type	int32_cmp, @function
int32_cmp:
	lw	a5,8(a0)
	lw	a4,8(a1)
	sgt	a0,a5,a4
	slt	a5,a5,a4
	subw	a0,a0,a5
	ret
	.size	int32_cmp, .-int32_cmp
	.section	.text.int32_hash,"ax",@progbits
	.align	1
	.type	int32_hash, @function
int32_hash:
	lw	a0,8(a0)
	ret
	.size	int32_hash, .-int32_hash
	.section	.text.caml_swap32,"ax",@progbits
	.align	1
	.type	caml_swap32, @function
caml_swap32:
	slliw	a5,a0,24
	slliw	a4,a0,8
	li	a3,16711680
	and	a4,a4,a3
	sext.w	a4,a4
	or	a5,a5,a4
	sraiw	a4,a0,8
	li	a3,65536
	addi	a3,a3,-256
	and	a4,a4,a3
	sext.w	a4,a4
	or	a5,a5,a4
	srliw	a0,a0,24
	or	a0,a5,a0
	sext.w	a0,a0
	ret
	.size	caml_swap32, .-caml_swap32
	.section	.text.int64_cmp,"ax",@progbits
	.align	1
	.type	int64_cmp, @function
int64_cmp:
	ld	a5,8(a0)
	ld	a4,8(a1)
	sgt	a0,a5,a4
	slt	a5,a5,a4
	subw	a0,a0,a5
	ret
	.size	int64_cmp, .-int64_cmp
	.section	.text.int64_hash,"ax",@progbits
	.align	1
	.type	int64_hash, @function
int64_hash:
	ld	a5,8(a0)
	sext.w	a0,a5
	srai	a5,a5,32
	xor	a0,a0,a5
	slli	a0,a0,32
	srli	a0,a0,32
	ret
	.size	int64_hash, .-int64_hash
	.section	.text.caml_swap64,"ax",@progbits
	.align	1
	.type	caml_swap64, @function
caml_swap64:
	slli	a5,a0,56
	slli	a3,a0,40
	li	a4,255
	slli	a2,a4,48
	and	a3,a3,a2
	or	a5,a5,a3
	slli	a3,a0,24
	slli	a2,a4,40
	and	a3,a3,a2
	or	a5,a5,a3
	slli	a3,a0,8
	slli	a2,a4,32
	and	a3,a3,a2
	or	a5,a5,a3
	srai	a3,a0,8
	slli	a4,a4,24
	and	a4,a3,a4
	or	a5,a5,a4
	srai	a4,a0,24
	li	a3,16711680
	and	a4,a4,a3
	or	a5,a5,a4
	srai	a4,a0,40
	li	a3,65536
	addi	a3,a3,-256
	and	a4,a4,a3
	or	a5,a5,a4
	srli	a0,a0,56
	or	a0,a5,a0
	ret
	.size	caml_swap64, .-caml_swap64
	.section	.text.nativeint_cmp,"ax",@progbits
	.align	1
	.type	nativeint_cmp, @function
nativeint_cmp:
	ld	a5,8(a0)
	ld	a4,8(a1)
	sgt	a0,a5,a4
	slt	a5,a5,a4
	subw	a0,a0,a5
	ret
	.size	nativeint_cmp, .-nativeint_cmp
	.section	.text.nativeint_hash,"ax",@progbits
	.align	1
	.type	nativeint_hash, @function
nativeint_hash:
	ld	a5,8(a0)
	srai	a0,a5,32
	srai	a4,a5,63
	xor	a0,a0,a4
	xor	a0,a0,a5
	ret
	.size	nativeint_hash, .-nativeint_hash
	.section	.text.parse_intnat,"ax",@progbits
	.align	1
	.type	parse_intnat, @function
parse_intnat:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	sd	s1,56(sp)
	sd	s2,48(sp)
	sd	s3,40(sp)
	sd	s4,32(sp)
	sd	s5,24(sp)
	sd	s6,16(sp)
	mv	s4,a0
	mv	s5,a1
	mv	s6,a2
	addi	a3,sp,12
	addi	a2,sp,4
	addi	a1,sp,8
	call	parse_sign_and_base
	mv	s1,a0
	lw	s3,8(sp)
	lbu	a0,0(a0)
	call	parse_digit
	blt	a0,zero,.L30
	mv	s2,s3
	mv	s0,a0
	ble	s3,a0,.L30
	addi	s1,s1,1
	j	.L37
.L30:
	mv	a0,s6
	call	caml_failwith
.L45:
	li	a5,1
	j	.L34
.L46:
	mv	a0,s6
	call	caml_failwith
.L32:
	addi	s1,s1,1
.L37:
	lbu	a0,0(s1)
	li	a5,95
	beq	a0,a5,.L32
	call	parse_digit
	blt	a0,zero,.L33
	ble	s3,a0,.L33
	li	a5,0
	mulhu	a4,s0,s2
	bne	a4,zero,.L45
.L34:
	bne	a5,zero,.L46
	mul	s0,s2,s0
	add	s0,s0,a0
	bleu	a0,s0,.L32
	mv	a0,s6
	call	caml_failwith
.L33:
	mv	a0,s4
	call	caml_string_length
	add	s4,s4,a0
	bne	s4,s1,.L47
	lw	a5,4(sp)
	beq	a5,zero,.L39
	lw	a5,12(sp)
	blt	a5,zero,.L40
	addiw	s5,s5,-1
	li	a5,1
	sll	a5,a5,s5
	bleu	a5,s0,.L48
.L41:
	lw	a5,12(sp)
	blt	a5,zero,.L49
	mv	a0,s0
.L29:
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
.L47:
	mv	a0,s6
	call	caml_failwith
.L48:
	mv	a0,s6
	call	caml_failwith
.L40:
	addiw	s5,s5,-1
	li	a5,1
	sll	a5,a5,s5
	bgeu	a5,s0,.L41
	mv	a0,s6
	call	caml_failwith
.L39:
	sext.w	a5,s5
	li	a4,63
	bgtu	a5,a4,.L41
	li	a5,1
	sll	s5,a5,s5
	bgtu	s5,s0,.L41
	mv	a0,s6
	call	caml_failwith
.L49:
	neg	a0,s0
	j	.L29
	.size	parse_intnat, .-parse_intnat
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"format_int: format too long"
	.section	.text.parse_format,"ax",@progbits
	.align	1
	.type	parse_format, @function
parse_format:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	sd	s4,16(sp)
	sd	s5,8(sp)
	mv	s5,a0
	mv	s4,a1
	mv	s0,a2
	call	caml_string_length
	mv	s2,a0
	mv	a0,s4
	call	strlen
	add	a5,s2,a0
	addi	a5,a5,1
	li	a4,31
	bgtu	a5,a4,.L55
	mv	s3,a0
	mv	a2,s2
	mv	a1,s5
	mv	a0,s0
	call	memmove
	addi	s2,s2,-1
	add	s0,s0,s2
	lbu	s1,0(s0)
	lbu	a5,-1(s0)
	li	a4,108
	beq	a5,a4,.L52
	li	a4,110
	beq	a5,a4,.L52
	li	a4,76
	bne	a5,a4,.L53
.L52:
	addi	s0,s0,-1
.L53:
	mv	a2,s3
	mv	a1,s4
	mv	a0,s0
	call	memmove
	add	s0,s0,s3
	sb	s1,0(s0)
	sb	zero,1(s0)
	mv	a0,s1
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	ld	s4,16(sp)
	ld	s5,8(sp)
	addi	sp,sp,64
	jr	ra
.L55:
	lla	a0,.LC0
	call	caml_invalid_argument
	.size	parse_format, .-parse_format
	.section	.text.int32_deserialize,"ax",@progbits
	.align	1
	.type	int32_deserialize, @function
int32_deserialize:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	call	caml_deserialize_sint_4
	sw	a0,0(s0)
	li	a0,4
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	int32_deserialize, .-int32_deserialize
	.section	.text.int32_serialize,"ax",@progbits
	.align	1
	.type	int32_serialize, @function
int32_serialize:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a1
	mv	s1,a2
	lw	a0,8(a0)
	call	caml_serialize_int_4
	li	a5,4
	sd	a5,0(s1)
	sd	a5,0(s0)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	int32_serialize, .-int32_serialize
	.section	.text.int64_deserialize,"ax",@progbits
	.align	1
	.type	int64_deserialize, @function
int64_deserialize:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	call	caml_deserialize_sint_8
	sd	a0,0(s0)
	li	a0,8
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	int64_deserialize, .-int64_deserialize
	.section	.text.int64_serialize,"ax",@progbits
	.align	1
	.type	int64_serialize, @function
int64_serialize:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a1
	mv	s1,a2
	ld	a0,8(a0)
	call	caml_serialize_int_8
	li	a5,8
	sd	a5,0(s1)
	sd	a5,0(s0)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	int64_serialize, .-int64_serialize
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"input_value: ill-formed native integer"
	.section	.text.nativeint_deserialize,"ax",@progbits
	.align	1
	.type	nativeint_deserialize, @function
nativeint_deserialize:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	call	caml_deserialize_uint_1
	li	a5,1
	beq	a0,a5,.L65
	li	a5,2
	bne	a0,a5,.L71
	call	caml_deserialize_sint_8
	sd	a0,0(s0)
	j	.L68
.L65:
	call	caml_deserialize_sint_4
	sd	a0,0(s0)
.L68:
	li	a0,8
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L71:
	lla	a0,.LC1
	call	caml_deserialize_error
	.size	nativeint_deserialize, .-nativeint_deserialize
	.section	.text.nativeint_serialize,"ax",@progbits
	.align	1
	.type	nativeint_serialize, @function
nativeint_serialize:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s1,a1
	mv	s0,a2
	ld	s2,8(a0)
	li	a5,1
	slli	a5,a5,31
	add	a5,s2,a5
	li	a4,-1
	srli	a4,a4,32
	bgtu	a5,a4,.L73
	li	a0,1
	call	caml_serialize_int_1
	sext.w	a0,s2
	call	caml_serialize_int_4
.L74:
	li	a5,4
	sd	a5,0(s1)
	li	a5,8
	sd	a5,0(s0)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L73:
	li	a0,2
	call	caml_serialize_int_1
	mv	a0,s2
	call	caml_serialize_int_8
	j	.L74
	.size	nativeint_serialize, .-nativeint_serialize
	.section	.text.caml_bswap16_direct,"ax",@progbits
	.align	1
	.globl	caml_bswap16_direct
	.type	caml_bswap16_direct, @function
caml_bswap16_direct:
	slli	a5,a0,8
	li	a4,65536
	addi	a4,a4,-1
	and	a5,a5,a4
	srai	a0,a0,8
	andi	a0,a0,255
	or	a0,a5,a0
	ret
	.size	caml_bswap16_direct, .-caml_bswap16_direct
	.section	.text.caml_bswap16,"ax",@progbits
	.align	1
	.globl	caml_bswap16
	.type	caml_bswap16, @function
caml_bswap16:
	srai	a0,a0,1
	sext.w	a0,a0
	slli	a5,a0,8
	li	a4,65536
	addi	a4,a4,-1
	and	a5,a5,a4
	srai	a0,a0,8
	andi	a0,a0,255
	or	a0,a5,a0
	slli	a0,a0,1
	addi	a0,a0,1
	ret
	.size	caml_bswap16, .-caml_bswap16
	.section	.text.caml_int_compare,"ax",@progbits
	.align	1
	.globl	caml_int_compare
	.type	caml_int_compare, @function
caml_int_compare:
	sgt	a5,a0,a1
	slt	a0,a0,a1
	sub	a0,a5,a0
	slli	a0,a0,1
	addi	a0,a0,1
	ret
	.size	caml_int_compare, .-caml_int_compare
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"int_of_string"
	.section	.text.caml_int_of_string,"ax",@progbits
	.align	1
	.globl	caml_int_of_string
	.type	caml_int_of_string, @function
caml_int_of_string:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a2,.LC2
	li	a1,63
	call	parse_intnat
	slli	a0,a0,1
	addi	a0,a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int_of_string, .-caml_int_of_string
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"l"
	.section	.text.caml_format_int,"ax",@progbits
	.align	1
	.globl	caml_format_int
	.type	caml_format_int, @function
caml_format_int:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	mv	s0,a1
	mv	a2,sp
	lla	a1,.LC3
	call	parse_format
	addiw	a0,a0,-88
	andi	a0,a0,0xff
	li	a5,32
	bgtu	a0,a5,.L82
	li	a5,1
	sll	a0,a5,a0
	li	a5,577
	slli	a5,a5,23
	addi	a5,a5,1
	and	a0,a0,a5
	beq	a0,zero,.L82
	srli	a1,s0,1
	mv	a0,sp
	call	caml_alloc_sprintf
.L81:
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
.L82:
	srai	a1,s0,1
	mv	a0,sp
	call	caml_alloc_sprintf
	j	.L81
	.size	caml_format_int, .-caml_format_int
	.section	.text.caml_copy_int32,"ax",@progbits
	.align	1
	.globl	caml_copy_int32
	.type	caml_copy_int32, @function
caml_copy_int32:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	li	a3,1
	li	a2,0
	li	a1,4
	lla	a0,.LANCHOR0
	call	caml_alloc_custom
	sw	s0,8(a0)
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_copy_int32, .-caml_copy_int32
	.section	.text.caml_int32_neg,"ax",@progbits
	.align	1
	.globl	caml_int32_neg
	.type	caml_int32_neg, @function
caml_int32_neg:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,8(a0)
	negw	a0,a0
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_neg, .-caml_int32_neg
	.section	.text.caml_int32_add,"ax",@progbits
	.align	1
	.globl	caml_int32_add
	.type	caml_int32_add, @function
caml_int32_add:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,8(a0)
	lw	a5,8(a1)
	addw	a0,a0,a5
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_add, .-caml_int32_add
	.section	.text.caml_int32_sub,"ax",@progbits
	.align	1
	.globl	caml_int32_sub
	.type	caml_int32_sub, @function
caml_int32_sub:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,8(a0)
	lw	a5,8(a1)
	subw	a0,a0,a5
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_sub, .-caml_int32_sub
	.section	.text.caml_int32_mul,"ax",@progbits
	.align	1
	.globl	caml_int32_mul
	.type	caml_int32_mul, @function
caml_int32_mul:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,8(a0)
	lw	a5,8(a1)
	mulw	a0,a0,a5
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_mul, .-caml_int32_mul
	.section	.text.caml_int32_div,"ax",@progbits
	.align	1
	.globl	caml_int32_div
	.type	caml_int32_div, @function
caml_int32_div:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a4,8(a0)
	lw	a5,8(a1)
	beq	a5,zero,.L101
	li	a3,-2147483648
	bne	a4,a3,.L97
	li	a3,-1
	beq	a5,a3,.L95
.L97:
	divw	a0,a4,a5
	call	caml_copy_int32
.L95:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L101:
	call	caml_raise_zero_divide
	.size	caml_int32_div, .-caml_int32_div
	.section	.text.caml_int32_mod,"ax",@progbits
	.align	1
	.globl	caml_int32_mod
	.type	caml_int32_mod, @function
caml_int32_mod:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,8(a0)
	lw	a5,8(a1)
	beq	a5,zero,.L107
	li	a4,-2147483648
	bne	a0,a4,.L104
	li	a4,-1
	beq	a5,a4,.L108
.L104:
	remw	a0,a0,a5
	call	caml_copy_int32
.L102:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L107:
	call	caml_raise_zero_divide
.L108:
	li	a0,0
	call	caml_copy_int32
	j	.L102
	.size	caml_int32_mod, .-caml_int32_mod
	.section	.text.caml_int32_and,"ax",@progbits
	.align	1
	.globl	caml_int32_and
	.type	caml_int32_and, @function
caml_int32_and:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,8(a0)
	lw	a5,8(a1)
	and	a0,a0,a5
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_and, .-caml_int32_and
	.section	.text.caml_int32_or,"ax",@progbits
	.align	1
	.globl	caml_int32_or
	.type	caml_int32_or, @function
caml_int32_or:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,8(a0)
	lw	a5,8(a1)
	or	a0,a0,a5
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_or, .-caml_int32_or
	.section	.text.caml_int32_xor,"ax",@progbits
	.align	1
	.globl	caml_int32_xor
	.type	caml_int32_xor, @function
caml_int32_xor:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,8(a0)
	lw	a5,8(a1)
	xor	a0,a0,a5
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_xor, .-caml_int32_xor
	.section	.text.caml_int32_shift_left,"ax",@progbits
	.align	1
	.globl	caml_int32_shift_left
	.type	caml_int32_shift_left, @function
caml_int32_shift_left:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,8(a0)
	srai	a1,a1,1
	sllw	a0,a0,a1
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_shift_left, .-caml_int32_shift_left
	.section	.text.caml_int32_shift_right,"ax",@progbits
	.align	1
	.globl	caml_int32_shift_right
	.type	caml_int32_shift_right, @function
caml_int32_shift_right:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,8(a0)
	srai	a1,a1,1
	sraw	a0,a0,a1
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_shift_right, .-caml_int32_shift_right
	.section	.text.caml_int32_shift_right_unsigned,"ax",@progbits
	.align	1
	.globl	caml_int32_shift_right_unsigned
	.type	caml_int32_shift_right_unsigned, @function
caml_int32_shift_right_unsigned:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,8(a0)
	srai	a1,a1,1
	srlw	a0,a0,a1
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_shift_right_unsigned, .-caml_int32_shift_right_unsigned
	.section	.text.caml_int32_direct_bswap,"ax",@progbits
	.align	1
	.globl	caml_int32_direct_bswap
	.type	caml_int32_direct_bswap, @function
caml_int32_direct_bswap:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sext.w	a0,a0
	call	caml_swap32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_direct_bswap, .-caml_int32_direct_bswap
	.section	.text.caml_int32_bswap,"ax",@progbits
	.align	1
	.globl	caml_int32_bswap
	.type	caml_int32_bswap, @function
caml_int32_bswap:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,8(a0)
	call	caml_swap32
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_bswap, .-caml_int32_bswap
	.section	.text.caml_int32_of_int,"ax",@progbits
	.align	1
	.globl	caml_int32_of_int
	.type	caml_int32_of_int, @function
caml_int32_of_int:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a0,a0,1
	sext.w	a0,a0
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_of_int, .-caml_int32_of_int
	.section	.text.caml_int32_to_int,"ax",@progbits
	.align	1
	.globl	caml_int32_to_int
	.type	caml_int32_to_int, @function
caml_int32_to_int:
	lw	a0,8(a0)
	slli	a0,a0,1
	addi	a0,a0,1
	ret
	.size	caml_int32_to_int, .-caml_int32_to_int
	.section	.text.caml_int32_of_float_unboxed,"ax",@progbits
	.align	1
	.globl	caml_int32_of_float_unboxed
	.type	caml_int32_of_float_unboxed, @function
caml_int32_of_float_unboxed:
	fcvt.w.d a0,fa0,rtz
	sext.w	a0,a0
	ret
	.size	caml_int32_of_float_unboxed, .-caml_int32_of_float_unboxed
	.section	.text.caml_int32_of_float,"ax",@progbits
	.align	1
	.globl	caml_int32_of_float
	.type	caml_int32_of_float, @function
caml_int32_of_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa5,0(a0)
	fcvt.w.d a0,fa5,rtz
	sext.w	a0,a0
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_of_float, .-caml_int32_of_float
	.section	.text.caml_int32_to_float_unboxed,"ax",@progbits
	.align	1
	.globl	caml_int32_to_float_unboxed
	.type	caml_int32_to_float_unboxed, @function
caml_int32_to_float_unboxed:
	fcvt.d.w	fa0,a0
	ret
	.size	caml_int32_to_float_unboxed, .-caml_int32_to_float_unboxed
	.section	.text.caml_int32_to_float,"ax",@progbits
	.align	1
	.globl	caml_int32_to_float
	.type	caml_int32_to_float, @function
caml_int32_to_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a5,8(a0)
	fcvt.d.w	fa0,a5
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_to_float, .-caml_int32_to_float
	.section	.text.caml_int32_compare_unboxed,"ax",@progbits
	.align	1
	.globl	caml_int32_compare_unboxed
	.type	caml_int32_compare_unboxed, @function
caml_int32_compare_unboxed:
	sgt	a5,a0,a1
	slt	a0,a0,a1
	sub	a0,a5,a0
	ret
	.size	caml_int32_compare_unboxed, .-caml_int32_compare_unboxed
	.section	.text.caml_int32_compare,"ax",@progbits
	.align	1
	.globl	caml_int32_compare
	.type	caml_int32_compare, @function
caml_int32_compare:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a1,8(a1)
	lw	a0,8(a0)
	call	caml_int32_compare_unboxed
	slli	a0,a0,1
	addi	a0,a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_compare, .-caml_int32_compare
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	""
	.section	.text.caml_int32_format,"ax",@progbits
	.align	1
	.globl	caml_int32_format
	.type	caml_int32_format, @function
caml_int32_format:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	mv	s0,a1
	mv	a2,sp
	lla	a1,.LC4
	call	parse_format
	lw	a1,8(s0)
	mv	a0,sp
	call	caml_alloc_sprintf
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_int32_format, .-caml_int32_format
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	"Int32.of_string"
	.section	.text.caml_int32_of_string,"ax",@progbits
	.align	1
	.globl	caml_int32_of_string
	.type	caml_int32_of_string, @function
caml_int32_of_string:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a2,.LC5
	li	a1,32
	call	parse_intnat
	sext.w	a0,a0
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_of_string, .-caml_int32_of_string
	.section	.text.caml_int32_bits_of_float_unboxed,"ax",@progbits
	.align	1
	.globl	caml_int32_bits_of_float_unboxed
	.type	caml_int32_bits_of_float_unboxed, @function
caml_int32_bits_of_float_unboxed:
	fcvt.s.d	fa5,fa0
	fmv.x.s	a0,fa5
	sext.w	a0,a0
	ret
	.size	caml_int32_bits_of_float_unboxed, .-caml_int32_bits_of_float_unboxed
	.section	.text.caml_int32_float_of_bits_unboxed,"ax",@progbits
	.align	1
	.globl	caml_int32_float_of_bits_unboxed
	.type	caml_int32_float_of_bits_unboxed, @function
caml_int32_float_of_bits_unboxed:
	fmv.s.x	fa5,a0
	fcvt.d.s	fa0,fa5
	ret
	.size	caml_int32_float_of_bits_unboxed, .-caml_int32_float_of_bits_unboxed
	.section	.text.caml_int32_bits_of_float,"ax",@progbits
	.align	1
	.globl	caml_int32_bits_of_float
	.type	caml_int32_bits_of_float, @function
caml_int32_bits_of_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	caml_int32_bits_of_float_unboxed
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_bits_of_float, .-caml_int32_bits_of_float
	.section	.text.caml_int32_float_of_bits,"ax",@progbits
	.align	1
	.globl	caml_int32_float_of_bits
	.type	caml_int32_float_of_bits, @function
caml_int32_float_of_bits:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,8(a0)
	call	caml_int32_float_of_bits_unboxed
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int32_float_of_bits, .-caml_int32_float_of_bits
	.section	.text.caml_copy_int64,"ax",@progbits
	.align	1
	.globl	caml_copy_int64
	.type	caml_copy_int64, @function
caml_copy_int64:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	li	a3,1
	li	a2,0
	li	a1,8
	lla	a0,.LANCHOR0+64
	call	caml_alloc_custom
	sd	s0,8(a0)
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_copy_int64, .-caml_copy_int64
	.section	.text.caml_int64_neg_native,"ax",@progbits
	.align	1
	.globl	caml_int64_neg_native
	.type	caml_int64_neg_native, @function
caml_int64_neg_native:
	neg	a0,a0
	ret
	.size	caml_int64_neg_native, .-caml_int64_neg_native
	.section	.text.caml_int64_neg,"ax",@progbits
	.align	1
	.globl	caml_int64_neg
	.type	caml_int64_neg, @function
caml_int64_neg:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	call	caml_int64_neg_native
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_neg, .-caml_int64_neg
	.section	.text.caml_int64_add_native,"ax",@progbits
	.align	1
	.globl	caml_int64_add_native
	.type	caml_int64_add_native, @function
caml_int64_add_native:
	add	a0,a0,a1
	ret
	.size	caml_int64_add_native, .-caml_int64_add_native
	.section	.text.caml_int64_add,"ax",@progbits
	.align	1
	.globl	caml_int64_add
	.type	caml_int64_add, @function
caml_int64_add:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a1,8(a1)
	ld	a0,8(a0)
	call	caml_int64_add_native
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_add, .-caml_int64_add
	.section	.text.caml_int64_sub_native,"ax",@progbits
	.align	1
	.globl	caml_int64_sub_native
	.type	caml_int64_sub_native, @function
caml_int64_sub_native:
	sub	a0,a0,a1
	ret
	.size	caml_int64_sub_native, .-caml_int64_sub_native
	.section	.text.caml_int64_sub,"ax",@progbits
	.align	1
	.globl	caml_int64_sub
	.type	caml_int64_sub, @function
caml_int64_sub:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a1,8(a1)
	ld	a0,8(a0)
	call	caml_int64_sub_native
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_sub, .-caml_int64_sub
	.section	.text.caml_int64_mul_native,"ax",@progbits
	.align	1
	.globl	caml_int64_mul_native
	.type	caml_int64_mul_native, @function
caml_int64_mul_native:
	mul	a0,a0,a1
	ret
	.size	caml_int64_mul_native, .-caml_int64_mul_native
	.section	.text.caml_int64_mul,"ax",@progbits
	.align	1
	.globl	caml_int64_mul
	.type	caml_int64_mul, @function
caml_int64_mul:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a1,8(a1)
	ld	a0,8(a0)
	call	caml_int64_mul_native
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_mul, .-caml_int64_mul
	.section	.text.caml_int64_div_native,"ax",@progbits
	.align	1
	.globl	caml_int64_div_native
	.type	caml_int64_div_native, @function
caml_int64_div_native:
	beq	a1,zero,.L169
	li	a5,-1
	slli	a5,a5,63
	beq	a0,a5,.L170
.L163:
	div	a0,a0,a1
.L161:
	ret
.L169:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_raise_zero_divide
.L170:
	li	a5,-1
	bne	a1,a5,.L163
	j	.L161
	.size	caml_int64_div_native, .-caml_int64_div_native
	.section	.text.caml_int64_div,"ax",@progbits
	.align	1
	.globl	caml_int64_div
	.type	caml_int64_div, @function
caml_int64_div:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a1,8(a1)
	ld	a0,8(a0)
	call	caml_int64_div_native
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_div, .-caml_int64_div
	.section	.text.caml_int64_mod_native,"ax",@progbits
	.align	1
	.globl	caml_int64_mod_native
	.type	caml_int64_mod_native, @function
caml_int64_mod_native:
	beq	a1,zero,.L181
	li	a5,-1
	slli	a5,a5,63
	beq	a0,a5,.L182
.L175:
	rem	a0,a0,a1
	ret
.L181:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_raise_zero_divide
.L182:
	li	a5,-1
	bne	a1,a5,.L175
	li	a0,0
	ret
	.size	caml_int64_mod_native, .-caml_int64_mod_native
	.section	.text.caml_int64_mod,"ax",@progbits
	.align	1
	.globl	caml_int64_mod
	.type	caml_int64_mod, @function
caml_int64_mod:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a1,8(a1)
	ld	a0,8(a0)
	call	caml_int64_mod_native
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_mod, .-caml_int64_mod
	.section	.text.caml_int64_and_native,"ax",@progbits
	.align	1
	.globl	caml_int64_and_native
	.type	caml_int64_and_native, @function
caml_int64_and_native:
	and	a0,a0,a1
	ret
	.size	caml_int64_and_native, .-caml_int64_and_native
	.section	.text.caml_int64_and,"ax",@progbits
	.align	1
	.globl	caml_int64_and
	.type	caml_int64_and, @function
caml_int64_and:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a1,8(a1)
	ld	a0,8(a0)
	call	caml_int64_and_native
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_and, .-caml_int64_and
	.section	.text.caml_int64_or_native,"ax",@progbits
	.align	1
	.globl	caml_int64_or_native
	.type	caml_int64_or_native, @function
caml_int64_or_native:
	or	a0,a0,a1
	ret
	.size	caml_int64_or_native, .-caml_int64_or_native
	.section	.text.caml_int64_or,"ax",@progbits
	.align	1
	.globl	caml_int64_or
	.type	caml_int64_or, @function
caml_int64_or:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a1,8(a1)
	ld	a0,8(a0)
	call	caml_int64_or_native
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_or, .-caml_int64_or
	.section	.text.caml_int64_xor_native,"ax",@progbits
	.align	1
	.globl	caml_int64_xor_native
	.type	caml_int64_xor_native, @function
caml_int64_xor_native:
	xor	a0,a0,a1
	ret
	.size	caml_int64_xor_native, .-caml_int64_xor_native
	.section	.text.caml_int64_xor,"ax",@progbits
	.align	1
	.globl	caml_int64_xor
	.type	caml_int64_xor, @function
caml_int64_xor:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a1,8(a1)
	ld	a0,8(a0)
	call	caml_int64_xor_native
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_xor, .-caml_int64_xor
	.section	.text.caml_int64_shift_left,"ax",@progbits
	.align	1
	.globl	caml_int64_shift_left
	.type	caml_int64_shift_left, @function
caml_int64_shift_left:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	srai	a1,a1,1
	sll	a0,a0,a1
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_shift_left, .-caml_int64_shift_left
	.section	.text.caml_int64_shift_right,"ax",@progbits
	.align	1
	.globl	caml_int64_shift_right
	.type	caml_int64_shift_right, @function
caml_int64_shift_right:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	srai	a1,a1,1
	sra	a0,a0,a1
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_shift_right, .-caml_int64_shift_right
	.section	.text.caml_int64_shift_right_unsigned,"ax",@progbits
	.align	1
	.globl	caml_int64_shift_right_unsigned
	.type	caml_int64_shift_right_unsigned, @function
caml_int64_shift_right_unsigned:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	srai	a1,a1,1
	srl	a0,a0,a1
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_shift_right_unsigned, .-caml_int64_shift_right_unsigned
	.section	.text.caml_int64_direct_bswap,"ax",@progbits
	.align	1
	.globl	caml_int64_direct_bswap
	.type	caml_int64_direct_bswap, @function
caml_int64_direct_bswap:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_swap64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_direct_bswap, .-caml_int64_direct_bswap
	.section	.text.caml_int64_bswap,"ax",@progbits
	.align	1
	.globl	caml_int64_bswap
	.type	caml_int64_bswap, @function
caml_int64_bswap:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	slli	a5,a0,56
	slli	a3,a0,40
	li	a4,255
	slli	a2,a4,48
	and	a3,a3,a2
	or	a5,a5,a3
	slli	a3,a0,24
	slli	a2,a4,40
	and	a3,a3,a2
	or	a5,a5,a3
	slli	a3,a0,8
	slli	a2,a4,32
	and	a3,a3,a2
	or	a5,a5,a3
	srli	a3,a0,8
	slli	a4,a4,24
	and	a4,a3,a4
	or	a5,a5,a4
	srli	a4,a0,24
	li	a3,16711680
	and	a4,a4,a3
	or	a5,a5,a4
	srli	a4,a0,40
	li	a3,65536
	addi	a3,a3,-256
	and	a4,a4,a3
	or	a5,a5,a4
	srli	a0,a0,56
	or	a0,a5,a0
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_bswap, .-caml_int64_bswap
	.section	.text.caml_int64_of_int,"ax",@progbits
	.align	1
	.globl	caml_int64_of_int
	.type	caml_int64_of_int, @function
caml_int64_of_int:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a0,a0,1
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_of_int, .-caml_int64_of_int
	.section	.text.caml_int64_to_int,"ax",@progbits
	.align	1
	.globl	caml_int64_to_int
	.type	caml_int64_to_int, @function
caml_int64_to_int:
	ld	a0,8(a0)
	slli	a0,a0,1
	addi	a0,a0,1
	ret
	.size	caml_int64_to_int, .-caml_int64_to_int
	.section	.text.caml_int64_of_float_unboxed,"ax",@progbits
	.align	1
	.globl	caml_int64_of_float_unboxed
	.type	caml_int64_of_float_unboxed, @function
caml_int64_of_float_unboxed:
	fcvt.l.d a0,fa0,rtz
	ret
	.size	caml_int64_of_float_unboxed, .-caml_int64_of_float_unboxed
	.section	.text.caml_int64_of_float,"ax",@progbits
	.align	1
	.globl	caml_int64_of_float
	.type	caml_int64_of_float, @function
caml_int64_of_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa5,0(a0)
	fcvt.l.d a0,fa5,rtz
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_of_float, .-caml_int64_of_float
	.section	.text.caml_int64_to_float_unboxed,"ax",@progbits
	.align	1
	.globl	caml_int64_to_float_unboxed
	.type	caml_int64_to_float_unboxed, @function
caml_int64_to_float_unboxed:
	fcvt.d.l	fa0,a0
	ret
	.size	caml_int64_to_float_unboxed, .-caml_int64_to_float_unboxed
	.section	.text.caml_int64_to_float,"ax",@progbits
	.align	1
	.globl	caml_int64_to_float
	.type	caml_int64_to_float, @function
caml_int64_to_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a5,8(a0)
	fcvt.d.l	fa0,a5
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_to_float, .-caml_int64_to_float
	.section	.text.caml_int64_of_int32,"ax",@progbits
	.align	1
	.globl	caml_int64_of_int32
	.type	caml_int64_of_int32, @function
caml_int64_of_int32:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,8(a0)
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_of_int32, .-caml_int64_of_int32
	.section	.text.caml_int64_to_int32,"ax",@progbits
	.align	1
	.globl	caml_int64_to_int32
	.type	caml_int64_to_int32, @function
caml_int64_to_int32:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,8(a0)
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_to_int32, .-caml_int64_to_int32
	.section	.text.caml_int64_of_nativeint,"ax",@progbits
	.align	1
	.globl	caml_int64_of_nativeint
	.type	caml_int64_of_nativeint, @function
caml_int64_of_nativeint:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_of_nativeint, .-caml_int64_of_nativeint
	.section	.text.caml_int64_compare_unboxed,"ax",@progbits
	.align	1
	.globl	caml_int64_compare_unboxed
	.type	caml_int64_compare_unboxed, @function
caml_int64_compare_unboxed:
	sgt	a5,a0,a1
	slt	a0,a0,a1
	sub	a0,a5,a0
	ret
	.size	caml_int64_compare_unboxed, .-caml_int64_compare_unboxed
	.section	.text.caml_int64_compare,"ax",@progbits
	.align	1
	.globl	caml_int64_compare
	.type	caml_int64_compare, @function
caml_int64_compare:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a1,8(a1)
	ld	a0,8(a0)
	call	caml_int64_compare_unboxed
	slli	a0,a0,1
	addi	a0,a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_compare, .-caml_int64_compare
	.section	.text.caml_int64_format,"ax",@progbits
	.align	1
	.globl	caml_int64_format
	.type	caml_int64_format, @function
caml_int64_format:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	mv	s0,a1
	mv	a2,sp
	lla	a1,.LC3
	call	parse_format
	ld	a1,8(s0)
	mv	a0,sp
	call	caml_alloc_sprintf
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_int64_format, .-caml_int64_format
	.section	.rodata.str1.8
	.align	3
.LC6:
	.string	"Int64.of_string"
	.section	.text.caml_int64_of_string,"ax",@progbits
	.align	1
	.globl	caml_int64_of_string
	.type	caml_int64_of_string, @function
caml_int64_of_string:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	sd	s4,16(sp)
	mv	s3,a0
	addi	a3,sp,12
	addi	a2,sp,4
	addi	a1,sp,8
	call	parse_sign_and_base
	mv	s4,a0
	lw	s2,8(sp)
	lbu	a0,0(a0)
	call	parse_digit
	blt	a0,zero,.L225
	mv	s1,s2
	mv	s0,a0
	ble	s2,a0,.L225
	addi	s4,s4,1
	j	.L232
.L225:
	lla	a0,.LC6
	call	caml_failwith
.L238:
	li	a5,1
	j	.L229
.L239:
	lla	a0,.LC6
	call	caml_failwith
.L227:
	addi	s4,s4,1
.L232:
	lbu	a0,0(s4)
	li	a5,95
	beq	a0,a5,.L227
	call	parse_digit
	blt	a0,zero,.L228
	ble	s2,a0,.L228
	li	a5,0
	mulhu	a4,s0,s1
	bne	a4,zero,.L238
.L229:
	bne	a5,zero,.L239
	mul	s0,s1,s0
	add	s0,s0,a0
	bleu	a0,s0,.L227
	lla	a0,.LC6
	call	caml_failwith
.L228:
	mv	a0,s3
	call	caml_string_length
	add	s3,s3,a0
	bne	s3,s4,.L240
	lw	a5,4(sp)
	beq	a5,zero,.L234
	lw	a5,12(sp)
	blt	a5,zero,.L235
	blt	s0,zero,.L241
.L234:
	lw	a5,12(sp)
	blt	a5,zero,.L242
.L236:
	mv	a0,s0
	call	caml_copy_int64
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	ld	s4,16(sp)
	addi	sp,sp,64
	jr	ra
.L240:
	lla	a0,.LC6
	call	caml_failwith
.L241:
	lla	a0,.LC6
	call	caml_failwith
.L235:
	li	a5,-1
	slli	a5,a5,63
	bleu	s0,a5,.L234
	lla	a0,.LC6
	call	caml_failwith
.L242:
	neg	s0,s0
	j	.L236
	.size	caml_int64_of_string, .-caml_int64_of_string
	.section	.text.caml_int64_bits_of_float_unboxed,"ax",@progbits
	.align	1
	.globl	caml_int64_bits_of_float_unboxed
	.type	caml_int64_bits_of_float_unboxed, @function
caml_int64_bits_of_float_unboxed:
	fmv.x.d	a0,fa0
	ret
	.size	caml_int64_bits_of_float_unboxed, .-caml_int64_bits_of_float_unboxed
	.section	.text.caml_int64_float_of_bits_unboxed,"ax",@progbits
	.align	1
	.globl	caml_int64_float_of_bits_unboxed
	.type	caml_int64_float_of_bits_unboxed, @function
caml_int64_float_of_bits_unboxed:
	fmv.d.x	fa0,a0
	ret
	.size	caml_int64_float_of_bits_unboxed, .-caml_int64_float_of_bits_unboxed
	.section	.text.caml_int64_bits_of_float,"ax",@progbits
	.align	1
	.globl	caml_int64_bits_of_float
	.type	caml_int64_bits_of_float, @function
caml_int64_bits_of_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa0,0(a0)
	call	caml_int64_bits_of_float_unboxed
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_bits_of_float, .-caml_int64_bits_of_float
	.section	.text.caml_int64_float_of_bits,"ax",@progbits
	.align	1
	.globl	caml_int64_float_of_bits
	.type	caml_int64_float_of_bits, @function
caml_int64_float_of_bits:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	call	caml_int64_float_of_bits_unboxed
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_float_of_bits, .-caml_int64_float_of_bits
	.section	.text.caml_copy_nativeint,"ax",@progbits
	.align	1
	.globl	caml_copy_nativeint
	.type	caml_copy_nativeint, @function
caml_copy_nativeint:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	li	a3,1
	li	a2,0
	li	a1,8
	lla	a0,.LANCHOR0+128
	call	caml_alloc_custom
	sd	s0,8(a0)
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_copy_nativeint, .-caml_copy_nativeint
	.section	.text.caml_int64_to_nativeint,"ax",@progbits
	.align	1
	.globl	caml_int64_to_nativeint
	.type	caml_int64_to_nativeint, @function
caml_int64_to_nativeint:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	call	caml_copy_nativeint
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_int64_to_nativeint, .-caml_int64_to_nativeint
	.section	.text.caml_nativeint_neg,"ax",@progbits
	.align	1
	.globl	caml_nativeint_neg
	.type	caml_nativeint_neg, @function
caml_nativeint_neg:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	neg	a0,a0
	call	caml_copy_nativeint
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_neg, .-caml_nativeint_neg
	.section	.text.caml_nativeint_add,"ax",@progbits
	.align	1
	.globl	caml_nativeint_add
	.type	caml_nativeint_add, @function
caml_nativeint_add:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	ld	a5,8(a1)
	add	a0,a0,a5
	call	caml_copy_nativeint
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_add, .-caml_nativeint_add
	.section	.text.caml_nativeint_sub,"ax",@progbits
	.align	1
	.globl	caml_nativeint_sub
	.type	caml_nativeint_sub, @function
caml_nativeint_sub:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	ld	a5,8(a1)
	sub	a0,a0,a5
	call	caml_copy_nativeint
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_sub, .-caml_nativeint_sub
	.section	.text.caml_nativeint_mul,"ax",@progbits
	.align	1
	.globl	caml_nativeint_mul
	.type	caml_nativeint_mul, @function
caml_nativeint_mul:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	ld	a5,8(a1)
	mul	a0,a0,a5
	call	caml_copy_nativeint
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_mul, .-caml_nativeint_mul
	.section	.text.caml_nativeint_div,"ax",@progbits
	.align	1
	.globl	caml_nativeint_div
	.type	caml_nativeint_div, @function
caml_nativeint_div:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a3,8(a0)
	ld	a4,8(a1)
	beq	a4,zero,.L267
	li	a5,-1
	slli	a5,a5,63
	bne	a3,a5,.L263
	li	a5,-1
	beq	a4,a5,.L261
.L263:
	div	a0,a3,a4
	call	caml_copy_nativeint
.L261:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L267:
	call	caml_raise_zero_divide
	.size	caml_nativeint_div, .-caml_nativeint_div
	.section	.text.caml_nativeint_mod,"ax",@progbits
	.align	1
	.globl	caml_nativeint_mod
	.type	caml_nativeint_mod, @function
caml_nativeint_mod:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	ld	a4,8(a1)
	beq	a4,zero,.L273
	li	a5,-1
	slli	a5,a5,63
	bne	a0,a5,.L270
	li	a5,-1
	beq	a4,a5,.L274
.L270:
	rem	a0,a0,a4
	call	caml_copy_nativeint
.L268:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L273:
	call	caml_raise_zero_divide
.L274:
	li	a0,0
	call	caml_copy_nativeint
	j	.L268
	.size	caml_nativeint_mod, .-caml_nativeint_mod
	.section	.text.caml_nativeint_and,"ax",@progbits
	.align	1
	.globl	caml_nativeint_and
	.type	caml_nativeint_and, @function
caml_nativeint_and:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	ld	a5,8(a1)
	and	a0,a0,a5
	call	caml_copy_nativeint
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_and, .-caml_nativeint_and
	.section	.text.caml_nativeint_or,"ax",@progbits
	.align	1
	.globl	caml_nativeint_or
	.type	caml_nativeint_or, @function
caml_nativeint_or:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	ld	a5,8(a1)
	or	a0,a0,a5
	call	caml_copy_nativeint
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_or, .-caml_nativeint_or
	.section	.text.caml_nativeint_xor,"ax",@progbits
	.align	1
	.globl	caml_nativeint_xor
	.type	caml_nativeint_xor, @function
caml_nativeint_xor:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	ld	a5,8(a1)
	xor	a0,a0,a5
	call	caml_copy_nativeint
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_xor, .-caml_nativeint_xor
	.section	.text.caml_nativeint_shift_left,"ax",@progbits
	.align	1
	.globl	caml_nativeint_shift_left
	.type	caml_nativeint_shift_left, @function
caml_nativeint_shift_left:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	srai	a1,a1,1
	sll	a0,a0,a1
	call	caml_copy_nativeint
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_shift_left, .-caml_nativeint_shift_left
	.section	.text.caml_nativeint_shift_right,"ax",@progbits
	.align	1
	.globl	caml_nativeint_shift_right
	.type	caml_nativeint_shift_right, @function
caml_nativeint_shift_right:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	srai	a1,a1,1
	sra	a0,a0,a1
	call	caml_copy_nativeint
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_shift_right, .-caml_nativeint_shift_right
	.section	.text.caml_nativeint_shift_right_unsigned,"ax",@progbits
	.align	1
	.globl	caml_nativeint_shift_right_unsigned
	.type	caml_nativeint_shift_right_unsigned, @function
caml_nativeint_shift_right_unsigned:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	srai	a1,a1,1
	srl	a0,a0,a1
	call	caml_copy_nativeint
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_shift_right_unsigned, .-caml_nativeint_shift_right_unsigned
	.section	.text.caml_nativeint_direct_bswap,"ax",@progbits
	.align	1
	.globl	caml_nativeint_direct_bswap
	.type	caml_nativeint_direct_bswap, @function
caml_nativeint_direct_bswap:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_swap64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_direct_bswap, .-caml_nativeint_direct_bswap
	.section	.text.caml_nativeint_bswap,"ax",@progbits
	.align	1
	.globl	caml_nativeint_bswap
	.type	caml_nativeint_bswap, @function
caml_nativeint_bswap:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	call	caml_swap64
	call	caml_copy_nativeint
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_bswap, .-caml_nativeint_bswap
	.section	.text.caml_nativeint_of_int,"ax",@progbits
	.align	1
	.globl	caml_nativeint_of_int
	.type	caml_nativeint_of_int, @function
caml_nativeint_of_int:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a0,a0,1
	call	caml_copy_nativeint
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_of_int, .-caml_nativeint_of_int
	.section	.text.caml_nativeint_to_int,"ax",@progbits
	.align	1
	.globl	caml_nativeint_to_int
	.type	caml_nativeint_to_int, @function
caml_nativeint_to_int:
	ld	a0,8(a0)
	slli	a0,a0,1
	addi	a0,a0,1
	ret
	.size	caml_nativeint_to_int, .-caml_nativeint_to_int
	.section	.text.caml_nativeint_of_float_unboxed,"ax",@progbits
	.align	1
	.globl	caml_nativeint_of_float_unboxed
	.type	caml_nativeint_of_float_unboxed, @function
caml_nativeint_of_float_unboxed:
	fcvt.l.d a0,fa0,rtz
	ret
	.size	caml_nativeint_of_float_unboxed, .-caml_nativeint_of_float_unboxed
	.section	.text.caml_nativeint_of_float,"ax",@progbits
	.align	1
	.globl	caml_nativeint_of_float
	.type	caml_nativeint_of_float, @function
caml_nativeint_of_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa5,0(a0)
	fcvt.l.d a0,fa5,rtz
	call	caml_copy_nativeint
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_of_float, .-caml_nativeint_of_float
	.section	.text.caml_nativeint_to_float_unboxed,"ax",@progbits
	.align	1
	.globl	caml_nativeint_to_float_unboxed
	.type	caml_nativeint_to_float_unboxed, @function
caml_nativeint_to_float_unboxed:
	fcvt.d.l	fa0,a0
	ret
	.size	caml_nativeint_to_float_unboxed, .-caml_nativeint_to_float_unboxed
	.section	.text.caml_nativeint_to_float,"ax",@progbits
	.align	1
	.globl	caml_nativeint_to_float
	.type	caml_nativeint_to_float, @function
caml_nativeint_to_float:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a5,8(a0)
	fcvt.d.l	fa0,a5
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_to_float, .-caml_nativeint_to_float
	.section	.text.caml_nativeint_of_int32,"ax",@progbits
	.align	1
	.globl	caml_nativeint_of_int32
	.type	caml_nativeint_of_int32, @function
caml_nativeint_of_int32:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,8(a0)
	call	caml_copy_nativeint
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_of_int32, .-caml_nativeint_of_int32
	.section	.text.caml_nativeint_to_int32,"ax",@progbits
	.align	1
	.globl	caml_nativeint_to_int32
	.type	caml_nativeint_to_int32, @function
caml_nativeint_to_int32:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,8(a0)
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_to_int32, .-caml_nativeint_to_int32
	.section	.text.caml_nativeint_compare_unboxed,"ax",@progbits
	.align	1
	.globl	caml_nativeint_compare_unboxed
	.type	caml_nativeint_compare_unboxed, @function
caml_nativeint_compare_unboxed:
	sgt	a5,a0,a1
	slt	a0,a0,a1
	sub	a0,a5,a0
	ret
	.size	caml_nativeint_compare_unboxed, .-caml_nativeint_compare_unboxed
	.section	.text.caml_nativeint_compare,"ax",@progbits
	.align	1
	.globl	caml_nativeint_compare
	.type	caml_nativeint_compare, @function
caml_nativeint_compare:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a1,8(a1)
	ld	a0,8(a0)
	call	caml_nativeint_compare_unboxed
	slli	a0,a0,1
	addi	a0,a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_compare, .-caml_nativeint_compare
	.section	.text.caml_nativeint_format,"ax",@progbits
	.align	1
	.globl	caml_nativeint_format
	.type	caml_nativeint_format, @function
caml_nativeint_format:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	mv	s0,a1
	mv	a2,sp
	lla	a1,.LC3
	call	parse_format
	ld	a1,8(s0)
	mv	a0,sp
	call	caml_alloc_sprintf
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_nativeint_format, .-caml_nativeint_format
	.section	.rodata.str1.8
	.align	3
.LC7:
	.string	"Nativeint.of_string"
	.section	.text.caml_nativeint_of_string,"ax",@progbits
	.align	1
	.globl	caml_nativeint_of_string
	.type	caml_nativeint_of_string, @function
caml_nativeint_of_string:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a2,.LC7
	li	a1,64
	call	parse_intnat
	call	caml_copy_nativeint
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_nativeint_of_string, .-caml_nativeint_of_string
	.globl	caml_nativeint_ops
	.section	.rodata.str1.8
	.align	3
.LC8:
	.string	"_n"
	.globl	caml_int64_ops
	.align	3
.LC9:
	.string	"_j"
	.globl	caml_int32_ops
	.align	3
.LC10:
	.string	"_i"
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	caml_int32_ops, @object
	.size	caml_int32_ops, 64
caml_int32_ops:
	.dword	.LC10
	.dword	0
	.dword	int32_cmp
	.dword	int32_hash
	.dword	int32_serialize
	.dword	int32_deserialize
	.dword	0
	.dword	int32_length
	.type	caml_int64_ops, @object
	.size	caml_int64_ops, 64
caml_int64_ops:
	.dword	.LC9
	.dword	0
	.dword	int64_cmp
	.dword	int64_hash
	.dword	int64_serialize
	.dword	int64_deserialize
	.dword	0
	.dword	int64_length
	.type	caml_nativeint_ops, @object
	.size	caml_nativeint_ops, 64
caml_nativeint_ops:
	.dword	.LC8
	.dword	0
	.dword	nativeint_cmp
	.dword	nativeint_hash
	.dword	nativeint_serialize
	.dword	nativeint_deserialize
	.dword	0
	.dword	nativeint_length
	.section	.rodata
	.align	3
	.type	nativeint_length, @object
	.size	nativeint_length, 16
nativeint_length:
	.dword	4
	.dword	8
	.type	int64_length, @object
	.size	int64_length, 16
int64_length:
	.dword	8
	.dword	8
	.type	int32_length, @object
	.size	int32_length, 16
int32_length:
	.dword	4
	.dword	4
	.ident	"GCC: (GNU) 9.2.0"
