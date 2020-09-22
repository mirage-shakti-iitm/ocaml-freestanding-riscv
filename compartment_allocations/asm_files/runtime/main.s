	.file	"main.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.main,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a0,a1
	call	caml_main
	li	a0,1
	call	caml_sys_exit
	.size	main, .-main
	.ident	"GCC: (GNU) 9.2.0"
