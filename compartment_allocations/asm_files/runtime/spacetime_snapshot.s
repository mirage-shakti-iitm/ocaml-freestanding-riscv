	.file	"spacetime_snapshot.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Spacetime profiling not enabled"
	.section	.text.spacetime_disabled,"ax",@progbits
	.align	1
	.type	spacetime_disabled, @function
spacetime_disabled:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,.LC0
	call	caml_failwith
	.size	spacetime_disabled, .-spacetime_disabled
	.section	.text.caml_spacetime_take_snapshot,"ax",@progbits
	.align	1
	.globl	caml_spacetime_take_snapshot
	.type	caml_spacetime_take_snapshot, @function
caml_spacetime_take_snapshot:
	li	a0,1
	ret
	.size	caml_spacetime_take_snapshot, .-caml_spacetime_take_snapshot
	.section	.text.caml_spacetime_marshal_frame_table,"ax",@progbits
	.align	1
	.globl	caml_spacetime_marshal_frame_table
	.type	caml_spacetime_marshal_frame_table, @function
caml_spacetime_marshal_frame_table:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	spacetime_disabled
	.size	caml_spacetime_marshal_frame_table, .-caml_spacetime_marshal_frame_table
	.section	.text.caml_spacetime_frame_table,"ax",@progbits
	.align	1
	.globl	caml_spacetime_frame_table
	.type	caml_spacetime_frame_table, @function
caml_spacetime_frame_table:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	spacetime_disabled
	.size	caml_spacetime_frame_table, .-caml_spacetime_frame_table
	.section	.text.caml_spacetime_marshal_shape_table,"ax",@progbits
	.align	1
	.globl	caml_spacetime_marshal_shape_table
	.type	caml_spacetime_marshal_shape_table, @function
caml_spacetime_marshal_shape_table:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	spacetime_disabled
	.size	caml_spacetime_marshal_shape_table, .-caml_spacetime_marshal_shape_table
	.section	.text.caml_spacetime_shape_table,"ax",@progbits
	.align	1
	.globl	caml_spacetime_shape_table
	.type	caml_spacetime_shape_table, @function
caml_spacetime_shape_table:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	spacetime_disabled
	.size	caml_spacetime_shape_table, .-caml_spacetime_shape_table
	.ident	"GCC: (GNU) 9.2.0"
