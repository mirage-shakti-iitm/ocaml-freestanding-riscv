	.file	"strrchr.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	strrchr
	.type	strrchr, @function
strrchr:
.LFB0:
	.file 1 "strrchr.c"
	.loc 1 18 1
	.cfi_startproc
.LVL0:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	mv	s0,a0
	.loc 1 19 3
	.loc 1 20 3
	andi	s1,a1,0xff
.LVL1:
	.loc 1 22 3
	.loc 1 22 6 is_stmt 0
	beq	s1,zero,.L7
	.loc 1 24 9
	li	s2,0
.LVL2:
.L2:
	.loc 1 25 9 is_stmt 1
	.loc 1 25 15 is_stmt 0
	mv	a1,s1
	mv	a0,s0
	call	strchr
.LVL3:
	.loc 1 25 9
	beq	a0,zero,.L1
	.loc 1 27 7 is_stmt 1
.LVL4:
	.loc 1 28 7
	.loc 1 28 9 is_stmt 0
	addi	s0,a0,1
.LVL5:
	.loc 1 27 13
	mv	s2,a0
	j	.L2
.LVL6:
.L7:
	.loc 1 23 5 is_stmt 1
	.loc 1 23 12 is_stmt 0
	call	strlen
.LVL7:
	add	s2,s0,a0
.L1:
	.loc 1 31 1
	mv	a0,s2
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
.LVL8:
	ld	s1,8(sp)
	.cfi_restore 9
.LVL9:
	ld	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	strrchr, .-strrchr
.Letext0:
	.file 2 "/home/sai/ocaml-freestanding-riscv/nolibc/include/string.h"
	.file 3 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xf6
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF4
	.byte	0xc
	.4byte	.LASF5
	.4byte	.LASF6
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF0
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF1
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x4
	.4byte	.LASF7
	.byte	0x2
	.byte	0x1a
	.byte	0x7
	.4byte	0xca
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0xca
	.byte	0x5
	.string	"s"
	.byte	0x1
	.byte	0x11
	.byte	0x1d
	.4byte	0xdc
	.4byte	.LLST0
	.byte	0x5
	.string	"c"
	.byte	0x1
	.byte	0x11
	.byte	0x24
	.4byte	0x3b
	.4byte	.LLST1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x13
	.byte	0xf
	.4byte	0xdc
	.4byte	.LLST2
	.byte	0x7
	.string	"p"
	.byte	0x1
	.byte	0x13
	.byte	0x17
	.4byte	0xdc
	.4byte	.LLST3
	.byte	0x8
	.8byte	.LVL3
	.4byte	0xe2
	.4byte	0xbc
	.byte	0x9
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x9
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0xa
	.8byte	.LVL7
	.4byte	0xee
	.byte	0
	.byte	0xb
	.byte	0x8
	.4byte	0xd0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.byte	0xc
	.4byte	0xd0
	.byte	0xb
	.byte	0x8
	.4byte	0xd7
	.byte	0xd
	.4byte	.LASF8
	.4byte	.LASF8
	.byte	0x2
	.byte	0x13
	.byte	0x7
	.byte	0xe
	.4byte	.LASF9
	.4byte	.LASF10
	.byte	0x3
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
	.byte	0xe
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
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x6
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x34
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
	.byte	0x8
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
	.byte	0x9
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0xe
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL9-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x7
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x5a
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
.LASF1:
	.string	"long unsigned int"
.LASF5:
	.string	"strrchr.c"
.LASF7:
	.string	"strrchr"
.LASF10:
	.string	"__builtin_strlen"
.LASF8:
	.string	"strchr"
.LASF2:
	.string	"found"
.LASF0:
	.string	"long int"
.LASF4:
	.string	"GNU C99 9.2.0 -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -O2 -Og -std=c99"
.LASF3:
	.string	"char"
.LASF9:
	.string	"strlen"
.LASF6:
	.string	"/home/sai/ocaml-freestanding-riscv/build/nolibc"
	.ident	"GCC: (GNU) 9.2.0"
