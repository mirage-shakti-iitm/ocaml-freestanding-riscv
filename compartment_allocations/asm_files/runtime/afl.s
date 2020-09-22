	.file	"afl.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.caml_setup_afl,"ax",@progbits
	.align	1
	.globl	caml_setup_afl
	.type	caml_setup_afl, @function
caml_setup_afl:
	li	a0,1
	ret
	.size	caml_setup_afl, .-caml_setup_afl
	.section	.text.caml_reset_afl_instrumentation,"ax",@progbits
	.align	1
	.globl	caml_reset_afl_instrumentation
	.type	caml_reset_afl_instrumentation, @function
caml_reset_afl_instrumentation:
	li	a0,1
	ret
	.size	caml_reset_afl_instrumentation, .-caml_reset_afl_instrumentation
	.ident	"GCC: (GNU) 9.2.0"
