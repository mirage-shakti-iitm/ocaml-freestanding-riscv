	.file	"main.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB8:
	.file 1 "main.c"
	.loc 1 38 1
	.cfi_startproc
.LVL0:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 44 3
	mv	a0,a1
.LVL1:
	call	caml_main
.LVL2:
	.loc 1 45 3
	li	a0,1
	call	caml_sys_exit
.LVL3:
	.loc 1 46 3
	.loc 1 47 1 is_stmt 0
	li	a0,0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
.Letext0:
	.file 2 "caml/config.h"
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 4 "caml/misc.h"
	.file 5 "caml/mlvalues.h"
	.file 6 "caml/sys.h"
	.file 7 "caml/freelist.h"
	.file 8 "caml/major_gc.h"
	.file 9 "caml/address_class.h"
	.file 10 "caml/minor_gc.h"
	.file 11 "caml/memory.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x5e9
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF83
	.byte	0xc
	.4byte	.LASF84
	.4byte	.LASF85
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
	.byte	0x4
	.4byte	.LASF7
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.4byte	0x42
	.byte	0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x3
	.byte	0x10
	.byte	0x4
	.4byte	.LASF9
	.byte	0x4
	.4byte	.LASF10
	.byte	0x4
	.byte	0x21
	.byte	0x10
	.4byte	0x6f
	.byte	0x5
	.byte	0x8
	.4byte	0x9b
	.byte	0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.byte	0x4
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
	.byte	0x4
	.4byte	.LASF19
	.byte	0x4
	.byte	0xcc
	.byte	0xe
	.4byte	0x9b
	.byte	0x8
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x169
	.byte	0x10
	.4byte	0x63
	.byte	0x8
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x171
	.byte	0x10
	.4byte	0x63
	.byte	0x4
	.4byte	.LASF22
	.byte	0x5
	.byte	0x3c
	.byte	0x10
	.4byte	0x57
	.byte	0x4
	.4byte	.LASF23
	.byte	0x5
	.byte	0x3d
	.byte	0x11
	.4byte	0x63
	.byte	0x4
	.4byte	.LASF24
	.byte	0x5
	.byte	0x3e
	.byte	0x11
	.4byte	0x63
	.byte	0x9
	.4byte	0x12f
	.4byte	0x152
	.byte	0xa
	.byte	0
	.byte	0x8
	.4byte	.LASF25
	.byte	0x5
	.2byte	0x15c
	.byte	0x15
	.4byte	0x147
	.byte	0x8
	.4byte	.LASF26
	.byte	0x5
	.2byte	0x171
	.byte	0xe
	.4byte	0x123
	.byte	0x7
	.4byte	.LASF27
	.byte	0x6
	.byte	0x25
	.byte	0x12
	.4byte	0x178
	.byte	0x5
	.byte	0x8
	.4byte	0xfd
	.byte	0x7
	.4byte	.LASF28
	.byte	0x7
	.byte	0x1a
	.byte	0x10
	.4byte	0x89
	.byte	0x7
	.4byte	.LASF29
	.byte	0x8
	.byte	0x24
	.byte	0xc
	.4byte	0x2d
	.byte	0x7
	.4byte	.LASF30
	.byte	0x8
	.byte	0x25
	.byte	0xc
	.4byte	0x2d
	.byte	0x7
	.4byte	.LASF31
	.byte	0x8
	.byte	0x26
	.byte	0x10
	.4byte	0x63
	.byte	0x7
	.4byte	.LASF32
	.byte	0x8
	.byte	0x27
	.byte	0xf
	.4byte	0x1ba
	.byte	0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF33
	.byte	0x7
	.4byte	.LASF34
	.byte	0x8
	.byte	0x28
	.byte	0x10
	.4byte	0x63
	.byte	0x7
	.4byte	.LASF35
	.byte	0x8
	.byte	0x28
	.byte	0x25
	.4byte	0x63
	.byte	0x7
	.4byte	.LASF36
	.byte	0x8
	.byte	0x29
	.byte	0x10
	.4byte	0x63
	.byte	0x7
	.4byte	.LASF37
	.byte	0x8
	.byte	0x3e
	.byte	0x12
	.4byte	0x95
	.byte	0x7
	.4byte	.LASF38
	.byte	0x8
	.byte	0x3f
	.byte	0x10
	.4byte	0x63
	.byte	0x7
	.4byte	.LASF39
	.byte	0x8
	.byte	0x40
	.byte	0xe
	.4byte	0x95
	.byte	0x7
	.4byte	.LASF40
	.byte	0x8
	.byte	0x42
	.byte	0xc
	.4byte	0x2d
	.byte	0x9
	.4byte	0x1ba
	.4byte	0x225
	.byte	0xb
	.4byte	0x42
	.byte	0x31
	.byte	0
	.byte	0xc
	.4byte	.LASF41
	.byte	0x8
	.byte	0x43
	.byte	0x8
	.4byte	0x215
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0xc
	.4byte	.LASF42
	.byte	0x8
	.byte	0x44
	.byte	0x5
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0xc
	.4byte	.LASF43
	.byte	0x8
	.byte	0x45
	.byte	0x8
	.4byte	0x1ba
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0x7
	.4byte	.LASF44
	.byte	0x8
	.byte	0x46
	.byte	0xf
	.4byte	0x1ba
	.byte	0x7
	.4byte	.LASF45
	.byte	0x8
	.byte	0x4a
	.byte	0x13
	.4byte	0xae
	.byte	0x7
	.4byte	.LASF46
	.byte	0x9
	.byte	0x31
	.byte	0xf
	.4byte	0x28b
	.byte	0x5
	.byte	0x8
	.4byte	0x123
	.byte	0x7
	.4byte	.LASF47
	.byte	0x9
	.byte	0x31
	.byte	0x22
	.4byte	0x28b
	.byte	0x7
	.4byte	.LASF48
	.byte	0x9
	.byte	0x32
	.byte	0xf
	.4byte	0x95
	.byte	0x7
	.4byte	.LASF49
	.byte	0x9
	.byte	0x32
	.byte	0x27
	.4byte	0x95
	.byte	0x7
	.4byte	.LASF50
	.byte	0xa
	.byte	0x18
	.byte	0x13
	.4byte	0x28b
	.byte	0x7
	.4byte	.LASF51
	.byte	0xa
	.byte	0x18
	.byte	0x2c
	.4byte	0x28b
	.byte	0x7
	.4byte	.LASF52
	.byte	0xa
	.byte	0x19
	.byte	0x13
	.4byte	0x28b
	.byte	0x7
	.4byte	.LASF53
	.byte	0xa
	.byte	0x19
	.byte	0x24
	.4byte	0x28b
	.byte	0x7
	.4byte	.LASF54
	.byte	0xa
	.byte	0x1a
	.byte	0x13
	.4byte	0x28b
	.byte	0x7
	.4byte	.LASF55
	.byte	0xa
	.byte	0x1b
	.byte	0x10
	.4byte	0x89
	.byte	0x7
	.4byte	.LASF56
	.byte	0xa
	.byte	0x1c
	.byte	0xc
	.4byte	0x2d
	.byte	0x7
	.4byte	.LASF57
	.byte	0xa
	.byte	0x1d
	.byte	0xf
	.4byte	0x1ba
	.byte	0xd
	.4byte	.LASF63
	.byte	0x38
	.byte	0xa
	.byte	0x29
	.byte	0x8
	.4byte	0x37e
	.byte	0xe
	.4byte	.LASF58
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x37e
	.byte	0
	.byte	0xf
	.string	"end"
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x37e
	.byte	0x8
	.byte	0xe
	.4byte	.LASF59
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x37e
	.byte	0x10
	.byte	0xf
	.string	"ptr"
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x37e
	.byte	0x18
	.byte	0xe
	.4byte	.LASF60
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x37e
	.byte	0x20
	.byte	0xe
	.4byte	.LASF61
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x89
	.byte	0x28
	.byte	0xe
	.4byte	.LASF62
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x28b
	.byte	0x7
	.4byte	.LASF63
	.byte	0xa
	.byte	0x2a
	.byte	0x22
	.4byte	0x315
	.byte	0xd
	.4byte	.LASF64
	.byte	0x10
	.byte	0xa
	.byte	0x2c
	.byte	0x8
	.4byte	0x3b8
	.byte	0xe
	.4byte	.LASF65
	.byte	0xa
	.byte	0x2d
	.byte	0x9
	.4byte	0x123
	.byte	0
	.byte	0xe
	.4byte	.LASF66
	.byte	0xa
	.byte	0x2e
	.byte	0xc
	.4byte	0x13b
	.byte	0x8
	.byte	0
	.byte	0xd
	.4byte	.LASF67
	.byte	0x38
	.byte	0xa
	.byte	0x31
	.byte	0x8
	.4byte	0x421
	.byte	0xe
	.4byte	.LASF58
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x421
	.byte	0
	.byte	0xf
	.string	"end"
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x421
	.byte	0x8
	.byte	0xe
	.4byte	.LASF59
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x421
	.byte	0x10
	.byte	0xf
	.string	"ptr"
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x421
	.byte	0x18
	.byte	0xe
	.4byte	.LASF60
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x421
	.byte	0x20
	.byte	0xe
	.4byte	.LASF61
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x89
	.byte	0x28
	.byte	0xe
	.4byte	.LASF62
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x390
	.byte	0x7
	.4byte	.LASF67
	.byte	0xa
	.byte	0x32
	.byte	0x27
	.4byte	0x3b8
	.byte	0xd
	.4byte	.LASF68
	.byte	0x18
	.byte	0xa
	.byte	0x34
	.byte	0x8
	.4byte	0x468
	.byte	0xe
	.4byte	.LASF69
	.byte	0xa
	.byte	0x35
	.byte	0x9
	.4byte	0x123
	.byte	0
	.byte	0xf
	.string	"mem"
	.byte	0xa
	.byte	0x36
	.byte	0xc
	.4byte	0x13b
	.byte	0x8
	.byte	0xf
	.string	"max"
	.byte	0xa
	.byte	0x37
	.byte	0xc
	.4byte	0x13b
	.byte	0x10
	.byte	0
	.byte	0xd
	.4byte	.LASF70
	.byte	0x38
	.byte	0xa
	.byte	0x3a
	.byte	0x8
	.4byte	0x4d1
	.byte	0xe
	.4byte	.LASF58
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4d1
	.byte	0
	.byte	0xf
	.string	"end"
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4d1
	.byte	0x8
	.byte	0xe
	.4byte	.LASF59
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4d1
	.byte	0x10
	.byte	0xf
	.string	"ptr"
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4d1
	.byte	0x18
	.byte	0xe
	.4byte	.LASF60
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4d1
	.byte	0x20
	.byte	0xe
	.4byte	.LASF61
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x89
	.byte	0x28
	.byte	0xe
	.4byte	.LASF62
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x433
	.byte	0x7
	.4byte	.LASF70
	.byte	0xa
	.byte	0x3b
	.byte	0x25
	.4byte	0x468
	.byte	0x7
	.4byte	.LASF71
	.byte	0xb
	.byte	0x3f
	.byte	0x10
	.4byte	0x2d
	.byte	0x7
	.4byte	.LASF72
	.byte	0xb
	.byte	0xb7
	.byte	0x10
	.4byte	0x63
	.byte	0xd
	.4byte	.LASF73
	.byte	0x40
	.byte	0xb
	.byte	0xf3
	.byte	0x8
	.4byte	0x53d
	.byte	0xe
	.4byte	.LASF74
	.byte	0xb
	.byte	0xf4
	.byte	0x1d
	.4byte	0x53d
	.byte	0
	.byte	0xe
	.4byte	.LASF75
	.byte	0xb
	.byte	0xf5
	.byte	0xa
	.4byte	0x57
	.byte	0x8
	.byte	0xe
	.4byte	.LASF76
	.byte	0xb
	.byte	0xf6
	.byte	0xa
	.4byte	0x57
	.byte	0x10
	.byte	0xe
	.4byte	.LASF77
	.byte	0xb
	.byte	0xf7
	.byte	0xa
	.4byte	0x543
	.byte	0x18
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x4fb
	.byte	0x9
	.4byte	0x28b
	.4byte	0x553
	.byte	0xb
	.4byte	0x42
	.byte	0x4
	.byte	0
	.byte	0x7
	.4byte	.LASF78
	.byte	0xb
	.byte	0xfa
	.byte	0x26
	.4byte	0x53d
	.byte	0x10
	.4byte	.LASF86
	.byte	0x1
	.byte	0x24
	.byte	0x5
	.4byte	0x2d
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0x5ce
	.byte	0x11
	.4byte	.LASF79
	.byte	0x1
	.byte	0x24
	.byte	0xe
	.4byte	0x2d
	.4byte	.LLST0
	.byte	0x11
	.4byte	.LASF80
	.byte	0x1
	.byte	0x24
	.byte	0x1b
	.4byte	0x5ce
	.4byte	.LLST1
	.byte	0x12
	.8byte	.LVL2
	.4byte	0x5d4
	.4byte	0x5ba
	.byte	0x13
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0x14
	.8byte	.LVL3
	.4byte	0x5e0
	.byte	0x13
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x95
	.byte	0x15
	.4byte	.LASF81
	.4byte	.LASF81
	.byte	0x1
	.byte	0x1d
	.byte	0x11
	.byte	0x15
	.4byte	.LASF82
	.4byte	.LASF82
	.byte	0x6
	.byte	0x21
	.byte	0x12
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
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
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
	.byte	0xd
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
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x12
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
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
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL1-.Ltext0
	.8byte	.LFE8-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL2-1-.Ltext0
	.8byte	.LFE8-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
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
.LASF60:
	.string	"limit"
.LASF50:
	.string	"caml_young_alloc_start"
.LASF85:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF12:
	.string	"caml_timing_hook"
.LASF54:
	.string	"caml_young_trigger"
.LASF3:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF68:
	.string	"caml_custom_elt"
.LASF30:
	.string	"caml_gc_subphase"
.LASF82:
	.string	"caml_sys_exit"
.LASF53:
	.string	"caml_young_limit"
.LASF86:
	.string	"main"
.LASF19:
	.string	"char_os"
.LASF51:
	.string	"caml_young_alloc_end"
.LASF83:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF22:
	.string	"value"
.LASF63:
	.string	"caml_ref_table"
.LASF39:
	.string	"caml_gc_sweep_hp"
.LASF15:
	.string	"caml_minor_gc_begin_hook"
.LASF56:
	.string	"caml_in_minor_collection"
.LASF78:
	.string	"caml_local_roots"
.LASF45:
	.string	"caml_major_gc_hook"
.LASF44:
	.string	"caml_gc_clock"
.LASF76:
	.string	"nitems"
.LASF18:
	.string	"caml_finalise_end_hook"
.LASF8:
	.string	"long long int"
.LASF41:
	.string	"caml_major_ring"
.LASF59:
	.string	"threshold"
.LASF77:
	.string	"tables"
.LASF5:
	.string	"intnat"
.LASF1:
	.string	"long int"
.LASF66:
	.string	"offset"
.LASF62:
	.string	"reserve"
.LASF71:
	.string	"caml_huge_fallback_count"
.LASF69:
	.string	"block"
.LASF28:
	.string	"caml_fl_cur_wsz"
.LASF21:
	.string	"caml_runtime_warnings"
.LASF23:
	.string	"header_t"
.LASF14:
	.string	"caml_major_slice_end_hook"
.LASF25:
	.string	"caml_atom_table"
.LASF9:
	.string	"long double"
.LASF17:
	.string	"caml_finalise_begin_hook"
.LASF57:
	.string	"caml_extra_heap_resources_minor"
.LASF35:
	.string	"caml_dependent_allocated"
.LASF79:
	.string	"argc"
.LASF24:
	.string	"mlsize_t"
.LASF73:
	.string	"caml__roots_block"
.LASF6:
	.string	"uintnat"
.LASF47:
	.string	"caml_young_end"
.LASF0:
	.string	"unsigned int"
.LASF80:
	.string	"argv"
.LASF65:
	.string	"ephe"
.LASF13:
	.string	"caml_major_slice_begin_hook"
.LASF4:
	.string	"short unsigned int"
.LASF46:
	.string	"caml_young_start"
.LASF11:
	.string	"char"
.LASF42:
	.string	"caml_major_ring_index"
.LASF29:
	.string	"caml_gc_phase"
.LASF55:
	.string	"caml_minor_heap_wsz"
.LASF20:
	.string	"caml_verb_gc"
.LASF16:
	.string	"caml_minor_gc_end_hook"
.LASF81:
	.string	"caml_main"
.LASF40:
	.string	"caml_major_window"
.LASF84:
	.string	"main.c"
.LASF2:
	.string	"long unsigned int"
.LASF48:
	.string	"caml_code_area_start"
.LASF33:
	.string	"double"
.LASF26:
	.string	"caml_global_data"
.LASF61:
	.string	"size"
.LASF36:
	.string	"caml_fl_wsz_at_phase_change"
.LASF70:
	.string	"caml_custom_table"
.LASF27:
	.string	"caml_exe_name"
.LASF49:
	.string	"caml_code_area_end"
.LASF32:
	.string	"caml_extra_heap_resources"
.LASF31:
	.string	"caml_allocated_words"
.LASF75:
	.string	"ntables"
.LASF34:
	.string	"caml_dependent_size"
.LASF37:
	.string	"caml_heap_start"
.LASF10:
	.string	"asize_t"
.LASF52:
	.string	"caml_young_ptr"
.LASF38:
	.string	"total_heap_size"
.LASF58:
	.string	"base"
.LASF43:
	.string	"caml_major_work_credit"
.LASF67:
	.string	"caml_ephe_ref_table"
.LASF64:
	.string	"caml_ephe_ref_elt"
.LASF74:
	.string	"next"
.LASF72:
	.string	"caml_use_huge_pages"
	.ident	"GCC: (GNU) 9.2.0"
