	.file	"ctype.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	isalpha
	.type	isalpha, @function
isalpha:
.LFB0:
	.file 1 "ctype.c"
	.loc 1 4 1
	.cfi_startproc
.LVL0:
	.loc 1 5 5
	.loc 1 5 24 is_stmt 0
	ori	a0,a0,32
.LVL1:
	.loc 1 5 28
	addiw	a0,a0,-97
	.loc 1 6 1
	sltiu	a0,a0,26
	ret
	.cfi_endproc
.LFE0:
	.size	isalpha, .-isalpha
	.align	1
	.globl	isdigit
	.type	isdigit, @function
isdigit:
.LFB1:
	.loc 1 9 1 is_stmt 1
	.cfi_startproc
.LVL2:
	.loc 1 10 5
	.loc 1 10 23 is_stmt 0
	addiw	a0,a0,-48
.LVL3:
	.loc 1 11 1
	sltiu	a0,a0,10
	ret
	.cfi_endproc
.LFE1:
	.size	isdigit, .-isdigit
	.align	1
	.globl	isprint
	.type	isprint, @function
isprint:
.LFB2:
	.loc 1 14 1 is_stmt 1
	.cfi_startproc
.LVL4:
	.loc 1 15 5
	.loc 1 15 23 is_stmt 0
	addiw	a0,a0,-32
.LVL5:
	.loc 1 16 1
	sltiu	a0,a0,95
	ret
	.cfi_endproc
.LFE2:
	.size	isprint, .-isprint
	.align	1
	.globl	isspace
	.type	isspace, @function
isspace:
.LFB3:
	.loc 1 19 1 is_stmt 1
	.cfi_startproc
.LVL6:
	.loc 1 20 5
	.loc 1 20 21 is_stmt 0
	li	a5,32
	beq	a0,a5,.L6
	.loc 1 20 35 discriminator 2
	addiw	a0,a0,-9
.LVL7:
	.loc 1 20 21 discriminator 2
	li	a5,4
	bgtu	a0,a5,.L7
	.loc 1 20 21
	li	a0,1
	ret
.LVL8:
.L6:
	li	a0,1
.LVL9:
	ret
.L7:
	li	a0,0
	.loc 1 21 1
	ret
	.cfi_endproc
.LFE3:
	.size	isspace, .-isspace
	.align	1
	.globl	isupper
	.type	isupper, @function
isupper:
.LFB4:
	.loc 1 24 1 is_stmt 1
	.cfi_startproc
.LVL10:
	.loc 1 25 5
	.loc 1 25 23 is_stmt 0
	addiw	a0,a0,-65
.LVL11:
	.loc 1 26 1
	sltiu	a0,a0,26
	ret
	.cfi_endproc
.LFE4:
	.size	isupper, .-isupper
.Letext0:
	.file 2 "/home/sai/ocaml-freestanding-riscv/nolibc/include/ctype.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x122
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
	.4byte	.LASF0
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	0x5e
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x5e
	.byte	0x3
	.string	"c"
	.byte	0x1
	.byte	0x17
	.byte	0x11
	.4byte	0x5e
	.4byte	.LLST4
	.byte	0
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.4byte	.LASF1
	.byte	0x2
	.byte	0x7
	.byte	0x5
	.4byte	0x5e
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x96
	.byte	0x3
	.string	"c"
	.byte	0x1
	.byte	0x12
	.byte	0x11
	.4byte	0x5e
	.4byte	.LLST3
	.byte	0
	.byte	0x2
	.4byte	.LASF2
	.byte	0x2
	.byte	0x6
	.byte	0x5
	.4byte	0x5e
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0xc7
	.byte	0x3
	.string	"c"
	.byte	0x1
	.byte	0xd
	.byte	0x11
	.4byte	0x5e
	.4byte	.LLST2
	.byte	0
	.byte	0x2
	.4byte	.LASF3
	.byte	0x2
	.byte	0x5
	.byte	0x5
	.4byte	0x5e
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0xf8
	.byte	0x3
	.string	"c"
	.byte	0x1
	.byte	0x8
	.byte	0x11
	.4byte	0x5e
	.4byte	.LLST1
	.byte	0
	.byte	0x5
	.4byte	.LASF7
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	0x5e
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x3
	.string	"c"
	.byte	0x1
	.byte	0x3
	.byte	0x11
	.4byte	0x5e
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
	.byte	0x3
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
.LLST4:
	.8byte	.LVL10-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL11-.Ltext0
	.8byte	.LFE4-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL9-.Ltext0
	.8byte	.LFE3-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL5-.Ltext0
	.8byte	.LFE2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL3-.Ltext0
	.8byte	.LFE1-.Ltext0
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
	.8byte	.LFE0-.Ltext0
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
.LASF2:
	.string	"isprint"
.LASF5:
	.string	"ctype.c"
.LASF3:
	.string	"isdigit"
.LASF7:
	.string	"isalpha"
.LASF4:
	.string	"GNU C99 9.2.0 -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -O2 -Og -std=c99"
.LASF1:
	.string	"isspace"
.LASF0:
	.string	"isupper"
.LASF6:
	.string	"/home/sai/ocaml-freestanding-riscv/build/nolibc"
	.ident	"GCC: (GNU) 9.2.0"
