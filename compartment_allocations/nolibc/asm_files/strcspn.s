	.file	"strcspn.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	strcspn
	.type	strcspn, @function
strcspn:
.LFB0:
	.file 1 "strcspn.c"
	.loc 1 37 1
	.cfi_startproc
.LVL0:
	.loc 1 38 5
	.loc 1 39 5
	.loc 1 39 12 is_stmt 0
	mv	a2,a0
.LVL1:
.L2:
	.loc 1 39 22 is_stmt 1 discriminator 1
	lbu	a3,0(a2)
	.loc 1 39 5 is_stmt 0 discriminator 1
	beq	a3,zero,.L8
	.loc 1 40 14
	mv	a4,a1
.L6:
.LVL2:
	.loc 1 40 23 is_stmt 1 discriminator 1
	lbu	a5,0(a4)
	.loc 1 40 7 is_stmt 0 discriminator 1
	beq	a5,zero,.L9
	.loc 1 41 9 is_stmt 1
	.loc 1 41 12 is_stmt 0
	beq	a5,a3,.L10
	.loc 1 40 32 is_stmt 1 discriminator 2
	.loc 1 40 33 is_stmt 0 discriminator 2
	addi	a4,a4,1
.LVL3:
	j	.L6
.L10:
	.loc 1 42 11 is_stmt 1
	.loc 1 42 19 is_stmt 0
	sub	a0,a2,a0
.LVL4:
	ret
.LVL5:
.L9:
	.loc 1 39 31 is_stmt 1 discriminator 2
	.loc 1 39 32 is_stmt 0 discriminator 2
	addi	a2,a2,1
.LVL6:
	j	.L2
.LVL7:
.L8:
	.loc 1 46 5 is_stmt 1
	.loc 1 46 13 is_stmt 0
	sub	a0,a2,a0
.LVL8:
	.loc 1 47 1
	ret
	.cfi_endproc
.LFE0:
	.size	strcspn, .-strcspn
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 3 "/home/sai/ocaml-freestanding-riscv/nolibc/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xba
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF5
	.byte	0xc
	.4byte	.LASF6
	.4byte	.LASF7
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF0
	.byte	0x3
	.4byte	.LASF8
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
	.4byte	.LASF9
	.byte	0x3
	.byte	0x1c
	.byte	0x8
	.4byte	0x34
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0xab
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x24
	.byte	0x1c
	.4byte	0xab
	.4byte	.LLST0
	.byte	0x7
	.4byte	.LASF3
	.byte	0x1
	.byte	0x24
	.byte	0x30
	.4byte	0xab
	.byte	0x1
	.byte	0x5b
	.byte	0x8
	.string	"p"
	.byte	0x1
	.byte	0x26
	.byte	0x11
	.4byte	0xab
	.4byte	.LLST1
	.byte	0x8
	.string	"s"
	.byte	0x1
	.byte	0x26
	.byte	0x15
	.4byte	0xab
	.4byte	.LLST2
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0xb8
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.byte	0xa
	.4byte	0xb1
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
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x8
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
	.byte	0x9
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL8-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL1-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5c
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
.LASF9:
	.string	"strcspn"
.LASF1:
	.string	"long unsigned int"
.LASF8:
	.string	"size_t"
.LASF6:
	.string	"strcspn.c"
.LASF4:
	.string	"char"
.LASF0:
	.string	"long int"
.LASF5:
	.string	"GNU C99 9.2.0 -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -O2 -Og -std=c99"
.LASF2:
	.string	"string"
.LASF3:
	.string	"chars"
.LASF7:
	.string	"/home/sai/ocaml-freestanding-riscv/build/nolibc"
	.ident	"GCC: (GNU) 9.2.0"
