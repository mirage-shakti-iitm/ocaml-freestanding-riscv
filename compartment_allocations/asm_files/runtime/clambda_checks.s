	.file	"clambda_checks.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"NULL is not a closure: %s\n"
	.align	3
.LC1:
	.string	"Expecting a closure, got a non-boxed value %p: %s\n"
	.align	3
.LC2:
	.string	"Expecting a closure, got a boxed value with tag %i: %s\n"
	.section	.text.caml_check_value_is_closure,"ax",@progbits
	.align	1
	.globl	caml_check_value_is_closure
	.type	caml_check_value_is_closure, @function
caml_check_value_is_closure:
	addi	sp,sp,-16
	sd	ra,8(sp)
	beq	a0,zero,.L6
	andi	a5,a0,1
	bne	a5,zero,.L7
	lbu	a2,-8(a0)
	li	a5,247
	beq	a2,a5,.L4
	li	a5,249
	bne	a2,a5,.L8
.L4:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L6:
	mv	a2,a1
	lla	a1,.LC0
	ld	a0,stderr
	call	fprintf
	call	abort
.L7:
	mv	a3,a1
	mv	a2,a0
	lla	a1,.LC1
	ld	a0,stderr
	call	fprintf
	call	abort
.L8:
	mv	a3,a1
	lla	a1,.LC2
	ld	a0,stderr
	call	fprintf
	call	abort
	.size	caml_check_value_is_closure, .-caml_check_value_is_closure
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"Access to field %lu of NULL: %s\n"
	.align	3
.LC4:
	.string	"Access to field %lu of non-boxed value %p is illegal: %s\n"
	.align	3
.LC5:
	.string	"Access to field %lu of value %p of size %lu is illegal: %s\n"
	.section	.text.caml_check_field_access,"ax",@progbits
	.align	1
	.globl	caml_check_field_access
	.type	caml_check_field_access, @function
caml_check_field_access:
	addi	sp,sp,-16
	sd	ra,8(sp)
	beq	a0,zero,.L16
	andi	a5,a0,1
	bne	a5,zero,.L17
	lbu	a4,-8(a0)
	li	a5,249
	beq	a4,a5,.L18
	mv	a3,a0
.L12:
	srai	a1,a1,1
	ld	a6,-8(a3)
	srli	a6,a6,10
	bgeu	a1,a6,.L19
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L16:
	mv	a3,a2
	srai	a2,a1,1
	lla	a1,.LC3
	ld	a0,stderr
	call	fprintf
	call	abort
.L17:
	mv	a4,a2
	mv	a3,a0
	srai	a2,a1,1
	lla	a1,.LC4
	ld	a0,stderr
	call	fprintf
	call	abort
.L18:
	ld	a5,-8(a0)
	srli	a5,a5,10
	slli	a3,a5,3
	sub	a3,a0,a3
	add	a1,a1,a5
	j	.L12
.L19:
	mv	a5,a2
	mv	a4,a6
	mv	a2,a1
	lla	a1,.LC5
	ld	a0,stderr
	call	fprintf
	call	abort
	.size	caml_check_field_access, .-caml_check_field_access
	.ident	"GCC: (GNU) 9.2.0"
