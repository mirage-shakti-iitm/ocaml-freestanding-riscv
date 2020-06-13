	.file	"memcpy.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	memcpy
	.type	memcpy, @function
memcpy:
.LFB0:
	.file 1 "memcpy.c"
	.loc 1 6 1
	.cfi_startproc
.LVL0:
	.loc 1 7 2
	.loc 1 8 2
	.loc 1 20 2
	.loc 1 21 2
	.loc 1 23 2
	.loc 1 7 17 is_stmt 0
	mv	a5,a0
.LVL1:
.L2:
	.loc 1 23 9 is_stmt 1 discriminator 1
	.loc 1 23 22 is_stmt 0 discriminator 1
	andi	a4,a1,3
	.loc 1 23 2 discriminator 1
	beq	a4,zero,.L3
	.loc 1 23 26 discriminator 2
	beq	a2,zero,.L3
	.loc 1 23 37 is_stmt 1 discriminator 3
.LVL2:
	.loc 1 23 44 is_stmt 0 discriminator 3
	lbu	a4,0(a1)
	.loc 1 23 42 discriminator 3
	sb	a4,0(a5)
	.loc 1 23 32 is_stmt 1 discriminator 3
	.loc 1 23 33 is_stmt 0 discriminator 3
	addi	a2,a2,-1
.LVL3:
	.loc 1 23 46 discriminator 3
	addi	a1,a1,1
.LVL4:
	.loc 1 23 39 discriminator 3
	addi	a5,a5,1
.LVL5:
	j	.L2
.L3:
	.loc 1 25 2 is_stmt 1
	.loc 1 25 19 is_stmt 0
	andi	a4,a5,3
	.loc 1 25 5
	beq	a4,zero,.L5
	.loc 1 50 2 is_stmt 1
	.loc 1 50 5 is_stmt 0
	li	a3,31
	bleu	a2,a3,.L13
	.loc 1 50 15 is_stmt 1
	li	a3,2
	beq	a4,a3,.L14
	li	a3,3
	beq	a4,a3,.L15
	li	a3,1
	beq	a4,a3,.L27
.L13:
	.loc 1 100 2
	.loc 1 100 7 is_stmt 0
	andi	a4,a2,16
	.loc 1 100 5
	beq	a4,zero,.L22
	.loc 1 101 3 is_stmt 1
.LVL6:
	.loc 1 101 10 is_stmt 0
	lbu	a4,0(a1)
	.loc 1 101 8
	sb	a4,0(a5)
	.loc 1 101 16 is_stmt 1
.LVL7:
	.loc 1 101 23 is_stmt 0
	lbu	a4,1(a1)
	.loc 1 101 21
	sb	a4,1(a5)
	.loc 1 101 29 is_stmt 1
.LVL8:
	.loc 1 101 36 is_stmt 0
	lbu	a4,2(a1)
	.loc 1 101 34
	sb	a4,2(a5)
	.loc 1 101 42 is_stmt 1
.LVL9:
	.loc 1 101 49 is_stmt 0
	lbu	a4,3(a1)
	.loc 1 101 47
	sb	a4,3(a5)
	.loc 1 102 3 is_stmt 1
.LVL10:
	.loc 1 102 10 is_stmt 0
	lbu	a4,4(a1)
	.loc 1 102 8
	sb	a4,4(a5)
	.loc 1 102 16 is_stmt 1
.LVL11:
	.loc 1 102 23 is_stmt 0
	lbu	a4,5(a1)
	.loc 1 102 21
	sb	a4,5(a5)
	.loc 1 102 29 is_stmt 1
.LVL12:
	.loc 1 102 36 is_stmt 0
	lbu	a4,6(a1)
	.loc 1 102 34
	sb	a4,6(a5)
	.loc 1 102 42 is_stmt 1
.LVL13:
	.loc 1 102 49 is_stmt 0
	lbu	a4,7(a1)
	.loc 1 102 47
	sb	a4,7(a5)
	.loc 1 103 3 is_stmt 1
.LVL14:
	.loc 1 103 10 is_stmt 0
	lbu	a4,8(a1)
	.loc 1 103 8
	sb	a4,8(a5)
	.loc 1 103 16 is_stmt 1
.LVL15:
	.loc 1 103 23 is_stmt 0
	lbu	a4,9(a1)
	.loc 1 103 21
	sb	a4,9(a5)
	.loc 1 103 29 is_stmt 1
.LVL16:
	.loc 1 103 36 is_stmt 0
	lbu	a4,10(a1)
	.loc 1 103 34
	sb	a4,10(a5)
	.loc 1 103 42 is_stmt 1
.LVL17:
	.loc 1 103 49 is_stmt 0
	lbu	a4,11(a1)
	.loc 1 103 47
	sb	a4,11(a5)
	.loc 1 104 3 is_stmt 1
.LVL18:
	.loc 1 104 10 is_stmt 0
	lbu	a4,12(a1)
	.loc 1 104 8
	sb	a4,12(a5)
	.loc 1 104 16 is_stmt 1
.LVL19:
	.loc 1 104 23 is_stmt 0
	lbu	a4,13(a1)
	.loc 1 104 21
	sb	a4,13(a5)
	.loc 1 104 29 is_stmt 1
.LVL20:
	.loc 1 104 36 is_stmt 0
	lbu	a4,14(a1)
	.loc 1 104 34
	sb	a4,14(a5)
	.loc 1 104 42 is_stmt 1
.LVL21:
	.loc 1 104 49 is_stmt 0
	lbu	a4,15(a1)
	.loc 1 104 47
	sb	a4,15(a5)
	.loc 1 104 51
	addi	a1,a1,16
.LVL22:
	.loc 1 104 44
	addi	a5,a5,16
.LVL23:
.L22:
	.loc 1 106 2 is_stmt 1
	.loc 1 106 7 is_stmt 0
	andi	a4,a2,8
	.loc 1 106 5
	beq	a4,zero,.L23
	.loc 1 107 3 is_stmt 1
.LVL24:
	.loc 1 107 10 is_stmt 0
	lbu	a4,0(a1)
	.loc 1 107 8
	sb	a4,0(a5)
	.loc 1 107 16 is_stmt 1
.LVL25:
	.loc 1 107 23 is_stmt 0
	lbu	a4,1(a1)
	.loc 1 107 21
	sb	a4,1(a5)
	.loc 1 107 29 is_stmt 1
.LVL26:
	.loc 1 107 36 is_stmt 0
	lbu	a4,2(a1)
	.loc 1 107 34
	sb	a4,2(a5)
	.loc 1 107 42 is_stmt 1
.LVL27:
	.loc 1 107 49 is_stmt 0
	lbu	a4,3(a1)
	.loc 1 107 47
	sb	a4,3(a5)
	.loc 1 108 3 is_stmt 1
.LVL28:
	.loc 1 108 10 is_stmt 0
	lbu	a4,4(a1)
	.loc 1 108 8
	sb	a4,4(a5)
	.loc 1 108 16 is_stmt 1
.LVL29:
	.loc 1 108 23 is_stmt 0
	lbu	a4,5(a1)
	.loc 1 108 21
	sb	a4,5(a5)
	.loc 1 108 29 is_stmt 1
.LVL30:
	.loc 1 108 36 is_stmt 0
	lbu	a4,6(a1)
	.loc 1 108 34
	sb	a4,6(a5)
	.loc 1 108 42 is_stmt 1
.LVL31:
	.loc 1 108 49 is_stmt 0
	lbu	a4,7(a1)
	.loc 1 108 47
	sb	a4,7(a5)
	.loc 1 108 51
	addi	a1,a1,8
.LVL32:
	.loc 1 108 44
	addi	a5,a5,8
.LVL33:
.L23:
	.loc 1 110 2 is_stmt 1
	.loc 1 110 7 is_stmt 0
	andi	a4,a2,4
	.loc 1 110 5
	beq	a4,zero,.L24
	.loc 1 111 3 is_stmt 1
.LVL34:
	.loc 1 111 10 is_stmt 0
	lbu	a4,0(a1)
	.loc 1 111 8
	sb	a4,0(a5)
	.loc 1 111 16 is_stmt 1
.LVL35:
	.loc 1 111 23 is_stmt 0
	lbu	a4,1(a1)
	.loc 1 111 21
	sb	a4,1(a5)
	.loc 1 111 29 is_stmt 1
.LVL36:
	.loc 1 111 36 is_stmt 0
	lbu	a4,2(a1)
	.loc 1 111 34
	sb	a4,2(a5)
	.loc 1 111 42 is_stmt 1
.LVL37:
	.loc 1 111 49 is_stmt 0
	lbu	a4,3(a1)
	.loc 1 111 47
	sb	a4,3(a5)
	.loc 1 111 51
	addi	a1,a1,4
.LVL38:
	.loc 1 111 44
	addi	a5,a5,4
.LVL39:
.L24:
	.loc 1 113 2 is_stmt 1
	.loc 1 113 7 is_stmt 0
	andi	a4,a2,2
	.loc 1 113 5
	beq	a4,zero,.L25
	.loc 1 114 3 is_stmt 1
.LVL40:
	.loc 1 114 10 is_stmt 0
	lbu	a4,0(a1)
	.loc 1 114 8
	sb	a4,0(a5)
	.loc 1 114 16 is_stmt 1
.LVL41:
	.loc 1 114 23 is_stmt 0
	lbu	a4,1(a1)
	.loc 1 114 21
	sb	a4,1(a5)
	.loc 1 114 25
	addi	a1,a1,2
.LVL42:
	.loc 1 114 18
	addi	a5,a5,2
.LVL43:
.L25:
	.loc 1 116 2 is_stmt 1
	.loc 1 116 7 is_stmt 0
	andi	a2,a2,1
.LVL44:
	.loc 1 116 5
	beq	a2,zero,.L12
	.loc 1 117 3 is_stmt 1
	.loc 1 117 8 is_stmt 0
	lbu	a4,0(a1)
	.loc 1 117 6
	sb	a4,0(a5)
.L12:
	.loc 1 124 1
	ret
.LVL45:
.L7:
	.loc 1 27 4 is_stmt 1 discriminator 2
	.loc 1 27 20 is_stmt 0 discriminator 2
	lw	a4,0(a1)
	.loc 1 27 18 discriminator 2
	sw	a4,0(a5)
	.loc 1 28 4 is_stmt 1 discriminator 2
	.loc 1 28 20 is_stmt 0 discriminator 2
	lw	a4,4(a1)
	.loc 1 28 18 discriminator 2
	sw	a4,4(a5)
	.loc 1 29 4 is_stmt 1 discriminator 2
	.loc 1 29 20 is_stmt 0 discriminator 2
	lw	a4,8(a1)
	.loc 1 29 18 discriminator 2
	sw	a4,8(a5)
	.loc 1 30 4 is_stmt 1 discriminator 2
	.loc 1 30 21 is_stmt 0 discriminator 2
	lw	a4,12(a1)
	.loc 1 30 19 discriminator 2
	sw	a4,12(a5)
	.loc 1 26 17 is_stmt 1 discriminator 2
	.loc 1 26 18 is_stmt 0 discriminator 2
	addi	a1,a1,16
.LVL46:
	.loc 1 26 25 discriminator 2
	addi	a5,a5,16
.LVL47:
	.loc 1 26 32 discriminator 2
	addi	a2,a2,-16
.LVL48:
.L5:
	.loc 1 26 10 is_stmt 1 discriminator 1
	.loc 1 26 3 is_stmt 0 discriminator 1
	li	a4,15
	bgtu	a2,a4,.L7
	.loc 1 32 3 is_stmt 1
	.loc 1 32 8 is_stmt 0
	andi	a4,a2,8
	.loc 1 32 6
	beq	a4,zero,.L8
	.loc 1 33 4 is_stmt 1
	.loc 1 33 20 is_stmt 0
	lw	a4,0(a1)
	.loc 1 33 18
	sw	a4,0(a5)
	.loc 1 34 4 is_stmt 1
	.loc 1 34 20 is_stmt 0
	lw	a4,4(a1)
	.loc 1 34 18
	sw	a4,4(a5)
	.loc 1 35 4 is_stmt 1
	.loc 1 35 6 is_stmt 0
	addi	a5,a5,8
.LVL49:
	.loc 1 35 12 is_stmt 1
	.loc 1 35 14 is_stmt 0
	addi	a1,a1,8
.LVL50:
.L8:
	.loc 1 37 3 is_stmt 1
	.loc 1 37 8 is_stmt 0
	andi	a4,a2,4
	.loc 1 37 6
	beq	a4,zero,.L9
	.loc 1 38 4 is_stmt 1
	.loc 1 38 20 is_stmt 0
	lw	a4,0(a1)
	.loc 1 38 18
	sw	a4,0(a5)
	.loc 1 39 4 is_stmt 1
	.loc 1 39 6 is_stmt 0
	addi	a5,a5,4
.LVL51:
	.loc 1 39 12 is_stmt 1
	.loc 1 39 14 is_stmt 0
	addi	a1,a1,4
.LVL52:
.L9:
	.loc 1 41 3 is_stmt 1
	.loc 1 41 8 is_stmt 0
	andi	a4,a2,2
	.loc 1 41 6
	beq	a4,zero,.L10
	.loc 1 42 4 is_stmt 1
.LVL53:
	.loc 1 42 11 is_stmt 0
	lbu	a4,0(a1)
	.loc 1 42 9
	sb	a4,0(a5)
	.loc 1 42 17 is_stmt 1
.LVL54:
	.loc 1 42 24 is_stmt 0
	lbu	a4,1(a1)
	.loc 1 42 22
	sb	a4,1(a5)
	.loc 1 42 26
	addi	a1,a1,2
.LVL55:
	.loc 1 42 19
	addi	a5,a5,2
.LVL56:
.L10:
	.loc 1 44 3 is_stmt 1
	.loc 1 44 8 is_stmt 0
	andi	a2,a2,1
.LVL57:
	.loc 1 44 6
	beq	a2,zero,.L12
	.loc 1 45 4 is_stmt 1
	.loc 1 45 9 is_stmt 0
	lbu	a4,0(a1)
	.loc 1 45 7
	sb	a4,0(a5)
	.loc 1 47 3 is_stmt 1
	.loc 1 47 10 is_stmt 0
	ret
.LVL58:
.L27:
	.loc 1 52 3 is_stmt 1
	.loc 1 52 5 is_stmt 0
	lw	a4,0(a1)
.LVL59:
	.loc 1 53 3 is_stmt 1
	.loc 1 53 10 is_stmt 0
	lbu	a3,0(a1)
	.loc 1 53 8
	sb	a3,0(a5)
	.loc 1 54 3 is_stmt 1
.LVL60:
	.loc 1 54 10 is_stmt 0
	lbu	a3,1(a1)
	.loc 1 54 8
	sb	a3,1(a5)
	.loc 1 55 3 is_stmt 1
.LVL61:
	.loc 1 55 10 is_stmt 0
	lbu	a3,2(a1)
	.loc 1 55 8
	sb	a3,2(a5)
	.loc 1 56 3 is_stmt 1
	.loc 1 56 5 is_stmt 0
	addi	a2,a2,-3
.LVL62:
	.loc 1 57 3 is_stmt 1
	.loc 1 55 12 is_stmt 0
	addi	a1,a1,3
.LVL63:
	.loc 1 55 5
	addi	a5,a5,3
.LVL64:
	.loc 1 57 3
	j	.L16
.L17:
	.loc 1 58 4 is_stmt 1 discriminator 2
	.loc 1 58 6 is_stmt 0 discriminator 2
	lw	a3,1(a1)
.LVL65:
	.loc 1 59 4 is_stmt 1 discriminator 2
	.loc 1 59 23 is_stmt 0 discriminator 2
	srliw	a4,a4,24
.LVL66:
	.loc 1 59 35 discriminator 2
	slliw	a6,a3,8
	.loc 1 59 30 discriminator 2
	or	a4,a4,a6
	.loc 1 59 18 discriminator 2
	sw	a4,0(a5)
	.loc 1 60 4 is_stmt 1 discriminator 2
	.loc 1 60 6 is_stmt 0 discriminator 2
	lw	a4,5(a1)
.LVL67:
	.loc 1 61 4 is_stmt 1 discriminator 2
	.loc 1 61 23 is_stmt 0 discriminator 2
	srliw	a3,a3,24
.LVL68:
	.loc 1 61 35 discriminator 2
	slliw	a6,a4,8
	.loc 1 61 30 discriminator 2
	or	a3,a3,a6
	.loc 1 61 18 discriminator 2
	sw	a3,4(a5)
	.loc 1 62 4 is_stmt 1 discriminator 2
	.loc 1 62 6 is_stmt 0 discriminator 2
	lw	a3,9(a1)
.LVL69:
	.loc 1 63 4 is_stmt 1 discriminator 2
	.loc 1 63 23 is_stmt 0 discriminator 2
	srliw	a4,a4,24
.LVL70:
	.loc 1 63 35 discriminator 2
	slliw	a6,a3,8
	.loc 1 63 30 discriminator 2
	or	a4,a4,a6
	.loc 1 63 18 discriminator 2
	sw	a4,8(a5)
	.loc 1 64 4 is_stmt 1 discriminator 2
	.loc 1 64 6 is_stmt 0 discriminator 2
	lw	a4,13(a1)
.LVL71:
	.loc 1 65 4 is_stmt 1 discriminator 2
	.loc 1 65 24 is_stmt 0 discriminator 2
	srliw	a3,a3,24
.LVL72:
	.loc 1 65 36 discriminator 2
	slliw	a6,a4,8
	.loc 1 65 31 discriminator 2
	or	a3,a3,a6
	.loc 1 65 19 discriminator 2
	sw	a3,12(a5)
	.loc 1 57 17 is_stmt 1 discriminator 2
	.loc 1 57 18 is_stmt 0 discriminator 2
	addi	a1,a1,16
.LVL73:
	.loc 1 57 25 discriminator 2
	addi	a5,a5,16
.LVL74:
	.loc 1 57 32 discriminator 2
	addi	a2,a2,-16
.LVL75:
.L16:
	.loc 1 57 10 is_stmt 1 discriminator 1
	.loc 1 57 3 is_stmt 0 discriminator 1
	li	a3,16
	bgtu	a2,a3,.L17
	j	.L13
.LVL76:
.L14:
	.loc 1 69 3 is_stmt 1
	.loc 1 69 5 is_stmt 0
	lw	a4,0(a1)
.LVL77:
	.loc 1 70 3 is_stmt 1
	.loc 1 70 10 is_stmt 0
	lbu	a3,0(a1)
	.loc 1 70 8
	sb	a3,0(a5)
	.loc 1 71 3 is_stmt 1
.LVL78:
	.loc 1 71 10 is_stmt 0
	lbu	a3,1(a1)
	.loc 1 71 8
	sb	a3,1(a5)
	.loc 1 72 3 is_stmt 1
	.loc 1 72 5 is_stmt 0
	addi	a2,a2,-2
.LVL79:
	.loc 1 73 3 is_stmt 1
	.loc 1 71 12 is_stmt 0
	addi	a1,a1,2
.LVL80:
	.loc 1 71 5
	addi	a5,a5,2
.LVL81:
	.loc 1 73 3
	j	.L18
.L19:
	.loc 1 74 4 is_stmt 1 discriminator 2
	.loc 1 74 6 is_stmt 0 discriminator 2
	lw	a3,2(a1)
.LVL82:
	.loc 1 75 4 is_stmt 1 discriminator 2
	.loc 1 75 23 is_stmt 0 discriminator 2
	srliw	a4,a4,16
.LVL83:
	.loc 1 75 35 discriminator 2
	slliw	a6,a3,16
	.loc 1 75 30 discriminator 2
	or	a4,a4,a6
	.loc 1 75 18 discriminator 2
	sw	a4,0(a5)
	.loc 1 76 4 is_stmt 1 discriminator 2
	.loc 1 76 6 is_stmt 0 discriminator 2
	lw	a4,6(a1)
.LVL84:
	.loc 1 77 4 is_stmt 1 discriminator 2
	.loc 1 77 23 is_stmt 0 discriminator 2
	srliw	a3,a3,16
.LVL85:
	.loc 1 77 35 discriminator 2
	slliw	a6,a4,16
	.loc 1 77 30 discriminator 2
	or	a3,a3,a6
	.loc 1 77 18 discriminator 2
	sw	a3,4(a5)
	.loc 1 78 4 is_stmt 1 discriminator 2
	.loc 1 78 6 is_stmt 0 discriminator 2
	lw	a3,10(a1)
.LVL86:
	.loc 1 79 4 is_stmt 1 discriminator 2
	.loc 1 79 23 is_stmt 0 discriminator 2
	srliw	a4,a4,16
.LVL87:
	.loc 1 79 35 discriminator 2
	slliw	a6,a3,16
	.loc 1 79 30 discriminator 2
	or	a4,a4,a6
	.loc 1 79 18 discriminator 2
	sw	a4,8(a5)
	.loc 1 80 4 is_stmt 1 discriminator 2
	.loc 1 80 6 is_stmt 0 discriminator 2
	lw	a4,14(a1)
.LVL88:
	.loc 1 81 4 is_stmt 1 discriminator 2
	.loc 1 81 24 is_stmt 0 discriminator 2
	srliw	a3,a3,16
.LVL89:
	.loc 1 81 36 discriminator 2
	slliw	a6,a4,16
	.loc 1 81 31 discriminator 2
	or	a3,a3,a6
	.loc 1 81 19 discriminator 2
	sw	a3,12(a5)
	.loc 1 73 17 is_stmt 1 discriminator 2
	.loc 1 73 18 is_stmt 0 discriminator 2
	addi	a1,a1,16
.LVL90:
	.loc 1 73 25 discriminator 2
	addi	a5,a5,16
.LVL91:
	.loc 1 73 32 discriminator 2
	addi	a2,a2,-16
.LVL92:
.L18:
	.loc 1 73 10 is_stmt 1 discriminator 1
	.loc 1 73 3 is_stmt 0 discriminator 1
	li	a3,17
	bgtu	a2,a3,.L19
	j	.L13
.LVL93:
.L15:
	.loc 1 85 3 is_stmt 1
	.loc 1 85 5 is_stmt 0
	lw	a4,0(a1)
.LVL94:
	.loc 1 86 3 is_stmt 1
	.loc 1 86 10 is_stmt 0
	lbu	a3,0(a1)
	.loc 1 86 8
	sb	a3,0(a5)
	.loc 1 87 3 is_stmt 1
	.loc 1 87 5 is_stmt 0
	addi	a2,a2,-1
.LVL95:
	.loc 1 88 3 is_stmt 1
	.loc 1 86 12 is_stmt 0
	addi	a1,a1,1
.LVL96:
	.loc 1 86 5
	addi	a5,a5,1
.LVL97:
	.loc 1 88 3
	j	.L20
.L21:
	.loc 1 89 4 is_stmt 1 discriminator 2
	.loc 1 89 6 is_stmt 0 discriminator 2
	lw	a3,3(a1)
.LVL98:
	.loc 1 90 4 is_stmt 1 discriminator 2
	.loc 1 90 23 is_stmt 0 discriminator 2
	srliw	a4,a4,8
.LVL99:
	.loc 1 90 34 discriminator 2
	slliw	a6,a3,24
	.loc 1 90 29 discriminator 2
	or	a4,a4,a6
	.loc 1 90 18 discriminator 2
	sw	a4,0(a5)
	.loc 1 91 4 is_stmt 1 discriminator 2
	.loc 1 91 6 is_stmt 0 discriminator 2
	lw	a4,7(a1)
.LVL100:
	.loc 1 92 4 is_stmt 1 discriminator 2
	.loc 1 92 23 is_stmt 0 discriminator 2
	srliw	a3,a3,8
.LVL101:
	.loc 1 92 34 discriminator 2
	slliw	a6,a4,24
	.loc 1 92 29 discriminator 2
	or	a3,a3,a6
	.loc 1 92 18 discriminator 2
	sw	a3,4(a5)
	.loc 1 93 4 is_stmt 1 discriminator 2
	.loc 1 93 6 is_stmt 0 discriminator 2
	lw	a3,11(a1)
.LVL102:
	.loc 1 94 4 is_stmt 1 discriminator 2
	.loc 1 94 23 is_stmt 0 discriminator 2
	srliw	a4,a4,8
.LVL103:
	.loc 1 94 34 discriminator 2
	slliw	a6,a3,24
	.loc 1 94 29 discriminator 2
	or	a4,a4,a6
	.loc 1 94 18 discriminator 2
	sw	a4,8(a5)
	.loc 1 95 4 is_stmt 1 discriminator 2
	.loc 1 95 6 is_stmt 0 discriminator 2
	lw	a4,15(a1)
.LVL104:
	.loc 1 96 4 is_stmt 1 discriminator 2
	.loc 1 96 24 is_stmt 0 discriminator 2
	srliw	a3,a3,8
.LVL105:
	.loc 1 96 35 discriminator 2
	slliw	a6,a4,24
	.loc 1 96 30 discriminator 2
	or	a3,a3,a6
	.loc 1 96 19 discriminator 2
	sw	a3,12(a5)
	.loc 1 88 17 is_stmt 1 discriminator 2
	.loc 1 88 18 is_stmt 0 discriminator 2
	addi	a1,a1,16
.LVL106:
	.loc 1 88 25 discriminator 2
	addi	a5,a5,16
.LVL107:
	.loc 1 88 32 discriminator 2
	addi	a2,a2,-16
.LVL108:
.L20:
	.loc 1 88 10 is_stmt 1 discriminator 1
	.loc 1 88 3 is_stmt 0 discriminator 1
	li	a3,18
	bgtu	a2,a3,.L21
	j	.L13
	.cfi_endproc
.LFE0:
	.size	memcpy, .-memcpy
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/riscv64-unknown-elf/include/machine/_default_types.h"
	.file 4 "/home/sai/Shakti-TEE-Build/riscv/riscv64-unknown-elf/include/sys/_stdint.h"
	.file 5 "/home/sai/ocaml-freestanding-riscv/nolibc/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x155
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF13
	.byte	0xc
	.4byte	.LASF14
	.4byte	.LASF15
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
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
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.byte	0x3
	.4byte	.LASF7
	.byte	0x3
	.byte	0x4f
	.byte	0x19
	.4byte	0x7b
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x3
	.4byte	.LASF9
	.byte	0x3
	.byte	0xe8
	.byte	0x1a
	.4byte	0x40
	.byte	0x3
	.4byte	.LASF10
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x6f
	.byte	0x3
	.4byte	.LASF11
	.byte	0x4
	.byte	0x52
	.byte	0x15
	.4byte	0x82
	.byte	0x6
	.4byte	.LASF16
	.byte	0x5
	.byte	0x8
	.byte	0x7
	.4byte	0x139
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x139
	.byte	0x7
	.4byte	.LASF12
	.byte	0x1
	.byte	0x5
	.byte	0x1d
	.4byte	0x13b
	.byte	0x1
	.byte	0x5a
	.byte	0x8
	.string	"src"
	.byte	0x1
	.byte	0x5
	.byte	0x38
	.4byte	0x146
	.4byte	.LLST0
	.byte	0x8
	.string	"n"
	.byte	0x1
	.byte	0x5
	.byte	0x44
	.4byte	0x34
	.4byte	.LLST1
	.byte	0x9
	.string	"d"
	.byte	0x1
	.byte	0x7
	.byte	0x11
	.4byte	0x14c
	.4byte	.LLST2
	.byte	0x9
	.string	"s"
	.byte	0x1
	.byte	0x8
	.byte	0x17
	.4byte	0x152
	.4byte	.LLST3
	.byte	0xa
	.string	"u32"
	.byte	0x1
	.byte	0x14
	.byte	0x32
	.4byte	0x6f
	.byte	0x9
	.string	"w"
	.byte	0x1
	.byte	0x15
	.byte	0xb
	.4byte	0x8e
	.4byte	.LLST4
	.byte	0x9
	.string	"x"
	.byte	0x1
	.byte	0x15
	.byte	0xe
	.4byte	0x8e
	.4byte	.LLST5
	.byte	0
	.byte	0xb
	.byte	0x8
	.byte	0xc
	.4byte	0x139
	.byte	0xd
	.byte	0x8
	.4byte	0x14b
	.byte	0xc
	.4byte	0x140
	.byte	0xe
	.byte	0xd
	.byte	0x8
	.4byte	0x55
	.byte	0xd
	.byte	0x8
	.4byte	0x5c
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
	.byte	0x9
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
	.byte	0xa
	.byte	0x16
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
	.byte	0xb
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x37
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
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
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL45-.Ltext0
	.8byte	.LVL57-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL58-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL9-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x3
	.byte	0x9f
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL10-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x4
	.byte	0x9f
	.8byte	.LVL10-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x5
	.byte	0x9f
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x6
	.byte	0x9f
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x7
	.byte	0x9f
	.8byte	.LVL13-.Ltext0
	.8byte	.LVL14-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x8
	.byte	0x9f
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x9
	.byte	0x9f
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0xa
	.byte	0x9f
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0xb
	.byte	0x9f
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0xc
	.byte	0x9f
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0xd
	.byte	0x9f
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0xe
	.byte	0x9f
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0xf
	.byte	0x9f
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL23-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x10
	.byte	0x9f
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL24-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL26-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x3
	.byte	0x9f
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x4
	.byte	0x9f
	.8byte	.LVL28-.Ltext0
	.8byte	.LVL29-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x5
	.byte	0x9f
	.8byte	.LVL29-.Ltext0
	.8byte	.LVL30-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x6
	.byte	0x9f
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL31-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x7
	.byte	0x9f
	.8byte	.LVL31-.Ltext0
	.8byte	.LVL33-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x8
	.byte	0x9f
	.8byte	.LVL33-.Ltext0
	.8byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL34-.Ltext0
	.8byte	.LVL35-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL35-.Ltext0
	.8byte	.LVL36-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL36-.Ltext0
	.8byte	.LVL37-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x3
	.byte	0x9f
	.8byte	.LVL37-.Ltext0
	.8byte	.LVL39-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x4
	.byte	0x9f
	.8byte	.LVL39-.Ltext0
	.8byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL40-.Ltext0
	.8byte	.LVL41-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL41-.Ltext0
	.8byte	.LVL43-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL43-.Ltext0
	.8byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL53-.Ltext0
	.8byte	.LVL54-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL54-.Ltext0
	.8byte	.LVL56-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL56-.Ltext0
	.8byte	.LVL59-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL59-.Ltext0
	.8byte	.LVL60-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL60-.Ltext0
	.8byte	.LVL61-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL61-.Ltext0
	.8byte	.LVL64-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x3
	.byte	0x9f
	.8byte	.LVL64-.Ltext0
	.8byte	.LVL77-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL77-.Ltext0
	.8byte	.LVL78-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL78-.Ltext0
	.8byte	.LVL81-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL81-.Ltext0
	.8byte	.LVL94-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL94-.Ltext0
	.8byte	.LVL97-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL97-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL9-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x3
	.byte	0x9f
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL10-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x4
	.byte	0x9f
	.8byte	.LVL10-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x5
	.byte	0x9f
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x6
	.byte	0x9f
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x7
	.byte	0x9f
	.8byte	.LVL13-.Ltext0
	.8byte	.LVL14-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x8
	.byte	0x9f
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x9
	.byte	0x9f
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0xa
	.byte	0x9f
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0xb
	.byte	0x9f
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0xc
	.byte	0x9f
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0xd
	.byte	0x9f
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0xe
	.byte	0x9f
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0xf
	.byte	0x9f
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL22-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x10
	.byte	0x9f
	.8byte	.LVL22-.Ltext0
	.8byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL24-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL26-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x3
	.byte	0x9f
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x4
	.byte	0x9f
	.8byte	.LVL28-.Ltext0
	.8byte	.LVL29-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x5
	.byte	0x9f
	.8byte	.LVL29-.Ltext0
	.8byte	.LVL30-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x6
	.byte	0x9f
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL31-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x7
	.byte	0x9f
	.8byte	.LVL31-.Ltext0
	.8byte	.LVL32-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x8
	.byte	0x9f
	.8byte	.LVL32-.Ltext0
	.8byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL34-.Ltext0
	.8byte	.LVL35-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL35-.Ltext0
	.8byte	.LVL36-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL36-.Ltext0
	.8byte	.LVL37-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x3
	.byte	0x9f
	.8byte	.LVL37-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x4
	.byte	0x9f
	.8byte	.LVL38-.Ltext0
	.8byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL40-.Ltext0
	.8byte	.LVL41-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL41-.Ltext0
	.8byte	.LVL42-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL53-.Ltext0
	.8byte	.LVL54-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL54-.Ltext0
	.8byte	.LVL55-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL55-.Ltext0
	.8byte	.LVL59-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL59-.Ltext0
	.8byte	.LVL60-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL60-.Ltext0
	.8byte	.LVL61-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL61-.Ltext0
	.8byte	.LVL63-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x3
	.byte	0x9f
	.8byte	.LVL63-.Ltext0
	.8byte	.LVL77-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL77-.Ltext0
	.8byte	.LVL78-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL78-.Ltext0
	.8byte	.LVL80-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL80-.Ltext0
	.8byte	.LVL94-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL94-.Ltext0
	.8byte	.LVL96-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL96-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL59-.Ltext0
	.8byte	.LVL66-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL67-.Ltext0
	.8byte	.LVL70-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL71-.Ltext0
	.8byte	.LVL76-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL77-.Ltext0
	.8byte	.LVL83-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL84-.Ltext0
	.8byte	.LVL87-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL88-.Ltext0
	.8byte	.LVL93-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL94-.Ltext0
	.8byte	.LVL99-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL100-.Ltext0
	.8byte	.LVL103-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL104-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL65-.Ltext0
	.8byte	.LVL68-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL69-.Ltext0
	.8byte	.LVL72-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL82-.Ltext0
	.8byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL86-.Ltext0
	.8byte	.LVL89-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL98-.Ltext0
	.8byte	.LVL101-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL102-.Ltext0
	.8byte	.LVL105-.Ltext0
	.2byte	0x1
	.byte	0x5d
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
	.string	"/home/sai/ocaml-freestanding-riscv/build/nolibc"
.LASF13:
	.string	"GNU C99 9.2.0 -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -O2 -Og -std=c99"
.LASF6:
	.string	"size_t"
.LASF11:
	.string	"uintptr_t"
.LASF9:
	.string	"__uintptr_t"
.LASF14:
	.string	"memcpy.c"
.LASF12:
	.string	"dest"
.LASF3:
	.string	"unsigned char"
.LASF1:
	.string	"long unsigned int"
.LASF5:
	.string	"short unsigned int"
.LASF7:
	.string	"__uint32_t"
.LASF8:
	.string	"unsigned int"
.LASF16:
	.string	"memcpy"
.LASF4:
	.string	"short int"
.LASF10:
	.string	"uint32_t"
.LASF0:
	.string	"long int"
.LASF2:
	.string	"signed char"
	.ident	"GCC: (GNU) 9.2.0"
