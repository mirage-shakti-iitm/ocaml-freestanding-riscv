	.file	"lexing.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.run_mem,"ax",@progbits
	.align	1
	.type	run_mem, @function
run_mem:
	j	.L2
.L4:
	slli	a5,a5,3
	add	a5,a5,a1
	slli	a4,a4,3
	add	a4,a4,a1
	ld	a4,0(a4)
	sd	a4,0(a5)
.L5:
	mv	a0,a3
.L2:
	lbu	a5,0(a0)
	li	a4,255
	beq	a5,a4,.L6
	addi	a3,a0,2
	lbu	a4,1(a0)
	li	a0,255
	bne	a4,a0,.L4
	slli	a5,a5,3
	add	a5,a5,a1
	sd	a2,0(a5)
	j	.L5
.L6:
	ret
	.size	run_mem, .-run_mem
	.section	.text.run_tag,"ax",@progbits
	.align	1
	.type	run_tag, @function
run_tag:
	j	.L8
.L10:
	slli	a5,a5,3
	add	a5,a5,a1
	slli	a4,a4,3
	add	a4,a4,a1
	ld	a4,0(a4)
	sd	a4,0(a5)
.L11:
	mv	a0,a3
.L8:
	lbu	a5,0(a0)
	li	a4,255
	beq	a5,a4,.L12
	addi	a3,a0,2
	lbu	a4,1(a0)
	li	a2,255
	bne	a4,a2,.L10
	slli	a5,a5,3
	add	a5,a5,a1
	li	a4,-1
	sd	a4,0(a5)
	j	.L11
.L12:
	ret
	.size	run_tag, .-run_tag
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"lexing: empty token"
	.section	.text.caml_lex_engine,"ax",@progbits
	.align	1
	.globl	caml_lex_engine
	.type	caml_lex_engine, @function
caml_lex_engine:
	srai	a1,a1,1
	sext.w	a3,a1
	slli	a5,a1,32
	blt	a5,zero,.L14
	ld	a5,40(a2)
	sd	a5,32(a2)
	sd	a5,48(a2)
	li	a5,-1
	sd	a5,56(a2)
	j	.L15
.L14:
	not	a3,a3
	j	.L15
.L33:
	not	a0,a5
	slli	a0,a0,1
	addi	a0,a0,1
	ret
.L34:
	not	a0,a3
	slli	a0,a0,1
	addi	a0,a0,1
	ret
.L20:
	srai	a6,a4,1
	ld	a7,8(a2)
	add	a6,a6,a7
	lbu	a6,0(a6)
	addi	a4,a4,2
	sd	a4,40(a2)
.L21:
	addw	a5,a6,a5
	slli	a5,a5,1
	ld	a4,32(a0)
	add	a4,a4,a5
	lh	a4,0(a4)
	beq	a4,a3,.L30
	ld	a5,16(a0)
	add	a1,a5,a1
	lh	a3,0(a1)
.L23:
	blt	a3,zero,.L31
	li	a5,256
	beq	a6,a5,.L32
.L15:
	slli	a1,a3,1
	ld	a5,0(a0)
	add	a5,a5,a1
	lh	a5,0(a5)
	blt	a5,zero,.L33
	ld	a4,8(a0)
	add	a4,a4,a1
	lh	a4,0(a4)
	blt	a4,zero,.L19
	ld	a6,40(a2)
	sd	a6,48(a2)
	slli	a4,a4,1
	addi	a4,a4,1
	sd	a4,56(a2)
.L19:
	ld	a4,40(a2)
	ld	a6,16(a2)
	blt	a4,a6,.L20
	ld	a6,64(a2)
	li	a4,1
	beq	a6,a4,.L34
	li	a6,256
	j	.L21
.L30:
	ld	a4,24(a0)
	add	a5,a4,a5
	lh	a3,0(a5)
	j	.L23
.L31:
	ld	a5,48(a2)
	sd	a5,40(a2)
	ld	a0,56(a2)
	li	a5,-1
	beq	a0,a5,.L35
	ret
.L35:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,.LC0
	call	caml_failwith
.L32:
	li	a5,1
	sd	a5,64(a2)
	j	.L15
	.size	caml_lex_engine, .-caml_lex_engine
	.section	.text.caml_new_lex_engine,"ax",@progbits
	.align	1
	.globl	caml_new_lex_engine
	.type	caml_new_lex_engine, @function
caml_new_lex_engine:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	sd	s4,16(sp)
	sd	s5,8(sp)
	mv	s0,a0
	mv	s2,a2
	srai	a1,a1,1
	sext.w	s4,a1
	slli	a5,a1,32
	blt	a5,zero,.L37
	ld	a5,40(a2)
	sd	a5,32(a2)
	sd	a5,48(a2)
	li	a5,-1
	sd	a5,56(a2)
	j	.L39
.L37:
	not	s4,s4
	sext.w	s4,s4
	j	.L39
.L59:
	ld	a5,40(s0)
	add	s3,a5,s3
	lh	a0,0(s3)
	ld	a5,80(s0)
	ld	a1,72(s2)
	add	a0,a0,a5
	call	run_tag
	not	a0,s1
	slli	a0,a0,1
	addi	a0,a0,1
.L36:
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	ld	s4,16(sp)
	ld	s5,8(sp)
	addi	sp,sp,64
	jr	ra
.L60:
	ld	a5,48(s0)
	add	a5,a5,s3
	lh	a0,0(a5)
	ld	a5,80(s0)
	ld	a1,72(s2)
	add	a0,a0,a5
	call	run_tag
	ld	a5,40(s2)
	sd	a5,48(s2)
	slli	s5,s5,1
	addi	s5,s5,1
	sd	s5,56(s2)
	j	.L42
.L61:
	not	a0,s4
	sext.w	a0,a0
	slli	a0,a0,1
	addi	a0,a0,1
	j	.L36
.L43:
	srai	a4,a5,1
	ld	a3,8(s2)
	add	a4,a4,a3
	lbu	s5,0(a4)
	addi	a5,a5,2
	sd	a5,40(s2)
.L44:
	addw	s1,s5,s1
	slli	s1,s1,1
	ld	a5,32(s0)
	add	a5,a5,s1
	lh	a5,0(a5)
	beq	a5,s4,.L54
	ld	a5,16(s0)
	add	a5,a5,s3
	lh	s1,0(a5)
.L46:
	blt	s1,zero,.L55
	ld	a5,40(s0)
	add	a5,a5,s3
	lh	a5,0(a5)
	addw	a5,s5,a5
	slli	a5,a5,1
	ld	a4,72(s0)
	add	a4,a4,a5
	lh	a4,0(a4)
	beq	a4,s4,.L56
	ld	a5,56(s0)
	add	s3,a5,s3
	lh	a5,0(s3)
.L49:
	bgt	a5,zero,.L57
.L50:
	li	a5,256
	beq	s5,a5,.L58
.L51:
	mv	s4,s1
.L39:
	slli	s3,s4,1
	ld	a5,0(s0)
	add	a5,a5,s3
	lh	s1,0(a5)
	blt	s1,zero,.L59
	ld	a5,8(s0)
	add	a5,a5,s3
	lh	s5,0(a5)
	bge	s5,zero,.L60
.L42:
	ld	a5,40(s2)
	ld	a4,16(s2)
	blt	a5,a4,.L43
	ld	a4,64(s2)
	li	a5,1
	beq	a4,a5,.L61
	li	s5,256
	j	.L44
.L54:
	ld	a5,24(s0)
	add	s1,a5,s1
	lh	s1,0(s1)
	j	.L46
.L55:
	ld	a5,48(s2)
	sd	a5,40(s2)
	ld	a0,56(s2)
	li	a5,-1
	bne	a0,a5,.L36
	lla	a0,.LC0
	call	caml_failwith
.L56:
	ld	a4,64(s0)
	add	a5,a4,a5
	lh	a5,0(a5)
	j	.L49
.L57:
	ld	a0,80(s0)
	ld	a2,40(s2)
	ld	a1,72(s2)
	add	a0,a5,a0
	call	run_mem
	j	.L50
.L58:
	li	a5,1
	sd	a5,64(s2)
	j	.L51
	.size	caml_new_lex_engine, .-caml_new_lex_engine
	.ident	"GCC: (GNU) 9.2.0"
