	.file	"spacetime_nat.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.caml_spacetime_write_magic_number,"ax",@progbits
	.align	1
	.globl	caml_spacetime_write_magic_number
	.type	caml_spacetime_write_magic_number, @function
caml_spacetime_write_magic_number:
	li	a0,1
	ret
	.size	caml_spacetime_write_magic_number, .-caml_spacetime_write_magic_number
	.section	.text.caml_spacetime_enabled,"ax",@progbits
	.align	1
	.globl	caml_spacetime_enabled
	.type	caml_spacetime_enabled, @function
caml_spacetime_enabled:
	li	a0,1
	ret
	.size	caml_spacetime_enabled, .-caml_spacetime_enabled
	.section	.text.caml_spacetime_save_event,"ax",@progbits
	.align	1
	.globl	caml_spacetime_save_event
	.type	caml_spacetime_save_event, @function
caml_spacetime_save_event:
	li	a0,1
	ret
	.size	caml_spacetime_save_event, .-caml_spacetime_save_event
	.section	.text.caml_spacetime_save_event_for_automatic_snapshots,"ax",@progbits
	.align	1
	.globl	caml_spacetime_save_event_for_automatic_snapshots
	.type	caml_spacetime_save_event_for_automatic_snapshots, @function
caml_spacetime_save_event_for_automatic_snapshots:
	li	a0,1
	ret
	.size	caml_spacetime_save_event_for_automatic_snapshots, .-caml_spacetime_save_event_for_automatic_snapshots
	.section	.text.caml_spacetime_save_trie,"ax",@progbits
	.align	1
	.globl	caml_spacetime_save_trie
	.type	caml_spacetime_save_trie, @function
caml_spacetime_save_trie:
	li	a0,1
	ret
	.size	caml_spacetime_save_trie, .-caml_spacetime_save_trie
	.section	.text.caml_register_channel_for_spacetime,"ax",@progbits
	.align	1
	.globl	caml_register_channel_for_spacetime
	.type	caml_register_channel_for_spacetime, @function
caml_register_channel_for_spacetime:
	li	a0,1
	ret
	.size	caml_register_channel_for_spacetime, .-caml_register_channel_for_spacetime
	.ident	"GCC: (GNU) 9.2.0"
