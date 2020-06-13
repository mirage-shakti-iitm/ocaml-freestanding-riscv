	.file	"vsnprintf.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.type	sn_write, @function
sn_write:
.LFB0:
	.file 1 "vsnprintf.c"
	.loc 1 8 1
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
	mv	s2,a2
	.loc 1 9 2
	.loc 1 9 14 is_stmt 0
	ld	s1,16(a0)
	.loc 1 9 24
	ld	a0,8(a0)
.LVL1:
	.loc 1 9 21
	sub	s1,s1,a0
.LVL2:
	.loc 1 10 2 is_stmt 1
	.loc 1 10 5 is_stmt 0
	bleu	s1,a2,.L2
	.loc 1 10 15
	mv	s1,a2
.LVL3:
.L2:
	.loc 1 11 2 is_stmt 1
	mv	a2,s1
.LVL4:
	call	memcpy
.LVL5:
	.loc 1 12 2
	.loc 1 12 10 is_stmt 0
	ld	a5,8(s0)
	add	s1,a5,s1
.LVL6:
	sd	s1,8(s0)
	.loc 1 14 2 is_stmt 1
	.loc 1 15 1 is_stmt 0
	mv	a0,s2
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
.LVL7:
	ld	s1,8(sp)
	.cfi_restore 9
	ld	s2,0(sp)
	.cfi_restore 18
.LVL8:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	sn_write, .-sn_write
	.align	1
	.globl	vsnprintf
	.type	vsnprintf, @function
vsnprintf:
.LFB1:
	.loc 1 18 1 is_stmt 1
	.cfi_startproc
.LVL9:
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	mv	a5,a1
	mv	a1,a2
.LVL10:
	mv	a2,a3
.LVL11:
	.loc 1 19 2
	.loc 1 20 2
	.loc 1 21 2
	.loc 1 21 7 is_stmt 0
	lla	a4,sn_write
	sd	a4,0(sp)
	.loc 1 23 2 is_stmt 1
	.loc 1 23 7 is_stmt 0
	addi	a3,a5,-1
.LVL12:
	.loc 1 23 5
	li	a4,-2147483648
	xori	a4,a4,-2
	bleu	a3,a4,.L6
	.loc 1 24 3 is_stmt 1
	.loc 1 24 6 is_stmt 0
	bne	a5,zero,.L11
	.loc 1 29 5
	li	a5,1
.LVL13:
	.loc 1 28 5
	addi	a0,sp,31
.LVL14:
.L6:
	.loc 1 33 2 is_stmt 1
	.loc 1 33 28 is_stmt 0
	not	s0,a0
	.loc 1 33 30
	addi	s0,s0,-1
	.loc 1 33 5
	bltu	s0,a5,.L8
	mv	s0,a5
.L8:
.LVL15:
	.loc 1 34 2 is_stmt 1
	.loc 1 34 9 is_stmt 0
	sd	a0,8(sp)
	.loc 1 35 2 is_stmt 1
	.loc 1 35 13 is_stmt 0
	add	a0,a0,s0
.LVL16:
	.loc 1 35 9
	sd	a0,16(sp)
	.loc 1 36 2 is_stmt 1
	.loc 1 36 6 is_stmt 0
	mv	a0,sp
	call	vfprintf
.LVL17:
	.loc 1 39 2 is_stmt 1
	.loc 1 39 5 is_stmt 0
	beq	s0,zero,.L7
	.loc 1 39 9 is_stmt 1 discriminator 1
	.loc 1 39 10 is_stmt 0 discriminator 1
	ld	a4,8(sp)
	.loc 1 39 29 discriminator 1
	ld	a5,16(sp)
	.loc 1 39 25 discriminator 1
	sub	a5,a4,a5
	seqz	a5,a5
	.loc 1 39 16 discriminator 1
	negw	a5,a5
	sext.w	a5,a5
	.loc 1 39 15 discriminator 1
	add	a5,a4,a5
	.loc 1 39 37 discriminator 1
	sb	zero,0(a5)
.LVL18:
.L7:
	.loc 1 41 1
	ld	ra,40(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.LVL19:
.L11:
	.cfi_restore_state
	.loc 1 25 4 is_stmt 1
	.loc 1 25 10 is_stmt 0
	li	a5,4
.LVL20:
	sw	a5,errno,a4
	.loc 1 26 4 is_stmt 1
	.loc 1 26 11 is_stmt 0
	li	a0,-1
.LVL21:
	j	.L7
	.cfi_endproc
.LFE1:
	.size	vsnprintf, .-vsnprintf
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stdarg.h"
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 4 "/home/sai/ocaml-freestanding-riscv/nolibc/include/stdio.h"
	.file 5 "/home/sai/ocaml-freestanding-riscv/nolibc/include/errno.h"
	.file 6 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x26a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF19
	.byte	0xc
	.4byte	.LASF20
	.4byte	.LASF21
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF0
	.byte	0x2
	.byte	0x28
	.byte	0x1b
	.4byte	0x39
	.byte	0x3
	.byte	0x8
	.4byte	.LASF22
	.byte	0x2
	.4byte	.LASF1
	.byte	0x2
	.byte	0x63
	.byte	0x18
	.4byte	0x2d
	.byte	0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF3
	.byte	0x2
	.4byte	.LASF2
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.4byte	0x5e
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF4
	.byte	0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x6
	.4byte	.LASF23
	.byte	0x18
	.byte	0x4
	.byte	0x8
	.byte	0x10
	.4byte	0xa1
	.byte	0x7
	.4byte	.LASF5
	.byte	0x4
	.byte	0x9
	.byte	0xe
	.4byte	0xd7
	.byte	0
	.byte	0x7
	.4byte	.LASF6
	.byte	0x4
	.byte	0xa
	.byte	0xb
	.4byte	0xdd
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0x4
	.byte	0xb
	.byte	0xb
	.4byte	0xdd
	.byte	0x10
	.byte	0
	.byte	0x8
	.4byte	0x52
	.4byte	0xba
	.byte	0x9
	.4byte	0xba
	.byte	0x9
	.4byte	0xc0
	.byte	0x9
	.4byte	0x52
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x6c
	.byte	0xa
	.byte	0x8
	.4byte	0xd2
	.byte	0xb
	.4byte	0xc0
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.byte	0xc
	.4byte	0xcb
	.byte	0xa
	.byte	0x8
	.4byte	0xa1
	.byte	0xa
	.byte	0x8
	.4byte	0xcb
	.byte	0xb
	.4byte	0xdd
	.byte	0x2
	.4byte	.LASF9
	.byte	0x4
	.byte	0xc
	.byte	0x3
	.4byte	0x6c
	.byte	0xd
	.4byte	.LASF10
	.byte	0x4
	.byte	0x11
	.byte	0xe
	.4byte	0x100
	.byte	0xa
	.byte	0x8
	.4byte	0xe8
	.byte	0xd
	.4byte	.LASF11
	.byte	0x4
	.byte	0x12
	.byte	0xe
	.4byte	0x100
	.byte	0xd
	.4byte	.LASF12
	.byte	0x4
	.byte	0x1c
	.byte	0xe
	.4byte	0x100
	.byte	0xd
	.4byte	.LASF13
	.byte	0x5
	.byte	0x4
	.byte	0xc
	.4byte	0x65
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.4byte	.LASF14
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.byte	0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF16
	.byte	0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF17
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF18
	.byte	0xe
	.4byte	.LASF24
	.byte	0x4
	.byte	0x16
	.byte	0x5
	.4byte	0x65
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x1e7
	.byte	0xf
	.string	"s"
	.byte	0x1
	.byte	0x11
	.byte	0x1e
	.4byte	0xe3
	.4byte	.LLST4
	.byte	0xf
	.string	"n"
	.byte	0x1
	.byte	0x11
	.byte	0x28
	.4byte	0x52
	.4byte	.LLST5
	.byte	0xf
	.string	"fmt"
	.byte	0x1
	.byte	0x11
	.byte	0x40
	.4byte	0xc6
	.4byte	.LLST6
	.byte	0xf
	.string	"ap"
	.byte	0x1
	.byte	0x11
	.byte	0x4d
	.4byte	0x3f
	.4byte	.LLST7
	.byte	0x10
	.string	"r"
	.byte	0x1
	.byte	0x13
	.byte	0x6
	.4byte	0x65
	.4byte	.LLST8
	.byte	0x11
	.string	"b"
	.byte	0x1
	.byte	0x14
	.byte	0x7
	.4byte	0xcb
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0x11
	.string	"f"
	.byte	0x1
	.byte	0x15
	.byte	0x7
	.4byte	0xe8
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x12
	.8byte	.LVL17
	.4byte	0x256
	.byte	0x13
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x72
	.byte	0
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LASF25
	.byte	0x1
	.byte	0x7
	.byte	0xf
	.4byte	0x52
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x256
	.byte	0xf
	.string	"f"
	.byte	0x1
	.byte	0x7
	.byte	0x1e
	.4byte	0x100
	.4byte	.LLST0
	.byte	0xf
	.string	"s"
	.byte	0x1
	.byte	0x7
	.byte	0x2d
	.4byte	0xc0
	.4byte	.LLST1
	.byte	0xf
	.string	"l"
	.byte	0x1
	.byte	0x7
	.byte	0x37
	.4byte	0x52
	.4byte	.LLST2
	.byte	0x10
	.string	"k"
	.byte	0x1
	.byte	0x9
	.byte	0x9
	.4byte	0x52
	.4byte	.LLST3
	.byte	0x12
	.8byte	.LVL5
	.4byte	0x262
	.byte	0x13
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0
	.byte	0x15
	.4byte	.LASF26
	.4byte	.LASF26
	.byte	0x4
	.byte	0x15
	.byte	0x5
	.byte	0x16
	.4byte	.LASF27
	.4byte	.LASF28
	.byte	0x6
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
	.byte	0x3
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0xe
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
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x5
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
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x8
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x37
	.byte	0
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
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x12
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
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
	.byte	0x2e
	.byte	0x1
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
	.byte	0x16
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
.LLST4:
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL17-1-.Ltext0
	.2byte	0x2
	.byte	0x91
	.byte	0x58
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL21-.Ltext0
	.8byte	.LFE1-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL10-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL13-.Ltext0
	.8byte	.LVL14-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL20-.Ltext0
	.8byte	.LFE1-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.byte	0x1
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL17-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL17-1-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	.LVL19-.Ltext0
	.8byte	.LFE1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL17-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL17-1-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5d
	.byte	0x9f
	.8byte	.LVL19-.Ltext0
	.8byte	.LFE1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL7-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL5-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL5-1-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL8-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x59
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
.LASF21:
	.string	"/home/sai/ocaml-freestanding-riscv/build/nolibc"
.LASF19:
	.string	"GNU C99 9.2.0 -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -O2 -Og -std=c99"
.LASF2:
	.string	"size_t"
.LASF11:
	.string	"stderr"
.LASF22:
	.string	"__builtin_va_list"
.LASF24:
	.string	"vsnprintf"
.LASF10:
	.string	"stdout"
.LASF25:
	.string	"sn_write"
.LASF13:
	.string	"errno"
.LASF9:
	.string	"FILE"
.LASF0:
	.string	"__gnuc_va_list"
.LASF15:
	.string	"unsigned char"
.LASF4:
	.string	"long unsigned int"
.LASF17:
	.string	"short unsigned int"
.LASF12:
	.string	"stdin"
.LASF5:
	.string	"write"
.LASF1:
	.string	"va_list"
.LASF7:
	.string	"wend"
.LASF20:
	.string	"vsnprintf.c"
.LASF18:
	.string	"unsigned int"
.LASF8:
	.string	"char"
.LASF26:
	.string	"vfprintf"
.LASF28:
	.string	"__builtin_memcpy"
.LASF27:
	.string	"memcpy"
.LASF16:
	.string	"short int"
.LASF23:
	.string	"_FILE"
.LASF3:
	.string	"long int"
.LASF6:
	.string	"wpos"
.LASF14:
	.string	"signed char"
	.ident	"GCC: (GNU) 9.2.0"
