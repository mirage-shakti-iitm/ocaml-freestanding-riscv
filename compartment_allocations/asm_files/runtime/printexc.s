	.file	"printexc.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.add_char,"ax",@progbits
	.align	1
	.type	add_char, @function
add_char:
	ld	a5,0(a0)
	ld	a4,8(a0)
	bgeu	a5,a4,.L1
	addi	a4,a5,1
	sd	a4,0(a0)
	sb	a1,0(a5)
.L1:
	ret
	.size	add_char, .-add_char
	.section	.text.add_string,"ax",@progbits
	.align	1
	.type	add_string, @function
add_string:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s0,a0
	mv	s2,a1
	mv	a0,a1
	call	strlen
	mv	s1,a0
	ld	a0,0(s0)
	add	a4,a0,s1
	ld	a5,8(s0)
	bleu	a4,a5,.L4
	sub	s1,a5,a0
.L4:
	bne	s1,zero,.L7
.L5:
	ld	a0,0(s0)
	add	s1,a0,s1
	sd	s1,0(s0)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L7:
	mv	a2,s1
	mv	a1,s2
	call	memmove
	j	.L5
	.size	add_string, .-add_string
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	", "
	.align	3
.LC1:
	.string	"%ld"
	.section	.text.caml_format_exception,"ax",@progbits
	.align	1
	.globl	caml_format_exception
	.type	caml_format_exception, @function
caml_format_exception:
	addi	sp,sp,-384
	sd	ra,376(sp)
	sd	s0,368(sp)
	sd	s1,360(sp)
	sd	s2,352(sp)
	sd	s3,344(sp)
	mv	s1,a0
	addi	a5,sp,80
	sd	a5,64(sp)
	addi	a5,sp,335
	sd	a5,72(sp)
	lbu	a5,-8(a0)
	bne	a5,zero,.L9
	ld	a5,0(a0)
	ld	a1,0(a5)
	addi	a0,sp,64
	call	add_string
	ld	a5,-8(s1)
	srli	a5,a5,10
	li	a4,2
	beq	a5,a4,.L24
	li	s3,1
.L10:
	li	a1,40
	addi	a0,sp,64
	call	add_char
	mv	s0,s3
	j	.L11
.L24:
	ld	a5,8(s1)
	andi	a4,a5,1
	bne	a4,zero,.L20
	lbu	a5,-8(a5)
	beq	a5,zero,.L25
	li	s3,1
	j	.L10
.L25:
	ld	a0,0(s1)
	call	caml_is_special_exception
	beq	a0,zero,.L22
	ld	s1,8(s1)
	li	s3,0
	j	.L10
.L20:
	li	s3,1
	j	.L10
.L22:
	li	s3,1
	j	.L10
.L27:
	lla	a1,.LC0
	addi	a0,sp,64
	call	add_string
	j	.L12
.L28:
	srai	a3,s2,1
	lla	a2,.LC1
	li	a1,64
	mv	a0,sp
	call	snprintf
	mv	a1,sp
	addi	a0,sp,64
	call	add_string
	j	.L14
.L15:
	li	a1,95
	addi	a0,sp,64
	call	add_char
.L14:
	addi	s0,s0,1
.L11:
	mv	s2,s1
	ld	a5,-8(s1)
	srli	a5,a5,10
	bleu	a5,s0,.L26
	bltu	s3,s0,.L27
.L12:
	slli	a5,s0,3
	add	a5,a5,s2
	ld	s2,0(a5)
	andi	a5,s2,1
	bne	a5,zero,.L28
	lbu	a4,-8(s2)
	li	a5,252
	bne	a4,a5,.L15
	li	a1,34
	addi	a0,sp,64
	call	add_char
	mv	a1,s2
	addi	a0,sp,64
	call	add_string
	li	a1,34
	addi	a0,sp,64
	call	add_char
	j	.L14
.L26:
	li	a1,41
	addi	a0,sp,64
	call	add_char
	j	.L17
.L9:
	ld	a1,0(a0)
	addi	a0,sp,64
	call	add_string
.L17:
	ld	a5,64(sp)
	sb	zero,0(a5)
	ld	s0,64(sp)
	addi	a5,sp,80
	sub	s0,s0,a5
	addi	s0,s0,1
	mv	a0,s0
	call	caml_stat_alloc_noexc
	mv	s1,a0
	beq	a0,zero,.L8
	mv	a2,s0
	addi	a1,sp,80
	call	memmove
.L8:
	mv	a0,s1
	ld	ra,376(sp)
	ld	s0,368(sp)
	ld	s1,360(sp)
	ld	s2,352(sp)
	ld	s3,344(sp)
	addi	sp,sp,384
	jr	ra
	.size	caml_format_exception, .-caml_format_exception
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"Pervasives.do_at_exit"
	.align	3
.LC3:
	.string	"Fatal error: exception %s\n"
	.section	.text.default_fatal_uncaught_exception,"ax",@progbits
	.align	1
	.type	default_fatal_uncaught_exception, @function
default_fatal_uncaught_exception:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	call	caml_format_exception
	mv	s0,a0
	ld	a5,Caml_state
	lw	s3,224(a5)
	lw	s2,232(a5)
	sd	zero,224(a5)
	lla	a0,.LC2
	call	caml_named_value
	beq	a0,zero,.L30
	li	a1,1
	ld	a0,0(a0)
	call	caml_callback_exn
.L30:
	lla	s1,Caml_state
	ld	a5,0(s1)
	sd	s3,224(a5)
	sd	s2,232(a5)
	mv	a2,s0
	lla	a1,.LC3
	ld	a0,stderr
	call	fprintf
	mv	a0,s0
	call	caml_stat_free
	ld	a5,0(s1)
	ld	a5,224(a5)
	bne	a5,zero,.L33
.L29:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L33:
	call	caml_print_exception_backtrace
	j	.L29
	.size	default_fatal_uncaught_exception, .-default_fatal_uncaught_exception
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Printexc.handle_uncaught_exception"
	.section	.text.caml_fatal_uncaught_exception,"ax",@progbits
	.align	1
	.globl	caml_fatal_uncaught_exception
	.type	caml_fatal_uncaught_exception, @function
caml_fatal_uncaught_exception:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	lla	a0,.LC4
	call	caml_named_value
	li	a5,1
	sw	a5,caml_memprof_suspended,a4
	beq	a0,zero,.L35
	li	a2,1
	mv	a1,s0
	ld	a0,0(a0)
	call	caml_callback2
.L36:
	lw	a5,caml_abort_on_uncaught_exn
	bne	a5,zero,.L39
	li	a0,2
	call	exit
.L35:
	mv	a0,s0
	call	default_fatal_uncaught_exception
	j	.L36
.L39:
	call	abort
	.size	caml_fatal_uncaught_exception, .-caml_fatal_uncaught_exception
	.globl	caml_abort_on_uncaught_exn
	.section	.sbss,"aw",@nobits
	.align	2
	.type	caml_abort_on_uncaught_exn, @object
	.size	caml_abort_on_uncaught_exn, 4
caml_abort_on_uncaught_exn:
	.zero	4
	.ident	"GCC: (GNU) 9.2.0"
