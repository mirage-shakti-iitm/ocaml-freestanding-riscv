	.file	"memcmp.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	memcmp
	.type	memcmp, @function
memcmp:
.LFB0:
	.file 1 "memcmp.c"
	.loc 1 4 1
	.cfi_startproc
.LVL0:
	.loc 1 5 2
	.loc 1 6 2
.L2:
	.loc 1 6 9 discriminator 1
	.loc 1 6 2 is_stmt 0 discriminator 1
	beq	a2,zero,.L3
	.loc 1 6 14 discriminator 2
	lbu	a4,0(a0)
	.loc 1 6 20 discriminator 2
	lbu	a5,0(a1)
	.loc 1 6 11 discriminator 2
	bne	a4,a5,.L3
	.loc 1 6 38 is_stmt 1 discriminator 3
	.loc 1 6 24 discriminator 3
	.loc 1 6 25 is_stmt 0 discriminator 3
	addi	a2,a2,-1
.LVL1:
	.loc 1 6 30 discriminator 3
	addi	a0,a0,1
.LVL2:
	.loc 1 6 35 discriminator 3
	addi	a1,a1,1
.LVL3:
	j	.L2
.L3:
	.loc 1 7 2 is_stmt 1
	.loc 1 7 19 is_stmt 0
	beq	a2,zero,.L6
	.loc 1 7 13 discriminator 1
	lbu	a0,0(a0)
.LVL4:
	.loc 1 7 16 discriminator 1
	lbu	a5,0(a1)
	.loc 1 7 19 discriminator 1
	subw	a0,a0,a5
	ret
.LVL5:
.L6:
	.loc 1 7 19
	li	a0,0
.LVL6:
	.loc 1 8 1
	ret
	.cfi_endproc
.LFE0:
	.size	memcmp, .-memcmp
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 3 "/home/sai/ocaml-freestanding-riscv/nolibc/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xc9
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF3
	.byte	0xc
	.4byte	.LASF4
	.4byte	.LASF5
	.4byte	.Ldebug_ranges0+0
	.8byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF0
	.byte	0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0xd1
	.byte	0x17
	.4byte	0x3c
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF1
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x5
	.4byte	.LASF7
	.byte	0x3
	.byte	0x6
	.byte	0x5
	.4byte	0x43
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0xb3
	.byte	0x6
	.string	"vl"
	.byte	0x1
	.byte	0x3
	.byte	0x18
	.4byte	0xb3
	.4byte	.LLST0
	.byte	0x6
	.string	"vr"
	.byte	0x1
	.byte	0x3
	.byte	0x28
	.4byte	0xb3
	.4byte	.LLST1
	.byte	0x6
	.string	"n"
	.byte	0x1
	.byte	0x3
	.byte	0x33
	.4byte	0x30
	.4byte	.LLST2
	.byte	0x7
	.string	"l"
	.byte	0x1
	.byte	0x5
	.byte	0x17
	.4byte	0xba
	.4byte	.LLST3
	.byte	0x8
	.string	"r"
	.byte	0x1
	.byte	0x5
	.byte	0x1e
	.4byte	0xba
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0xb9
	.byte	0xa
	.byte	0x9
	.byte	0x8
	.4byte	0xc7
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0xb
	.4byte	0xc0
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
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
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
	.byte	0x18
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
	.byte	0
	.byte	0
	.byte	0xb
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
	.8byte	.LVL0
	.8byte	.LVL0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL0
	.8byte	.LFE0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0
	.8byte	.LVL0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL0
	.8byte	.LFE0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL0
	.8byte	.LVL1
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL1
	.8byte	.LFE0
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL0
	.8byte	.LVL4
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL5
	.8byte	.LVL6
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
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.8byte	.Ltext0
	.8byte	.Letext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF7:
	.string	"memcmp"
.LASF1:
	.string	"long unsigned int"
.LASF6:
	.string	"size_t"
.LASF4:
	.string	"memcmp.c"
.LASF2:
	.string	"unsigned char"
.LASF0:
	.string	"long int"
.LASF3:
	.string	"GNU C99 9.2.0 -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -O2 -Og -std=c99"
.LASF5:
	.string	"/home/sai/ocaml-freestanding-riscv/build/nolibc"
	.ident	"GCC: (GNU) 9.2.0"
