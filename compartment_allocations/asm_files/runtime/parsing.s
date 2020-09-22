	.file	"parsing.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"<unknown token>"
	.section	.text.token_name,"ax",@progbits
	.align	1
	.type	token_name, @function
token_name:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	mv	s1,a1
.L2:
	ble	s1,zero,.L3
	lbu	a5,0(s0)
	beq	a5,zero,.L5
	mv	a0,s0
	call	strlen
	addi	a0,a0,1
	add	s0,s0,a0
	addiw	s1,s1,-1
	j	.L2
.L5:
	lla	s0,.LC0
.L3:
	mv	a0,s0
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	token_name, .-token_name
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"State %d: read token %s\n"
	.align	3
.LC2:
	.string	"State %d: read token %s("
	.align	3
.LC3:
	.string	"%ld"
	.align	3
.LC4:
	.string	"%g"
	.align	3
.LC5:
	.string	")\n"
	.section	.text.print_token,"ax",@progbits
	.align	1
	.type	print_token, @function
print_token:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a1
	mv	s0,a2
	andi	a5,a2,1
	beq	a5,zero,.L8
	srai	s0,a2,1
	sext.w	a1,s0
	ld	a0,112(a0)
	call	token_name
	mv	a3,a0
	mv	a2,s1
	lla	a1,.LC1
	ld	a0,stderr
	call	fprintf
.L7:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L8:
	lbu	a1,-8(a2)
	ld	a0,120(a0)
	call	token_name
	mv	a3,a0
	mv	a2,s1
	lla	a1,.LC2
	ld	a0,stderr
	call	fprintf
	ld	a0,0(s0)
	andi	a5,a0,1
	bne	a5,zero,.L15
	lbu	a5,-8(a0)
	li	a4,252
	beq	a5,a4,.L16
	li	a4,253
	beq	a5,a4,.L17
	ld	a1,stderr
	li	a0,95
	call	fputc
.L11:
	ld	a3,stderr
	li	a2,2
	li	a1,1
	lla	a0,.LC5
	call	fwrite
	j	.L7
.L15:
	srai	a2,a0,1
	lla	a1,.LC3
	ld	a0,stderr
	call	fprintf
	j	.L11
.L16:
	ld	a1,stderr
	call	fputs
	j	.L11
.L17:
	ld	a2,0(a0)
	lla	a1,.LC4
	ld	a0,stderr
	call	fprintf
	j	.L11
	.size	print_token, .-print_token
	.section	.rodata.str1.8
	.align	3
.LC6:
	.string	"Recovering in state %d\n"
	.align	3
.LC7:
	.string	"Discarding state %d\n"
	.align	3
.LC8:
	.string	"No more states to discard\n"
	.align	3
.LC9:
	.string	"Discarding last token read\n"
	.align	3
.LC10:
	.string	"State %d: shift to state %d\n"
	.align	3
.LC11:
	.string	"State %d: reduce by rule %d\n"
	.section	.text.caml_parse_engine,"ax",@progbits
	.align	1
	.globl	caml_parse_engine
	.type	caml_parse_engine, @function
caml_parse_engine:
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
	srai	a2,a2,1
	sext.w	s2,a2
	li	a5,5
	bgtu	s2,a5,.L52
	mv	s3,a0
	mv	s0,a1
	mv	s5,a3
	slli	a4,s2,2
	lla	a3,.L21
	add	a4,a4,a3
	lw	a5,0(a4)
	add	a5,a5,a3
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L21:
	.word	.L26-.L21
	.word	.L25-.L21
	.word	.L24-.L21
	.word	.L23-.L21
	.word	.L22-.L21
	.word	.L20-.L21
	.section	.text.caml_parse_engine
.L26:
	ld	s1,104(a1)
	srai	s1,s1,1
	sext.w	s1,s1
	mv	s4,s2
	j	.L27
.L25:
	ld	s1,104(a1)
	srai	s1,s1,1
	sext.w	s1,s1
	ld	s2,112(a1)
	srai	s2,s2,1
	sext.w	s2,s2
	ld	s4,120(a1)
	srai	s4,s4,1
	sext.w	s4,s4
	andi	a5,s5,1
	bne	a5,zero,.L30
	lbu	a5,-8(s5)
	ld	a4,16(a0)
	slli	a5,a5,3
	add	a5,a5,a4
	ld	a5,0(a5)
	sd	a5,48(a1)
	ld	a1,0(s5)
	addi	a0,s0,56
	call	caml_modify
.L31:
	lw	a5,caml_parser_trace
	bne	a5,zero,.L55
.L29:
	ld	a5,56(s3)
	mv	a2,s2
	slli	a3,s2,1
	add	a5,a5,a3
	lh	a4,0(a5)
	ld	s5,48(s0)
	srai	s5,s5,1
	sext.w	a1,s5
	addw	s5,s5,a4
	beq	a4,zero,.L32
	blt	s5,zero,.L32
	ld	a5,80(s3)
	srai	a5,a5,1
	sext.w	a5,a5
	blt	a5,s5,.L32
	ld	a5,96(s3)
	slli	a4,s5,1
	add	a5,a5,a4
	lh	a5,0(a5)
	beq	a1,a5,.L56
.L32:
	ld	a5,64(s3)
	add	a5,a5,a3
	lh	a5,0(a5)
	addw	a4,a1,a5
	beq	a5,zero,.L35
	blt	a4,zero,.L35
	ld	a5,80(s3)
	srai	a5,a5,1
	sext.w	a5,a5
	blt	a5,a4,.L35
	ld	a5,96(s3)
	slli	a4,a4,1
	add	a5,a5,a4
	lh	a5,0(a5)
	beq	a1,a5,.L57
.L35:
	bgt	s4,zero,.L36
	slli	s1,s1,1
	addi	s1,s1,1
	sd	s1,104(s0)
	slli	a2,a2,1
	addi	a2,a2,1
	sd	a2,112(s0)
	slli	s4,s4,1
	addi	s4,s4,1
	sd	s4,120(s0)
	li	a0,11
	j	.L18
.L30:
	srai	a5,s5,1
	sext.w	a5,a5
	ld	a4,8(a0)
	slli	a5,a5,3
	add	a5,a5,a4
	ld	a5,0(a5)
	sd	a5,48(a1)
	li	a1,1
	addi	a0,s0,56
	call	caml_modify
	j	.L31
.L55:
	mv	a2,s5
	mv	a1,s2
	mv	a0,s3
	call	print_token
	j	.L29
.L56:
	li	a5,-1
	sd	a5,48(s0)
	ble	s4,zero,.L34
	addiw	s4,s4,-1
	j	.L34
.L57:
	ld	a5,88(s3)
	add	a4,a5,a4
	lh	s5,0(a4)
.L28:
	lw	a5,caml_parser_trace
	bne	a5,zero,.L58
.L47:
	ld	a5,32(s3)
	slli	s5,s5,1
	add	a5,a5,s5
	lh	a5,0(a5)
	slli	a4,s1,1
	addi	a4,a4,1
	sd	a4,80(s0)
	addi	a4,s5,1
	sd	a4,96(s0)
	slli	a4,a5,1
	addi	a4,a4,1
	sd	a4,88(s0)
	sub	s1,s1,a5
	addi	s1,s1,1
	ld	a5,24(s3)
	add	s5,a5,s5
	lh	a4,0(s5)
	ld	a3,0(s0)
	slli	a5,s1,3
	add	a5,a5,a3
	ld	a5,-8(a5)
	srai	a5,a5,1
	sext.w	a2,a5
	ld	a3,72(s3)
	slli	a4,a4,1
	add	a3,a3,a4
	lh	a3,0(a3)
	addw	a5,a5,a3
	beq	a3,zero,.L48
	blt	a5,zero,.L48
	ld	a3,80(s3)
	srai	a3,a3,1
	sext.w	a3,a3
	blt	a3,a5,.L48
	ld	a3,96(s3)
	slli	a5,a5,1
	add	a3,a3,a5
	lh	a3,0(a3)
	beq	a3,a2,.L59
.L48:
	ld	a5,48(s3)
	add	a4,a5,a4
	lh	a5,0(a4)
.L49:
	ld	a4,32(s0)
	srai	a4,a4,1
	bgtu	a4,s1,.L50
	slli	s1,s1,1
	addi	s1,s1,1
	sd	s1,104(s0)
	slli	a5,a5,1
	addi	a5,a5,1
	sd	a5,112(s0)
	slli	s4,s4,1
	addi	s4,s4,1
	sd	s4,120(s0)
	li	a0,7
	j	.L18
.L20:
	ld	s1,104(a1)
	srai	s1,s1,1
	sext.w	s1,s1
	ld	s2,112(a1)
	srai	s2,s2,1
	sext.w	s2,s2
	ld	s4,120(a1)
	srai	s4,s4,1
	sext.w	s4,s4
.L36:
	li	a5,2
	ble	s4,a5,.L43
	ld	a5,48(s0)
	srai	a5,a5,1
	sext.w	a5,a5
	beq	a5,zero,.L53
	lw	a5,caml_parser_trace
	bne	a5,zero,.L60
.L44:
	li	a5,-1
	sd	a5,48(s0)
	j	.L27
.L63:
	lla	a1,.LC6
	ld	a0,stderr
	call	fprintf
	j	.L39
.L38:
	lw	a5,caml_parser_trace
	bne	a5,zero,.L61
.L40:
	ld	a5,40(s0)
	srai	a5,a5,1
	sext.w	a5,a5
	bgeu	a5,s1,.L62
	addi	s1,s1,-1
.L43:
	ld	a4,0(s0)
	slli	a5,s1,3
	add	a5,a5,a4
	ld	a2,0(a5)
	srai	a2,a2,1
	sext.w	a2,a2
	ld	a5,56(s3)
	slli	a4,a2,1
	add	a5,a5,a4
	lh	a5,0(a5)
	addiw	s5,a5,256
	beq	a5,zero,.L38
	blt	s5,zero,.L38
	ld	a5,80(s3)
	srai	a5,a5,1
	sext.w	a5,a5
	blt	a5,s5,.L38
	ld	a5,96(s3)
	slli	a4,s5,1
	add	a5,a5,a4
	lh	a4,0(a5)
	li	a5,256
	bne	a4,a5,.L38
	lw	a5,caml_parser_trace
	bne	a5,zero,.L63
.L39:
	li	s4,3
.L34:
	lw	a5,caml_parser_trace
	bne	a5,zero,.L64
.L45:
	ld	a5,88(s3)
	slli	s5,s5,1
	add	s5,a5,s5
	lh	a5,0(s5)
	sext.w	s2,a5
	addi	s1,s1,1
	ld	a4,32(s0)
	srai	a4,a4,1
	bgtu	a4,s1,.L46
	slli	a4,s1,1
	addi	a4,a4,1
	sd	a4,104(s0)
	slli	a5,a5,1
	addi	a5,a5,1
	sd	a5,112(s0)
	slli	a5,s4,1
	addi	a5,a5,1
	sd	a5,120(s0)
	li	a0,5
	j	.L18
.L61:
	lla	a1,.LC7
	ld	a0,stderr
	call	fprintf
	j	.L40
.L62:
	lw	a5,caml_parser_trace
	bne	a5,zero,.L65
.L42:
	li	a0,3
	j	.L18
.L65:
	ld	a3,stderr
	li	a2,26
	li	a1,1
	lla	a0,.LC8
	call	fwrite
	j	.L42
.L60:
	ld	a3,stderr
	li	a2,27
	li	a1,1
	lla	a0,.LC9
	call	fwrite
	j	.L44
.L64:
	ld	a5,88(s3)
	slli	a4,s5,1
	add	a5,a5,a4
	lh	a3,0(a5)
	mv	a2,s2
	lla	a1,.LC10
	ld	a0,stderr
	call	fprintf
	j	.L45
.L24:
	ld	s1,104(a1)
	srai	s1,s1,1
	sext.w	s1,s1
	ld	s2,112(a1)
	srai	s2,s2,1
	sext.w	s2,s2
	ld	s4,120(a1)
	srai	s4,s4,1
	sext.w	s4,s4
.L46:
	slli	a5,s2,1
	slli	s5,s1,3
	ld	a4,0(s0)
	add	a4,a4,s5
	addi	a5,a5,1
	sd	a5,0(a4)
	ld	a0,8(s0)
	ld	a1,56(s0)
	add	a0,a0,s5
	call	caml_modify
	ld	a0,16(s0)
	ld	a1,64(s0)
	add	a0,a0,s5
	call	caml_modify
	ld	a0,24(s0)
	ld	a1,72(s0)
	add	a0,a0,s5
	call	caml_modify
.L27:
	ld	a5,40(s3)
	slli	a3,s2,1
	add	a5,a5,a3
	lh	s5,0(a5)
	bne	s5,zero,.L28
	ld	a5,48(s0)
	slli	a3,a5,31
	bge	a3,zero,.L29
	slli	s1,s1,1
	addi	s1,s1,1
	sd	s1,104(s0)
	slli	a4,s2,1
	addi	a4,a4,1
	sd	a4,112(s0)
	slli	s4,s4,1
	addi	s4,s4,1
	sd	s4,120(s0)
	li	a0,1
	j	.L18
.L58:
	mv	a3,s5
	mv	a2,s2
	lla	a1,.LC11
	ld	a0,stderr
	call	fprintf
	j	.L47
.L59:
	ld	a4,88(s3)
	add	a5,a4,a5
	lh	a5,0(a5)
	j	.L49
.L23:
	ld	s1,104(a1)
	srai	s1,s1,1
	sext.w	s1,s1
	ld	a5,112(a1)
	srai	a5,a5,1
	sext.w	a5,a5
	ld	s4,120(a1)
	srai	s4,s4,1
	sext.w	s4,s4
.L50:
	slli	s1,s1,1
	addi	s1,s1,1
	sd	s1,104(s0)
	slli	a5,a5,1
	addi	a5,a5,1
	sd	a5,112(s0)
	slli	s4,s4,1
	addi	s4,s4,1
	sd	s4,120(s0)
	li	a0,9
.L18:
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
.L22:
	ld	s1,104(a1)
	srai	s1,s1,1
	sext.w	s1,s1
	ld	s2,112(a1)
	srai	s2,s2,1
	sext.w	s2,s2
	ld	s4,120(a1)
	srai	s4,s4,1
	sext.w	s4,s4
	slli	a4,s2,1
	slli	s6,s1,3
	ld	a5,0(a1)
	add	a5,a5,s6
	addi	a4,a4,1
	sd	a4,0(a5)
	ld	a0,8(a1)
	mv	a1,s5
	add	a0,a0,s6
	call	caml_modify
	ld	s5,80(s0)
	srai	s5,s5,1
	sext.w	s5,s5
	slli	s7,s5,3
	ld	a0,24(s0)
	add	a5,s7,a0
	ld	a1,0(a5)
	add	a0,s6,a0
	call	caml_modify
	bleu	s1,s5,.L27
	ld	a5,24(s0)
	add	s7,a5,s7
	ld	a0,16(s0)
	ld	a1,0(s7)
	add	a0,a0,s6
	call	caml_modify
	j	.L27
.L52:
	li	a0,3
	j	.L18
.L53:
	li	a0,3
	j	.L18
	.size	caml_parse_engine, .-caml_parse_engine
	.section	.text.caml_set_parser_trace,"ax",@progbits
	.align	1
	.globl	caml_set_parser_trace
	.type	caml_set_parser_trace, @function
caml_set_parser_trace:
	mv	a5,a0
	lw	a4,caml_parser_trace
	bne	a4,zero,.L69
	li	a0,1
.L67:
	srai	a5,a5,1
	sw	a5,caml_parser_trace,a4
	ret
.L69:
	li	a0,3
	j	.L67
	.size	caml_set_parser_trace, .-caml_set_parser_trace
	.globl	caml_parser_trace
	.section	.sbss,"aw",@nobits
	.align	2
	.type	caml_parser_trace, @object
	.size	caml_parser_trace, 4
caml_parser_trace:
	.zero	4
	.ident	"GCC: (GNU) 9.2.0"
