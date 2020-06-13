	.file	"strstr.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.type	twobyte_strstr, @function
twobyte_strstr:
.LFB0:
	.file 1 "strstr.c"
	.loc 1 5 1
	.cfi_startproc
.LVL0:
	.loc 1 6 2
	.loc 1 6 17 is_stmt 0
	lbu	a5,0(a1)
	.loc 1 6 20
	slliw	a5,a5,8
	.loc 1 6 27
	lbu	a1,1(a1)
.LVL1:
	.loc 1 6 11
	or	a1,a1,a5
.LVL2:
	.loc 1 6 38
	lbu	a5,0(a0)
	.loc 1 6 41
	slliw	a4,a5,8
	.loc 1 6 48
	lbu	a5,1(a0)
	.loc 1 6 32
	or	a5,a5,a4
.LVL3:
	.loc 1 7 2 is_stmt 1
	.loc 1 7 8 is_stmt 0
	addi	a0,a0,1
.LVL4:
.L2:
	.loc 1 7 12 is_stmt 1 discriminator 1
	lbu	a3,0(a0)
	.loc 1 7 2 is_stmt 0 discriminator 1
	beq	a3,zero,.L3
	.loc 1 7 15 discriminator 3
	sext.w	a4,a5
	sext.w	a2,a1
	beq	a4,a2,.L3
	.loc 1 7 46 is_stmt 1 discriminator 4
	.loc 1 7 28 discriminator 4
	.loc 1 7 35 is_stmt 0 discriminator 4
	slli	a5,a5,8
.LVL5:
	.loc 1 7 31 discriminator 4
	addi	a0,a0,1
.LVL6:
	.loc 1 7 41 discriminator 4
	lbu	a4,0(a0)
	.loc 1 7 39 discriminator 4
	or	a5,a4,a5
	.loc 1 7 31 discriminator 4
	slli	a5,a5,48
	srli	a5,a5,48
.LVL7:
	j	.L2
.L3:
	.loc 1 8 2 is_stmt 1
	.loc 1 8 26 is_stmt 0
	beq	a3,zero,.L6
	.loc 1 8 26 discriminator 1
	addi	a0,a0,-1
.LVL8:
	ret
.LVL9:
.L6:
	.loc 1 8 26
	li	a0,0
.LVL10:
	.loc 1 9 1
	ret
	.cfi_endproc
.LFE0:
	.size	twobyte_strstr, .-twobyte_strstr
	.align	1
	.type	threebyte_strstr, @function
threebyte_strstr:
.LFB1:
	.loc 1 12 1 is_stmt 1
	.cfi_startproc
.LVL11:
	.loc 1 13 2
	.loc 1 13 17 is_stmt 0
	lbu	a3,0(a1)
	.loc 1 13 20
	slliw	a3,a3,24
	.loc 1 13 28
	lbu	a5,1(a1)
	.loc 1 13 31
	slliw	a5,a5,16
	.loc 1 13 25
	or	a3,a3,a5
	.loc 1 13 39
	lbu	a5,2(a1)
	.loc 1 13 42
	slliw	a5,a5,8
	.loc 1 13 11
	or	a3,a3,a5
.LVL12:
	.loc 1 14 2 is_stmt 1
	.loc 1 14 17 is_stmt 0
	lbu	a5,0(a0)
	.loc 1 14 20
	slliw	a5,a5,24
	.loc 1 14 28
	lbu	a4,1(a0)
	.loc 1 14 31
	slliw	a4,a4,16
	.loc 1 14 25
	or	a5,a5,a4
	.loc 1 14 39
	lbu	a4,2(a0)
	.loc 1 14 42
	slliw	a4,a4,8
	.loc 1 14 11
	or	a5,a5,a4
.LVL13:
	.loc 1 15 2 is_stmt 1
	.loc 1 15 8 is_stmt 0
	addi	a0,a0,2
.LVL14:
.L8:
	.loc 1 15 13 is_stmt 1 discriminator 1
	lbu	a4,0(a0)
	.loc 1 15 2 is_stmt 0 discriminator 1
	beq	a4,zero,.L9
	.loc 1 15 16 discriminator 3
	beq	a5,a3,.L9
	.loc 1 15 47 is_stmt 1 discriminator 4
	.loc 1 15 29 discriminator 4
	.loc 1 15 32 is_stmt 0 discriminator 4
	addi	a0,a0,1
.LVL15:
	.loc 1 15 38 discriminator 4
	lbu	a4,0(a0)
	.loc 1 15 37 discriminator 4
	or	a5,a5,a4
.LVL16:
	.loc 1 15 32 discriminator 4
	slliw	a5,a5,8
	j	.L8
.LVL17:
.L9:
	.loc 1 16 2 is_stmt 1
	.loc 1 16 26 is_stmt 0
	beq	a4,zero,.L12
	.loc 1 16 26 discriminator 1
	addi	a0,a0,-2
.LVL18:
	ret
.LVL19:
.L12:
	.loc 1 16 26
	li	a0,0
.LVL20:
	.loc 1 17 1
	ret
	.cfi_endproc
.LFE1:
	.size	threebyte_strstr, .-threebyte_strstr
	.align	1
	.type	fourbyte_strstr, @function
fourbyte_strstr:
.LFB2:
	.loc 1 20 1 is_stmt 1
	.cfi_startproc
.LVL21:
	.loc 1 21 2
	.loc 1 21 17 is_stmt 0
	lbu	a3,0(a1)
	.loc 1 21 20
	slliw	a3,a3,24
	.loc 1 21 28
	lbu	a5,1(a1)
	.loc 1 21 31
	slliw	a5,a5,16
	.loc 1 21 25
	or	a3,a3,a5
	.loc 1 21 39
	lbu	a5,2(a1)
	.loc 1 21 42
	slliw	a5,a5,8
	.loc 1 21 36
	or	a3,a3,a5
	.loc 1 21 49
	lbu	a5,3(a1)
	.loc 1 21 11
	or	a3,a3,a5
.LVL22:
	.loc 1 22 2 is_stmt 1
	.loc 1 22 17 is_stmt 0
	lbu	a5,0(a0)
	.loc 1 22 20
	slliw	a5,a5,24
	.loc 1 22 28
	lbu	a4,1(a0)
	.loc 1 22 31
	slliw	a4,a4,16
	.loc 1 22 25
	or	a5,a5,a4
	.loc 1 22 39
	lbu	a4,2(a0)
	.loc 1 22 42
	slliw	a4,a4,8
	.loc 1 22 36
	or	a5,a5,a4
	.loc 1 22 49
	lbu	a4,3(a0)
	.loc 1 22 11
	or	a5,a5,a4
.LVL23:
	.loc 1 23 2 is_stmt 1
	.loc 1 23 8 is_stmt 0
	addi	a0,a0,3
.LVL24:
.L14:
	.loc 1 23 13 is_stmt 1 discriminator 1
	lbu	a4,0(a0)
	.loc 1 23 2 is_stmt 0 discriminator 1
	beq	a4,zero,.L15
	.loc 1 23 16 discriminator 3
	beq	a5,a3,.L15
	.loc 1 23 47 is_stmt 1 discriminator 4
	.loc 1 23 29 discriminator 4
	.loc 1 23 36 is_stmt 0 discriminator 4
	slliw	a5,a5,8
.LVL25:
	.loc 1 23 32 discriminator 4
	addi	a0,a0,1
.LVL26:
	.loc 1 23 42 discriminator 4
	lbu	a4,0(a0)
	.loc 1 23 32 discriminator 4
	or	a5,a5,a4
	sext.w	a5,a5
.LVL27:
	j	.L14
.L15:
	.loc 1 24 2 is_stmt 1
	.loc 1 24 26 is_stmt 0
	beq	a4,zero,.L18
	.loc 1 24 26 discriminator 1
	addi	a0,a0,-3
.LVL28:
	ret
.LVL29:
.L18:
	.loc 1 24 26
	li	a0,0
.LVL30:
	.loc 1 25 1
	ret
	.cfi_endproc
.LFE2:
	.size	fourbyte_strstr, .-fourbyte_strstr
	.align	1
	.type	twoway_strstr, @function
twoway_strstr:
.LFB3:
	.loc 1 34 1 is_stmt 1
	.cfi_startproc
.LVL31:
	addi	sp,sp,-160
	.cfi_def_cfa_offset 160
	sd	ra,152(sp)
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	s9,72(sp)
	addi	sp,sp,-2032
	.cfi_def_cfa_offset 2192
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
	mv	s0,a0
	mv	s2,a1
	.loc 1 35 2
	.loc 1 36 2
	.loc 1 37 2
	.loc 1 37 9 is_stmt 0
	li	a5,4096
	addi	a4,a5,-2048
	addi	a3,sp,16
	add	a4,a4,a3
	sd	zero,0(a4)
	addi	a4,a5,-2040
	add	a4,a4,a3
	sd	zero,0(a4)
	addi	a4,a5,-2032
	add	a4,a4,a3
	sd	zero,0(a4)
	addi	a5,a5,-2024
	add	a5,a5,a3
	sd	zero,0(a5)
	.loc 1 38 2 is_stmt 1
	.loc 1 41 2
.LVL32:
	.loc 1 41 8 is_stmt 0
	li	s1,0
	.loc 1 41 2
	j	.L20
.LVL33:
.L22:
	.loc 1 42 3 is_stmt 1 discriminator 4
	srli	a4,a5,6
	li	a3,1
	sll	a2,a3,a5
	slli	a4,a4,3
	li	a1,4096
	addi	a3,a1,-2016
	addi	a0,sp,16
	add	a3,a3,a0
	add	a4,a3,a4
	ld	a3,-32(a4)
	or	a3,a3,a2
	sd	a3,-32(a4)
	.loc 1 42 44 is_stmt 0 discriminator 4
	addi	s1,s1,1
.LVL34:
	.loc 1 42 41 discriminator 4
	li	a4,-4096
	slli	a5,a5,3
	addi	a3,a1,-2016
	add	a3,a3,a0
	add	a4,a3,a4
	sd	a4,8(sp)
	add	a5,a4,a5
	sd	s1,2016(a5)
	.loc 1 41 26 is_stmt 1 discriminator 4
.LVL35:
.L20:
	.loc 1 41 12 discriminator 1
	.loc 1 41 13 is_stmt 0 discriminator 1
	add	a5,s2,s1
	lbu	a5,0(a5)
	.loc 1 41 2 discriminator 1
	beq	a5,zero,.L21
	.loc 1 41 21 discriminator 3
	add	a4,s0,s1
	lbu	a4,0(a4)
	.loc 1 41 17 discriminator 3
	bne	a4,zero,.L22
.L21:
	.loc 1 43 2 is_stmt 1
	.loc 1 43 5 is_stmt 0
	bne	a5,zero,.L53
	.loc 1 46 25
	li	s5,1
	.loc 1 46 21
	li	a3,1
	.loc 1 46 14
	li	a2,0
	.loc 1 46 5
	li	s6,-1
	j	.L24
.LVL36:
.L61:
	.loc 1 49 4 is_stmt 1
	.loc 1 49 7 is_stmt 0
	beq	a3,s5,.L59
	.loc 1 52 11 is_stmt 1
	.loc 1 52 12 is_stmt 0
	addi	a3,a3,1
.LVL37:
	j	.L24
.L59:
	.loc 1 50 5 is_stmt 1
	.loc 1 50 8 is_stmt 0
	add	a2,a2,s5
.LVL38:
	.loc 1 51 5 is_stmt 1
	.loc 1 51 7 is_stmt 0
	li	a3,1
	j	.L24
.LVL39:
.L28:
	.loc 1 58 4 is_stmt 1
	.loc 1 59 4
	.loc 1 58 7 is_stmt 0
	mv	s6,a2
	.loc 1 58 11
	addi	a2,a2,1
.LVL40:
	.loc 1 59 10
	li	s5,1
	.loc 1 59 6
	li	a3,1
.LVL41:
.L24:
	.loc 1 47 8 is_stmt 1
	.loc 1 47 11 is_stmt 0
	add	a4,a2,a3
	.loc 1 47 8
	bgeu	a4,s1,.L60
	.loc 1 48 3 is_stmt 1
	.loc 1 48 11 is_stmt 0
	add	a5,s6,a3
	.loc 1 48 8
	add	a5,s2,a5
	lbu	a1,0(a5)
	.loc 1 48 19
	add	a5,s2,a4
	lbu	a5,0(a5)
	.loc 1 48 6
	beq	a1,a5,.L61
	.loc 1 53 10 is_stmt 1
	.loc 1 53 13 is_stmt 0
	bleu	a1,a5,.L28
	.loc 1 54 4 is_stmt 1
.LVL42:
	.loc 1 55 4
	.loc 1 56 4
	.loc 1 56 6 is_stmt 0
	sub	s5,a4,s6
.LVL43:
	.loc 1 54 7
	mv	a2,a4
	.loc 1 55 6
	li	a3,1
	j	.L24
.LVL44:
.L60:
	.loc 1 66 25
	li	a6,1
	.loc 1 66 21
	li	a3,1
.LVL45:
	.loc 1 66 14
	li	a2,0
.LVL46:
	.loc 1 66 5
	li	a0,-1
	j	.L30
.LVL47:
.L64:
	.loc 1 69 4 is_stmt 1
	.loc 1 69 7 is_stmt 0
	beq	a3,a6,.L62
	.loc 1 72 11 is_stmt 1
	.loc 1 72 12 is_stmt 0
	addi	a3,a3,1
.LVL48:
	j	.L30
.L62:
	.loc 1 70 5 is_stmt 1
	.loc 1 70 8 is_stmt 0
	add	a2,a2,a6
.LVL49:
	.loc 1 71 5 is_stmt 1
	.loc 1 71 7 is_stmt 0
	li	a3,1
	j	.L30
.LVL50:
.L34:
	.loc 1 78 4 is_stmt 1
	.loc 1 79 4
	.loc 1 78 7 is_stmt 0
	mv	a0,a2
	.loc 1 78 11
	addi	a2,a2,1
.LVL51:
	.loc 1 79 10
	li	a6,1
	.loc 1 79 6
	li	a3,1
.LVL52:
.L30:
	.loc 1 67 8 is_stmt 1
	.loc 1 67 11 is_stmt 0
	add	a4,a2,a3
	.loc 1 67 8
	bgeu	a4,s1,.L63
	.loc 1 68 3 is_stmt 1
	.loc 1 68 11 is_stmt 0
	add	a5,a0,a3
	.loc 1 68 8
	add	a5,s2,a5
	lbu	a1,0(a5)
	.loc 1 68 19
	add	a5,s2,a4
	lbu	a5,0(a5)
	.loc 1 68 6
	beq	a1,a5,.L64
	.loc 1 73 10 is_stmt 1
	.loc 1 73 13 is_stmt 0
	bgeu	a1,a5,.L34
	.loc 1 74 4 is_stmt 1
.LVL53:
	.loc 1 75 4
	.loc 1 76 4
	.loc 1 76 6 is_stmt 0
	sub	a6,a4,a0
.LVL54:
	.loc 1 74 7
	mv	a2,a4
	.loc 1 75 6
	li	a3,1
	j	.L30
.LVL55:
.L63:
	.loc 1 82 2 is_stmt 1
	.loc 1 82 8 is_stmt 0
	addi	a5,a0,1
	.loc 1 82 15
	addi	a4,s6,1
	.loc 1 82 5
	bleu	a5,a4,.L36
	.loc 1 82 22
	mv	s6,a0
	.loc 1 82 5
	mv	s5,a6
.L36:
.LVL56:
	.loc 1 86 2 is_stmt 1
	.loc 1 86 6 is_stmt 0
	addi	s4,s6,1
	mv	a2,s4
.LVL57:
	add	a1,s2,s5
	mv	a0,s2
.LVL58:
	call	memcmp
.LVL59:
	.loc 1 86 5
	beq	a0,zero,.L37
	.loc 1 87 3 is_stmt 1
.LVL60:
	.loc 1 88 3
	.loc 1 88 7 is_stmt 0
	sub	s5,s1,s6
.LVL61:
	addi	s5,s5,-1
	bgeu	s5,s6,.L38
	mv	s5,s6
.L38:
	.loc 1 88 5
	addi	s5,s5,1
.LVL62:
	.loc 1 87 8
	li	s7,0
.LVL63:
.L39:
	.loc 1 90 2 is_stmt 1
	.loc 1 93 2
	.loc 1 93 4 is_stmt 0
	mv	s3,s0
	.loc 1 90 6
	li	s8,0
	j	.L40
.LVL64:
.L37:
	.loc 1 89 9 is_stmt 1
	.loc 1 89 14 is_stmt 0
	sub	s7,s1,s5
.LVL65:
	j	.L39
.LVL66:
.L42:
.LBB2:
	.loc 1 105 11 is_stmt 1
	.loc 1 105 13 is_stmt 0
	add	s3,s3,s9
.LVL67:
	j	.L41
.LVL68:
.L45:
.LBE2:
	.loc 1 114 5 is_stmt 1
	.loc 1 114 7 is_stmt 0
	add	s0,s0,a2
.LVL69:
	.loc 1 115 5 is_stmt 1
	.loc 1 116 5
	.loc 1 115 9 is_stmt 0
	li	s8,0
.LVL70:
.L40:
	.loc 1 96 2 is_stmt 1
	.loc 1 98 3
	.loc 1 98 8 is_stmt 0
	sub	a5,s3,s0
	.loc 1 98 6
	bgeu	a5,s1,.L41
.LBB3:
	.loc 1 100 4 is_stmt 1
	.loc 1 100 11 is_stmt 0
	ori	s9,s1,63
.LVL71:
	.loc 1 101 4 is_stmt 1
	.loc 1 101 30 is_stmt 0
	mv	a2,s9
	li	a1,0
	mv	a0,s3
	call	memchr
.LVL72:
	.loc 1 102 4 is_stmt 1
	.loc 1 102 7 is_stmt 0
	beq	a0,zero,.L42
	.loc 1 103 5 is_stmt 1
.LVL73:
	.loc 1 104 5
	.loc 1 104 10 is_stmt 0
	sub	a5,a0,s0
	.loc 1 104 8
	bltu	a5,s1,.L54
	.loc 1 103 7
	mv	s3,a0
.LVL74:
.L41:
.LBE3:
	.loc 1 109 3 is_stmt 1
	.loc 1 109 7 is_stmt 0
	add	a5,s0,s1
	lbu	a4,-1(a5)
	srli	a5,a4,6
	slli	a5,a5,3
	li	a2,4096
	addi	a3,a2,-2016
	addi	a1,sp,16
	add	a3,a3,a1
	add	a5,a3,a5
	ld	a5,-32(a5)
	srl	a5,a5,a4
	andi	a5,a5,1
	.loc 1 109 6
	beq	a5,zero,.L43
	.loc 1 110 4 is_stmt 1
	.loc 1 110 15 is_stmt 0
	li	a5,-4096
	slli	a4,a4,3
	addi	a3,a2,-2016
	add	a3,a3,a1
	add	a5,a3,a5
	sd	a5,8(sp)
	add	a4,a5,a4
	ld	a5,2016(a4)
	.loc 1 110 6
	sub	a2,s1,a5
.LVL75:
	.loc 1 112 4 is_stmt 1
	.loc 1 112 7 is_stmt 0
	beq	s1,a5,.L44
	.loc 1 113 5 is_stmt 1
	.loc 1 113 8 is_stmt 0
	beq	s7,zero,.L45
	.loc 1 113 14 discriminator 1
	beq	s8,zero,.L45
	.loc 1 113 21 discriminator 2
	bleu	s5,a2,.L45
	.loc 1 113 31 is_stmt 1 discriminator 3
	.loc 1 113 33 is_stmt 0 discriminator 3
	sub	a2,s1,s5
.LVL76:
	j	.L45
.LVL77:
.L43:
	.loc 1 119 4 is_stmt 1
	.loc 1 119 6 is_stmt 0
	add	s0,s0,s1
.LVL78:
	.loc 1 120 4 is_stmt 1
	.loc 1 121 4
	.loc 1 120 8 is_stmt 0
	mv	s8,a5
	.loc 1 121 4
	j	.L40
.LVL79:
.L44:
	.loc 1 125 3 is_stmt 1
	.loc 1 125 9 is_stmt 0
	mv	a5,s4
	bgeu	s4,s8,.L48
	mv	a5,s8
.LVL80:
	.loc 1 125 3
	j	.L48
.L50:
	.loc 1 125 51 is_stmt 1 discriminator 4
	.loc 1 125 47 discriminator 4
	.loc 1 125 48 is_stmt 0 discriminator 4
	addi	a5,a5,1
.LVL81:
.L48:
	.loc 1 125 25 is_stmt 1 discriminator 1
	.loc 1 125 26 is_stmt 0 discriminator 1
	add	a4,s2,a5
	lbu	a4,0(a4)
	.loc 1 125 3 discriminator 1
	beq	a4,zero,.L49
	.loc 1 125 42 discriminator 3
	add	a3,s0,a5
	lbu	a3,0(a3)
	.loc 1 125 30 discriminator 3
	beq	a4,a3,.L50
.L49:
	.loc 1 126 3 is_stmt 1
	.loc 1 126 6 is_stmt 0
	beq	a4,zero,.L55
	.loc 1 127 4 is_stmt 1
	.loc 1 127 10 is_stmt 0
	sub	a5,a5,s6
.LVL82:
	.loc 1 127 6
	add	s0,s0,a5
.LVL83:
	.loc 1 128 4 is_stmt 1
	.loc 1 129 4
	.loc 1 128 8 is_stmt 0
	mv	s8,a2
	.loc 1 129 4
	j	.L40
.LVL84:
.L55:
	.loc 1 132 9
	mv	a4,s4
	j	.L51
.LVL85:
.L56:
	.loc 1 132 44
	mv	a4,a5
.LVL86:
.L51:
	.loc 1 132 16 is_stmt 1 discriminator 1
	.loc 1 132 3 is_stmt 0 discriminator 1
	bleu	a4,s8,.L52
	.loc 1 132 26 discriminator 3
	addi	a5,a4,-1
	add	a3,s2,a5
	lbu	a2,0(a3)
	.loc 1 132 36 discriminator 3
	add	a3,s0,a5
	lbu	a3,0(a3)
	.loc 1 132 22 discriminator 3
	beq	a2,a3,.L56
.L52:
	.loc 1 133 3 is_stmt 1
	.loc 1 133 6 is_stmt 0
	bleu	a4,s8,.L57
	.loc 1 134 3 is_stmt 1
	.loc 1 134 5 is_stmt 0
	add	s0,s0,s5
.LVL87:
	.loc 1 135 3 is_stmt 1
	.loc 1 135 7 is_stmt 0
	mv	s8,s7
	j	.L40
.LVL88:
.L53:
	.loc 1 43 19
	li	a0,0
	j	.L19
.LVL89:
.L54:
.LBB4:
	.loc 1 104 25
	li	a0,0
.LVL90:
.L19:
.LBE4:
	.loc 1 137 1
	addi	sp,sp,2032
	.cfi_remember_state
	.cfi_def_cfa_offset 160
	ld	ra,152(sp)
	.cfi_restore 1
	ld	s0,144(sp)
	.cfi_restore 8
.LVL91:
	ld	s1,136(sp)
	.cfi_restore 9
.LVL92:
	ld	s2,128(sp)
	.cfi_restore 18
.LVL93:
	ld	s3,120(sp)
	.cfi_restore 19
	ld	s4,112(sp)
	.cfi_restore 20
	ld	s5,104(sp)
	.cfi_restore 21
	ld	s6,96(sp)
	.cfi_restore 22
	ld	s7,88(sp)
	.cfi_restore 23
	ld	s8,80(sp)
	.cfi_restore 24
	ld	s9,72(sp)
	.cfi_restore 25
	addi	sp,sp,160
	.cfi_def_cfa_offset 0
	jr	ra
.LVL94:
.L57:
	.cfi_restore_state
	.loc 1 133 24
	mv	a0,s0
	j	.L19
	.cfi_endproc
.LFE3:
	.size	twoway_strstr, .-twoway_strstr
	.align	1
	.globl	strstr
	.type	strstr, @function
strstr:
.LFB4:
	.loc 1 140 1 is_stmt 1
	.cfi_startproc
.LVL95:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	mv	s0,a1
	.loc 1 142 2
	.loc 1 142 8 is_stmt 0
	lbu	a1,0(a1)
.LVL96:
	.loc 1 142 5
	beq	a1,zero,.L65
	.loc 1 145 2 is_stmt 1
	.loc 1 145 6 is_stmt 0
	call	strchr
.LVL97:
	.loc 1 146 2 is_stmt 1
	.loc 1 146 5 is_stmt 0
	beq	a0,zero,.L65
	.loc 1 146 14 discriminator 2
	lbu	a5,1(s0)
	.loc 1 146 9 discriminator 2
	beq	a5,zero,.L65
	.loc 1 147 2 is_stmt 1
	.loc 1 147 8 is_stmt 0
	lbu	a5,1(a0)
	.loc 1 147 5
	beq	a5,zero,.L71
	.loc 1 148 2 is_stmt 1
	.loc 1 148 8 is_stmt 0
	lbu	a5,2(s0)
	.loc 1 148 5
	beq	a5,zero,.L75
	.loc 1 149 2 is_stmt 1
	.loc 1 149 8 is_stmt 0
	lbu	a5,2(a0)
	.loc 1 149 5
	beq	a5,zero,.L72
	.loc 1 150 2 is_stmt 1
	.loc 1 150 8 is_stmt 0
	lbu	a5,3(s0)
	.loc 1 150 5
	beq	a5,zero,.L76
	.loc 1 151 2 is_stmt 1
	.loc 1 151 8 is_stmt 0
	lbu	a5,3(a0)
	.loc 1 151 5
	beq	a5,zero,.L73
	.loc 1 152 2 is_stmt 1
	.loc 1 152 8 is_stmt 0
	lbu	a5,4(s0)
	.loc 1 152 5
	beq	a5,zero,.L77
	.loc 1 154 2 is_stmt 1
	.loc 1 154 9 is_stmt 0
	mv	a1,s0
	call	twoway_strstr
.LVL98:
.L65:
	.loc 1 155 1
	ld	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
.LVL99:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL100:
.L75:
	.cfi_restore_state
	.loc 1 148 13 is_stmt 1 discriminator 1
	.loc 1 148 20 is_stmt 0 discriminator 1
	mv	a1,s0
	call	twobyte_strstr
.LVL101:
	j	.L65
.LVL102:
.L76:
	.loc 1 150 13 is_stmt 1 discriminator 1
	.loc 1 150 20 is_stmt 0 discriminator 1
	mv	a1,s0
	call	threebyte_strstr
.LVL103:
	j	.L65
.LVL104:
.L77:
	.loc 1 152 13 is_stmt 1 discriminator 1
	.loc 1 152 20 is_stmt 0 discriminator 1
	mv	a1,s0
	call	fourbyte_strstr
.LVL105:
	j	.L65
.LVL106:
.L71:
	.loc 1 147 20
	li	a0,0
.LVL107:
	j	.L65
.LVL108:
.L72:
	.loc 1 149 20
	li	a0,0
.LVL109:
	j	.L65
.LVL110:
.L73:
	.loc 1 151 20
	li	a0,0
.LVL111:
	j	.L65
	.cfi_endproc
.LFE4:
	.size	strstr, .-strstr
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/riscv64-unknown-elf/include/machine/_default_types.h"
	.file 4 "/home/sai/Shakti-TEE-Build/riscv/riscv64-unknown-elf/include/sys/_stdint.h"
	.file 5 "/home/sai/ocaml-freestanding-riscv/nolibc/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x420
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF24
	.byte	0xc
	.4byte	.LASF25
	.4byte	.LASF26
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF0
	.byte	0x3
	.4byte	.LASF5
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
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.byte	0x5
	.4byte	0x55
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.byte	0x3
	.4byte	.LASF6
	.byte	0x3
	.byte	0x39
	.byte	0x19
	.4byte	0x74
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x3
	.4byte	.LASF8
	.byte	0x3
	.byte	0x4f
	.byte	0x19
	.4byte	0x87
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.byte	0x3
	.4byte	.LASF10
	.byte	0x4
	.byte	0x24
	.byte	0x14
	.4byte	0x68
	.byte	0x3
	.4byte	.LASF11
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x7b
	.byte	0x6
	.4byte	.LASF27
	.byte	0x5
	.byte	0x14
	.byte	0x7
	.4byte	0x15a
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x15a
	.byte	0x7
	.string	"h"
	.byte	0x1
	.byte	0x8b
	.byte	0x1a
	.4byte	0x16c
	.4byte	.LLST20
	.byte	0x7
	.string	"n"
	.byte	0x1
	.byte	0x8b
	.byte	0x29
	.4byte	0x16c
	.4byte	.LLST21
	.byte	0x8
	.8byte	.LVL97
	.4byte	0x3ff
	.4byte	0xfd
	.byte	0x9
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x8
	.8byte	.LVL98
	.4byte	0x172
	.4byte	0x115
	.byte	0x9
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x8
	.8byte	.LVL101
	.4byte	0x3a4
	.4byte	0x12d
	.byte	0x9
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x8
	.8byte	.LVL103
	.4byte	0x34b
	.4byte	0x145
	.byte	0x9
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0xa
	.8byte	.LVL105
	.4byte	0x2f2
	.byte	0x9
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x8
	.4byte	0x160
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.byte	0x5
	.4byte	0x160
	.byte	0xb
	.byte	0x8
	.4byte	0x167
	.byte	0xc
	.4byte	.LASF17
	.byte	0x1
	.byte	0x21
	.byte	0xe
	.4byte	0x15a
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x2cc
	.byte	0x7
	.string	"h"
	.byte	0x1
	.byte	0x21
	.byte	0x31
	.4byte	0x2cc
	.4byte	.LLST7
	.byte	0x7
	.string	"n"
	.byte	0x1
	.byte	0x21
	.byte	0x49
	.4byte	0x2cc
	.4byte	.LLST8
	.byte	0xd
	.string	"z"
	.byte	0x1
	.byte	0x23
	.byte	0x17
	.4byte	0x2cc
	.4byte	.LLST9
	.byte	0xd
	.string	"l"
	.byte	0x1
	.byte	0x24
	.byte	0x9
	.4byte	0x34
	.4byte	.LLST10
	.byte	0xd
	.string	"ip"
	.byte	0x1
	.byte	0x24
	.byte	0xc
	.4byte	0x34
	.4byte	.LLST11
	.byte	0xd
	.string	"jp"
	.byte	0x1
	.byte	0x24
	.byte	0x10
	.4byte	0x34
	.4byte	.LLST12
	.byte	0xd
	.string	"k"
	.byte	0x1
	.byte	0x24
	.byte	0x14
	.4byte	0x34
	.4byte	.LLST13
	.byte	0xd
	.string	"p"
	.byte	0x1
	.byte	0x24
	.byte	0x17
	.4byte	0x34
	.4byte	.LLST14
	.byte	0xd
	.string	"ms"
	.byte	0x1
	.byte	0x24
	.byte	0x1a
	.4byte	0x34
	.4byte	.LLST15
	.byte	0xe
	.string	"p0"
	.byte	0x1
	.byte	0x24
	.byte	0x1e
	.4byte	0x34
	.byte	0xd
	.string	"mem"
	.byte	0x1
	.byte	0x24
	.byte	0x22
	.4byte	0x34
	.4byte	.LLST16
	.byte	0xf
	.4byte	.LASF13
	.byte	0x1
	.byte	0x24
	.byte	0x27
	.4byte	0x34
	.4byte	.LLST17
	.byte	0x10
	.4byte	.LASF14
	.byte	0x1
	.byte	0x25
	.byte	0x9
	.4byte	0x2d2
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0x10
	.4byte	.LASF15
	.byte	0x1
	.byte	0x26
	.byte	0x9
	.4byte	0x2e2
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x6f
	.byte	0x11
	.4byte	.Ldebug_ranges0+0
	.4byte	0x2a8
	.byte	0xf
	.4byte	.LASF16
	.byte	0x1
	.byte	0x64
	.byte	0xb
	.4byte	0x34
	.4byte	.LLST18
	.byte	0xd
	.string	"z2"
	.byte	0x1
	.byte	0x65
	.byte	0x19
	.4byte	0x2cc
	.4byte	.LLST19
	.byte	0xa
	.8byte	.LVL72
	.4byte	0x40b
	.byte	0x9
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0x9
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x9
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x89
	.byte	0
	.byte	0
	.byte	0
	.byte	0xa
	.8byte	.LVL59
	.4byte	0x417
	.byte	0x9
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0x9
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.byte	0x82
	.byte	0
	.byte	0x85
	.byte	0
	.byte	0x22
	.byte	0x9
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x84
	.byte	0
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x8
	.4byte	0x5c
	.byte	0x12
	.4byte	0x34
	.4byte	0x2e2
	.byte	0x13
	.4byte	0x40
	.byte	0x3
	.byte	0
	.byte	0x12
	.4byte	0x34
	.4byte	0x2f2
	.byte	0x13
	.4byte	0x40
	.byte	0xff
	.byte	0
	.byte	0xc
	.4byte	.LASF18
	.byte	0x1
	.byte	0x13
	.byte	0xe
	.4byte	0x15a
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x34b
	.byte	0x7
	.string	"h"
	.byte	0x1
	.byte	0x13
	.byte	0x33
	.4byte	0x2cc
	.4byte	.LLST5
	.byte	0x14
	.string	"n"
	.byte	0x1
	.byte	0x13
	.byte	0x4b
	.4byte	0x2cc
	.byte	0x1
	.byte	0x5b
	.byte	0x15
	.string	"nw"
	.byte	0x1
	.byte	0x15
	.byte	0xb
	.4byte	0x9a
	.byte	0x1
	.byte	0x5d
	.byte	0xd
	.string	"hw"
	.byte	0x1
	.byte	0x16
	.byte	0xb
	.4byte	0x9a
	.4byte	.LLST6
	.byte	0
	.byte	0xc
	.4byte	.LASF19
	.byte	0x1
	.byte	0xb
	.byte	0xe
	.4byte	0x15a
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x3a4
	.byte	0x7
	.string	"h"
	.byte	0x1
	.byte	0xb
	.byte	0x34
	.4byte	0x2cc
	.4byte	.LLST3
	.byte	0x14
	.string	"n"
	.byte	0x1
	.byte	0xb
	.byte	0x4c
	.4byte	0x2cc
	.byte	0x1
	.byte	0x5b
	.byte	0x15
	.string	"nw"
	.byte	0x1
	.byte	0xd
	.byte	0xb
	.4byte	0x9a
	.byte	0x1
	.byte	0x5d
	.byte	0xd
	.string	"hw"
	.byte	0x1
	.byte	0xe
	.byte	0xb
	.4byte	0x9a
	.4byte	.LLST4
	.byte	0
	.byte	0xc
	.4byte	.LASF20
	.byte	0x1
	.byte	0x4
	.byte	0xe
	.4byte	0x15a
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x3ff
	.byte	0x7
	.string	"h"
	.byte	0x1
	.byte	0x4
	.byte	0x32
	.4byte	0x2cc
	.4byte	.LLST0
	.byte	0x7
	.string	"n"
	.byte	0x1
	.byte	0x4
	.byte	0x4a
	.4byte	0x2cc
	.4byte	.LLST1
	.byte	0x15
	.string	"nw"
	.byte	0x1
	.byte	0x6
	.byte	0xb
	.4byte	0x8e
	.byte	0x1
	.byte	0x5b
	.byte	0xd
	.string	"hw"
	.byte	0x1
	.byte	0x6
	.byte	0x20
	.4byte	0x8e
	.4byte	.LLST2
	.byte	0
	.byte	0x16
	.4byte	.LASF21
	.4byte	.LASF21
	.byte	0x5
	.byte	0x13
	.byte	0x7
	.byte	0x16
	.4byte	.LASF22
	.4byte	.LASF22
	.byte	0x5
	.byte	0x7
	.byte	0x7
	.byte	0x16
	.4byte	.LASF23
	.4byte	.LASF23
	.byte	0x5
	.byte	0x6
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x1
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
	.byte	0xd
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
	.byte	0xe
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
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST20:
	.8byte	.LVL95-.Ltext0
	.8byte	.LVL97-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL97-1-.Ltext0
	.8byte	.LVL97-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL97-.Ltext0
	.8byte	.LVL98-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL100-.Ltext0
	.8byte	.LVL101-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL102-.Ltext0
	.8byte	.LVL103-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL104-.Ltext0
	.8byte	.LVL105-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL106-.Ltext0
	.8byte	.LVL107-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL108-.Ltext0
	.8byte	.LVL109-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL110-.Ltext0
	.8byte	.LVL111-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST21:
	.8byte	.LVL95-.Ltext0
	.8byte	.LVL96-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL96-.Ltext0
	.8byte	.LVL99-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL99-.Ltext0
	.8byte	.LVL100-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL100-.Ltext0
	.8byte	.LFE4-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL31-.Ltext0
	.8byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL33-.Ltext0
	.8byte	.LVL91-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL94-.Ltext0
	.8byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL31-.Ltext0
	.8byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL33-.Ltext0
	.8byte	.LVL93-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL93-.Ltext0
	.8byte	.LVL94-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL94-.Ltext0
	.8byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL63-.Ltext0
	.8byte	.LVL64-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL66-.Ltext0
	.8byte	.LVL73-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL73-.Ltext0
	.8byte	.LVL74-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL74-.Ltext0
	.8byte	.LVL88-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL89-.Ltext0
	.8byte	.LVL90-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL94-.Ltext0
	.8byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST10:
	.8byte	.LVL32-.Ltext0
	.8byte	.LVL33-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL33-.Ltext0
	.8byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL34-.Ltext0
	.8byte	.LVL35-.Ltext0
	.2byte	0x3
	.byte	0x79
	.byte	0x7f
	.byte	0x9f
	.8byte	.LVL35-.Ltext0
	.8byte	.LVL92-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL94-.Ltext0
	.8byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST11:
	.8byte	.LVL36-.Ltext0
	.8byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL39-.Ltext0
	.8byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL40-.Ltext0
	.8byte	.LVL47-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL47-.Ltext0
	.8byte	.LVL50-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL50-.Ltext0
	.8byte	.LVL51-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL51-.Ltext0
	.8byte	.LVL58-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL58-.Ltext0
	.8byte	.LVL59-1-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST12:
	.8byte	.LVL36-.Ltext0
	.8byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL39-.Ltext0
	.8byte	.LVL40-.Ltext0
	.2byte	0x3
	.byte	0x7c
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL40-.Ltext0
	.8byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL44-.Ltext0
	.8byte	.LVL46-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL47-.Ltext0
	.8byte	.LVL50-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL50-.Ltext0
	.8byte	.LVL51-.Ltext0
	.2byte	0x3
	.byte	0x7c
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL51-.Ltext0
	.8byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL53-.Ltext0
	.8byte	.LVL55-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL55-.Ltext0
	.8byte	.LVL57-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST13:
	.8byte	.LVL36-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL38-.Ltext0
	.8byte	.LVL41-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	.LVL41-.Ltext0
	.8byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL44-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	.LVL44-.Ltext0
	.8byte	.LVL45-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL47-.Ltext0
	.8byte	.LVL49-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL49-.Ltext0
	.8byte	.LVL52-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	.LVL52-.Ltext0
	.8byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL53-.Ltext0
	.8byte	.LVL55-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	.LVL55-.Ltext0
	.8byte	.LVL59-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL68-.Ltext0
	.8byte	.LVL70-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL75-.Ltext0
	.8byte	.LVL77-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL79-.Ltext0
	.8byte	.LVL80-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL80-.Ltext0
	.8byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL84-.Ltext0
	.8byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL85-.Ltext0
	.8byte	.LVL88-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL94-.Ltext0
	.8byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST14:
	.8byte	.LVL36-.Ltext0
	.8byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	.LVL39-.Ltext0
	.8byte	.LVL41-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	.LVL41-.Ltext0
	.8byte	.LVL47-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	.LVL47-.Ltext0
	.8byte	.LVL50-.Ltext0
	.2byte	0x1
	.byte	0x60
	.8byte	.LVL50-.Ltext0
	.8byte	.LVL52-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	.LVL52-.Ltext0
	.8byte	.LVL56-.Ltext0
	.2byte	0x1
	.byte	0x60
	.8byte	.LVL56-.Ltext0
	.8byte	.LVL61-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	.LVL62-.Ltext0
	.8byte	.LVL88-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	.LVL89-.Ltext0
	.8byte	.LVL90-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	.LVL94-.Ltext0
	.8byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	0
	.8byte	0
.LLST15:
	.8byte	.LVL56-.Ltext0
	.8byte	.LVL88-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL89-.Ltext0
	.8byte	.LVL90-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL94-.Ltext0
	.8byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	0
	.8byte	0
.LLST16:
	.8byte	.LVL63-.Ltext0
	.8byte	.LVL64-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL66-.Ltext0
	.8byte	.LVL69-.Ltext0
	.2byte	0x1
	.byte	0x68
	.8byte	.LVL69-.Ltext0
	.8byte	.LVL70-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL70-.Ltext0
	.8byte	.LVL78-.Ltext0
	.2byte	0x1
	.byte	0x68
	.8byte	.LVL78-.Ltext0
	.8byte	.LVL79-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL79-.Ltext0
	.8byte	.LVL83-.Ltext0
	.2byte	0x1
	.byte	0x68
	.8byte	.LVL83-.Ltext0
	.8byte	.LVL84-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL84-.Ltext0
	.8byte	.LVL87-.Ltext0
	.2byte	0x1
	.byte	0x68
	.8byte	.LVL87-.Ltext0
	.8byte	.LVL88-.Ltext0
	.2byte	0x1
	.byte	0x67
	.8byte	.LVL89-.Ltext0
	.8byte	.LVL90-.Ltext0
	.2byte	0x1
	.byte	0x68
	.8byte	.LVL94-.Ltext0
	.8byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x68
	.8byte	0
	.8byte	0
.LLST17:
	.8byte	.LVL60-.Ltext0
	.8byte	.LVL63-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL63-.Ltext0
	.8byte	.LVL64-.Ltext0
	.2byte	0x1
	.byte	0x67
	.8byte	.LVL65-.Ltext0
	.8byte	.LVL88-.Ltext0
	.2byte	0x1
	.byte	0x67
	.8byte	.LVL89-.Ltext0
	.8byte	.LVL90-.Ltext0
	.2byte	0x1
	.byte	0x67
	.8byte	.LVL94-.Ltext0
	.8byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x67
	.8byte	0
	.8byte	0
.LLST18:
	.8byte	.LVL66-.Ltext0
	.8byte	.LVL68-.Ltext0
	.2byte	0x1
	.byte	0x69
	.8byte	.LVL71-.Ltext0
	.8byte	.LVL74-.Ltext0
	.2byte	0x1
	.byte	0x69
	.8byte	.LVL89-.Ltext0
	.8byte	.LVL90-.Ltext0
	.2byte	0x1
	.byte	0x69
	.8byte	0
	.8byte	0
.LLST19:
	.8byte	.LVL66-.Ltext0
	.8byte	.LVL68-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL72-.Ltext0
	.8byte	.LVL74-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL89-.Ltext0
	.8byte	.LVL90-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL24-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL28-.Ltext0
	.8byte	.LVL29-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.byte	0x3
	.byte	0x9f
	.8byte	.LVL29-.Ltext0
	.8byte	.LVL30-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL27-.Ltext0
	.8byte	.LFE2-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL13-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL17-.Ltext0
	.8byte	.LFE1-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL9-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL1-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL7-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5f
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
	.8byte	.LBB2-.Ltext0
	.8byte	.LBE2-.Ltext0
	.8byte	.LBB3-.Ltext0
	.8byte	.LBE3-.Ltext0
	.8byte	.LBB4-.Ltext0
	.8byte	.LBE4-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF26:
	.string	"/home/sai/ocaml-freestanding-riscv/build/nolibc"
.LASF15:
	.string	"shift"
.LASF24:
	.string	"GNU C99 9.2.0 -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -O2 -Og -std=c99"
.LASF5:
	.string	"size_t"
.LASF21:
	.string	"strchr"
.LASF20:
	.string	"twobyte_strstr"
.LASF17:
	.string	"twoway_strstr"
.LASF25:
	.string	"strstr.c"
.LASF16:
	.string	"grow"
.LASF1:
	.string	"long unsigned int"
.LASF18:
	.string	"fourbyte_strstr"
.LASF7:
	.string	"short unsigned int"
.LASF3:
	.string	"unsigned char"
.LASF6:
	.string	"__uint16_t"
.LASF22:
	.string	"memchr"
.LASF8:
	.string	"__uint32_t"
.LASF13:
	.string	"mem0"
.LASF9:
	.string	"unsigned int"
.LASF12:
	.string	"char"
.LASF4:
	.string	"short int"
.LASF23:
	.string	"memcmp"
.LASF10:
	.string	"uint16_t"
.LASF14:
	.string	"byteset"
.LASF11:
	.string	"uint32_t"
.LASF0:
	.string	"long int"
.LASF2:
	.string	"signed char"
.LASF27:
	.string	"strstr"
.LASF19:
	.string	"threebyte_strstr"
	.ident	"GCC: (GNU) 9.2.0"
