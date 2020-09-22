	.file	"eventlog.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.caml_eventlog_resume,"ax",@progbits
	.align	1
	.globl	caml_eventlog_resume
	.type	caml_eventlog_resume, @function
caml_eventlog_resume:
	li	a0,1
	ret
	.size	caml_eventlog_resume, .-caml_eventlog_resume
	.section	.text.caml_eventlog_pause,"ax",@progbits
	.align	1
	.globl	caml_eventlog_pause
	.type	caml_eventlog_pause, @function
caml_eventlog_pause:
	li	a0,1
	ret
	.size	caml_eventlog_pause, .-caml_eventlog_pause
	.ident	"GCC: (GNU) 9.2.0"
