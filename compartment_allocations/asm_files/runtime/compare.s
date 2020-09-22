	.file	"compare.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.compare_free_stack,"ax",@progbits
	.align	1
	.type	compare_free_stack, @function
compare_free_stack:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	ld	a0,192(a0)
	beq	a0,s0,.L1
	call	caml_stat_free
	sd	zero,192(s0)
.L1:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	compare_free_stack, .-compare_free_stack
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Stack overflow in structural comparison\n"
	.section	.text.compare_stack_overflow,"ax",@progbits
	.align	1
	.type	compare_stack_overflow, @function
compare_stack_overflow:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	lla	a1,.LC0
	li	a0,4
	call	caml_gc_message
	mv	a0,s0
	call	compare_free_stack
	call	caml_raise_out_of_memory
	.size	compare_stack_overflow, .-compare_stack_overflow
	.section	.text.compare_resize_stack,"ax",@progbits
	.align	1
	.type	compare_resize_stack, @function
compare_resize_stack:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	mv	s1,a0
	ld	a0,192(a0)
	sub	s3,a1,a0
	beq	a0,s1,.L12
	ld	s0,200(s1)
	sub	s0,s0,a0
	srai	s0,s0,3
	ld	a5,.LC1
	mul	s0,s0,a5
	slli	s0,s0,1
	li	a5,1048576
	bgeu	s0,a5,.L13
	slli	a1,s0,1
	add	a1,a1,s0
	slli	a1,a1,3
	call	caml_stat_resize_noexc
	mv	s2,a0
	beq	a0,zero,.L14
.L9:
	sd	s2,192(s1)
	slli	a5,s0,1
	add	s0,a5,s0
	slli	s0,s0,3
	add	s0,s2,s0
	sd	s0,200(s1)
	add	a0,s2,s3
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L12:
	li	a0,768
	call	caml_stat_alloc_noexc
	mv	s2,a0
	beq	a0,zero,.L15
	li	a2,192
	mv	a1,s1
	call	memcpy
	li	s0,32
	j	.L9
.L15:
	mv	a0,s1
	call	compare_stack_overflow
.L13:
	mv	a0,s1
	call	compare_stack_overflow
.L14:
	mv	a0,s1
	call	compare_stack_overflow
	.size	compare_resize_stack, .-compare_resize_stack
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"compare: abstract value"
	.align	3
.LC3:
	.string	"compare: functional value"
	.section	.text.do_compare_val,"ax",@progbits
	.align	1
	.type	do_compare_val, @function
do_compare_val:
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
	sd	s8,0(sp)
	mv	s3,a0
	mv	s1,a1
	mv	s0,a2
	mv	s4,a3
	ld	s2,192(a0)
	j	.L17
.L82:
	beq	s4,zero,.L18
	j	.L19
.L83:
	srai	a5,s1,1
	srai	a0,s0,1
	sub	a0,a5,a0
	j	.L16
.L23:
	ld	s0,0(s0)
	j	.L17
.L24:
	ld	a5,0(s0)
	ld	a5,48(a5)
	beq	a5,zero,.L58
	lla	s5,Caml_state
	ld	a4,0(s5)
	sd	zero,256(a4)
	mv	a1,s0
	mv	a0,s1
	jalr	a5
	ld	a5,0(s5)
	ld	a5,256(a5)
	beq	a5,zero,.L26
	beq	s4,zero,.L59
.L26:
	beq	a0,zero,.L19
	j	.L16
.L20:
	andi	a5,s0,1
	beq	a5,zero,.L27
	mv	a0,s1
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L60
	lbu	a5,-8(s1)
	li	a4,250
	beq	a5,a4,.L28
	li	a4,255
	beq	a5,a4,.L29
	li	a0,1
	j	.L16
.L28:
	ld	s1,0(s1)
	j	.L17
.L29:
	ld	a5,0(s1)
	ld	a5,48(a5)
	beq	a5,zero,.L61
	lla	s5,Caml_state
	ld	a4,0(s5)
	sd	zero,256(a4)
	mv	a1,s0
	mv	a0,s1
	jalr	a5
	ld	a5,0(s5)
	ld	a5,256(a5)
	beq	a5,zero,.L30
	beq	s4,zero,.L62
.L30:
	beq	a0,zero,.L19
	j	.L16
.L27:
	mv	s5,s1
	mv	a0,s1
	call	caml_page_table_lookup
	andi	a0,a0,7
	bne	a0,zero,.L80
.L31:
	bne	s1,s0,.L81
.L19:
	ld	a5,192(s3)
	beq	a5,s2,.L78
	ld	a5,0(s2)
	addi	a4,a5,8
	sd	a4,0(s2)
	ld	s1,0(a5)
	ld	a5,8(s2)
	addi	a4,a5,8
	sd	a4,8(s2)
	ld	s0,0(a5)
	ld	a5,16(s2)
	addi	a5,a5,-1
	sd	a5,16(s2)
	bne	a5,zero,.L17
	addi	s2,s2,-24
.L17:
	beq	s1,s0,.L82
.L18:
	andi	a5,s1,1
	beq	a5,zero,.L20
	beq	s1,s0,.L19
	andi	a5,s0,1
	bne	a5,zero,.L83
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L57
	lbu	a5,-8(s0)
	li	a4,250
	beq	a5,a4,.L23
	li	a4,255
	beq	a5,a4,.L24
	li	a0,-1
.L16:
	ld	ra,72(sp)
	ld	s0,64(sp)
	ld	s1,56(sp)
	ld	s2,48(sp)
	ld	s3,40(sp)
	ld	s4,32(sp)
	ld	s5,24(sp)
	ld	s6,16(sp)
	ld	s7,8(sp)
	ld	s8,0(sp)
	addi	sp,sp,80
	jr	ra
.L80:
	mv	s6,s0
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L31
	mv	s8,s1
	addi	a6,s1,-8
	lbu	a5,-8(s1)
	sext.w	a4,a5
	mv	s7,s0
	addi	a1,s0,-8
	lbu	a0,-8(s0)
	sext.w	a3,a0
	li	a2,250
	beq	a4,a2,.L84
	li	a2,250
	beq	a3,a2,.L85
	bne	a4,a3,.L86
	addiw	a5,a5,9
	andi	a3,a5,0xff
	li	a4,8
	bgtu	a3,a4,.L36
	slli	a5,a3,2
	lla	a4,.L38
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L38:
	.word	.L43-.L38
	.word	.L44-.L38
	.word	.L43-.L38
	.word	.L36-.L38
	.word	.L42-.L38
	.word	.L41-.L38
	.word	.L40-.L38
	.word	.L39-.L38
	.word	.L37-.L38
	.section	.text.do_compare_val
.L81:
	srai	a0,s1,1
	srai	a5,s0,1
	sub	a0,a0,a5
	j	.L16
.L84:
	ld	s1,0(s1)
	j	.L17
.L85:
	ld	s0,0(s0)
	j	.L17
.L86:
	sub	a0,a5,a0
	j	.L16
.L41:
	beq	s1,s0,.L19
	mv	a0,s1
	call	caml_string_length
	mv	s1,a0
	mv	a0,s0
	call	caml_string_length
	mv	s0,a0
	mv	a2,s1
	bleu	s1,a0,.L46
	mv	a2,a0
.L46:
	mv	a1,s6
	mv	a0,s5
	call	memcmp
	blt	a0,zero,.L63
	bgt	a0,zero,.L64
	beq	s1,s0,.L19
	sub	a0,s1,s0
	j	.L16
.L40:
	fld	fa4,0(s1)
	fld	fa5,0(s0)
	flt.d	a5,fa4,fa5
	bne	a5,zero,.L65
	fgt.d	a5,fa4,fa5
	bne	a5,zero,.L66
	feq.d	a5,fa4,fa5
	bne	a5,zero,.L19
	beq	s4,zero,.L67
	feq.d	a5,fa4,fa4
	bne	a5,zero,.L68
	feq.d	a5,fa5,fa5
	beq	a5,zero,.L19
	li	a0,-1
	j	.L16
.L39:
	ld	a5,0(a6)
	srli	a5,a5,10
	ld	a0,0(a1)
	srli	a0,a0,10
	bne	a5,a0,.L87
	li	a3,0
	j	.L47
.L87:
	sub	a0,a5,a0
	j	.L16
.L48:
	addi	a3,a3,1
.L47:
	bgeu	a3,a5,.L19
	slli	a4,a3,3
	add	a2,s8,a4
	fld	fa4,0(a2)
	add	a4,s7,a4
	fld	fa5,0(a4)
	flt.d	a4,fa4,fa5
	bne	a4,zero,.L71
	fgt.d	a4,fa4,fa5
	bne	a4,zero,.L72
	feq.d	a4,fa4,fa5
	bne	a4,zero,.L48
	beq	s4,zero,.L73
	feq.d	a4,fa4,fa4
	bne	a4,zero,.L74
	feq.d	a4,fa5,fa5
	beq	a4,zero,.L48
	li	a0,-1
	j	.L16
.L42:
	mv	a0,s3
	call	compare_free_stack
	lla	a0,.LC2
	call	caml_invalid_argument
.L43:
	mv	a0,s3
	call	compare_free_stack
	lla	a0,.LC3
	call	caml_invalid_argument
.L44:
	ld	a5,8(s1)
	srai	a5,a5,1
	ld	a0,8(s0)
	srai	a0,a0,1
	beq	a5,a0,.L19
	sub	a0,a5,a0
	j	.L16
.L37:
	ld	a4,0(s1)
	ld	a5,16(a4)
	ld	a3,0(s0)
	ld	a2,16(a3)
	bne	a2,a5,.L88
	beq	a5,zero,.L89
	lla	s5,Caml_state
	ld	a4,0(s5)
	sd	zero,256(a4)
	mv	a1,s0
	mv	a0,s1
	jalr	a5
	ld	a5,0(s5)
	ld	a5,256(a5)
	beq	a5,zero,.L53
	beq	s4,zero,.L77
.L53:
	beq	a0,zero,.L19
	j	.L16
.L88:
	ld	a1,0(a3)
	ld	a0,0(a4)
	call	strcmp
	blt	a0,zero,.L90
	li	a0,1
	j	.L16
.L90:
	li	a0,-1
	j	.L16
.L89:
	mv	a0,s3
	call	compare_free_stack
	lla	a0,.LC2
	call	caml_invalid_argument
.L36:
	ld	a0,0(a6)
	srli	s0,a0,10
	ld	a5,0(a1)
	srli	a5,a5,10
	bne	s0,a5,.L91
	beq	s0,zero,.L19
	li	a5,1
	bleu	s0,a5,.L55
	addi	s2,s2,24
	ld	a5,200(s3)
	bleu	a5,s2,.L92
.L56:
	addi	s8,s8,8
	sd	s8,0(s2)
	addi	s7,s7,8
	sd	s7,8(s2)
	addi	a0,s0,-1
	sd	a0,16(s2)
.L55:
	ld	s1,0(s5)
	ld	s0,0(s6)
	j	.L17
.L91:
	sub	a0,s0,a5
	j	.L16
.L92:
	mv	a1,s2
	mv	a0,s3
	call	compare_resize_stack
	mv	s2,a0
	j	.L56
.L57:
	li	a0,-1
	j	.L16
.L58:
	li	a0,-1
	j	.L16
.L59:
	li	a5,-1
	slli	a0,a5,63
	j	.L16
.L60:
	li	a0,1
	j	.L16
.L61:
	li	a0,1
	j	.L16
.L62:
	li	a5,-1
	slli	a0,a5,63
	j	.L16
.L63:
	li	a0,-1
	j	.L16
.L64:
	li	a0,1
	j	.L16
.L65:
	li	a0,-1
	j	.L16
.L66:
	li	a0,1
	j	.L16
.L67:
	li	a5,-1
	slli	a0,a5,63
	j	.L16
.L68:
	li	a0,1
	j	.L16
.L71:
	li	a0,-1
	j	.L16
.L72:
	li	a0,1
	j	.L16
.L73:
	li	a5,-1
	slli	a0,a5,63
	j	.L16
.L74:
	li	a0,1
	j	.L16
.L77:
	li	a5,-1
	slli	a0,a5,63
	j	.L16
.L78:
	li	a0,0
	j	.L16
	.size	do_compare_val, .-do_compare_val
	.section	.text.compare_val,"ax",@progbits
	.align	1
	.type	compare_val, @function
compare_val:
	addi	sp,sp,-224
	sd	ra,216(sp)
	sd	s0,208(sp)
	mv	a3,a2
	sd	sp,192(sp)
	addi	a5,sp,192
	sd	a5,200(sp)
	mv	a2,a1
	mv	a1,a0
	mv	a0,sp
	call	do_compare_val
	mv	s0,a0
	mv	a0,sp
	call	compare_free_stack
	mv	a0,s0
	ld	ra,216(sp)
	ld	s0,208(sp)
	addi	sp,sp,224
	jr	ra
	.size	compare_val, .-compare_val
	.section	.text.caml_compare,"ax",@progbits
	.align	1
	.globl	caml_compare
	.type	caml_compare, @function
caml_compare:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a2,1
	call	compare_val
	blt	a0,zero,.L97
	bgt	a0,zero,.L100
	li	a0,1
.L95:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L100:
	li	a0,3
	j	.L95
.L97:
	li	a0,-1
	j	.L95
	.size	caml_compare, .-caml_compare
	.section	.text.caml_equal,"ax",@progbits
	.align	1
	.globl	caml_equal
	.type	caml_equal, @function
caml_equal:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a2,0
	call	compare_val
	beq	a0,zero,.L105
	li	a0,1
.L101:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L105:
	li	a0,3
	j	.L101
	.size	caml_equal, .-caml_equal
	.section	.text.caml_notequal,"ax",@progbits
	.align	1
	.globl	caml_notequal
	.type	caml_notequal, @function
caml_notequal:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a2,0
	call	compare_val
	bne	a0,zero,.L110
	li	a0,1
.L106:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L110:
	li	a0,3
	j	.L106
	.size	caml_notequal, .-caml_notequal
	.section	.text.caml_lessthan,"ax",@progbits
	.align	1
	.globl	caml_lessthan
	.type	caml_lessthan, @function
caml_lessthan:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a2,0
	call	compare_val
	li	a5,-1
	srli	a5,a5,1
	add	a0,a0,a5
	sltu	a0,a0,a5
	slli	a0,a0,1
	addi	a0,a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_lessthan, .-caml_lessthan
	.section	.text.caml_lessequal,"ax",@progbits
	.align	1
	.globl	caml_lessequal
	.type	caml_lessequal, @function
caml_lessequal:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a2,0
	call	compare_val
	li	a5,-1
	srli	a5,a5,1
	add	a0,a0,a5
	not	a0,a0
	srli	a0,a0,63
	slli	a0,a0,1
	addi	a0,a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_lessequal, .-caml_lessequal
	.section	.text.caml_greaterthan,"ax",@progbits
	.align	1
	.globl	caml_greaterthan
	.type	caml_greaterthan, @function
caml_greaterthan:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a2,0
	call	compare_val
	bgt	a0,zero,.L119
	li	a0,1
.L115:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L119:
	li	a0,3
	j	.L115
	.size	caml_greaterthan, .-caml_greaterthan
	.section	.text.caml_greaterequal,"ax",@progbits
	.align	1
	.globl	caml_greaterequal
	.type	caml_greaterequal, @function
caml_greaterequal:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a2,0
	call	compare_val
	bge	a0,zero,.L124
	li	a0,1
.L120:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L124:
	li	a0,3
	j	.L120
	.size	caml_greaterequal, .-caml_greaterequal
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	-6148914691236517205
	.ident	"GCC: (GNU) 9.2.0"
