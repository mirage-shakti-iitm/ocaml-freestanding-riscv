	.file	"afl.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	caml_setup_afl
	.type	caml_setup_afl, @function
caml_setup_afl:
.LFB5:
	.file 1 "afl.c"
	.loc 1 23 1
	.cfi_startproc
.LVL0:
	.loc 1 24 3
	.loc 1 25 1 is_stmt 0
	li	a0,1
.LVL1:
	ret
	.cfi_endproc
.LFE5:
	.size	caml_setup_afl, .-caml_setup_afl
	.align	1
	.globl	caml_reset_afl_instrumentation
	.type	caml_reset_afl_instrumentation, @function
caml_reset_afl_instrumentation:
.LFB6:
	.loc 1 28 1 is_stmt 1
	.cfi_startproc
.LVL2:
	.loc 1 29 3
	.loc 1 30 1 is_stmt 0
	li	a0,1
.LVL3:
	ret
	.cfi_endproc
.LFE6:
	.size	caml_reset_afl_instrumentation, .-caml_reset_afl_instrumentation
.Letext0:
	.file 2 "caml/config.h"
	.file 3 "caml/misc.h"
	.file 4 "caml/mlvalues.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x17b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF23
	.byte	0xc
	.4byte	.LASF24
	.4byte	.LASF25
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.byte	0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1
	.byte	0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF2
	.byte	0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF4
	.byte	0x4
	.4byte	.LASF5
	.byte	0x2
	.byte	0x5b
	.byte	0xe
	.4byte	0x3b
	.byte	0x4
	.4byte	.LASF6
	.byte	0x2
	.byte	0x5c
	.byte	0x17
	.4byte	0x42
	.byte	0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.byte	0x3
	.byte	0x10
	.byte	0x4
	.4byte	.LASF8
	.byte	0x4
	.4byte	.LASF9
	.byte	0x3
	.byte	0x5c
	.byte	0x10
	.4byte	0x89
	.byte	0x5
	.byte	0x8
	.4byte	0x8f
	.byte	0x6
	.byte	0x7
	.4byte	.LASF10
	.byte	0x3
	.byte	0x5d
	.byte	0x19
	.4byte	0x7d
	.byte	0x7
	.4byte	.LASF11
	.byte	0x3
	.byte	0x5d
	.byte	0x36
	.4byte	0x7d
	.byte	0x7
	.4byte	.LASF12
	.byte	0x3
	.byte	0x5e
	.byte	0x19
	.4byte	0x7d
	.byte	0x7
	.4byte	.LASF13
	.byte	0x3
	.byte	0x5e
	.byte	0x33
	.4byte	0x7d
	.byte	0x7
	.4byte	.LASF14
	.byte	0x3
	.byte	0x5f
	.byte	0x19
	.4byte	0x7d
	.byte	0x7
	.4byte	.LASF15
	.byte	0x3
	.byte	0x5f
	.byte	0x33
	.4byte	0x7d
	.byte	0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF16
	.byte	0x4
	.4byte	.LASF17
	.byte	0x4
	.byte	0x3c
	.byte	0x10
	.4byte	0x57
	.byte	0x4
	.4byte	.LASF18
	.byte	0x4
	.byte	0x3d
	.byte	0x11
	.4byte	0x63
	.byte	0x8
	.4byte	0xeb
	.4byte	0x102
	.byte	0x9
	.byte	0
	.byte	0xa
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x15c
	.byte	0x15
	.4byte	0xf7
	.byte	0xa
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x171
	.byte	0xe
	.4byte	0xdf
	.byte	0xb
	.4byte	.LASF26
	.byte	0x1
	.byte	0x1b
	.byte	0x10
	.4byte	0xdf
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x14f
	.byte	0xc
	.4byte	.LASF21
	.byte	0x1
	.byte	0x1b
	.byte	0x35
	.4byte	0xdf
	.4byte	.LLST1
	.byte	0
	.byte	0xd
	.4byte	.LASF27
	.byte	0x1
	.byte	0x16
	.byte	0x10
	.4byte	0xdf
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.byte	0xc
	.4byte	.LASF22
	.byte	0x1
	.byte	0x16
	.byte	0x26
	.4byte	0xdf
	.4byte	.LLST0
	.byte	0
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
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x3
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
	.byte	0x4
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
	.byte	0x5
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x7
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
	.byte	0x8
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0xb
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
	.byte	0xc
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
	.byte	0xd
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST1:
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL3-.Ltext0
	.8byte	.LFE6-.Ltext0
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
	.8byte	.LFE5-.Ltext0
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
.LASF12:
	.string	"caml_minor_gc_begin_hook"
.LASF27:
	.string	"caml_setup_afl"
.LASF17:
	.string	"value"
.LASF13:
	.string	"caml_minor_gc_end_hook"
.LASF23:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF10:
	.string	"caml_major_slice_begin_hook"
.LASF6:
	.string	"uintnat"
.LASF25:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF2:
	.string	"long unsigned int"
.LASF19:
	.string	"caml_atom_table"
.LASF4:
	.string	"short unsigned int"
.LASF15:
	.string	"caml_finalise_end_hook"
.LASF14:
	.string	"caml_finalise_begin_hook"
.LASF11:
	.string	"caml_major_slice_end_hook"
.LASF0:
	.string	"unsigned int"
.LASF16:
	.string	"char"
.LASF22:
	.string	"unit"
.LASF21:
	.string	"unused"
.LASF24:
	.string	"afl.c"
.LASF26:
	.string	"caml_reset_afl_instrumentation"
.LASF7:
	.string	"long long int"
.LASF18:
	.string	"header_t"
.LASF3:
	.string	"short int"
.LASF20:
	.string	"caml_global_data"
.LASF1:
	.string	"long int"
.LASF8:
	.string	"long double"
.LASF9:
	.string	"caml_timing_hook"
.LASF5:
	.string	"intnat"
	.ident	"GCC: (GNU) 9.2.0"
