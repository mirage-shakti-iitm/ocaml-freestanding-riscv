	.file	"meta.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Meta.get_global_data"
	.section	.text.caml_get_global_data,"ax",@progbits
	.align	1
	.globl	caml_get_global_data
	.type	caml_get_global_data, @function
caml_get_global_data:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,.LC0
	call	caml_invalid_argument
	.size	caml_get_global_data, .-caml_get_global_data
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"Meta.get_section_table"
	.section	.text.caml_get_section_table,"ax",@progbits
	.align	1
	.globl	caml_get_section_table
	.type	caml_get_section_table, @function
caml_get_section_table:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,.LC1
	call	caml_invalid_argument
	.size	caml_get_section_table, .-caml_get_section_table
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"Meta.realloc_global"
	.section	.text.caml_realloc_global,"ax",@progbits
	.align	1
	.globl	caml_realloc_global
	.type	caml_realloc_global, @function
caml_realloc_global:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,.LC2
	call	caml_invalid_argument
	.size	caml_realloc_global, .-caml_realloc_global
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"Meta.invoke_traced_function"
	.section	.text.caml_invoke_traced_function,"ax",@progbits
	.align	1
	.globl	caml_invoke_traced_function
	.type	caml_invoke_traced_function, @function
caml_invoke_traced_function:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,.LC3
	call	caml_invalid_argument
	.size	caml_invoke_traced_function, .-caml_invoke_traced_function
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Meta.reify_bytecode"
	.section	.text.caml_reify_bytecode,"ax",@progbits
	.align	1
	.globl	caml_reify_bytecode
	.type	caml_reify_bytecode, @function
caml_reify_bytecode:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,.LC4
	call	caml_invalid_argument
	.size	caml_reify_bytecode, .-caml_reify_bytecode
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	"Meta.static_release_bytecode"
	.section	.text.caml_static_release_bytecode,"ax",@progbits
	.align	1
	.globl	caml_static_release_bytecode
	.type	caml_static_release_bytecode, @function
caml_static_release_bytecode:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,.LC5
	call	caml_invalid_argument
	.size	caml_static_release_bytecode, .-caml_static_release_bytecode
	.ident	"GCC: (GNU) 9.2.0"
