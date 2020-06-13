	.file	"strtol.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	strtol
	.type	strtol, @function
strtol:
.LFB0:
	.file 1 "strtol.c"
	.loc 1 44 1
	.cfi_startproc
.LVL0:
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	sd	ra,88(sp)
	sd	s0,80(sp)
	sd	s1,72(sp)
	sd	s2,64(sp)
	sd	s3,56(sp)
	sd	s4,48(sp)
	sd	s5,40(sp)
	sd	s6,32(sp)
	sd	s7,24(sp)
	sd	s8,16(sp)
	sd	s9,8(sp)
	sd	s10,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	mv	s8,a0
	mv	s7,a1
	.loc 1 45 2
	.loc 1 46 2
	.loc 1 47 2
	.loc 1 48 2
	.loc 1 54 2
	.loc 1 54 5 is_stmt 0
	blt	a2,zero,.L2
	mv	s4,a2
	.loc 1 54 15 discriminator 1
	li	a5,1
	beq	a2,a5,.L2
	.loc 1 54 28 discriminator 2
	li	a5,36
	bgt	a2,a5,.L2
	.loc 1 66 4
	mv	s1,a0
.LVL1:
.L3:
	.loc 1 67 2 is_stmt 1 discriminator 1
	.loc 1 68 3 discriminator 1
	mv	s3,s1
	.loc 1 68 25 is_stmt 0 discriminator 1
	addi	s1,s1,1
.LVL2:
	.loc 1 68 5 discriminator 1
	lbu	s0,0(s3)
.LVL3:
	.loc 1 69 10 is_stmt 1 discriminator 1
	.loc 1 69 11 is_stmt 0 discriminator 1
	mv	a0,s0
	call	isspace
.LVL4:
	mv	s2,a0
	.loc 1 69 2 discriminator 1
	bne	a0,zero,.L3
	.loc 1 70 2 is_stmt 1
	.loc 1 70 5 is_stmt 0
	li	a5,45
	beq	s0,a5,.L33
	.loc 1 74 3 is_stmt 1
.LVL5:
	.loc 1 75 3
	.loc 1 75 6 is_stmt 0
	li	a5,43
	beq	s0,a5,.L34
	.loc 1 74 7
	mv	s6,a0
.LVL6:
.L7:
	.loc 1 78 2 is_stmt 1
	.loc 1 78 5 is_stmt 0
	beq	s4,zero,.L8
	.loc 1 78 17 discriminator 2
	li	a5,16
	bne	s4,a5,.L9
.L8:
	.loc 1 78 32 discriminator 3
	li	a5,48
	beq	s0,a5,.L35
.LVL7:
.L9:
	.loc 1 84 2 is_stmt 1
	.loc 1 84 5 is_stmt 0
	bne	s4,zero,.L11
	.loc 1 85 3 is_stmt 1
	.loc 1 85 23 is_stmt 0
	li	a5,48
	beq	s0,a5,.L36
	li	s4,10
.LVL8:
.L11:
	.loc 1 104 2 is_stmt 1
	.loc 1 104 26 is_stmt 0
	beq	s6,zero,.L30
	li	s5,-1
	slli	s5,s5,63
.L12:
.LVL9:
	.loc 1 105 2 is_stmt 1 discriminator 4
	.loc 1 105 18 is_stmt 0 discriminator 4
	mv	s10,s4
	rem	s9,s5,s4
	.loc 1 105 9 discriminator 4
	sext.w	s9,s9
.LVL10:
	.loc 1 106 2 is_stmt 1 discriminator 4
	.loc 1 106 9 is_stmt 0 discriminator 4
	div	s5,s5,s4
.LVL11:
	.loc 1 107 2 is_stmt 1 discriminator 4
	.loc 1 107 5 is_stmt 0 discriminator 4
	beq	s6,zero,.L13
	.loc 1 108 3 is_stmt 1
	.loc 1 108 6 is_stmt 0
	ble	s9,zero,.L14
	.loc 1 109 4 is_stmt 1
	.loc 1 109 11 is_stmt 0
	subw	s9,s9,s4
.LVL12:
	.loc 1 110 4 is_stmt 1
	.loc 1 110 11 is_stmt 0
	addi	s5,s5,1
.LVL13:
.L14:
	.loc 1 112 3 is_stmt 1
	.loc 1 112 10 is_stmt 0
	negw	s9,s9
.LVL14:
.L13:
	.loc 1 114 2 is_stmt 1
	.loc 1 114 11 is_stmt 0
	li	s3,0
	j	.L25
.LVL15:
.L2:
	.loc 1 55 3 is_stmt 1
	.loc 1 55 6 is_stmt 0
	beq	s7,zero,.L4
	.loc 1 56 4 is_stmt 1
	.loc 1 56 12 is_stmt 0
	sd	s8,0(s7)
.L4:
	.loc 1 57 3 is_stmt 1
	.loc 1 57 9 is_stmt 0
	li	a5,6
	sw	a5,errno,a4
	.loc 1 58 3 is_stmt 1
	.loc 1 58 10 is_stmt 0
	li	s3,0
.LVL16:
.L1:
	.loc 1 150 1
	mv	a0,s3
	ld	ra,88(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,80(sp)
	.cfi_restore 8
	ld	s1,72(sp)
	.cfi_restore 9
	ld	s2,64(sp)
	.cfi_restore 18
	ld	s3,56(sp)
	.cfi_restore 19
	ld	s4,48(sp)
	.cfi_restore 20
	ld	s5,40(sp)
	.cfi_restore 21
	ld	s6,32(sp)
	.cfi_restore 22
	ld	s7,24(sp)
	.cfi_restore 23
.LVL17:
	ld	s8,16(sp)
	.cfi_restore 24
	ld	s9,8(sp)
	.cfi_restore 25
	ld	s10,0(sp)
	.cfi_restore 26
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
.LVL18:
.L33:
	.cfi_restore_state
	.loc 1 71 3 is_stmt 1
	.loc 1 72 3
	.loc 1 72 5 is_stmt 0
	lbu	s0,0(s1)
.LVL19:
	.loc 1 72 9
	addi	s1,s3,2
.LVL20:
	.loc 1 71 7
	li	s6,1
	j	.L7
.LVL21:
.L34:
	.loc 1 76 4 is_stmt 1
	.loc 1 76 6 is_stmt 0
	lbu	s0,0(s1)
.LVL22:
	.loc 1 74 7
	mv	s6,a0
	.loc 1 76 10
	addi	s1,s3,2
.LVL23:
	j	.L7
.LVL24:
.L35:
	.loc 1 79 19
	lbu	a5,0(s1)
	.loc 1 79 15
	li	a4,120
	beq	a5,a4,.L10
	.loc 1 79 29 discriminator 1
	li	a4,88
	bne	a5,a4,.L9
.L10:
	.loc 1 80 3 is_stmt 1
	.loc 1 80 5 is_stmt 0
	lbu	s0,1(s1)
.LVL25:
	.loc 1 81 3 is_stmt 1
	.loc 1 81 5 is_stmt 0
	addi	s1,s1,2
.LVL26:
	.loc 1 82 3 is_stmt 1
	.loc 1 82 8 is_stmt 0
	li	s4,16
	j	.L9
.LVL27:
.L36:
	.loc 1 85 23
	li	s4,8
.LVL28:
	j	.L11
.LVL29:
.L30:
	.loc 1 104 26
	li	s5,-1
	srli	s5,s5,1
	j	.L12
.LVL30:
.L15:
	.loc 1 117 8 is_stmt 1
	.loc 1 117 12 is_stmt 0
	mv	a0,s0
	call	isalpha
.LVL31:
	.loc 1 117 11
	beq	a0,zero,.L17
	.loc 1 118 4 is_stmt 1
	.loc 1 118 9 is_stmt 0
	mv	a0,s0
	call	isupper
.LVL32:
	.loc 1 118 31
	beq	a0,zero,.L31
	li	a5,55
.L18:
	.loc 1 118 6 discriminator 4
	subw	s0,s0,a5
.LVL33:
	j	.L16
.LVL34:
.L31:
	.loc 1 118 31
	li	a5,87
	j	.L18
.L37:
	.loc 1 126 39 discriminator 2
	ble	s0,s9,.L22
.L21:
	.loc 1 127 5 is_stmt 1
.LVL35:
	.loc 1 128 5
	.loc 1 129 5
	.loc 1 129 11 is_stmt 0
	li	a5,2
	sw	a5,errno,a4
	.loc 1 127 9
	li	s2,-1
	.loc 1 128 9
	slli	s3,s2,63
.LVL36:
.L19:
	.loc 1 114 26 is_stmt 1
	.loc 1 114 28 is_stmt 0
	lbu	s0,0(s1)
.LVL37:
	.loc 1 114 24 is_stmt 1
	.loc 1 114 48 is_stmt 0
	addi	s1,s1,1
.LVL38:
.L25:
	.loc 1 115 3 is_stmt 1
	.loc 1 115 7 is_stmt 0
	addiw	a5,s0,-48
	.loc 1 115 6
	li	a4,9
	bgtu	a5,a4,.L15
	.loc 1 116 4 is_stmt 1
	.loc 1 116 6 is_stmt 0
	mv	s0,a5
.LVL39:
.L16:
	.loc 1 121 3 is_stmt 1
	.loc 1 121 6 is_stmt 0
	ble	s4,s0,.L17
	.loc 1 123 3 is_stmt 1
	.loc 1 123 6 is_stmt 0
	blt	s2,zero,.L19
	.loc 1 125 3 is_stmt 1
	.loc 1 125 6 is_stmt 0
	beq	s6,zero,.L20
	.loc 1 126 4 is_stmt 1
	.loc 1 126 7 is_stmt 0
	blt	s3,s5,.L21
	.loc 1 126 21 discriminator 1
	beq	s3,s5,.L37
.L22:
	.loc 1 131 5 is_stmt 1
.LVL40:
	.loc 1 132 5
	.loc 1 132 9 is_stmt 0
	mul	s3,s10,s3
.LVL41:
	.loc 1 133 5 is_stmt 1
	.loc 1 133 9 is_stmt 0
	sub	s3,s3,s0
.LVL42:
	.loc 1 131 9
	mv	s2,s6
	j	.L19
.LVL43:
.L20:
	.loc 1 136 4 is_stmt 1
	.loc 1 136 7 is_stmt 0
	bgt	s3,s5,.L23
	.loc 1 136 21 discriminator 1
	beq	s3,s5,.L38
.L24:
	.loc 1 141 5 is_stmt 1
.LVL44:
	.loc 1 142 5
	.loc 1 142 9 is_stmt 0
	mul	s3,s10,s3
.LVL45:
	.loc 1 143 5 is_stmt 1
	.loc 1 143 9 is_stmt 0
	add	s3,s0,s3
.LVL46:
	.loc 1 141 9
	li	s2,1
	j	.L19
.LVL47:
.L38:
	.loc 1 136 39 discriminator 2
	ble	s0,s9,.L24
.L23:
	.loc 1 137 5 is_stmt 1
.LVL48:
	.loc 1 138 5
	.loc 1 139 5
	.loc 1 139 11 is_stmt 0
	li	a5,2
	sw	a5,errno,a4
	.loc 1 137 9
	li	s2,-1
	.loc 1 138 9
	srli	s3,s2,1
	.loc 1 139 11
	j	.L19
.LVL49:
.L17:
	.loc 1 147 2 is_stmt 1
	.loc 1 147 5 is_stmt 0
	beq	s7,zero,.L1
	.loc 1 148 3 is_stmt 1
	.loc 1 148 11 is_stmt 0
	beq	s2,zero,.L26
	.loc 1 148 11 discriminator 1
	addi	s8,s1,-1
.LVL50:
.L26:
	.loc 1 148 11 discriminator 4
	sd	s8,0(s7)
	j	.L1
	.cfi_endproc
.LFE0:
	.size	strtol, .-strtol
.Letext0:
	.file 2 "/home/sai/ocaml-freestanding-riscv/nolibc/include/ctype.h"
	.file 3 "/home/sai/ocaml-freestanding-riscv/nolibc/include/errno.h"
	.file 4 "/home/sai/ocaml-freestanding-riscv/nolibc/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x190
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF11
	.byte	0xc
	.4byte	.LASF12
	.4byte	.LASF13
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF14
	.byte	0x3
	.byte	0x4
	.byte	0xc
	.4byte	0x39
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF0
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF1
	.byte	0x5
	.4byte	.LASF15
	.byte	0x4
	.byte	0x10
	.byte	0x6
	.4byte	0x40
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x151
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x2b
	.byte	0x14
	.4byte	0x151
	.4byte	.LLST0
	.byte	0x6
	.4byte	.LASF3
	.byte	0x1
	.byte	0x2b
	.byte	0x21
	.4byte	0x163
	.4byte	.LLST1
	.byte	0x6
	.4byte	.LASF4
	.byte	0x1
	.byte	0x2b
	.byte	0x2d
	.4byte	0x39
	.4byte	.LLST2
	.byte	0x7
	.string	"s"
	.byte	0x1
	.byte	0x2d
	.byte	0xe
	.4byte	0x151
	.4byte	.LLST3
	.byte	0x7
	.string	"acc"
	.byte	0x1
	.byte	0x2e
	.byte	0x7
	.4byte	0x40
	.4byte	.LLST4
	.byte	0x8
	.4byte	.LASF5
	.byte	0x1
	.byte	0x2e
	.byte	0xc
	.4byte	0x40
	.4byte	.LLST5
	.byte	0x7
	.string	"c"
	.byte	0x1
	.byte	0x2f
	.byte	0x6
	.4byte	0x39
	.4byte	.LLST6
	.byte	0x7
	.string	"neg"
	.byte	0x1
	.byte	0x30
	.byte	0x6
	.4byte	0x39
	.4byte	.LLST7
	.byte	0x7
	.string	"any"
	.byte	0x1
	.byte	0x30
	.byte	0xb
	.4byte	0x39
	.4byte	.LLST8
	.byte	0x8
	.4byte	.LASF6
	.byte	0x1
	.byte	0x30
	.byte	0x10
	.4byte	0x39
	.4byte	.LLST9
	.byte	0x9
	.8byte	.LVL4
	.4byte	0x16f
	.4byte	0x124
	.byte	0xa
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x9
	.8byte	.LVL31
	.4byte	0x17b
	.4byte	0x13c
	.byte	0xa
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0xb
	.8byte	.LVL32
	.4byte	0x187
	.byte	0xa
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x15e
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF7
	.byte	0xd
	.4byte	0x157
	.byte	0xc
	.byte	0x8
	.4byte	0x169
	.byte	0xc
	.byte	0x8
	.4byte	0x157
	.byte	0xe
	.4byte	.LASF8
	.4byte	.LASF8
	.byte	0x2
	.byte	0x7
	.byte	0x5
	.byte	0xe
	.4byte	.LASF9
	.4byte	.LASF9
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.byte	0xe
	.4byte	.LASF10
	.4byte	.LASF10
	.byte	0x2
	.byte	0x8
	.byte	0x5
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
	.byte	0x9
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
	.byte	0xa
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.8byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x68
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL50-.Ltext0
	.2byte	0x1
	.byte	0x68
	.8byte	.LVL50-.Ltext0
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
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x67
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x67
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL18-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x67
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	.LVL26-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x2
	.byte	0x40
	.byte	0x9f
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	.LVL29-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x3
	.byte	0x83
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL23-.Ltext0
	.2byte	0x3
	.byte	0x83
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL36-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x3
	.byte	0x79
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL38-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL35-.Ltext0
	.8byte	.LVL36-.Ltext0
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.8byte	0x8000000000000000
	.8byte	.LVL36-.Ltext0
	.8byte	.LVL48-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL48-.Ltext0
	.8byte	.LVL49-.Ltext0
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.8byte	0x7fffffffffffffff
	.8byte	.LVL49-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	.LVL30-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL34-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL24-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL24-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL35-.Ltext0
	.8byte	.LVL36-.Ltext0
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.8byte	.LVL36-.Ltext0
	.8byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL40-.Ltext0
	.8byte	.LVL43-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	.LVL43-.Ltext0
	.8byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL44-.Ltext0
	.8byte	.LVL47-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	.LVL47-.Ltext0
	.8byte	.LVL48-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL48-.Ltext0
	.8byte	.LVL49-.Ltext0
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.8byte	.LVL49-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL10-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x69
	.8byte	.LVL13-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x69
	.8byte	.LVL30-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x69
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
.LASF15:
	.string	"strtol"
.LASF12:
	.string	"strtol.c"
.LASF9:
	.string	"isalpha"
.LASF8:
	.string	"isspace"
.LASF5:
	.string	"cutoff"
.LASF2:
	.string	"nptr"
.LASF3:
	.string	"endptr"
.LASF14:
	.string	"errno"
.LASF10:
	.string	"isupper"
.LASF0:
	.string	"long int"
.LASF4:
	.string	"base"
.LASF1:
	.string	"long unsigned int"
.LASF11:
	.string	"GNU C99 9.2.0 -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -O2 -Og -std=c99"
.LASF6:
	.string	"cutlim"
.LASF13:
	.string	"/home/sai/ocaml-freestanding-riscv/build/nolibc"
.LASF7:
	.string	"char"
	.ident	"GCC: (GNU) 9.2.0"
