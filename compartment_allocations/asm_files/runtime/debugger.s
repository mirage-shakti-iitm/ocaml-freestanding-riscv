	.file	"debugger.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.caml_debugger_init,"ax",@progbits
	.align	1
	.globl	caml_debugger_init
	.type	caml_debugger_init, @function
caml_debugger_init:
	ret
	.size	caml_debugger_init, .-caml_debugger_init
	.section	.text.caml_debugger,"ax",@progbits
	.align	1
	.globl	caml_debugger
	.type	caml_debugger, @function
caml_debugger:
	ret
	.size	caml_debugger, .-caml_debugger
	.section	.text.caml_debugger_cleanup_fork,"ax",@progbits
	.align	1
	.globl	caml_debugger_cleanup_fork
	.type	caml_debugger_cleanup_fork, @function
caml_debugger_cleanup_fork:
	ret
	.size	caml_debugger_cleanup_fork, .-caml_debugger_cleanup_fork
	.globl	caml_debugger_fork_mode
	.globl	caml_event_count
	.globl	caml_debugger_in_use
	.section	.sbss,"aw",@nobits
	.align	3
	.type	caml_event_count, @object
	.size	caml_event_count, 8
caml_event_count:
	.zero	8
	.type	caml_debugger_in_use, @object
	.size	caml_debugger_in_use, 4
caml_debugger_in_use:
	.zero	4
	.section	.sdata,"aw"
	.align	2
	.type	caml_debugger_fork_mode, @object
	.size	caml_debugger_fork_mode, 4
caml_debugger_fork_mode:
	.word	1
	.ident	"GCC: (GNU) 9.2.0"
