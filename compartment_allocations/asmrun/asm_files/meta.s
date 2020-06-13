	.file	"meta.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Meta.get_global_data"
	.text
	.align	1
	.globl	caml_get_global_data
	.type	caml_get_global_data, @function
caml_get_global_data:
.LFB12:
	.file 1 "meta.c"
	.loc 1 189 1
	.cfi_startproc
.LVL0:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 190 3
	lla	a0,.LC0
.LVL1:
	call	caml_invalid_argument
.LVL2:
	.cfi_endproc
.LFE12:
	.size	caml_get_global_data, .-caml_get_global_data
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"Meta.get_section_table"
	.text
	.align	1
	.globl	caml_get_section_table
	.type	caml_get_section_table, @function
caml_get_section_table:
.LFB13:
	.loc 1 195 1
	.cfi_startproc
.LVL3:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 196 3
	lla	a0,.LC1
.LVL4:
	call	caml_invalid_argument
.LVL5:
	.cfi_endproc
.LFE13:
	.size	caml_get_section_table, .-caml_get_section_table
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"Meta.realloc_global"
	.text
	.align	1
	.globl	caml_realloc_global
	.type	caml_realloc_global, @function
caml_realloc_global:
.LFB14:
	.loc 1 201 1
	.cfi_startproc
.LVL6:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 202 3
	lla	a0,.LC2
.LVL7:
	call	caml_invalid_argument
.LVL8:
	.cfi_endproc
.LFE14:
	.size	caml_realloc_global, .-caml_realloc_global
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"Meta.invoke_traced_function"
	.text
	.align	1
	.globl	caml_invoke_traced_function
	.type	caml_invoke_traced_function, @function
caml_invoke_traced_function:
.LFB15:
	.loc 1 207 1
	.cfi_startproc
.LVL9:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 208 3
	lla	a0,.LC3
.LVL10:
	call	caml_invalid_argument
.LVL11:
	.cfi_endproc
.LFE15:
	.size	caml_invoke_traced_function, .-caml_invoke_traced_function
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Meta.reify_bytecode"
	.text
	.align	1
	.globl	caml_reify_bytecode
	.type	caml_reify_bytecode, @function
caml_reify_bytecode:
.LFB16:
	.loc 1 213 1
	.cfi_startproc
.LVL12:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 214 3
	lla	a0,.LC4
.LVL13:
	call	caml_invalid_argument
.LVL14:
	.cfi_endproc
.LFE16:
	.size	caml_reify_bytecode, .-caml_reify_bytecode
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	"Meta.static_release_bytecode"
	.text
	.align	1
	.globl	caml_static_release_bytecode
	.type	caml_static_release_bytecode, @function
caml_static_release_bytecode:
.LFB17:
	.loc 1 219 1
	.cfi_startproc
.LVL15:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 220 3
	lla	a0,.LC5
.LVL16:
	call	caml_invalid_argument
.LVL17:
	.cfi_endproc
.LFE17:
	.size	caml_static_release_bytecode, .-caml_static_release_bytecode
	.comm	caml_external_raise,8,8
	.comm	caml_async_action_hook,8,8
	.comm	caml_something_to_do,4,4
	.comm	caml_callback_depth,4,4
	.comm	caml_trapsp,8,8
	.comm	caml_extern_sp,8,8
	.comm	caml_stack_threshold,8,8
	.comm	caml_stack_high,8,8
	.comm	caml_stack_low,8,8
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
	.comm	caml_code_fragments_table,16,8
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 3 "caml/config.h"
	.file 4 "caml/misc.h"
	.file 5 "caml/mlvalues.h"
	.file 6 "/home/sai/ocaml-freestanding-riscv/nolibc/include/signal.h"
	.file 7 "caml/fail.h"
	.file 8 "caml/fix_code.h"
	.file 9 "caml/io.h"
	.file 10 "caml/intext.h"
	.file 11 "caml/freelist.h"
	.file 12 "caml/major_gc.h"
	.file 13 "caml/address_class.h"
	.file 14 "caml/minor_gc.h"
	.file 15 "caml/memory.h"
	.file 16 "caml/prims.h"
	.file 17 "caml/stacks.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xb3e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF136
	.byte	0xc
	.4byte	.LASF137
	.4byte	.LASF138
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF0
	.byte	0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0xd1
	.byte	0x17
	.4byte	0x40
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF1
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x5
	.4byte	0x47
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x10
	.byte	0x4
	.4byte	.LASF3
	.byte	0x3
	.4byte	.LASF5
	.byte	0x3
	.byte	0x4d
	.byte	0x19
	.4byte	0x47
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF8
	.byte	0x3
	.4byte	.LASF9
	.byte	0x3
	.byte	0x5b
	.byte	0xe
	.4byte	0x2d
	.byte	0x3
	.4byte	.LASF10
	.byte	0x3
	.byte	0x5c
	.byte	0x17
	.4byte	0x40
	.byte	0x3
	.4byte	.LASF11
	.byte	0x4
	.byte	0x21
	.byte	0x10
	.4byte	0x34
	.byte	0x6
	.byte	0x8
	.4byte	0xac
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.byte	0x3
	.4byte	.LASF13
	.byte	0x4
	.byte	0x5c
	.byte	0x10
	.4byte	0xbf
	.byte	0x6
	.byte	0x8
	.4byte	0xca
	.byte	0x5
	.4byte	0xbf
	.byte	0x7
	.byte	0x8
	.4byte	.LASF14
	.byte	0x4
	.byte	0x5d
	.byte	0x19
	.4byte	0xb3
	.byte	0x8
	.4byte	.LASF15
	.byte	0x4
	.byte	0x5d
	.byte	0x36
	.4byte	0xb3
	.byte	0x8
	.4byte	.LASF16
	.byte	0x4
	.byte	0x5e
	.byte	0x19
	.4byte	0xb3
	.byte	0x8
	.4byte	.LASF17
	.byte	0x4
	.byte	0x5e
	.byte	0x33
	.4byte	0xb3
	.byte	0x8
	.4byte	.LASF18
	.byte	0x4
	.byte	0x5f
	.byte	0x19
	.4byte	0xb3
	.byte	0x8
	.4byte	.LASF19
	.byte	0x4
	.byte	0x5f
	.byte	0x33
	.4byte	0xb3
	.byte	0x9
	.4byte	.LASF33
	.byte	0x10
	.byte	0x4
	.2byte	0x152
	.byte	0x8
	.4byte	0x14c
	.byte	0xa
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x153
	.byte	0x7
	.4byte	0x47
	.byte	0
	.byte	0xa
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x154
	.byte	0x7
	.4byte	0x47
	.byte	0x4
	.byte	0xa
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x155
	.byte	0xb
	.4byte	0x14c
	.byte	0x8
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x152
	.byte	0xb
	.byte	0x8
	.byte	0xc
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x169
	.byte	0x10
	.4byte	0x8e
	.byte	0xc
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x171
	.byte	0x10
	.4byte	0x8e
	.byte	0x3
	.4byte	.LASF25
	.byte	0x5
	.byte	0x3c
	.byte	0x10
	.4byte	0x82
	.byte	0x3
	.4byte	.LASF26
	.byte	0x5
	.byte	0x3d
	.byte	0x11
	.4byte	0x8e
	.byte	0x3
	.4byte	.LASF27
	.byte	0x5
	.byte	0x3e
	.byte	0x11
	.4byte	0x8e
	.byte	0x3
	.4byte	.LASF28
	.byte	0x5
	.byte	0xbf
	.byte	0x11
	.4byte	0x61
	.byte	0x3
	.4byte	.LASF29
	.byte	0x5
	.byte	0xc0
	.byte	0x14
	.4byte	0x1aa
	.byte	0x6
	.byte	0x8
	.4byte	0x192
	.byte	0xd
	.4byte	0x17a
	.4byte	0x1bb
	.byte	0xe
	.byte	0
	.byte	0xc
	.4byte	.LASF30
	.byte	0x5
	.2byte	0x15c
	.byte	0x15
	.4byte	0x1b0
	.byte	0xc
	.4byte	.LASF31
	.byte	0x5
	.2byte	0x171
	.byte	0xe
	.4byte	0x16e
	.byte	0x3
	.4byte	.LASF32
	.byte	0x6
	.byte	0x4
	.byte	0xd
	.4byte	0x47
	.byte	0xf
	.4byte	.LASF34
	.byte	0x4
	.byte	0x7
	.byte	0x2c
	.byte	0x8
	.4byte	0x1fc
	.byte	0x10
	.string	"buf"
	.byte	0x7
	.byte	0x2d
	.byte	0xe
	.4byte	0x1d5
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	.LASF35
	.byte	0x7
	.byte	0x3e
	.byte	0x24
	.4byte	0x208
	.byte	0x6
	.byte	0x8
	.4byte	0x1e1
	.byte	0x8
	.4byte	.LASF36
	.byte	0x7
	.byte	0x3f
	.byte	0xe
	.4byte	0x16e
	.byte	0x8
	.4byte	.LASF37
	.byte	0x8
	.byte	0x1b
	.byte	0xf
	.4byte	0x19e
	.byte	0x8
	.4byte	.LASF38
	.byte	0x8
	.byte	0x1c
	.byte	0x10
	.4byte	0x9a
	.byte	0x8
	.4byte	.LASF39
	.byte	0x8
	.byte	0x1d
	.byte	0x18
	.4byte	0x23e
	.byte	0x6
	.byte	0x8
	.4byte	0x244
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF40
	.byte	0x8
	.4byte	.LASF41
	.byte	0x8
	.byte	0x26
	.byte	0x10
	.4byte	0x257
	.byte	0x6
	.byte	0x8
	.4byte	0xa6
	.byte	0x8
	.4byte	.LASF42
	.byte	0x8
	.byte	0x27
	.byte	0xf
	.4byte	0xa6
	.byte	0x3
	.4byte	.LASF43
	.byte	0x9
	.byte	0x24
	.byte	0xe
	.4byte	0x2d
	.byte	0x11
	.4byte	.LASF44
	.4byte	0x10058
	.byte	0x9
	.byte	0x27
	.byte	0x8
	.4byte	0x33e
	.byte	0x10
	.string	"fd"
	.byte	0x9
	.byte	0x28
	.byte	0x7
	.4byte	0x47
	.byte	0
	.byte	0x12
	.4byte	.LASF45
	.byte	0x9
	.byte	0x29
	.byte	0xf
	.4byte	0x269
	.byte	0x8
	.byte	0x10
	.string	"end"
	.byte	0x9
	.byte	0x2a
	.byte	0xa
	.4byte	0xa6
	.byte	0x10
	.byte	0x12
	.4byte	.LASF46
	.byte	0x9
	.byte	0x2b
	.byte	0xa
	.4byte	0xa6
	.byte	0x18
	.byte	0x10
	.string	"max"
	.byte	0x9
	.byte	0x2c
	.byte	0xa
	.4byte	0xa6
	.byte	0x20
	.byte	0x12
	.4byte	.LASF47
	.byte	0x9
	.byte	0x2d
	.byte	0xa
	.4byte	0x152
	.byte	0x28
	.byte	0x12
	.4byte	.LASF48
	.byte	0x9
	.byte	0x2e
	.byte	0x14
	.4byte	0x33e
	.byte	0x30
	.byte	0x12
	.4byte	.LASF49
	.byte	0x9
	.byte	0x2e
	.byte	0x1c
	.4byte	0x33e
	.byte	0x38
	.byte	0x12
	.4byte	.LASF50
	.byte	0x9
	.byte	0x2f
	.byte	0x7
	.4byte	0x47
	.byte	0x40
	.byte	0x12
	.4byte	.LASF51
	.byte	0x9
	.byte	0x30
	.byte	0x7
	.4byte	0x47
	.byte	0x44
	.byte	0x12
	.4byte	.LASF52
	.byte	0x9
	.byte	0x31
	.byte	0x7
	.4byte	0x47
	.byte	0x48
	.byte	0x12
	.4byte	.LASF53
	.byte	0x9
	.byte	0x32
	.byte	0x7
	.4byte	0x47
	.byte	0x4c
	.byte	0x12
	.4byte	.LASF54
	.byte	0x9
	.byte	0x33
	.byte	0x8
	.4byte	0x344
	.byte	0x50
	.byte	0x13
	.4byte	.LASF55
	.byte	0x9
	.byte	0x34
	.byte	0xa
	.4byte	0xa6
	.4byte	0x10050
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x275
	.byte	0xd
	.4byte	0xac
	.4byte	0x355
	.byte	0x14
	.4byte	0x40
	.2byte	0xffff
	.byte	0
	.byte	0x15
	.4byte	0x360
	.byte	0x16
	.4byte	0x33e
	.byte	0
	.byte	0x8
	.4byte	.LASF56
	.byte	0x9
	.byte	0x69
	.byte	0x13
	.4byte	0x36c
	.byte	0x6
	.byte	0x8
	.4byte	0x355
	.byte	0x8
	.4byte	.LASF57
	.byte	0x9
	.byte	0x6a
	.byte	0x13
	.4byte	0x36c
	.byte	0x8
	.4byte	.LASF58
	.byte	0x9
	.byte	0x6b
	.byte	0x13
	.4byte	0x36c
	.byte	0x8
	.4byte	.LASF59
	.byte	0x9
	.byte	0x6c
	.byte	0x13
	.4byte	0xbf
	.byte	0x8
	.4byte	.LASF60
	.byte	0x9
	.byte	0x6e
	.byte	0x1d
	.4byte	0x33e
	.byte	0x8
	.4byte	.LASF61
	.byte	0xa
	.byte	0x86
	.byte	0xc
	.4byte	0x47
	.byte	0x17
	.4byte	.LASF62
	.byte	0xa
	.byte	0xc7
	.byte	0x12
	.4byte	0x113
	.byte	0x9
	.byte	0x3
	.8byte	caml_code_fragments_table
	.byte	0x8
	.4byte	.LASF63
	.byte	0xb
	.byte	0x1a
	.byte	0x10
	.4byte	0x9a
	.byte	0x8
	.4byte	.LASF64
	.byte	0xc
	.byte	0x24
	.byte	0xc
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF65
	.byte	0xc
	.byte	0x25
	.byte	0xc
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF66
	.byte	0xc
	.byte	0x26
	.byte	0x10
	.4byte	0x8e
	.byte	0x8
	.4byte	.LASF67
	.byte	0xc
	.byte	0x27
	.byte	0xf
	.4byte	0x400
	.byte	0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF68
	.byte	0x8
	.4byte	.LASF69
	.byte	0xc
	.byte	0x28
	.byte	0x10
	.4byte	0x8e
	.byte	0x8
	.4byte	.LASF70
	.byte	0xc
	.byte	0x28
	.byte	0x25
	.4byte	0x8e
	.byte	0x8
	.4byte	.LASF71
	.byte	0xc
	.byte	0x29
	.byte	0x10
	.4byte	0x8e
	.byte	0x8
	.4byte	.LASF72
	.byte	0xc
	.byte	0x3e
	.byte	0x12
	.4byte	0xa6
	.byte	0x8
	.4byte	.LASF73
	.byte	0xc
	.byte	0x3f
	.byte	0x10
	.4byte	0x8e
	.byte	0x8
	.4byte	.LASF74
	.byte	0xc
	.byte	0x40
	.byte	0xe
	.4byte	0xa6
	.byte	0x8
	.4byte	.LASF75
	.byte	0xc
	.byte	0x42
	.byte	0xc
	.4byte	0x47
	.byte	0xd
	.4byte	0x400
	.4byte	0x46b
	.byte	0x18
	.4byte	0x40
	.byte	0x31
	.byte	0
	.byte	0x17
	.4byte	.LASF76
	.byte	0xc
	.byte	0x43
	.byte	0x8
	.4byte	0x45b
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0x17
	.4byte	.LASF77
	.byte	0xc
	.byte	0x44
	.byte	0x5
	.4byte	0x47
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0x17
	.4byte	.LASF78
	.byte	0xc
	.byte	0x45
	.byte	0x8
	.4byte	0x400
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0x8
	.4byte	.LASF79
	.byte	0xc
	.byte	0x46
	.byte	0xf
	.4byte	0x400
	.byte	0x8
	.4byte	.LASF80
	.byte	0xc
	.byte	0x4a
	.byte	0x13
	.4byte	0xbf
	.byte	0x8
	.4byte	.LASF81
	.byte	0xd
	.byte	0x31
	.byte	0xf
	.4byte	0x4d1
	.byte	0x6
	.byte	0x8
	.4byte	0x16e
	.byte	0x8
	.4byte	.LASF82
	.byte	0xd
	.byte	0x31
	.byte	0x22
	.4byte	0x4d1
	.byte	0x8
	.4byte	.LASF83
	.byte	0xd
	.byte	0x32
	.byte	0xf
	.4byte	0xa6
	.byte	0x8
	.4byte	.LASF84
	.byte	0xd
	.byte	0x32
	.byte	0x27
	.4byte	0xa6
	.byte	0x8
	.4byte	.LASF85
	.byte	0xe
	.byte	0x18
	.byte	0x13
	.4byte	0x4d1
	.byte	0x8
	.4byte	.LASF86
	.byte	0xe
	.byte	0x18
	.byte	0x2c
	.4byte	0x4d1
	.byte	0x8
	.4byte	.LASF87
	.byte	0xe
	.byte	0x19
	.byte	0x13
	.4byte	0x4d1
	.byte	0x8
	.4byte	.LASF88
	.byte	0xe
	.byte	0x19
	.byte	0x24
	.4byte	0x4d1
	.byte	0x8
	.4byte	.LASF89
	.byte	0xe
	.byte	0x1a
	.byte	0x13
	.4byte	0x4d1
	.byte	0x8
	.4byte	.LASF90
	.byte	0xe
	.byte	0x1b
	.byte	0x10
	.4byte	0x9a
	.byte	0x8
	.4byte	.LASF91
	.byte	0xe
	.byte	0x1c
	.byte	0xc
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF92
	.byte	0xe
	.byte	0x1d
	.byte	0xf
	.4byte	0x400
	.byte	0xf
	.4byte	.LASF93
	.byte	0x38
	.byte	0xe
	.byte	0x29
	.byte	0x8
	.4byte	0x5c4
	.byte	0x12
	.4byte	.LASF94
	.byte	0xe
	.byte	0x29
	.byte	0x17
	.4byte	0x5c4
	.byte	0
	.byte	0x10
	.string	"end"
	.byte	0xe
	.byte	0x29
	.byte	0x17
	.4byte	0x5c4
	.byte	0x8
	.byte	0x12
	.4byte	.LASF95
	.byte	0xe
	.byte	0x29
	.byte	0x17
	.4byte	0x5c4
	.byte	0x10
	.byte	0x10
	.string	"ptr"
	.byte	0xe
	.byte	0x29
	.byte	0x17
	.4byte	0x5c4
	.byte	0x18
	.byte	0x12
	.4byte	.LASF96
	.byte	0xe
	.byte	0x29
	.byte	0x17
	.4byte	0x5c4
	.byte	0x20
	.byte	0x12
	.4byte	.LASF20
	.byte	0xe
	.byte	0x29
	.byte	0x17
	.4byte	0x9a
	.byte	0x28
	.byte	0x12
	.4byte	.LASF97
	.byte	0xe
	.byte	0x29
	.byte	0x17
	.4byte	0x9a
	.byte	0x30
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x4d1
	.byte	0x8
	.4byte	.LASF93
	.byte	0xe
	.byte	0x2a
	.byte	0x22
	.4byte	0x55b
	.byte	0xf
	.4byte	.LASF98
	.byte	0x10
	.byte	0xe
	.byte	0x2c
	.byte	0x8
	.4byte	0x5fe
	.byte	0x12
	.4byte	.LASF99
	.byte	0xe
	.byte	0x2d
	.byte	0x9
	.4byte	0x16e
	.byte	0
	.byte	0x12
	.4byte	.LASF45
	.byte	0xe
	.byte	0x2e
	.byte	0xc
	.4byte	0x186
	.byte	0x8
	.byte	0
	.byte	0xf
	.4byte	.LASF100
	.byte	0x38
	.byte	0xe
	.byte	0x31
	.byte	0x8
	.4byte	0x667
	.byte	0x12
	.4byte	.LASF94
	.byte	0xe
	.byte	0x31
	.byte	0x1c
	.4byte	0x667
	.byte	0
	.byte	0x10
	.string	"end"
	.byte	0xe
	.byte	0x31
	.byte	0x1c
	.4byte	0x667
	.byte	0x8
	.byte	0x12
	.4byte	.LASF95
	.byte	0xe
	.byte	0x31
	.byte	0x1c
	.4byte	0x667
	.byte	0x10
	.byte	0x10
	.string	"ptr"
	.byte	0xe
	.byte	0x31
	.byte	0x1c
	.4byte	0x667
	.byte	0x18
	.byte	0x12
	.4byte	.LASF96
	.byte	0xe
	.byte	0x31
	.byte	0x1c
	.4byte	0x667
	.byte	0x20
	.byte	0x12
	.4byte	.LASF20
	.byte	0xe
	.byte	0x31
	.byte	0x1c
	.4byte	0x9a
	.byte	0x28
	.byte	0x12
	.4byte	.LASF97
	.byte	0xe
	.byte	0x31
	.byte	0x1c
	.4byte	0x9a
	.byte	0x30
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x5d6
	.byte	0x8
	.4byte	.LASF100
	.byte	0xe
	.byte	0x32
	.byte	0x27
	.4byte	0x5fe
	.byte	0xf
	.4byte	.LASF101
	.byte	0x18
	.byte	0xe
	.byte	0x34
	.byte	0x8
	.4byte	0x6ae
	.byte	0x12
	.4byte	.LASF102
	.byte	0xe
	.byte	0x35
	.byte	0x9
	.4byte	0x16e
	.byte	0
	.byte	0x10
	.string	"mem"
	.byte	0xe
	.byte	0x36
	.byte	0xc
	.4byte	0x186
	.byte	0x8
	.byte	0x10
	.string	"max"
	.byte	0xe
	.byte	0x37
	.byte	0xc
	.4byte	0x186
	.byte	0x10
	.byte	0
	.byte	0xf
	.4byte	.LASF103
	.byte	0x38
	.byte	0xe
	.byte	0x3a
	.byte	0x8
	.4byte	0x717
	.byte	0x12
	.4byte	.LASF94
	.byte	0xe
	.byte	0x3a
	.byte	0x1a
	.4byte	0x717
	.byte	0
	.byte	0x10
	.string	"end"
	.byte	0xe
	.byte	0x3a
	.byte	0x1a
	.4byte	0x717
	.byte	0x8
	.byte	0x12
	.4byte	.LASF95
	.byte	0xe
	.byte	0x3a
	.byte	0x1a
	.4byte	0x717
	.byte	0x10
	.byte	0x10
	.string	"ptr"
	.byte	0xe
	.byte	0x3a
	.byte	0x1a
	.4byte	0x717
	.byte	0x18
	.byte	0x12
	.4byte	.LASF96
	.byte	0xe
	.byte	0x3a
	.byte	0x1a
	.4byte	0x717
	.byte	0x20
	.byte	0x12
	.4byte	.LASF20
	.byte	0xe
	.byte	0x3a
	.byte	0x1a
	.4byte	0x9a
	.byte	0x28
	.byte	0x12
	.4byte	.LASF97
	.byte	0xe
	.byte	0x3a
	.byte	0x1a
	.4byte	0x9a
	.byte	0x30
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x679
	.byte	0x8
	.4byte	.LASF103
	.byte	0xe
	.byte	0x3b
	.byte	0x25
	.4byte	0x6ae
	.byte	0x8
	.4byte	.LASF104
	.byte	0xf
	.byte	0x3f
	.byte	0x10
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF105
	.byte	0xf
	.byte	0xb7
	.byte	0x10
	.4byte	0x8e
	.byte	0xf
	.4byte	.LASF106
	.byte	0x40
	.byte	0xf
	.byte	0xf3
	.byte	0x8
	.4byte	0x783
	.byte	0x12
	.4byte	.LASF48
	.byte	0xf
	.byte	0xf4
	.byte	0x1d
	.4byte	0x783
	.byte	0
	.byte	0x12
	.4byte	.LASF107
	.byte	0xf
	.byte	0xf5
	.byte	0xa
	.4byte	0x82
	.byte	0x8
	.byte	0x12
	.4byte	.LASF108
	.byte	0xf
	.byte	0xf6
	.byte	0xa
	.4byte	0x82
	.byte	0x10
	.byte	0x12
	.4byte	.LASF109
	.byte	0xf
	.byte	0xf7
	.byte	0xa
	.4byte	0x789
	.byte	0x18
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x741
	.byte	0xd
	.4byte	0x4d1
	.4byte	0x799
	.byte	0x18
	.4byte	0x40
	.byte	0x4
	.byte	0
	.byte	0x8
	.4byte	.LASF110
	.byte	0xf
	.byte	0xfa
	.byte	0x26
	.4byte	0x783
	.byte	0x3
	.4byte	.LASF111
	.byte	0x10
	.byte	0x17
	.byte	0x11
	.4byte	0x7b1
	.byte	0x6
	.byte	0x8
	.4byte	0x7b7
	.byte	0x19
	.4byte	0x16e
	.4byte	0x7c2
	.byte	0x1a
	.byte	0
	.byte	0xd
	.4byte	0x7a5
	.4byte	0x7cd
	.byte	0xe
	.byte	0
	.byte	0x8
	.4byte	.LASF112
	.byte	0x10
	.byte	0x19
	.byte	0x14
	.4byte	0x7c2
	.byte	0xd
	.4byte	0xa6
	.4byte	0x7e4
	.byte	0xe
	.byte	0
	.byte	0x8
	.4byte	.LASF113
	.byte	0x10
	.byte	0x1a
	.byte	0xf
	.4byte	0x7d9
	.byte	0x8
	.4byte	.LASF114
	.byte	0x10
	.byte	0x1c
	.byte	0x19
	.4byte	0x113
	.byte	0x8
	.4byte	.LASF115
	.byte	0x10
	.byte	0x23
	.byte	0xf
	.4byte	0xa6
	.byte	0x8
	.4byte	.LASF116
	.byte	0x10
	.byte	0x24
	.byte	0x10
	.4byte	0x9a
	.byte	0x8
	.4byte	.LASF117
	.byte	0x11
	.byte	0x1b
	.byte	0x14
	.4byte	0x4d1
	.byte	0x8
	.4byte	.LASF118
	.byte	0x11
	.byte	0x1c
	.byte	0x14
	.4byte	0x4d1
	.byte	0x8
	.4byte	.LASF119
	.byte	0x11
	.byte	0x1d
	.byte	0x14
	.4byte	0x4d1
	.byte	0x8
	.4byte	.LASF120
	.byte	0x11
	.byte	0x1e
	.byte	0x14
	.4byte	0x4d1
	.byte	0x8
	.4byte	.LASF121
	.byte	0x11
	.byte	0x1f
	.byte	0x14
	.4byte	0x4d1
	.byte	0x8
	.4byte	.LASF122
	.byte	0x11
	.byte	0x20
	.byte	0x14
	.4byte	0x4d1
	.byte	0x1b
	.4byte	0x8e
	.byte	0x8
	.4byte	.LASF123
	.byte	0x11
	.byte	0x2a
	.byte	0x16
	.4byte	0x86d
	.byte	0x6
	.byte	0x8
	.4byte	0x85c
	.byte	0x1c
	.4byte	0x814
	.byte	0x1
	.byte	0xe0
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_stack_low
	.byte	0x1c
	.4byte	0x820
	.byte	0x1
	.byte	0xe1
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_stack_high
	.byte	0x1c
	.4byte	0x82c
	.byte	0x1
	.byte	0xe2
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_stack_threshold
	.byte	0x1c
	.4byte	0x838
	.byte	0x1
	.byte	0xe3
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_extern_sp
	.byte	0x1c
	.4byte	0x844
	.byte	0x1
	.byte	0xe4
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_trapsp
	.byte	0x17
	.4byte	.LASF124
	.byte	0x1
	.byte	0xe5
	.byte	0x5
	.4byte	0x47
	.byte	0x9
	.byte	0x3
	.8byte	caml_callback_depth
	.byte	0x17
	.4byte	.LASF125
	.byte	0x1
	.byte	0xe6
	.byte	0xe
	.4byte	0x4e
	.byte	0x9
	.byte	0x3
	.8byte	caml_something_to_do
	.byte	0x17
	.4byte	.LASF126
	.byte	0x1
	.byte	0xe7
	.byte	0x12
	.4byte	0xc5
	.byte	0x9
	.byte	0x3
	.8byte	caml_async_action_hook
	.byte	0x1c
	.4byte	0x1fc
	.byte	0x1
	.byte	0xe8
	.byte	0x19
	.byte	0x9
	.byte	0x3
	.8byte	caml_external_raise
	.byte	0x1d
	.4byte	.LASF128
	.byte	0x1
	.byte	0xda
	.byte	0x7
	.4byte	0x16e
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0x97f
	.byte	0x1e
	.4byte	.LASF127
	.byte	0x1
	.byte	0xda
	.byte	0x2a
	.4byte	0x16e
	.4byte	.LLST8
	.byte	0x1f
	.string	"len"
	.byte	0x1
	.byte	0xda
	.byte	0x36
	.4byte	0x16e
	.4byte	.LLST9
	.byte	0x20
	.8byte	.LVL17
	.4byte	0xb35
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC5
	.byte	0
	.byte	0
	.byte	0x1d
	.4byte	.LASF129
	.byte	0x1
	.byte	0xd4
	.byte	0x7
	.4byte	0x16e
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x9dd
	.byte	0x1e
	.4byte	.LASF127
	.byte	0x1
	.byte	0xd4
	.byte	0x21
	.4byte	0x16e
	.4byte	.LLST6
	.byte	0x1f
	.string	"len"
	.byte	0x1
	.byte	0xd4
	.byte	0x2d
	.4byte	0x16e
	.4byte	.LLST7
	.byte	0x20
	.8byte	.LVL14
	.4byte	0xb35
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC4
	.byte	0
	.byte	0
	.byte	0x1d
	.4byte	.LASF130
	.byte	0x1
	.byte	0xce
	.byte	0x7
	.4byte	0x16e
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0xa4b
	.byte	0x1e
	.4byte	.LASF131
	.byte	0x1
	.byte	0xce
	.byte	0x29
	.4byte	0x16e
	.4byte	.LLST3
	.byte	0x1f
	.string	"env"
	.byte	0x1
	.byte	0xce
	.byte	0x38
	.4byte	0x16e
	.4byte	.LLST4
	.byte	0x1f
	.string	"arg"
	.byte	0x1
	.byte	0xce
	.byte	0x43
	.4byte	0x16e
	.4byte	.LLST5
	.byte	0x20
	.8byte	.LVL11
	.4byte	0xb35
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0
	.byte	0
	.byte	0x1d
	.4byte	.LASF132
	.byte	0x1
	.byte	0xc8
	.byte	0x7
	.4byte	0x16e
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0xa99
	.byte	0x1e
	.4byte	.LASF20
	.byte	0x1
	.byte	0xc8
	.byte	0x21
	.4byte	0x16e
	.4byte	.LLST2
	.byte	0x20
	.8byte	.LVL8
	.4byte	0xb35
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC2
	.byte	0
	.byte	0
	.byte	0x1d
	.4byte	.LASF133
	.byte	0x1
	.byte	0xc2
	.byte	0x7
	.4byte	0x16e
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0xae7
	.byte	0x1e
	.4byte	.LASF134
	.byte	0x1
	.byte	0xc2
	.byte	0x24
	.4byte	0x16e
	.4byte	.LLST1
	.byte	0x20
	.8byte	.LVL5
	.4byte	0xb35
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0
	.byte	0
	.byte	0x1d
	.4byte	.LASF135
	.byte	0x1
	.byte	0xbc
	.byte	0x7
	.4byte	0x16e
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0xb35
	.byte	0x1e
	.4byte	.LASF134
	.byte	0x1
	.byte	0xbc
	.byte	0x22
	.4byte	0x16e
	.4byte	.LLST0
	.byte	0x20
	.8byte	.LVL2
	.4byte	0xb35
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC0
	.byte	0
	.byte	0
	.byte	0x22
	.4byte	.LASF139
	.4byte	.LASF139
	.byte	0x7
	.byte	0x65
	.byte	0x11
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0x1b
	.byte	0xe
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x6
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x15
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x34
	.byte	0
	.byte	0x47
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x6e
	.byte	0xe
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST8:
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL16-.Ltext0
	.8byte	.LFE17-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL17-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL17-1-.Ltext0
	.8byte	.LFE17-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL13-.Ltext0
	.8byte	.LFE16-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL14-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL14-1-.Ltext0
	.8byte	.LFE16-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL10-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL11-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL11-1-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL11-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL11-1-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL7-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL4-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL1-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF96:
	.string	"limit"
.LASF85:
	.string	"caml_young_alloc_start"
.LASF138:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF64:
	.string	"caml_gc_phase"
.LASF32:
	.string	"sigjmp_buf"
.LASF13:
	.string	"caml_timing_hook"
.LASF59:
	.string	"caml_channel_mutex_unlock_exn"
.LASF125:
	.string	"caml_something_to_do"
.LASF100:
	.string	"caml_ephe_ref_table"
.LASF89:
	.string	"caml_young_trigger"
.LASF7:
	.string	"short int"
.LASF4:
	.string	"size_t"
.LASF101:
	.string	"caml_custom_elt"
.LASF65:
	.string	"caml_gc_subphase"
.LASF130:
	.string	"caml_invoke_traced_function"
.LASF29:
	.string	"code_t"
.LASF73:
	.string	"total_heap_size"
.LASF58:
	.string	"caml_channel_mutex_unlock"
.LASF57:
	.string	"caml_channel_mutex_lock"
.LASF75:
	.string	"caml_major_window"
.LASF88:
	.string	"caml_young_limit"
.LASF47:
	.string	"mutex"
.LASF54:
	.string	"buff"
.LASF86:
	.string	"caml_young_alloc_end"
.LASF119:
	.string	"caml_stack_threshold"
.LASF133:
	.string	"caml_get_section_table"
.LASF132:
	.string	"caml_realloc_global"
.LASF136:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF25:
	.string	"value"
.LASF93:
	.string	"caml_ref_table"
.LASF22:
	.string	"contents"
.LASF16:
	.string	"caml_minor_gc_begin_hook"
.LASF52:
	.string	"refcount"
.LASF91:
	.string	"caml_in_minor_collection"
.LASF90:
	.string	"caml_minor_heap_wsz"
.LASF120:
	.string	"caml_extern_sp"
.LASF50:
	.string	"revealed"
.LASF123:
	.string	"caml_stack_usage_hook"
.LASF122:
	.string	"caml_trap_barrier"
.LASF113:
	.string	"caml_names_of_builtin_cprim"
.LASF80:
	.string	"caml_major_gc_hook"
.LASF107:
	.string	"ntables"
.LASF79:
	.string	"caml_gc_clock"
.LASF108:
	.string	"nitems"
.LASF19:
	.string	"caml_finalise_end_hook"
.LASF2:
	.string	"long long int"
.LASF74:
	.string	"caml_gc_sweep_hp"
.LASF76:
	.string	"caml_major_ring"
.LASF95:
	.string	"threshold"
.LASF109:
	.string	"tables"
.LASF9:
	.string	"intnat"
.LASF0:
	.string	"long int"
.LASF53:
	.string	"flags"
.LASF45:
	.string	"offset"
.LASF97:
	.string	"reserve"
.LASF104:
	.string	"caml_huge_fallback_count"
.LASF102:
	.string	"block"
.LASF63:
	.string	"caml_fl_cur_wsz"
.LASF24:
	.string	"caml_runtime_warnings"
.LASF26:
	.string	"header_t"
.LASF98:
	.string	"caml_ephe_ref_elt"
.LASF55:
	.string	"name"
.LASF15:
	.string	"caml_major_slice_end_hook"
.LASF30:
	.string	"caml_atom_table"
.LASF37:
	.string	"caml_start_code"
.LASF3:
	.string	"long double"
.LASF18:
	.string	"caml_finalise_begin_hook"
.LASF61:
	.string	"caml_extern_allow_out_of_heap"
.LASF33:
	.string	"ext_table"
.LASF40:
	.string	"unsigned char"
.LASF70:
	.string	"caml_dependent_allocated"
.LASF137:
	.string	"meta.c"
.LASF27:
	.string	"mlsize_t"
.LASF135:
	.string	"caml_get_global_data"
.LASF106:
	.string	"caml__roots_block"
.LASF21:
	.string	"capacity"
.LASF10:
	.string	"uintnat"
.LASF82:
	.string	"caml_young_end"
.LASF62:
	.string	"caml_code_fragments_table"
.LASF6:
	.string	"unsigned int"
.LASF39:
	.string	"caml_saved_code"
.LASF69:
	.string	"caml_dependent_size"
.LASF134:
	.string	"unit"
.LASF99:
	.string	"ephe"
.LASF129:
	.string	"caml_reify_bytecode"
.LASF127:
	.string	"prog"
.LASF14:
	.string	"caml_major_slice_begin_hook"
.LASF8:
	.string	"short unsigned int"
.LASF121:
	.string	"caml_trapsp"
.LASF81:
	.string	"caml_young_start"
.LASF139:
	.string	"caml_invalid_argument"
.LASF12:
	.string	"char"
.LASF5:
	.string	"int32_t"
.LASF77:
	.string	"caml_major_ring_index"
.LASF43:
	.string	"file_offset"
.LASF110:
	.string	"caml_local_roots"
.LASF46:
	.string	"curr"
.LASF34:
	.string	"longjmp_buffer"
.LASF118:
	.string	"caml_stack_high"
.LASF60:
	.string	"caml_all_opened_channels"
.LASF44:
	.string	"channel"
.LASF23:
	.string	"caml_verb_gc"
.LASF17:
	.string	"caml_minor_gc_end_hook"
.LASF38:
	.string	"caml_code_size"
.LASF128:
	.string	"caml_static_release_bytecode"
.LASF35:
	.string	"caml_external_raise"
.LASF56:
	.string	"caml_channel_mutex_free"
.LASF1:
	.string	"long unsigned int"
.LASF83:
	.string	"caml_code_area_start"
.LASF126:
	.string	"caml_async_action_hook"
.LASF68:
	.string	"double"
.LASF36:
	.string	"caml_exn_bucket"
.LASF31:
	.string	"caml_global_data"
.LASF20:
	.string	"size"
.LASF112:
	.string	"caml_builtin_cprim"
.LASF51:
	.string	"old_revealed"
.LASF116:
	.string	"caml_section_table_size"
.LASF71:
	.string	"caml_fl_wsz_at_phase_change"
.LASF103:
	.string	"caml_custom_table"
.LASF131:
	.string	"codeptr"
.LASF92:
	.string	"caml_extra_heap_resources_minor"
.LASF124:
	.string	"caml_callback_depth"
.LASF84:
	.string	"caml_code_area_end"
.LASF67:
	.string	"caml_extra_heap_resources"
.LASF66:
	.string	"caml_allocated_words"
.LASF42:
	.string	"caml_instr_base"
.LASF111:
	.string	"c_primitive"
.LASF28:
	.string	"opcode_t"
.LASF72:
	.string	"caml_heap_start"
.LASF11:
	.string	"asize_t"
.LASF87:
	.string	"caml_young_ptr"
.LASF49:
	.string	"prev"
.LASF117:
	.string	"caml_stack_low"
.LASF94:
	.string	"base"
.LASF78:
	.string	"caml_major_work_credit"
.LASF115:
	.string	"caml_section_table"
.LASF114:
	.string	"caml_prim_table"
.LASF41:
	.string	"caml_instr_table"
.LASF48:
	.string	"next"
.LASF105:
	.string	"caml_use_huge_pages"
	.ident	"GCC: (GNU) 9.2.0"
