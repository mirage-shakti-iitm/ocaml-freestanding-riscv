	.file	"debugger.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	caml_debugger_init
	.type	caml_debugger_init, @function
caml_debugger_init:
.LFB12:
	.file 1 "debugger.c"
	.loc 1 39 1
	.cfi_startproc
	.loc 1 40 1
	ret
	.cfi_endproc
.LFE12:
	.size	caml_debugger_init, .-caml_debugger_init
	.align	1
	.globl	caml_debugger
	.type	caml_debugger, @function
caml_debugger:
.LFB13:
	.loc 1 43 1
	.cfi_startproc
.LVL0:
	.loc 1 44 1
	ret
	.cfi_endproc
.LFE13:
	.size	caml_debugger, .-caml_debugger
	.align	1
	.globl	caml_debugger_cleanup_fork
	.type	caml_debugger_cleanup_fork, @function
caml_debugger_cleanup_fork:
.LFB14:
	.loc 1 47 1
	.cfi_startproc
	.loc 1 48 1
	ret
	.cfi_endproc
.LFE14:
	.size	caml_debugger_cleanup_fork, .-caml_debugger_cleanup_fork
	.globl	caml_debugger_fork_mode
	.comm	caml_event_count,8,8
	.globl	caml_debugger_in_use
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
	.section	.sbss,"aw",@nobits
	.align	2
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
	.text
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 3 "caml/config.h"
	.file 4 "caml/misc.h"
	.file 5 "caml/mlvalues.h"
	.file 6 "caml/debugger.h"
	.file 7 "caml/freelist.h"
	.file 8 "caml/major_gc.h"
	.file 9 "caml/address_class.h"
	.file 10 "caml/minor_gc.h"
	.file 11 "caml/memory.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x630
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF88
	.byte	0xc
	.4byte	.LASF89
	.4byte	.LASF90
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF0
	.byte	0x3
	.4byte	.LASF7
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
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x10
	.byte	0x4
	.4byte	.LASF3
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.byte	0x3
	.4byte	.LASF8
	.byte	0x3
	.byte	0x5b
	.byte	0xe
	.4byte	0x2d
	.byte	0x3
	.4byte	.LASF9
	.byte	0x3
	.byte	0x5c
	.byte	0x17
	.4byte	0x40
	.byte	0x3
	.4byte	.LASF10
	.byte	0x4
	.byte	0x21
	.byte	0x10
	.4byte	0x34
	.byte	0x5
	.byte	0x8
	.4byte	0x9b
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.byte	0x3
	.4byte	.LASF12
	.byte	0x4
	.byte	0x5c
	.byte	0x10
	.4byte	0xae
	.byte	0x5
	.byte	0x8
	.4byte	0xb4
	.byte	0x6
	.byte	0x7
	.4byte	.LASF13
	.byte	0x4
	.byte	0x5d
	.byte	0x19
	.4byte	0xa2
	.byte	0x7
	.4byte	.LASF14
	.byte	0x4
	.byte	0x5d
	.byte	0x36
	.4byte	0xa2
	.byte	0x7
	.4byte	.LASF15
	.byte	0x4
	.byte	0x5e
	.byte	0x19
	.4byte	0xa2
	.byte	0x7
	.4byte	.LASF16
	.byte	0x4
	.byte	0x5e
	.byte	0x33
	.4byte	0xa2
	.byte	0x7
	.4byte	.LASF17
	.byte	0x4
	.byte	0x5f
	.byte	0x19
	.4byte	0xa2
	.byte	0x7
	.4byte	.LASF18
	.byte	0x4
	.byte	0x5f
	.byte	0x33
	.4byte	0xa2
	.byte	0x8
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x169
	.byte	0x10
	.4byte	0x7d
	.byte	0x8
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x171
	.byte	0x10
	.4byte	0x7d
	.byte	0x3
	.4byte	.LASF21
	.byte	0x5
	.byte	0x3c
	.byte	0x10
	.4byte	0x71
	.byte	0x3
	.4byte	.LASF22
	.byte	0x5
	.byte	0x3d
	.byte	0x11
	.4byte	0x7d
	.byte	0x3
	.4byte	.LASF23
	.byte	0x5
	.byte	0x3e
	.byte	0x11
	.4byte	0x7d
	.byte	0x9
	.4byte	0x123
	.4byte	0x146
	.byte	0xa
	.byte	0
	.byte	0x8
	.4byte	.LASF24
	.byte	0x5
	.2byte	0x15c
	.byte	0x15
	.4byte	0x13b
	.byte	0x8
	.4byte	.LASF25
	.byte	0x5
	.2byte	0x171
	.byte	0xe
	.4byte	0x117
	.byte	0x7
	.4byte	.LASF26
	.byte	0x6
	.byte	0x1a
	.byte	0x10
	.4byte	0x47
	.byte	0x7
	.4byte	.LASF27
	.byte	0x6
	.byte	0x1b
	.byte	0x10
	.4byte	0x47
	.byte	0x7
	.4byte	.LASF28
	.byte	0x6
	.byte	0x1c
	.byte	0x10
	.4byte	0x7d
	.byte	0xb
	.4byte	.LASF91
	.byte	0x7
	.byte	0x4
	.4byte	0x5c
	.byte	0x6
	.byte	0x1e
	.byte	0x6
	.4byte	0x1bb
	.byte	0xc
	.4byte	.LASF29
	.byte	0
	.byte	0xc
	.4byte	.LASF30
	.byte	0x1
	.byte	0xc
	.4byte	.LASF31
	.byte	0x2
	.byte	0xc
	.4byte	.LASF32
	.byte	0x3
	.byte	0xc
	.4byte	.LASF33
	.byte	0x4
	.byte	0xc
	.4byte	.LASF34
	.byte	0x5
	.byte	0
	.byte	0x7
	.4byte	.LASF35
	.byte	0x7
	.byte	0x1a
	.byte	0x10
	.4byte	0x89
	.byte	0x7
	.4byte	.LASF36
	.byte	0x8
	.byte	0x24
	.byte	0xc
	.4byte	0x47
	.byte	0x7
	.4byte	.LASF37
	.byte	0x8
	.byte	0x25
	.byte	0xc
	.4byte	0x47
	.byte	0x7
	.4byte	.LASF38
	.byte	0x8
	.byte	0x26
	.byte	0x10
	.4byte	0x7d
	.byte	0x7
	.4byte	.LASF39
	.byte	0x8
	.byte	0x27
	.byte	0xf
	.4byte	0x1f7
	.byte	0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF40
	.byte	0x7
	.4byte	.LASF41
	.byte	0x8
	.byte	0x28
	.byte	0x10
	.4byte	0x7d
	.byte	0x7
	.4byte	.LASF42
	.byte	0x8
	.byte	0x28
	.byte	0x25
	.4byte	0x7d
	.byte	0x7
	.4byte	.LASF43
	.byte	0x8
	.byte	0x29
	.byte	0x10
	.4byte	0x7d
	.byte	0x7
	.4byte	.LASF44
	.byte	0x8
	.byte	0x3e
	.byte	0x12
	.4byte	0x95
	.byte	0x7
	.4byte	.LASF45
	.byte	0x8
	.byte	0x3f
	.byte	0x10
	.4byte	0x7d
	.byte	0x7
	.4byte	.LASF46
	.byte	0x8
	.byte	0x40
	.byte	0xe
	.4byte	0x95
	.byte	0x7
	.4byte	.LASF47
	.byte	0x8
	.byte	0x42
	.byte	0xc
	.4byte	0x47
	.byte	0x9
	.4byte	0x1f7
	.4byte	0x262
	.byte	0xd
	.4byte	0x40
	.byte	0x31
	.byte	0
	.byte	0xe
	.4byte	.LASF48
	.byte	0x8
	.byte	0x43
	.byte	0x8
	.4byte	0x252
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0xe
	.4byte	.LASF49
	.byte	0x8
	.byte	0x44
	.byte	0x5
	.4byte	0x47
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0xe
	.4byte	.LASF50
	.byte	0x8
	.byte	0x45
	.byte	0x8
	.4byte	0x1f7
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0x7
	.4byte	.LASF51
	.byte	0x8
	.byte	0x46
	.byte	0xf
	.4byte	0x1f7
	.byte	0x7
	.4byte	.LASF52
	.byte	0x8
	.byte	0x4a
	.byte	0x13
	.4byte	0xae
	.byte	0x7
	.4byte	.LASF53
	.byte	0x9
	.byte	0x31
	.byte	0xf
	.4byte	0x2c8
	.byte	0x5
	.byte	0x8
	.4byte	0x117
	.byte	0x7
	.4byte	.LASF54
	.byte	0x9
	.byte	0x31
	.byte	0x22
	.4byte	0x2c8
	.byte	0x7
	.4byte	.LASF55
	.byte	0x9
	.byte	0x32
	.byte	0xf
	.4byte	0x95
	.byte	0x7
	.4byte	.LASF56
	.byte	0x9
	.byte	0x32
	.byte	0x27
	.4byte	0x95
	.byte	0x7
	.4byte	.LASF57
	.byte	0xa
	.byte	0x18
	.byte	0x13
	.4byte	0x2c8
	.byte	0x7
	.4byte	.LASF58
	.byte	0xa
	.byte	0x18
	.byte	0x2c
	.4byte	0x2c8
	.byte	0x7
	.4byte	.LASF59
	.byte	0xa
	.byte	0x19
	.byte	0x13
	.4byte	0x2c8
	.byte	0x7
	.4byte	.LASF60
	.byte	0xa
	.byte	0x19
	.byte	0x24
	.4byte	0x2c8
	.byte	0x7
	.4byte	.LASF61
	.byte	0xa
	.byte	0x1a
	.byte	0x13
	.4byte	0x2c8
	.byte	0x7
	.4byte	.LASF62
	.byte	0xa
	.byte	0x1b
	.byte	0x10
	.4byte	0x89
	.byte	0x7
	.4byte	.LASF63
	.byte	0xa
	.byte	0x1c
	.byte	0xc
	.4byte	0x47
	.byte	0x7
	.4byte	.LASF64
	.byte	0xa
	.byte	0x1d
	.byte	0xf
	.4byte	0x1f7
	.byte	0xf
	.4byte	.LASF70
	.byte	0x38
	.byte	0xa
	.byte	0x29
	.byte	0x8
	.4byte	0x3bb
	.byte	0x10
	.4byte	.LASF65
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x3bb
	.byte	0
	.byte	0x11
	.string	"end"
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x3bb
	.byte	0x8
	.byte	0x10
	.4byte	.LASF66
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x3bb
	.byte	0x10
	.byte	0x11
	.string	"ptr"
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x3bb
	.byte	0x18
	.byte	0x10
	.4byte	.LASF67
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x3bb
	.byte	0x20
	.byte	0x10
	.4byte	.LASF68
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x89
	.byte	0x28
	.byte	0x10
	.4byte	.LASF69
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x2c8
	.byte	0x7
	.4byte	.LASF70
	.byte	0xa
	.byte	0x2a
	.byte	0x22
	.4byte	0x352
	.byte	0xf
	.4byte	.LASF71
	.byte	0x10
	.byte	0xa
	.byte	0x2c
	.byte	0x8
	.4byte	0x3f5
	.byte	0x10
	.4byte	.LASF72
	.byte	0xa
	.byte	0x2d
	.byte	0x9
	.4byte	0x117
	.byte	0
	.byte	0x10
	.4byte	.LASF73
	.byte	0xa
	.byte	0x2e
	.byte	0xc
	.4byte	0x12f
	.byte	0x8
	.byte	0
	.byte	0xf
	.4byte	.LASF74
	.byte	0x38
	.byte	0xa
	.byte	0x31
	.byte	0x8
	.4byte	0x45e
	.byte	0x10
	.4byte	.LASF65
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x45e
	.byte	0
	.byte	0x11
	.string	"end"
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x45e
	.byte	0x8
	.byte	0x10
	.4byte	.LASF66
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x45e
	.byte	0x10
	.byte	0x11
	.string	"ptr"
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x45e
	.byte	0x18
	.byte	0x10
	.4byte	.LASF67
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x45e
	.byte	0x20
	.byte	0x10
	.4byte	.LASF68
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x89
	.byte	0x28
	.byte	0x10
	.4byte	.LASF69
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x3cd
	.byte	0x7
	.4byte	.LASF74
	.byte	0xa
	.byte	0x32
	.byte	0x27
	.4byte	0x3f5
	.byte	0xf
	.4byte	.LASF75
	.byte	0x18
	.byte	0xa
	.byte	0x34
	.byte	0x8
	.4byte	0x4a5
	.byte	0x10
	.4byte	.LASF76
	.byte	0xa
	.byte	0x35
	.byte	0x9
	.4byte	0x117
	.byte	0
	.byte	0x11
	.string	"mem"
	.byte	0xa
	.byte	0x36
	.byte	0xc
	.4byte	0x12f
	.byte	0x8
	.byte	0x11
	.string	"max"
	.byte	0xa
	.byte	0x37
	.byte	0xc
	.4byte	0x12f
	.byte	0x10
	.byte	0
	.byte	0xf
	.4byte	.LASF77
	.byte	0x38
	.byte	0xa
	.byte	0x3a
	.byte	0x8
	.4byte	0x50e
	.byte	0x10
	.4byte	.LASF65
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x50e
	.byte	0
	.byte	0x11
	.string	"end"
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x50e
	.byte	0x8
	.byte	0x10
	.4byte	.LASF66
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x50e
	.byte	0x10
	.byte	0x11
	.string	"ptr"
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x50e
	.byte	0x18
	.byte	0x10
	.4byte	.LASF67
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x50e
	.byte	0x20
	.byte	0x10
	.4byte	.LASF68
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x89
	.byte	0x28
	.byte	0x10
	.4byte	.LASF69
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x470
	.byte	0x7
	.4byte	.LASF77
	.byte	0xa
	.byte	0x3b
	.byte	0x25
	.4byte	0x4a5
	.byte	0x7
	.4byte	.LASF78
	.byte	0xb
	.byte	0x3f
	.byte	0x10
	.4byte	0x47
	.byte	0x7
	.4byte	.LASF79
	.byte	0xb
	.byte	0xb7
	.byte	0x10
	.4byte	0x7d
	.byte	0xf
	.4byte	.LASF80
	.byte	0x40
	.byte	0xb
	.byte	0xf3
	.byte	0x8
	.4byte	0x57a
	.byte	0x10
	.4byte	.LASF81
	.byte	0xb
	.byte	0xf4
	.byte	0x1d
	.4byte	0x57a
	.byte	0
	.byte	0x10
	.4byte	.LASF82
	.byte	0xb
	.byte	0xf5
	.byte	0xa
	.4byte	0x71
	.byte	0x8
	.byte	0x10
	.4byte	.LASF83
	.byte	0xb
	.byte	0xf6
	.byte	0xa
	.4byte	0x71
	.byte	0x10
	.byte	0x10
	.4byte	.LASF84
	.byte	0xb
	.byte	0xf7
	.byte	0xa
	.4byte	0x580
	.byte	0x18
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x538
	.byte	0x9
	.4byte	0x2c8
	.4byte	0x590
	.byte	0xd
	.4byte	0x40
	.byte	0x4
	.byte	0
	.byte	0x7
	.4byte	.LASF85
	.byte	0xb
	.byte	0xfa
	.byte	0x26
	.4byte	0x57a
	.byte	0x12
	.4byte	0x160
	.byte	0x1
	.byte	0x20
	.byte	0x5
	.byte	0x9
	.byte	0x3
	.8byte	caml_debugger_in_use
	.byte	0x12
	.4byte	0x178
	.byte	0x1
	.byte	0x21
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_event_count
	.byte	0x12
	.4byte	0x16c
	.byte	0x1
	.byte	0x22
	.byte	0x5
	.byte	0x9
	.byte	0x3
	.8byte	caml_debugger_fork_mode
	.byte	0x13
	.4byte	.LASF86
	.byte	0x1
	.byte	0x2e
	.byte	0x6
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.byte	0x14
	.4byte	.LASF92
	.byte	0x1
	.byte	0x2a
	.byte	0x6
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0x619
	.byte	0x15
	.4byte	.LASF93
	.byte	0x1
	.byte	0x2a
	.byte	0x24
	.4byte	0x184
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x13
	.4byte	.LASF87
	.byte	0x1
	.byte	0x26
	.byte	0x6
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
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
	.byte	0x9
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3e
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
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
	.byte	0xc
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
	.byte	0x2e
	.byte	0
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
	.byte	0x14
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
	.byte	0x15
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
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
.LASF67:
	.string	"limit"
.LASF29:
	.string	"EVENT_COUNT"
.LASF90:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF12:
	.string	"caml_timing_hook"
.LASF33:
	.string	"TRAP_BARRIER"
.LASF27:
	.string	"caml_debugger_fork_mode"
.LASF83:
	.string	"nitems"
.LASF61:
	.string	"caml_young_trigger"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF75:
	.string	"caml_custom_elt"
.LASF37:
	.string	"caml_gc_subphase"
.LASF32:
	.string	"PROGRAM_EXIT"
.LASF26:
	.string	"caml_debugger_in_use"
.LASF31:
	.string	"PROGRAM_START"
.LASF93:
	.string	"event"
.LASF88:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF21:
	.string	"value"
.LASF70:
	.string	"caml_ref_table"
.LASF46:
	.string	"caml_gc_sweep_hp"
.LASF15:
	.string	"caml_minor_gc_begin_hook"
.LASF63:
	.string	"caml_in_minor_collection"
.LASF58:
	.string	"caml_young_alloc_end"
.LASF85:
	.string	"caml_local_roots"
.LASF86:
	.string	"caml_debugger_cleanup_fork"
.LASF91:
	.string	"event_kind"
.LASF52:
	.string	"caml_major_gc_hook"
.LASF51:
	.string	"caml_gc_clock"
.LASF57:
	.string	"caml_young_alloc_start"
.LASF18:
	.string	"caml_finalise_end_hook"
.LASF2:
	.string	"long long int"
.LASF48:
	.string	"caml_major_ring"
.LASF66:
	.string	"threshold"
.LASF84:
	.string	"tables"
.LASF8:
	.string	"intnat"
.LASF0:
	.string	"long int"
.LASF73:
	.string	"offset"
.LASF69:
	.string	"reserve"
.LASF30:
	.string	"BREAKPOINT"
.LASF78:
	.string	"caml_huge_fallback_count"
.LASF76:
	.string	"block"
.LASF35:
	.string	"caml_fl_cur_wsz"
.LASF20:
	.string	"caml_runtime_warnings"
.LASF22:
	.string	"header_t"
.LASF14:
	.string	"caml_major_slice_end_hook"
.LASF24:
	.string	"caml_atom_table"
.LASF3:
	.string	"long double"
.LASF17:
	.string	"caml_finalise_begin_hook"
.LASF64:
	.string	"caml_extra_heap_resources_minor"
.LASF42:
	.string	"caml_dependent_allocated"
.LASF34:
	.string	"UNCAUGHT_EXC"
.LASF23:
	.string	"mlsize_t"
.LASF80:
	.string	"caml__roots_block"
.LASF9:
	.string	"uintnat"
.LASF54:
	.string	"caml_young_end"
.LASF4:
	.string	"unsigned int"
.LASF28:
	.string	"caml_event_count"
.LASF72:
	.string	"ephe"
.LASF13:
	.string	"caml_major_slice_begin_hook"
.LASF6:
	.string	"short unsigned int"
.LASF53:
	.string	"caml_young_start"
.LASF11:
	.string	"char"
.LASF49:
	.string	"caml_major_ring_index"
.LASF87:
	.string	"caml_debugger_init"
.LASF36:
	.string	"caml_gc_phase"
.LASF62:
	.string	"caml_minor_heap_wsz"
.LASF19:
	.string	"caml_verb_gc"
.LASF16:
	.string	"caml_minor_gc_end_hook"
.LASF47:
	.string	"caml_major_window"
.LASF1:
	.string	"long unsigned int"
.LASF89:
	.string	"debugger.c"
.LASF40:
	.string	"double"
.LASF25:
	.string	"caml_global_data"
.LASF68:
	.string	"size"
.LASF55:
	.string	"caml_code_area_start"
.LASF43:
	.string	"caml_fl_wsz_at_phase_change"
.LASF77:
	.string	"caml_custom_table"
.LASF92:
	.string	"caml_debugger"
.LASF56:
	.string	"caml_code_area_end"
.LASF39:
	.string	"caml_extra_heap_resources"
.LASF38:
	.string	"caml_allocated_words"
.LASF82:
	.string	"ntables"
.LASF41:
	.string	"caml_dependent_size"
.LASF44:
	.string	"caml_heap_start"
.LASF10:
	.string	"asize_t"
.LASF59:
	.string	"caml_young_ptr"
.LASF45:
	.string	"total_heap_size"
.LASF65:
	.string	"base"
.LASF50:
	.string	"caml_major_work_credit"
.LASF74:
	.string	"caml_ephe_ref_table"
.LASF71:
	.string	"caml_ephe_ref_elt"
.LASF60:
	.string	"caml_young_limit"
.LASF81:
	.string	"next"
.LASF79:
	.string	"caml_use_huge_pages"
	.ident	"GCC: (GNU) 9.2.0"
