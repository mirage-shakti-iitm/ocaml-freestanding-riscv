	.file	"str.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.caml_string_length,"ax",@progbits
	.align	1
	.globl	caml_string_length
	.type	caml_string_length, @function
caml_string_length:
	ld	a5,-8(a0)
	srli	a5,a5,10
	slli	a5,a5,3
	addi	a5,a5,-1
	add	a0,a0,a5
	lbu	a0,0(a0)
	sub	a0,a5,a0
	ret
	.size	caml_string_length, .-caml_string_length
	.section	.text.caml_ml_string_length,"ax",@progbits
	.align	1
	.globl	caml_ml_string_length
	.type	caml_ml_string_length, @function
caml_ml_string_length:
	ld	a5,-8(a0)
	srli	a5,a5,10
	slli	a5,a5,3
	addi	a5,a5,-1
	add	a0,a0,a5
	lbu	a0,0(a0)
	sub	a0,a5,a0
	slli	a0,a0,1
	addi	a0,a0,1
	ret
	.size	caml_ml_string_length, .-caml_ml_string_length
	.section	.text.caml_ml_bytes_length,"ax",@progbits
	.align	1
	.globl	caml_ml_bytes_length
	.type	caml_ml_bytes_length, @function
caml_ml_bytes_length:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_ml_string_length
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ml_bytes_length, .-caml_ml_bytes_length
	.section	.text.caml_string_is_c_safe,"ax",@progbits
	.align	1
	.globl	caml_string_is_c_safe
	.type	caml_string_is_c_safe, @function
caml_string_is_c_safe:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a0
	call	strlen
	mv	s0,a0
	mv	a0,s1
	call	caml_string_length
	sub	a0,s0,a0
	seqz	a0,a0
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_string_is_c_safe, .-caml_string_is_c_safe
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"String.create"
	.section	.text.caml_create_string,"ax",@progbits
	.align	1
	.globl	caml_create_string
	.type	caml_create_string, @function
caml_create_string:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a0,a0,1
	li	a5,-1025
	srli	a5,a5,7
	bgtu	a0,a5,.L10
	call	caml_alloc_string
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L10:
	lla	a0,.LC0
	call	caml_invalid_argument
	.size	caml_create_string, .-caml_create_string
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"Bytes.create"
	.section	.text.caml_create_bytes,"ax",@progbits
	.align	1
	.globl	caml_create_bytes
	.type	caml_create_bytes, @function
caml_create_bytes:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a0,a0,1
	li	a5,-1025
	srli	a5,a5,7
	bgtu	a0,a5,.L14
	call	caml_alloc_string
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L14:
	lla	a0,.LC1
	call	caml_invalid_argument
	.size	caml_create_bytes, .-caml_create_bytes
	.section	.text.caml_string_get,"ax",@progbits
	.align	1
	.globl	caml_string_get
	.type	caml_string_get, @function
caml_string_get:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	blt	a1,zero,.L16
	mv	s0,a0
	srai	s1,a1,1
	call	caml_string_length
	bleu	a0,s1,.L16
	add	s0,s0,s1
	lbu	a0,0(s0)
	slli	a0,a0,1
	addi	a0,a0,1
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L16:
	call	caml_array_bound_error
	.size	caml_string_get, .-caml_string_get
	.section	.text.caml_bytes_get,"ax",@progbits
	.align	1
	.globl	caml_bytes_get
	.type	caml_bytes_get, @function
caml_bytes_get:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_string_get
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_bytes_get, .-caml_bytes_get
	.section	.text.caml_bytes_set,"ax",@progbits
	.align	1
	.globl	caml_bytes_set
	.type	caml_bytes_set, @function
caml_bytes_set:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	blt	a1,zero,.L22
	mv	s0,a0
	mv	s1,a2
	srai	s2,a1,1
	call	caml_string_length
	bleu	a0,s2,.L22
	srai	a2,s1,1
	add	s0,s0,s2
	sb	a2,0(s0)
	li	a0,1
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L22:
	call	caml_array_bound_error
	.size	caml_bytes_set, .-caml_bytes_set
	.section	.text.caml_string_set,"ax",@progbits
	.align	1
	.globl	caml_string_set
	.type	caml_string_set, @function
caml_string_set:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_bytes_set
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_string_set, .-caml_string_set
	.section	.text.caml_string_get16,"ax",@progbits
	.align	1
	.globl	caml_string_get16
	.type	caml_string_get16, @function
caml_string_get16:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	blt	a1,zero,.L28
	mv	s1,a0
	srai	s0,a1,1
	addi	s2,s0,1
	call	caml_string_length
	bgeu	s2,a0,.L28
	add	s0,s0,s1
	lbu	a5,0(s0)
	lbu	a0,1(s0)
	slli	a0,a0,8
	or	a0,a0,a5
	slli	a0,a0,1
	addi	a0,a0,1
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L28:
	call	caml_array_bound_error
	.size	caml_string_get16, .-caml_string_get16
	.section	.text.caml_bytes_get16,"ax",@progbits
	.align	1
	.globl	caml_bytes_get16
	.type	caml_bytes_get16, @function
caml_bytes_get16:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_string_get16
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_bytes_get16, .-caml_bytes_get16
	.section	.text.caml_string_get32,"ax",@progbits
	.align	1
	.globl	caml_string_get32
	.type	caml_string_get32, @function
caml_string_get32:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	blt	a1,zero,.L34
	mv	s1,a0
	srai	s0,a1,1
	addi	s2,s0,3
	call	caml_string_length
	bgeu	s2,a0,.L34
	add	a5,s0,s1
	lbu	a4,1(a5)
	lbu	a3,2(a5)
	lbu	a0,3(a5)
	slliw	a0,a0,24
	slli	a3,a3,16
	or	a0,a0,a3
	slli	a4,a4,8
	or	a0,a0,a4
	lbu	a5,0(a5)
	or	a0,a0,a5
	sext.w	a0,a0
	call	caml_copy_int32
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L34:
	call	caml_array_bound_error
	.size	caml_string_get32, .-caml_string_get32
	.section	.text.caml_bytes_get32,"ax",@progbits
	.align	1
	.globl	caml_bytes_get32
	.type	caml_bytes_get32, @function
caml_bytes_get32:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_string_get32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_bytes_get32, .-caml_bytes_get32
	.section	.text.caml_string_get64,"ax",@progbits
	.align	1
	.globl	caml_string_get64
	.type	caml_string_get64, @function
caml_string_get64:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	blt	a1,zero,.L40
	mv	s1,a0
	srai	s0,a1,1
	addi	s2,s0,7
	call	caml_string_length
	bgeu	s2,a0,.L40
	add	a3,s0,s1
	lbu	a0,0(a3)
	lbu	a2,1(a3)
	lbu	a1,2(a3)
	lbu	a6,3(a3)
	lbu	a7,4(a3)
	lbu	a5,5(a3)
	lbu	t1,6(a3)
	lbu	a4,7(a3)
	slli	a4,a4,56
	slli	a3,t1,48
	or	a4,a4,a3
	slli	a5,a5,40
	or	a5,a4,a5
	slli	a4,a7,32
	or	a5,a5,a4
	slli	a4,a6,24
	or	a5,a5,a4
	slli	a4,a1,16
	or	a5,a5,a4
	slli	a4,a2,8
	or	a5,a5,a4
	or	a0,a5,a0
	call	caml_copy_int64
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L40:
	call	caml_array_bound_error
	.size	caml_string_get64, .-caml_string_get64
	.section	.text.caml_bytes_get64,"ax",@progbits
	.align	1
	.globl	caml_bytes_get64
	.type	caml_bytes_get64, @function
caml_bytes_get64:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_string_get64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_bytes_get64, .-caml_bytes_get64
	.section	.text.caml_bytes_set16,"ax",@progbits
	.align	1
	.globl	caml_bytes_set16
	.type	caml_bytes_set16, @function
caml_bytes_set16:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	blt	a1,zero,.L46
	mv	s2,a0
	mv	s0,a2
	srai	s1,a1,1
	addi	s3,s1,1
	call	caml_string_length
	bgeu	s3,a0,.L46
	srai	a5,s0,1
	srai	s0,s0,9
	add	s1,s1,s2
	sb	a5,0(s1)
	sb	s0,1(s1)
	li	a0,1
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L46:
	call	caml_array_bound_error
	.size	caml_bytes_set16, .-caml_bytes_set16
	.section	.text.caml_bytes_set32,"ax",@progbits
	.align	1
	.globl	caml_bytes_set32
	.type	caml_bytes_set32, @function
caml_bytes_set32:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	blt	a1,zero,.L50
	mv	s1,a0
	mv	s2,a2
	srai	s0,a1,1
	addi	s3,s0,3
	call	caml_string_length
	bgeu	s3,a0,.L50
	lw	a5,8(s2)
	srliw	a4,a5,24
	srai	a3,a5,16
	srai	a2,a5,8
	add	a0,s0,s1
	sb	a5,0(a0)
	sb	a2,1(a0)
	sb	a3,2(a0)
	sb	a4,3(a0)
	li	a0,1
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L50:
	call	caml_array_bound_error
	.size	caml_bytes_set32, .-caml_bytes_set32
	.section	.text.caml_bytes_set64,"ax",@progbits
	.align	1
	.globl	caml_bytes_set64
	.type	caml_bytes_set64, @function
caml_bytes_set64:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	blt	a1,zero,.L54
	mv	s1,a0
	mv	s2,a2
	srai	s0,a1,1
	addi	s3,s0,7
	call	caml_string_length
	bgeu	s3,a0,.L54
	ld	a5,8(s2)
	srli	a4,a5,56
	srai	a3,a5,48
	srai	a2,a5,40
	srai	a1,a5,32
	srliw	a6,a5,24
	srai	a7,a5,16
	srai	t1,a5,8
	add	a0,s0,s1
	sb	a5,0(a0)
	sb	t1,1(a0)
	sb	a7,2(a0)
	sb	a6,3(a0)
	sb	a1,4(a0)
	sb	a2,5(a0)
	sb	a3,6(a0)
	sb	a4,7(a0)
	li	a0,1
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L54:
	call	caml_array_bound_error
	.size	caml_bytes_set64, .-caml_bytes_set64
	.section	.text.caml_string_equal,"ax",@progbits
	.align	1
	.globl	caml_string_equal
	.type	caml_string_equal, @function
caml_string_equal:
	beq	a0,a1,.L61
	ld	a5,-8(a0)
	srli	a5,a5,10
	ld	a4,-8(a1)
	srli	a4,a4,10
	bne	a5,a4,.L62
.L59:
	beq	a5,zero,.L64
	ld	a3,0(a0)
	ld	a4,0(a1)
	bne	a3,a4,.L63
	addi	a5,a5,-1
	addi	a0,a0,8
	addi	a1,a1,8
	j	.L59
.L64:
	li	a0,3
	ret
.L61:
	li	a0,3
	ret
.L62:
	li	a0,1
	ret
.L63:
	li	a0,1
	ret
	.size	caml_string_equal, .-caml_string_equal
	.section	.text.caml_bytes_equal,"ax",@progbits
	.align	1
	.globl	caml_bytes_equal
	.type	caml_bytes_equal, @function
caml_bytes_equal:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_string_equal
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_bytes_equal, .-caml_bytes_equal
	.section	.text.caml_string_notequal,"ax",@progbits
	.align	1
	.globl	caml_string_notequal
	.type	caml_string_notequal, @function
caml_string_notequal:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_string_equal
	li	a5,4
	sub	a0,a5,a0
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_string_notequal, .-caml_string_notequal
	.section	.text.caml_bytes_notequal,"ax",@progbits
	.align	1
	.globl	caml_bytes_notequal
	.type	caml_bytes_notequal, @function
caml_bytes_notequal:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_string_notequal
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_bytes_notequal, .-caml_bytes_notequal
	.section	.text.caml_string_compare,"ax",@progbits
	.align	1
	.globl	caml_string_compare
	.type	caml_string_compare, @function
caml_string_compare:
	beq	a0,a1,.L75
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	mv	s0,a0
	mv	s1,a1
	call	caml_string_length
	mv	s2,a0
	mv	a0,s1
	call	caml_string_length
	mv	s3,a0
	mv	a2,s2
	bleu	s2,a0,.L74
	mv	a2,a0
.L74:
	mv	a1,s1
	mv	a0,s0
	call	memcmp
	blt	a0,zero,.L76
	bgt	a0,zero,.L77
	bltu	s2,s3,.L78
	bgtu	s2,s3,.L79
	li	a0,1
.L71:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L75:
	li	a0,1
	ret
.L76:
	li	a0,-1
	j	.L71
.L77:
	li	a0,3
	j	.L71
.L78:
	li	a0,-1
	j	.L71
.L79:
	li	a0,3
	j	.L71
	.size	caml_string_compare, .-caml_string_compare
	.section	.text.caml_bytes_compare,"ax",@progbits
	.align	1
	.globl	caml_bytes_compare
	.type	caml_bytes_compare, @function
caml_bytes_compare:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_string_compare
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_bytes_compare, .-caml_bytes_compare
	.section	.text.caml_string_lessthan,"ax",@progbits
	.align	1
	.globl	caml_string_lessthan
	.type	caml_string_lessthan, @function
caml_string_lessthan:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_string_compare
	ble	a0,zero,.L90
	li	a0,1
.L86:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L90:
	li	a0,3
	j	.L86
	.size	caml_string_lessthan, .-caml_string_lessthan
	.section	.text.caml_bytes_lessthan,"ax",@progbits
	.align	1
	.globl	caml_bytes_lessthan
	.type	caml_bytes_lessthan, @function
caml_bytes_lessthan:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_string_lessthan
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_bytes_lessthan, .-caml_bytes_lessthan
	.section	.text.caml_string_lessequal,"ax",@progbits
	.align	1
	.globl	caml_string_lessequal
	.type	caml_string_lessequal, @function
caml_string_lessequal:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_string_compare
	li	a5,1
	ble	a0,a5,.L97
	li	a0,1
.L93:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L97:
	li	a0,3
	j	.L93
	.size	caml_string_lessequal, .-caml_string_lessequal
	.section	.text.caml_bytes_lessequal,"ax",@progbits
	.align	1
	.globl	caml_bytes_lessequal
	.type	caml_bytes_lessequal, @function
caml_bytes_lessequal:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_string_lessequal
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_bytes_lessequal, .-caml_bytes_lessequal
	.section	.text.caml_string_greaterthan,"ax",@progbits
	.align	1
	.globl	caml_string_greaterthan
	.type	caml_string_greaterthan, @function
caml_string_greaterthan:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_string_compare
	li	a5,1
	bgt	a0,a5,.L104
	li	a0,1
.L100:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L104:
	li	a0,3
	j	.L100
	.size	caml_string_greaterthan, .-caml_string_greaterthan
	.section	.text.caml_bytes_greaterthan,"ax",@progbits
	.align	1
	.globl	caml_bytes_greaterthan
	.type	caml_bytes_greaterthan, @function
caml_bytes_greaterthan:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_string_greaterthan
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_bytes_greaterthan, .-caml_bytes_greaterthan
	.section	.text.caml_string_greaterequal,"ax",@progbits
	.align	1
	.globl	caml_string_greaterequal
	.type	caml_string_greaterequal, @function
caml_string_greaterequal:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_string_compare
	bgt	a0,zero,.L111
	li	a0,1
.L107:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L111:
	li	a0,3
	j	.L107
	.size	caml_string_greaterequal, .-caml_string_greaterequal
	.section	.text.caml_bytes_greaterequal,"ax",@progbits
	.align	1
	.globl	caml_bytes_greaterequal
	.type	caml_bytes_greaterequal, @function
caml_bytes_greaterequal:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_string_greaterequal
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_bytes_greaterequal, .-caml_bytes_greaterequal
	.section	.text.caml_blit_bytes,"ax",@progbits
	.align	1
	.globl	caml_blit_bytes
	.type	caml_blit_bytes, @function
caml_blit_bytes:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a5,a2
	srai	a3,a3,1
	srai	a1,a1,1
	srai	a2,a4,1
	add	a1,a1,a0
	add	a0,a3,a5
	call	memmove
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_blit_bytes, .-caml_blit_bytes
	.section	.text.caml_blit_string,"ax",@progbits
	.align	1
	.globl	caml_blit_string
	.type	caml_blit_string, @function
caml_blit_string:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_blit_bytes
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_blit_string, .-caml_blit_string
	.section	.text.caml_fill_bytes,"ax",@progbits
	.align	1
	.globl	caml_fill_bytes
	.type	caml_fill_bytes, @function
caml_fill_bytes:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a5,a1,1
	srai	a1,a3,1
	srai	a2,a2,1
	sext.w	a1,a1
	add	a0,a5,a0
	call	memset
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_fill_bytes, .-caml_fill_bytes
	.section	.text.caml_fill_string,"ax",@progbits
	.align	1
	.globl	caml_fill_string
	.type	caml_fill_string, @function
caml_fill_string:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_fill_bytes
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_fill_string, .-caml_fill_string
	.section	.text.caml_alloc_sprintf,"ax",@progbits
	.align	1
	.globl	caml_alloc_sprintf
	.type	caml_alloc_sprintf, @function
caml_alloc_sprintf:
	addi	sp,sp,-240
	sd	ra,168(sp)
	sd	s0,160(sp)
	sd	s1,152(sp)
	sd	s2,144(sp)
	mv	s1,a0
	sd	a1,184(sp)
	sd	a2,192(sp)
	sd	a3,200(sp)
	sd	a4,208(sp)
	sd	a5,216(sp)
	sd	a6,224(sp)
	sd	a7,232(sp)
	addi	a3,sp,184
	sd	a3,136(sp)
	mv	a2,a0
	li	a1,128
	addi	a0,sp,8
	call	vsnprintf
	mv	s0,a0
	sext.w	a4,a0
	li	a5,127
	bgtu	a4,a5,.L123
	addi	a1,sp,8
	call	caml_alloc_initialized_string
	mv	s1,a0
.L122:
	mv	a0,s1
	ld	ra,168(sp)
	ld	s0,160(sp)
	ld	s1,152(sp)
	ld	s2,144(sp)
	addi	sp,sp,240
	jr	ra
.L123:
	mv	a0,s1
	call	caml_stat_strdup
	mv	s2,a0
	mv	a0,s0
	call	caml_alloc_string
	mv	s1,a0
	addi	a3,sp,184
	sd	a3,136(sp)
	mv	a2,s2
	addiw	a1,s0,1
	call	vsnprintf
	mv	a0,s2
	call	caml_stat_free
	j	.L122
	.size	caml_alloc_sprintf, .-caml_alloc_sprintf
	.section	.text.caml_string_of_bytes,"ax",@progbits
	.align	1
	.globl	caml_string_of_bytes
	.type	caml_string_of_bytes, @function
caml_string_of_bytes:
	ret
	.size	caml_string_of_bytes, .-caml_string_of_bytes
	.section	.text.caml_bytes_of_string,"ax",@progbits
	.align	1
	.globl	caml_bytes_of_string
	.type	caml_bytes_of_string, @function
caml_bytes_of_string:
	ret
	.size	caml_bytes_of_string, .-caml_bytes_of_string
	.ident	"GCC: (GNU) 9.2.0"
