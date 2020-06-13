	.file	"alloc.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	caml_alloc
	.type	caml_alloc, @function
caml_alloc:
.LFB12:
	.file 1 "alloc.c"
	.loc 1 35 1
	.cfi_startproc
.LVL0:
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	mv	s0,a0
	mv	s1,a1
	.loc 1 36 3
	.loc 1 37 3
	.loc 1 39 3
	.loc 1 40 3
	.loc 1 41 3
	.loc 1 41 6 is_stmt 0
	li	a5,256
	bgtu	a0,a5,.L2
	.loc 1 42 5 is_stmt 1
	.loc 1 42 8 is_stmt 0
	bne	a0,zero,.L3
	.loc 1 43 7 is_stmt 1
	.loc 1 43 16 is_stmt 0
	slli	a0,a1,32
.LVL1:
	srli	a0,a0,32
	slli	a0,a0,3
	lla	a5,caml_atom_table
	add	a0,a0,a5
	addi	a0,a0,8
.LVL2:
.L1:
	.loc 1 58 1
	ld	ra,40(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
.LVL3:
	ld	s1,24(sp)
	.cfi_restore 9
	ld	s2,16(sp)
	.cfi_restore 18
	ld	s3,8(sp)
	.cfi_restore 19
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.LVL4:
.L3:
	.cfi_restore_state
	.loc 1 45 7 is_stmt 1
	.loc 1 45 7
	.loc 1 45 7
	.loc 1 45 7
	.loc 1 45 7
	slli	a5,a0,3
	li	s2,-8
	sub	s2,s2,a5
	lla	a4,caml_young_ptr
	ld	a5,0(a4)
	add	a5,a5,s2
	sd	a5,0(a4)
	.loc 1 45 7
	ld	a4,caml_young_trigger
	bltu	a5,a4,.L14
.LVL5:
.L5:
	.loc 1 45 7 discriminator 3
	slli	a5,s0,10
	slli	a2,s1,32
	srli	a2,a2,32
	lla	a4,caml_young_ptr
	ld	a3,0(a4)
	add	a5,a5,a2
	addi	a5,a5,768
	sd	a5,0(a3)
	.loc 1 45 7 discriminator 3
	ld	a2,0(a4)
	addi	a2,a2,8
	mv	a0,a2
.LVL6:
	.loc 1 45 7 discriminator 3
	.loc 1 45 7 discriminator 3
	.loc 1 46 7 discriminator 3
	.loc 1 46 10 is_stmt 0 discriminator 3
	li	a5,250
	bgtu	s1,a5,.L1
	.loc 1 47 16
	li	a5,0
	j	.L6
.LVL7:
.L14:
	.loc 1 45 7 is_stmt 1 discriminator 1
	lla	s3,caml_young_ptr
	addi	a4,a0,1
	slli	a4,a4,3
	add	a5,a5,a4
	sd	a5,0(s3)
	.loc 1 45 7 discriminator 1
	.loc 1 45 7 discriminator 1
	.loc 1 45 7 discriminator 1
	call	caml_gc_dispatch
.LVL8:
	.loc 1 45 7 discriminator 1
	.loc 1 45 7 discriminator 1
	ld	a5,0(s3)
	add	s2,a5,s2
	sd	s2,0(s3)
	j	.L5
.LVL9:
.L7:
	.loc 1 47 38 discriminator 3
	slli	a4,a5,3
	add	a4,a2,a4
	.loc 1 47 56 is_stmt 0 discriminator 3
	li	a3,1
	sd	a3,0(a4)
	.loc 1 47 33 is_stmt 1 discriminator 3
	.loc 1 47 34 is_stmt 0 discriminator 3
	addi	a5,a5,1
.LVL10:
.L6:
	.loc 1 47 21 is_stmt 1 discriminator 1
	.loc 1 47 9 is_stmt 0 discriminator 1
	bltu	a5,s0,.L7
	j	.L1
.LVL11:
.L2:
	.loc 1 51 5 is_stmt 1
	.loc 1 51 14 is_stmt 0
	call	caml_alloc_shr
.LVL12:
	.loc 1 52 5 is_stmt 1
	.loc 1 52 8 is_stmt 0
	li	a5,250
	bleu	s1,a5,.L12
.L9:
	.loc 1 55 5 is_stmt 1
	.loc 1 55 14 is_stmt 0
	call	caml_check_urgent_gc
.LVL13:
	.loc 1 57 3 is_stmt 1
	.loc 1 57 10 is_stmt 0
	j	.L1
.L12:
	.loc 1 53 14
	li	a5,0
.L8:
.LVL14:
	.loc 1 53 19 is_stmt 1 discriminator 1
	.loc 1 53 7 is_stmt 0 discriminator 1
	bgeu	a5,s0,.L9
	.loc 1 53 36 is_stmt 1 discriminator 3
	slli	a4,a5,3
	add	a4,a4,a0
	.loc 1 53 54 is_stmt 0 discriminator 3
	li	a3,1
	sd	a3,0(a4)
	.loc 1 53 31 is_stmt 1 discriminator 3
	.loc 1 53 32 is_stmt 0 discriminator 3
	addi	a5,a5,1
.LVL15:
	j	.L8
	.cfi_endproc
.LFE12:
	.size	caml_alloc, .-caml_alloc
	.align	1
	.globl	caml_alloc_small
	.type	caml_alloc_small, @function
caml_alloc_small:
.LFB13:
	.loc 1 61 1 is_stmt 1
	.cfi_startproc
.LVL16:
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	mv	s0,a0
	mv	s1,a1
	.loc 1 62 3
	.loc 1 64 3
	.loc 1 65 3
	.loc 1 66 3
	.loc 1 67 3
	.loc 1 67 3
	.loc 1 67 3
	.loc 1 67 3
	.loc 1 67 3
	slli	a5,a0,3
	li	s2,-8
	sub	s2,s2,a5
	lla	a4,caml_young_ptr
	ld	a5,0(a4)
	add	a5,a5,s2
	sd	a5,0(a4)
	.loc 1 67 3
	ld	a4,caml_young_trigger
	bltu	a5,a4,.L18
.LVL17:
.L16:
	.loc 1 67 3 discriminator 3
	slli	s0,s0,10
.LVL18:
	slli	s1,s1,32
	srli	s1,s1,32
	lla	a5,caml_young_ptr
	ld	a4,0(a5)
	add	s0,s0,s1
	addi	s0,s0,768
	sd	s0,0(a4)
	.loc 1 67 3 discriminator 3
	ld	a0,0(a5)
.LVL19:
	.loc 1 67 3 discriminator 3
	.loc 1 67 3 discriminator 3
	.loc 1 68 3 discriminator 3
	.loc 1 69 1 is_stmt 0 discriminator 3
	addi	a0,a0,8
.LVL20:
	ld	ra,40(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	ld	s1,24(sp)
	.cfi_restore 9
	ld	s2,16(sp)
	.cfi_restore 18
	ld	s3,8(sp)
	.cfi_restore 19
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.LVL21:
.L18:
	.cfi_restore_state
	.loc 1 67 3 is_stmt 1 discriminator 1
	lla	s3,caml_young_ptr
	addi	a4,a0,1
	slli	a4,a4,3
	add	a5,a5,a4
	sd	a5,0(s3)
	.loc 1 67 3 discriminator 1
	.loc 1 67 3 discriminator 1
	.loc 1 67 3 discriminator 1
	call	caml_gc_dispatch
.LVL22:
	.loc 1 67 3 discriminator 1
	.loc 1 67 3 discriminator 1
	ld	a5,0(s3)
	add	s2,a5,s2
	sd	s2,0(s3)
	j	.L16
	.cfi_endproc
.LFE13:
	.size	caml_alloc_small, .-caml_alloc_small
	.align	1
	.globl	caml_alloc_small_with_my_or_given_profinfo
	.type	caml_alloc_small_with_my_or_given_profinfo, @function
caml_alloc_small_with_my_or_given_profinfo:
.LFB14:
	.loc 1 73 1
	.cfi_startproc
.LVL23:
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	mv	s0,a0
	mv	s1,a1
	.loc 1 74 3
	.loc 1 74 6 is_stmt 0
	beq	a2,zero,.L24
.LBB2:
	.loc 1 78 5 is_stmt 1
	.loc 1 80 5
	.loc 1 81 5
	.loc 1 82 5
	.loc 1 83 5
	.loc 1 83 5
	.loc 1 83 5
	.loc 1 83 5
	.loc 1 83 5
	slli	a5,a0,3
	li	s2,-8
	sub	s2,s2,a5
	lla	a4,caml_young_ptr
	ld	a5,0(a4)
	add	a5,a5,s2
	sd	a5,0(a4)
	.loc 1 83 5
	ld	a4,caml_young_trigger
	bltu	a5,a4,.L25
.LVL24:
.L22:
	.loc 1 83 5 discriminator 3
	slli	s0,s0,10
.LVL25:
	slli	s1,s1,32
	srli	s1,s1,32
	lla	a5,caml_young_ptr
	ld	a4,0(a5)
	add	s0,s0,s1
	addi	s0,s0,768
	sd	s0,0(a4)
	.loc 1 83 5 discriminator 3
	ld	a0,0(a5)
	addi	a0,a0,8
.LVL26:
	.loc 1 83 5 discriminator 3
	.loc 1 83 5 discriminator 3
	.loc 1 84 5 discriminator 3
.L19:
.LBE2:
	.loc 1 86 1 is_stmt 0
	ld	ra,40(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	ld	s1,24(sp)
	.cfi_restore 9
	ld	s2,16(sp)
	.cfi_restore 18
	ld	s3,8(sp)
	.cfi_restore 19
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.LVL27:
.L24:
	.cfi_restore_state
	.loc 1 75 5 is_stmt 1
	.loc 1 75 12 is_stmt 0
	call	caml_alloc_small
.LVL28:
	j	.L19
.LVL29:
.L25:
.LBB3:
	.loc 1 83 5 is_stmt 1 discriminator 1
	lla	s3,caml_young_ptr
	addi	a4,a0,1
	slli	a4,a4,3
	add	a5,a5,a4
	sd	a5,0(s3)
	.loc 1 83 5 discriminator 1
	.loc 1 83 5 discriminator 1
	.loc 1 83 5 discriminator 1
	call	caml_gc_dispatch
.LVL30:
	.loc 1 83 5 discriminator 1
	.loc 1 83 5 discriminator 1
	ld	a5,0(s3)
	add	s2,a5,s2
	sd	s2,0(s3)
	j	.L22
.LBE3:
	.cfi_endproc
.LFE14:
	.size	caml_alloc_small_with_my_or_given_profinfo, .-caml_alloc_small_with_my_or_given_profinfo
	.align	1
	.globl	caml_alloc_tuple
	.type	caml_alloc_tuple, @function
caml_alloc_tuple:
.LFB15:
	.loc 1 90 1
	.cfi_startproc
.LVL31:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 91 3
	.loc 1 91 10 is_stmt 0
	li	a1,0
	call	caml_alloc
.LVL32:
	.loc 1 92 1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE15:
	.size	caml_alloc_tuple, .-caml_alloc_tuple
	.align	1
	.globl	caml_alloc_string
	.type	caml_alloc_string, @function
caml_alloc_string:
.LFB16:
	.loc 1 96 1 is_stmt 1
	.cfi_startproc
.LVL33:
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	sd	s4,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	mv	s1,a0
	.loc 1 97 3
	.loc 1 98 3
	.loc 1 99 3
	.loc 1 99 26 is_stmt 0
	addi	s0,a0,8
	.loc 1 99 12
	srli	s2,s0,3
.LVL34:
	.loc 1 101 3 is_stmt 1
	.loc 1 101 6 is_stmt 0
	li	a5,4096
	addi	a5,a5,-2041
	bgtu	s0,a5,.L29
	.loc 1 102 5 is_stmt 1
	.loc 1 102 5
	.loc 1 102 5
	.loc 1 102 5
	.loc 1 102 5
	not	s3,s0
	andi	s3,s3,-8
	lla	a4,caml_young_ptr
	ld	a5,0(a4)
	add	a5,a5,s3
	sd	a5,0(a4)
	.loc 1 102 5
	ld	a4,caml_young_trigger
	bltu	a5,a4,.L33
.LVL35:
.L30:
	.loc 1 102 5 discriminator 3
	slli	s2,s2,10
.LVL36:
	lla	a5,caml_young_ptr
	ld	a4,0(a5)
	addi	s2,s2,1020
	sd	s2,0(a4)
	.loc 1 102 5 discriminator 3
	ld	a5,0(a5)
	addi	a0,a5,8
.LVL37:
	.loc 1 102 5 discriminator 3
	.loc 1 102 5 discriminator 3
.L31:
	.loc 1 107 3
	andi	s0,s0,-8
.LVL38:
	add	a5,s0,a0
	.loc 1 107 30 is_stmt 0
	sd	zero,-8(a5)
	.loc 1 108 3 is_stmt 1
	.loc 1 108 16 is_stmt 0
	addi	s0,s0,-1
.LVL39:
	.loc 1 109 3 is_stmt 1
	add	a5,a0,s0
	.loc 1 109 46 is_stmt 0
	subw	s0,s0,s1
.LVL40:
	.loc 1 109 31
	sb	s0,0(a5)
	.loc 1 110 3 is_stmt 1
	.loc 1 111 1 is_stmt 0
	ld	ra,40(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	ld	s1,24(sp)
	.cfi_restore 9
.LVL41:
	ld	s2,16(sp)
	.cfi_restore 18
	ld	s3,8(sp)
	.cfi_restore 19
	ld	s4,0(sp)
	.cfi_restore 20
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.LVL42:
.L33:
	.cfi_restore_state
	.loc 1 102 5 is_stmt 1 discriminator 1
	lla	s4,caml_young_ptr
	addi	a4,s2,1
	slli	a4,a4,3
	add	a5,a5,a4
	sd	a5,0(s4)
	.loc 1 102 5 discriminator 1
	.loc 1 102 5 discriminator 1
	.loc 1 102 5 discriminator 1
	call	caml_gc_dispatch
.LVL43:
	.loc 1 102 5 discriminator 1
	.loc 1 102 5 discriminator 1
	ld	a5,0(s4)
	add	s3,a5,s3
	sd	s3,0(s4)
	j	.L30
.L29:
	.loc 1 104 5
	.loc 1 104 14 is_stmt 0
	li	a1,252
	mv	a0,s2
	call	caml_alloc_shr
.LVL44:
	.loc 1 105 5 is_stmt 1
	.loc 1 105 14 is_stmt 0
	call	caml_check_urgent_gc
.LVL45:
	j	.L31
	.cfi_endproc
.LFE16:
	.size	caml_alloc_string, .-caml_alloc_string
	.align	1
	.globl	caml_alloc_initialized_string
	.type	caml_alloc_initialized_string, @function
caml_alloc_initialized_string:
.LFB17:
	.loc 1 115 1 is_stmt 1
	.cfi_startproc
.LVL46:
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
	mv	s2,a0
	mv	s1,a1
	.loc 1 116 3
	.loc 1 116 18 is_stmt 0
	call	caml_alloc_string
.LVL47:
	mv	s0,a0
.LVL48:
	.loc 1 117 3 is_stmt 1
	mv	a2,s2
	mv	a1,s1
	call	memcpy
.LVL49:
	.loc 1 118 3
	.loc 1 119 1 is_stmt 0
	mv	a0,s0
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
.LVL50:
	ld	s1,8(sp)
	.cfi_restore 9
.LVL51:
	ld	s2,0(sp)
	.cfi_restore 18
.LVL52:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE17:
	.size	caml_alloc_initialized_string, .-caml_alloc_initialized_string
	.align	1
	.globl	caml_copy_string
	.type	caml_copy_string, @function
caml_copy_string:
.LFB19:
	.loc 1 132 1 is_stmt 1
	.cfi_startproc
.LVL53:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	mv	s0,a0
	.loc 1 133 3
	.loc 1 134 3
	.loc 1 136 3
	.loc 1 136 9 is_stmt 0
	call	strlen
.LVL54:
	.loc 1 137 3 is_stmt 1
	.loc 1 137 9 is_stmt 0
	mv	a1,s0
	sext.w	a0,a0
	call	caml_alloc_initialized_string
.LVL55:
	.loc 1 138 3 is_stmt 1
	.loc 1 139 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
.LVL56:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE19:
	.size	caml_copy_string, .-caml_copy_string
	.align	1
	.globl	caml_alloc_final
	.type	caml_alloc_final, @function
caml_alloc_final:
.LFB18:
	.loc 1 126 1 is_stmt 1
	.cfi_startproc
.LVL57:
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
	mv	s1,a2
	mv	s2,a3
	.loc 1 127 3
	.loc 1 127 10 is_stmt 0
	mv	a0,a1
.LVL58:
	call	caml_final_custom_operations
.LVL59:
	mv	a3,s2
	mv	a2,s1
	slli	a1,s0,3
	call	caml_alloc_custom
.LVL60:
	.loc 1 129 1
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
.LVL61:
	ld	s1,8(sp)
	.cfi_restore 9
.LVL62:
	ld	s2,0(sp)
	.cfi_restore 18
.LVL63:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE18:
	.size	caml_alloc_final, .-caml_alloc_final
	.align	1
	.globl	caml_alloc_array
	.type	caml_alloc_array, @function
caml_alloc_array:
.LFB20:
	.loc 1 143 1 is_stmt 1
	.cfi_startproc
.LVL64:
	addi	sp,sp,-144
	.cfi_def_cfa_offset 144
	sd	ra,136(sp)
	sd	s0,128(sp)
	sd	s1,120(sp)
	sd	s2,112(sp)
	sd	s3,104(sp)
	sd	s4,96(sp)
	sd	s5,88(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	mv	s4,a0
	mv	s3,a1
	.loc 1 144 3
	lla	a4,caml_local_roots
	ld	s5,0(a4)
.LVL65:
	.loc 1 145 3
	.loc 1 146 3
	li	a5,1
	sd	a5,72(sp)
	sd	a5,64(sp)
	.loc 1 146 3
	.loc 1 146 3
	sd	s5,0(sp)
	sd	sp,0(a4)
	sd	a5,16(sp)
	li	a5,2
	sd	a5,8(sp)
	addi	a5,sp,72
	sd	a5,24(sp)
	addi	a5,sp,64
	sd	a5,32(sp)
.LVL66:
	.loc 1 148 3
	.loc 1 149 3
	.loc 1 148 7 is_stmt 0
	li	s0,0
.LVL67:
.L41:
	.loc 1 149 9 is_stmt 1 discriminator 1
	.loc 1 149 13 is_stmt 0 discriminator 1
	slli	a5,s0,3
	add	a5,s3,a5
	ld	a5,0(a5)
	.loc 1 149 9 discriminator 1
	beq	a5,zero,.L46
	.loc 1 149 25 is_stmt 1 discriminator 2
	.loc 1 149 28 is_stmt 0 discriminator 2
	addi	s0,s0,1
.LVL68:
	j	.L41
.L46:
	.loc 1 150 3 is_stmt 1
	.loc 1 150 12 is_stmt 0
	li	a1,0
.LVL69:
	mv	a0,s0
.LVL70:
	call	caml_alloc
.LVL71:
	.loc 1 150 10
	sd	a0,64(sp)
	.loc 1 151 3 is_stmt 1
.LVL72:
	.loc 1 151 10 is_stmt 0
	li	s1,0
	.loc 1 151 3
	j	.L43
.LVL73:
.L44:
	.loc 1 155 5 is_stmt 1 discriminator 3
	.loc 1 155 18 is_stmt 0 discriminator 3
	slli	s2,s1,3
	add	a5,s3,s2
	.loc 1 155 9 discriminator 3
	ld	a0,0(a5)
	jalr	s4
.LVL74:
	mv	a1,a0
	.loc 1 155 7 discriminator 3
	sd	a0,72(sp)
	.loc 1 156 5 is_stmt 1 discriminator 3
	ld	a0,64(sp)
	add	a0,s2,a0
	call	caml_modify
.LVL75:
	.loc 1 151 24 discriminator 3
	.loc 1 151 25 is_stmt 0 discriminator 3
	addi	s1,s1,1
.LVL76:
.L43:
	.loc 1 151 15 is_stmt 1 discriminator 1
	.loc 1 151 3 is_stmt 0 discriminator 1
	bgtu	s0,s1,.L44
	.loc 1 158 3 is_stmt 1
.LBB4:
	.loc 1 158 3
.LVL77:
	.loc 1 158 3
	sd	s5,caml_local_roots,a5
	.loc 1 158 3
.LBE4:
	.loc 1 158 3
	.loc 1 159 1 is_stmt 0
	ld	a0,64(sp)
	ld	ra,136(sp)
	.cfi_restore 1
	ld	s0,128(sp)
	.cfi_restore 8
.LVL78:
	ld	s1,120(sp)
	.cfi_restore 9
.LVL79:
	ld	s2,112(sp)
	.cfi_restore 18
	ld	s3,104(sp)
	.cfi_restore 19
.LVL80:
	ld	s4,96(sp)
	.cfi_restore 20
.LVL81:
	ld	s5,88(sp)
	.cfi_restore 21
.LVL82:
	addi	sp,sp,144
	.cfi_def_cfa_offset 0
.LVL83:
	jr	ra
	.cfi_endproc
.LFE20:
	.size	caml_alloc_array, .-caml_alloc_array
	.align	1
	.globl	caml_alloc_float_array
	.type	caml_alloc_float_array, @function
caml_alloc_float_array:
.LFB21:
	.loc 1 163 1 is_stmt 1
	.cfi_startproc
.LVL84:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 181 3
	.loc 1 181 10 is_stmt 0
	li	a1,0
	call	caml_alloc
.LVL85:
	.loc 1 183 1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	caml_alloc_float_array, .-caml_alloc_float_array
	.align	1
	.globl	caml_copy_string_array
	.type	caml_copy_string_array, @function
caml_copy_string_array:
.LFB22:
	.loc 1 187 1 is_stmt 1
	.cfi_startproc
.LVL86:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	mv	a1,a0
	.loc 1 188 3
	.loc 1 188 10 is_stmt 0
	lla	a0,caml_copy_string
.LVL87:
	call	caml_alloc_array
.LVL88:
	.loc 1 189 1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE22:
	.size	caml_copy_string_array, .-caml_copy_string_array
	.align	1
	.globl	caml_convert_flag_list
	.type	caml_convert_flag_list, @function
caml_convert_flag_list:
.LFB23:
	.loc 1 192 1 is_stmt 1
	.cfi_startproc
.LVL89:
	mv	a4,a0
	.loc 1 193 3
	.loc 1 194 3
.LVL90:
	.loc 1 195 3
	.loc 1 194 7 is_stmt 0
	li	a0,0
.LVL91:
.L52:
	.loc 1 195 9 is_stmt 1
	li	a5,1
	beq	a4,a5,.L54
	.loc 1 196 5
	.loc 1 196 18 is_stmt 0
	ld	a5,0(a4)
	srai	a5,a5,1
	sext.w	a5,a5
	.loc 1 196 17
	slli	a5,a5,2
	add	a5,a1,a5
	lw	a5,0(a5)
	.loc 1 196 9
	or	a0,a5,a0
.LVL92:
	.loc 1 197 5 is_stmt 1
	.loc 1 197 10 is_stmt 0
	ld	a4,8(a4)
.LVL93:
	j	.L52
.L54:
	.loc 1 200 1
	ret
	.cfi_endproc
.LFE23:
	.size	caml_convert_flag_list, .-caml_convert_flag_list
	.align	1
	.globl	caml_alloc_dummy
	.type	caml_alloc_dummy, @function
caml_alloc_dummy:
.LFB24:
	.loc 1 206 1 is_stmt 1
	.cfi_startproc
.LVL94:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 207 3
.LVL95:
	.loc 1 208 3
	.loc 1 208 10 is_stmt 0
	li	a1,0
	srai	a0,a0,1
.LVL96:
	call	caml_alloc
.LVL97:
	.loc 1 209 1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE24:
	.size	caml_alloc_dummy, .-caml_alloc_dummy
	.align	1
	.globl	caml_alloc_dummy_function
	.type	caml_alloc_dummy_function, @function
caml_alloc_dummy_function:
.LFB25:
	.loc 1 213 1 is_stmt 1
	.cfi_startproc
.LVL98:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 215 3
	.loc 1 215 10 is_stmt 0
	call	caml_alloc_dummy
.LVL99:
	.loc 1 216 1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE25:
	.size	caml_alloc_dummy_function, .-caml_alloc_dummy_function
	.align	1
	.globl	caml_alloc_dummy_float
	.type	caml_alloc_dummy_float, @function
caml_alloc_dummy_float:
.LFB26:
	.loc 1 220 1 is_stmt 1
	.cfi_startproc
.LVL100:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 221 3
.LVL101:
	.loc 1 222 3
	.loc 1 222 10 is_stmt 0
	li	a1,0
	srai	a0,a0,1
.LVL102:
	call	caml_alloc
.LVL103:
	.loc 1 223 1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE26:
	.size	caml_alloc_dummy_float, .-caml_alloc_dummy_float
	.align	1
	.globl	caml_update_dummy
	.type	caml_update_dummy, @function
caml_update_dummy:
.LFB27:
	.loc 1 226 1 is_stmt 1
	.cfi_startproc
.LVL104:
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	mv	s1,a1
	.loc 1 227 3
	.loc 1 228 3
	.loc 1 230 3
	.loc 1 230 10 is_stmt 0
	ld	s3,-8(a1)
.LVL105:
	.loc 1 231 3 is_stmt 1
	.loc 1 231 9 is_stmt 0
	lbu	a5,-8(a1)
.LVL106:
	.loc 1 232 3 is_stmt 1
	.loc 1 233 3
	.loc 1 235 3
	mv	s2,a0
	.loc 1 235 18 is_stmt 0
	sb	a5,-8(a0)
	.loc 1 236 3 is_stmt 1
	.loc 1 236 6 is_stmt 0
	li	a4,254
	beq	a5,a4,.L69
	srli	s3,s3,10
.LVL107:
	.loc 1 242 12
	li	s0,0
.LVL108:
.L62:
	.loc 1 242 17 is_stmt 1 discriminator 1
	.loc 1 242 5 is_stmt 0 discriminator 1
	bgeu	s0,s3,.L65
	.loc 1 243 7 is_stmt 1 discriminator 3
	.loc 1 243 21 is_stmt 0 discriminator 3
	slli	a0,s0,3
	.loc 1 243 38 discriminator 3
	add	a5,s1,a0
	.loc 1 243 7 discriminator 3
	ld	a1,0(a5)
	add	a0,s2,a0
	call	caml_modify
.LVL109:
	.loc 1 242 27 is_stmt 1 discriminator 3
	.loc 1 242 28 is_stmt 0 discriminator 3
	addi	s0,s0,1
.LVL110:
	j	.L62
.LVL111:
.L69:
	.loc 1 237 5 is_stmt 1
	.loc 1 237 12 is_stmt 0
	ld	a2,-8(a1)
	.loc 1 237 10
	srli	a2,a2,10
.LVL112:
	.loc 1 238 5 is_stmt 1
	.loc 1 238 12 is_stmt 0
	li	a4,0
.LVL113:
.L63:
	.loc 1 238 17 is_stmt 1 discriminator 1
	.loc 1 238 5 is_stmt 0 discriminator 1
	bgeu	a4,a2,.L65
	.loc 1 239 7 is_stmt 1 discriminator 3
.LBB5:
	.loc 1 239 7 discriminator 3
.LVL114:
	.loc 1 239 7 discriminator 3
	slli	a5,a4,3
	add	a3,s1,a5
	fld	fa5,0(a3)
.LVL115:
	.loc 1 239 7 discriminator 3
	add	a5,s2,a5
	fsd	fa5,0(a5)
.LBE5:
	.loc 1 239 7 discriminator 3
	.loc 1 238 27 discriminator 3
	.loc 1 238 28 is_stmt 0 discriminator 3
	addi	a4,a4,1
.LVL116:
	j	.L63
.LVL117:
.L65:
	.loc 1 246 3 is_stmt 1
	.loc 1 247 1 is_stmt 0
	li	a0,1
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	ld	s1,24(sp)
	.cfi_restore 9
.LVL118:
	ld	s2,16(sp)
	.cfi_restore 18
.LVL119:
	ld	s3,8(sp)
	.cfi_restore 19
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE27:
	.size	caml_update_dummy, .-caml_update_dummy
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 3 "caml/config.h"
	.file 4 "caml/misc.h"
	.file 5 "caml/mlvalues.h"
	.file 6 "caml/alloc.h"
	.file 7 "caml/custom.h"
	.file 8 "caml/freelist.h"
	.file 9 "caml/major_gc.h"
	.file 10 "caml/address_class.h"
	.file 11 "caml/minor_gc.h"
	.file 12 "caml/memory.h"
	.file 13 "caml/stacks.h"
	.file 14 "/home/sai/ocaml-freestanding-riscv/nolibc/include/string.h"
	.file 15 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xe15
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF126
	.byte	0xc
	.4byte	.LASF127
	.4byte	.LASF128
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
	.byte	0x6
	.4byte	0x9b
	.byte	0x3
	.4byte	.LASF12
	.byte	0x4
	.byte	0x5c
	.byte	0x10
	.4byte	0xb3
	.byte	0x5
	.byte	0x8
	.4byte	0xb9
	.byte	0x7
	.byte	0x8
	.4byte	.LASF13
	.byte	0x4
	.byte	0x5d
	.byte	0x19
	.4byte	0xa7
	.byte	0x8
	.4byte	.LASF14
	.byte	0x4
	.byte	0x5d
	.byte	0x36
	.4byte	0xa7
	.byte	0x8
	.4byte	.LASF15
	.byte	0x4
	.byte	0x5e
	.byte	0x19
	.4byte	0xa7
	.byte	0x8
	.4byte	.LASF16
	.byte	0x4
	.byte	0x5e
	.byte	0x33
	.4byte	0xa7
	.byte	0x8
	.4byte	.LASF17
	.byte	0x4
	.byte	0x5f
	.byte	0x19
	.4byte	0xa7
	.byte	0x8
	.4byte	.LASF18
	.byte	0x4
	.byte	0x5f
	.byte	0x33
	.4byte	0xa7
	.byte	0x9
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x169
	.byte	0x10
	.4byte	0x7d
	.byte	0x9
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
	.byte	0x3
	.4byte	.LASF24
	.byte	0x5
	.byte	0x3f
	.byte	0x16
	.4byte	0x5c
	.byte	0xa
	.4byte	0x128
	.4byte	0x157
	.byte	0xb
	.byte	0
	.byte	0x9
	.4byte	.LASF25
	.byte	0x5
	.2byte	0x15c
	.byte	0x15
	.4byte	0x14c
	.byte	0x9
	.4byte	.LASF26
	.byte	0x5
	.2byte	0x171
	.byte	0xe
	.4byte	0x11c
	.byte	0x3
	.4byte	.LASF27
	.byte	0x6
	.byte	0x37
	.byte	0x10
	.4byte	0x17d
	.byte	0x5
	.byte	0x8
	.4byte	0x183
	.byte	0xc
	.4byte	0x18e
	.byte	0xd
	.4byte	0x11c
	.byte	0
	.byte	0x8
	.4byte	.LASF28
	.byte	0x7
	.byte	0x3a
	.byte	0x10
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF29
	.byte	0x8
	.byte	0x1a
	.byte	0x10
	.4byte	0x89
	.byte	0x8
	.4byte	.LASF30
	.byte	0x9
	.byte	0x24
	.byte	0xc
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF31
	.byte	0x9
	.byte	0x25
	.byte	0xc
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF32
	.byte	0x9
	.byte	0x26
	.byte	0x10
	.4byte	0x7d
	.byte	0x8
	.4byte	.LASF33
	.byte	0x9
	.byte	0x27
	.byte	0xf
	.4byte	0x1d6
	.byte	0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF34
	.byte	0x8
	.4byte	.LASF35
	.byte	0x9
	.byte	0x28
	.byte	0x10
	.4byte	0x7d
	.byte	0x8
	.4byte	.LASF36
	.byte	0x9
	.byte	0x28
	.byte	0x25
	.4byte	0x7d
	.byte	0x8
	.4byte	.LASF37
	.byte	0x9
	.byte	0x29
	.byte	0x10
	.4byte	0x7d
	.byte	0x8
	.4byte	.LASF38
	.byte	0x9
	.byte	0x3e
	.byte	0x12
	.4byte	0x95
	.byte	0x8
	.4byte	.LASF39
	.byte	0x9
	.byte	0x3f
	.byte	0x10
	.4byte	0x7d
	.byte	0x8
	.4byte	.LASF40
	.byte	0x9
	.byte	0x40
	.byte	0xe
	.4byte	0x95
	.byte	0x8
	.4byte	.LASF41
	.byte	0x9
	.byte	0x42
	.byte	0xc
	.4byte	0x47
	.byte	0xa
	.4byte	0x1d6
	.4byte	0x241
	.byte	0xe
	.4byte	0x40
	.byte	0x31
	.byte	0
	.byte	0xf
	.4byte	.LASF42
	.byte	0x9
	.byte	0x43
	.byte	0x8
	.4byte	0x231
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0xf
	.4byte	.LASF43
	.byte	0x9
	.byte	0x44
	.byte	0x5
	.4byte	0x47
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0xf
	.4byte	.LASF44
	.byte	0x9
	.byte	0x45
	.byte	0x8
	.4byte	0x1d6
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0x8
	.4byte	.LASF45
	.byte	0x9
	.byte	0x46
	.byte	0xf
	.4byte	0x1d6
	.byte	0x8
	.4byte	.LASF46
	.byte	0x9
	.byte	0x4a
	.byte	0x13
	.4byte	0xb3
	.byte	0x8
	.4byte	.LASF47
	.byte	0xa
	.byte	0x31
	.byte	0xf
	.4byte	0x2a7
	.byte	0x5
	.byte	0x8
	.4byte	0x11c
	.byte	0x8
	.4byte	.LASF48
	.byte	0xa
	.byte	0x31
	.byte	0x22
	.4byte	0x2a7
	.byte	0x8
	.4byte	.LASF49
	.byte	0xa
	.byte	0x32
	.byte	0xf
	.4byte	0x95
	.byte	0x8
	.4byte	.LASF50
	.byte	0xa
	.byte	0x32
	.byte	0x27
	.4byte	0x95
	.byte	0x8
	.4byte	.LASF51
	.byte	0xb
	.byte	0x18
	.byte	0x13
	.4byte	0x2a7
	.byte	0x8
	.4byte	.LASF52
	.byte	0xb
	.byte	0x18
	.byte	0x2c
	.4byte	0x2a7
	.byte	0x8
	.4byte	.LASF53
	.byte	0xb
	.byte	0x19
	.byte	0x13
	.4byte	0x2a7
	.byte	0x8
	.4byte	.LASF54
	.byte	0xb
	.byte	0x19
	.byte	0x24
	.4byte	0x2a7
	.byte	0x8
	.4byte	.LASF55
	.byte	0xb
	.byte	0x1a
	.byte	0x13
	.4byte	0x2a7
	.byte	0x8
	.4byte	.LASF56
	.byte	0xb
	.byte	0x1b
	.byte	0x10
	.4byte	0x89
	.byte	0x8
	.4byte	.LASF57
	.byte	0xb
	.byte	0x1c
	.byte	0xc
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF58
	.byte	0xb
	.byte	0x1d
	.byte	0xf
	.4byte	0x1d6
	.byte	0x10
	.4byte	.LASF64
	.byte	0x38
	.byte	0xb
	.byte	0x29
	.byte	0x8
	.4byte	0x39a
	.byte	0x11
	.4byte	.LASF59
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x39a
	.byte	0
	.byte	0x12
	.string	"end"
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x39a
	.byte	0x8
	.byte	0x11
	.4byte	.LASF60
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x39a
	.byte	0x10
	.byte	0x12
	.string	"ptr"
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x39a
	.byte	0x18
	.byte	0x11
	.4byte	.LASF61
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x39a
	.byte	0x20
	.byte	0x11
	.4byte	.LASF62
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x89
	.byte	0x28
	.byte	0x11
	.4byte	.LASF63
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x2a7
	.byte	0x8
	.4byte	.LASF64
	.byte	0xb
	.byte	0x2a
	.byte	0x22
	.4byte	0x331
	.byte	0x10
	.4byte	.LASF65
	.byte	0x10
	.byte	0xb
	.byte	0x2c
	.byte	0x8
	.4byte	0x3d4
	.byte	0x11
	.4byte	.LASF66
	.byte	0xb
	.byte	0x2d
	.byte	0x9
	.4byte	0x11c
	.byte	0
	.byte	0x11
	.4byte	.LASF67
	.byte	0xb
	.byte	0x2e
	.byte	0xc
	.4byte	0x134
	.byte	0x8
	.byte	0
	.byte	0x10
	.4byte	.LASF68
	.byte	0x38
	.byte	0xb
	.byte	0x31
	.byte	0x8
	.4byte	0x43d
	.byte	0x11
	.4byte	.LASF59
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x43d
	.byte	0
	.byte	0x12
	.string	"end"
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x43d
	.byte	0x8
	.byte	0x11
	.4byte	.LASF60
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x43d
	.byte	0x10
	.byte	0x12
	.string	"ptr"
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x43d
	.byte	0x18
	.byte	0x11
	.4byte	.LASF61
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x43d
	.byte	0x20
	.byte	0x11
	.4byte	.LASF62
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x89
	.byte	0x28
	.byte	0x11
	.4byte	.LASF63
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x3ac
	.byte	0x8
	.4byte	.LASF68
	.byte	0xb
	.byte	0x32
	.byte	0x27
	.4byte	0x3d4
	.byte	0x10
	.4byte	.LASF69
	.byte	0x18
	.byte	0xb
	.byte	0x34
	.byte	0x8
	.4byte	0x484
	.byte	0x11
	.4byte	.LASF70
	.byte	0xb
	.byte	0x35
	.byte	0x9
	.4byte	0x11c
	.byte	0
	.byte	0x12
	.string	"mem"
	.byte	0xb
	.byte	0x36
	.byte	0xc
	.4byte	0x134
	.byte	0x8
	.byte	0x12
	.string	"max"
	.byte	0xb
	.byte	0x37
	.byte	0xc
	.4byte	0x134
	.byte	0x10
	.byte	0
	.byte	0x10
	.4byte	.LASF71
	.byte	0x38
	.byte	0xb
	.byte	0x3a
	.byte	0x8
	.4byte	0x4ed
	.byte	0x11
	.4byte	.LASF59
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4ed
	.byte	0
	.byte	0x12
	.string	"end"
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4ed
	.byte	0x8
	.byte	0x11
	.4byte	.LASF60
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4ed
	.byte	0x10
	.byte	0x12
	.string	"ptr"
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4ed
	.byte	0x18
	.byte	0x11
	.4byte	.LASF61
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4ed
	.byte	0x20
	.byte	0x11
	.4byte	.LASF62
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x89
	.byte	0x28
	.byte	0x11
	.4byte	.LASF63
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x44f
	.byte	0x8
	.4byte	.LASF71
	.byte	0xb
	.byte	0x3b
	.byte	0x25
	.4byte	0x484
	.byte	0x8
	.4byte	.LASF72
	.byte	0xc
	.byte	0x3f
	.byte	0x10
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF73
	.byte	0xc
	.byte	0xb7
	.byte	0x10
	.4byte	0x7d
	.byte	0x10
	.4byte	.LASF74
	.byte	0x40
	.byte	0xc
	.byte	0xf3
	.byte	0x8
	.4byte	0x559
	.byte	0x11
	.4byte	.LASF75
	.byte	0xc
	.byte	0xf4
	.byte	0x1d
	.4byte	0x559
	.byte	0
	.byte	0x11
	.4byte	.LASF76
	.byte	0xc
	.byte	0xf5
	.byte	0xa
	.4byte	0x71
	.byte	0x8
	.byte	0x11
	.4byte	.LASF77
	.byte	0xc
	.byte	0xf6
	.byte	0xa
	.4byte	0x71
	.byte	0x10
	.byte	0x11
	.4byte	.LASF78
	.byte	0xc
	.byte	0xf7
	.byte	0xa
	.4byte	0x55f
	.byte	0x18
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x517
	.byte	0xa
	.4byte	0x2a7
	.4byte	0x56f
	.byte	0xe
	.4byte	0x40
	.byte	0x4
	.byte	0
	.byte	0x8
	.4byte	.LASF79
	.byte	0xc
	.byte	0xfa
	.byte	0x26
	.4byte	0x559
	.byte	0x8
	.4byte	.LASF80
	.byte	0xd
	.byte	0x1b
	.byte	0x14
	.4byte	0x2a7
	.byte	0x8
	.4byte	.LASF81
	.byte	0xd
	.byte	0x1c
	.byte	0x14
	.4byte	0x2a7
	.byte	0x8
	.4byte	.LASF82
	.byte	0xd
	.byte	0x1d
	.byte	0x14
	.4byte	0x2a7
	.byte	0x8
	.4byte	.LASF83
	.byte	0xd
	.byte	0x1e
	.byte	0x14
	.4byte	0x2a7
	.byte	0x8
	.4byte	.LASF84
	.byte	0xd
	.byte	0x1f
	.byte	0x14
	.4byte	0x2a7
	.byte	0x8
	.4byte	.LASF85
	.byte	0xd
	.byte	0x20
	.byte	0x14
	.4byte	0x2a7
	.byte	0x13
	.4byte	0x7d
	.byte	0x8
	.4byte	.LASF86
	.byte	0xd
	.byte	0x2a
	.byte	0x16
	.4byte	0x5d4
	.byte	0x5
	.byte	0x8
	.4byte	0x5c3
	.byte	0x14
	.4byte	.LASF91
	.byte	0x1
	.byte	0xe1
	.byte	0x10
	.4byte	0x11c
	.8byte	.LFB27
	.8byte	.LFE27-.LFB27
	.byte	0x1
	.byte	0x9c
	.4byte	0x69a
	.byte	0x15
	.4byte	.LASF87
	.byte	0x1
	.byte	0xe1
	.byte	0x28
	.4byte	0x11c
	.4byte	.LLST40
	.byte	0x15
	.4byte	.LASF88
	.byte	0x1
	.byte	0xe1
	.byte	0x35
	.4byte	0x11c
	.4byte	.LLST41
	.byte	0x16
	.4byte	.LASF62
	.byte	0x1
	.byte	0xe3
	.byte	0xc
	.4byte	0x134
	.4byte	.LLST42
	.byte	0x17
	.string	"i"
	.byte	0x1
	.byte	0xe3
	.byte	0x12
	.4byte	0x134
	.4byte	.LLST43
	.byte	0x17
	.string	"tag"
	.byte	0x1
	.byte	0xe4
	.byte	0x9
	.4byte	0x140
	.4byte	.LLST44
	.byte	0x18
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.4byte	0x680
	.byte	0x16
	.4byte	.LASF89
	.byte	0x1
	.byte	0xef
	.byte	0x7
	.4byte	0x134
	.4byte	.LLST45
	.byte	0x16
	.4byte	.LASF90
	.byte	0x1
	.byte	0xef
	.byte	0x7
	.4byte	0x1d6
	.4byte	.LLST46
	.byte	0
	.byte	0x19
	.8byte	.LVL109
	.4byte	0xdb9
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.byte	0x78
	.byte	0
	.byte	0x33
	.byte	0x24
	.byte	0x82
	.byte	0
	.byte	0x22
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LASF92
	.byte	0x1
	.byte	0xdb
	.byte	0x10
	.4byte	0x11c
	.8byte	.LFB26
	.8byte	.LFE26-.LFB26
	.byte	0x1
	.byte	0x9c
	.4byte	0x6f9
	.byte	0x15
	.4byte	.LASF62
	.byte	0x1
	.byte	0xdb
	.byte	0x2e
	.4byte	0x11c
	.4byte	.LLST38
	.byte	0x16
	.4byte	.LASF93
	.byte	0x1
	.byte	0xdd
	.byte	0xc
	.4byte	0x134
	.4byte	.LLST39
	.byte	0x19
	.8byte	.LVL103
	.4byte	0xd31
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x31
	.byte	0x26
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LASF94
	.byte	0x1
	.byte	0xd4
	.byte	0x10
	.4byte	0x11c
	.8byte	.LFB25
	.8byte	.LFE25-.LFB25
	.byte	0x1
	.byte	0x9c
	.4byte	0x751
	.byte	0x15
	.4byte	.LASF62
	.byte	0x1
	.byte	0xd4
	.byte	0x30
	.4byte	0x11c
	.4byte	.LLST36
	.byte	0x15
	.4byte	.LASF95
	.byte	0x1
	.byte	0xd4
	.byte	0x3b
	.4byte	0x11c
	.4byte	.LLST37
	.byte	0x19
	.8byte	.LVL99
	.4byte	0x751
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LASF96
	.byte	0x1
	.byte	0xcd
	.byte	0x10
	.4byte	0x11c
	.8byte	.LFB24
	.8byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.4byte	0x7b0
	.byte	0x15
	.4byte	.LASF62
	.byte	0x1
	.byte	0xcd
	.byte	0x27
	.4byte	0x11c
	.4byte	.LLST34
	.byte	0x16
	.4byte	.LASF93
	.byte	0x1
	.byte	0xcf
	.byte	0xc
	.4byte	0x134
	.4byte	.LLST35
	.byte	0x19
	.8byte	.LVL97
	.4byte	0xd31
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x31
	.byte	0x26
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LASF97
	.byte	0x1
	.byte	0xbf
	.byte	0x10
	.4byte	0x47
	.8byte	.LFB23
	.8byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x801
	.byte	0x15
	.4byte	.LASF98
	.byte	0x1
	.byte	0xbf
	.byte	0x2d
	.4byte	0x11c
	.4byte	.LLST32
	.byte	0x1b
	.4byte	.LASF99
	.byte	0x1
	.byte	0xbf
	.byte	0x38
	.4byte	0x801
	.byte	0x1
	.byte	0x5b
	.byte	0x17
	.string	"res"
	.byte	0x1
	.byte	0xc1
	.byte	0x7
	.4byte	0x47
	.4byte	.LLST33
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x47
	.byte	0x14
	.4byte	.LASF100
	.byte	0x1
	.byte	0xba
	.byte	0x12
	.4byte	0x11c
	.8byte	.LFB22
	.8byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0x85c
	.byte	0x1c
	.string	"arr"
	.byte	0x1
	.byte	0xba
	.byte	0x37
	.4byte	0x85c
	.4byte	.LLST31
	.byte	0x19
	.8byte	.LVL88
	.4byte	0x8b5
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	caml_copy_string
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x862
	.byte	0x5
	.byte	0x8
	.4byte	0xa2
	.byte	0x14
	.4byte	.LASF101
	.byte	0x1
	.byte	0xa2
	.byte	0x7
	.4byte	0x11c
	.8byte	.LFB21
	.8byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x8b5
	.byte	0x1c
	.string	"len"
	.byte	0x1
	.byte	0xa2
	.byte	0x27
	.4byte	0x134
	.4byte	.LLST30
	.byte	0x19
	.8byte	.LVL85
	.4byte	0xd31
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0x1d
	.4byte	.LASF102
	.byte	0x1
	.byte	0x8d
	.byte	0x12
	.4byte	0x11c
	.8byte	.LFB20
	.8byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x9b1
	.byte	0x15
	.4byte	.LASF103
	.byte	0x1
	.byte	0x8d
	.byte	0x2b
	.4byte	0x9c0
	.4byte	.LLST24
	.byte	0x1c
	.string	"arr"
	.byte	0x1
	.byte	0x8e
	.byte	0x31
	.4byte	0x85c
	.4byte	.LLST25
	.byte	0x16
	.4byte	.LASF104
	.byte	0x1
	.byte	0x90
	.byte	0x3
	.4byte	0x559
	.4byte	.LLST26
	.byte	0x17
	.string	"nbr"
	.byte	0x1
	.byte	0x91
	.byte	0xc
	.4byte	0x134
	.4byte	.LLST27
	.byte	0x17
	.string	"n"
	.byte	0x1
	.byte	0x91
	.byte	0x11
	.4byte	0x134
	.4byte	.LLST28
	.byte	0x1e
	.string	"v"
	.byte	0x1
	.byte	0x92
	.byte	0x3
	.4byte	0x11c
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x1f
	.4byte	.LASF105
	.byte	0x1
	.byte	0x92
	.byte	0x3
	.4byte	0x11c
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x1f
	.4byte	.LASF106
	.byte	0x1
	.byte	0x92
	.byte	0x3
	.4byte	0x517
	.byte	0x3
	.byte	0x91
	.byte	0xf0,0x7e
	.byte	0x20
	.4byte	.LASF107
	.byte	0x1
	.byte	0x92
	.byte	0x3
	.4byte	0x47
	.byte	0
	.byte	0x18
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0x986
	.byte	0x16
	.4byte	.LASF108
	.byte	0x1
	.byte	0x9e
	.byte	0x3
	.4byte	0x11c
	.4byte	.LLST29
	.byte	0
	.byte	0x21
	.8byte	.LVL71
	.4byte	0xd31
	.4byte	0x9a3
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x22
	.8byte	.LVL75
	.4byte	0xdb9
	.byte	0
	.byte	0x23
	.4byte	0x11c
	.4byte	0x9c0
	.byte	0xd
	.4byte	0x862
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x9b1
	.byte	0x14
	.4byte	.LASF109
	.byte	0x1
	.byte	0x83
	.byte	0x12
	.4byte	0x11c
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0xa41
	.byte	0x1c
	.string	"s"
	.byte	0x1
	.byte	0x83
	.byte	0x2f
	.4byte	0x862
	.4byte	.LLST18
	.byte	0x17
	.string	"len"
	.byte	0x1
	.byte	0x85
	.byte	0x7
	.4byte	0x47
	.4byte	.LLST19
	.byte	0x1e
	.string	"res"
	.byte	0x1
	.byte	0x86
	.byte	0x9
	.4byte	0x11c
	.byte	0x1
	.byte	0x5a
	.byte	0x21
	.8byte	.LVL54
	.4byte	0xdc5
	.4byte	0xa2c
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x19
	.8byte	.LVL55
	.4byte	0xadf
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LASF110
	.byte	0x1
	.byte	0x7c
	.byte	0x12
	.4byte	0x11c
	.8byte	.LFB18
	.8byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0xadf
	.byte	0x1c
	.string	"len"
	.byte	0x1
	.byte	0x7c
	.byte	0x2d
	.4byte	0x134
	.4byte	.LLST20
	.byte	0x1c
	.string	"fun"
	.byte	0x1
	.byte	0x7c
	.byte	0x3c
	.4byte	0x171
	.4byte	.LLST21
	.byte	0x1c
	.string	"mem"
	.byte	0x1
	.byte	0x7d
	.byte	0x2d
	.4byte	0x134
	.4byte	.LLST22
	.byte	0x1c
	.string	"max"
	.byte	0x1
	.byte	0x7d
	.byte	0x3b
	.4byte	0x134
	.4byte	.LLST23
	.byte	0x21
	.8byte	.LVL59
	.4byte	0xdd1
	.4byte	0xabc
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0x19
	.8byte	.LVL60
	.4byte	0xddd
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x4
	.byte	0x78
	.byte	0
	.byte	0x33
	.byte	0x24
	.byte	0x1a
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x1a
	.byte	0x1
	.byte	0x5d
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LASF111
	.byte	0x1
	.byte	0x72
	.byte	0x12
	.4byte	0x11c
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0xb68
	.byte	0x1c
	.string	"len"
	.byte	0x1
	.byte	0x72
	.byte	0x3a
	.4byte	0x134
	.4byte	.LLST15
	.byte	0x1c
	.string	"p"
	.byte	0x1
	.byte	0x72
	.byte	0x4b
	.4byte	0x862
	.4byte	.LLST16
	.byte	0x16
	.4byte	.LASF105
	.byte	0x1
	.byte	0x74
	.byte	0x9
	.4byte	0x11c
	.4byte	.LLST17
	.byte	0x21
	.8byte	.LVL47
	.4byte	0xb68
	.4byte	0xb47
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x19
	.8byte	.LVL49
	.4byte	0xde9
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x1a
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LASF112
	.byte	0x1
	.byte	0x5f
	.byte	0x12
	.4byte	0x11c
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0xc03
	.byte	0x1c
	.string	"len"
	.byte	0x1
	.byte	0x5f
	.byte	0x2e
	.4byte	0x134
	.4byte	.LLST11
	.byte	0x16
	.4byte	.LASF105
	.byte	0x1
	.byte	0x61
	.byte	0x9
	.4byte	0x11c
	.4byte	.LLST12
	.byte	0x16
	.4byte	.LASF113
	.byte	0x1
	.byte	0x62
	.byte	0xc
	.4byte	0x134
	.4byte	.LLST13
	.byte	0x16
	.4byte	.LASF93
	.byte	0x1
	.byte	0x63
	.byte	0xc
	.4byte	0x134
	.4byte	.LLST14
	.byte	0x22
	.8byte	.LVL43
	.4byte	0xdf4
	.byte	0x21
	.8byte	.LVL44
	.4byte	0xe00
	.4byte	0xbf5
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x8
	.byte	0xfc
	.byte	0
	.byte	0x22
	.8byte	.LVL45
	.4byte	0xe0c
	.byte	0
	.byte	0x14
	.4byte	.LASF114
	.byte	0x1
	.byte	0x59
	.byte	0x12
	.4byte	0x11c
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0xc4e
	.byte	0x1c
	.string	"n"
	.byte	0x1
	.byte	0x59
	.byte	0x2c
	.4byte	0x134
	.4byte	.LLST10
	.byte	0x19
	.8byte	.LVL32
	.4byte	0xd31
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LASF115
	.byte	0x1
	.byte	0x47
	.byte	0x12
	.4byte	0x11c
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0xcd1
	.byte	0x15
	.4byte	.LASF93
	.byte	0x1
	.byte	0x47
	.byte	0x47
	.4byte	0x134
	.4byte	.LLST7
	.byte	0x1c
	.string	"tag"
	.byte	0x1
	.byte	0x48
	.byte	0x9
	.4byte	0x140
	.4byte	.LLST8
	.byte	0x15
	.4byte	.LASF116
	.byte	0x1
	.byte	0x48
	.byte	0x16
	.4byte	0x7d
	.4byte	.LLST9
	.byte	0x24
	.4byte	.Ldebug_ranges0+0
	.4byte	0xcc3
	.byte	0x25
	.4byte	.LASF105
	.byte	0x1
	.byte	0x4e
	.byte	0xb
	.4byte	0x11c
	.byte	0x22
	.8byte	.LVL30
	.4byte	0xdf4
	.byte	0
	.byte	0x22
	.8byte	.LVL28
	.4byte	0xcd1
	.byte	0
	.byte	0x14
	.4byte	.LASF117
	.byte	0x1
	.byte	0x3c
	.byte	0x12
	.4byte	0x11c
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0xd31
	.byte	0x15
	.4byte	.LASF93
	.byte	0x1
	.byte	0x3c
	.byte	0x2d
	.4byte	0x134
	.4byte	.LLST4
	.byte	0x1c
	.string	"tag"
	.byte	0x1
	.byte	0x3c
	.byte	0x3b
	.4byte	0x140
	.4byte	.LLST5
	.byte	0x16
	.4byte	.LASF105
	.byte	0x1
	.byte	0x3e
	.byte	0x9
	.4byte	0x11c
	.4byte	.LLST6
	.byte	0x22
	.8byte	.LVL22
	.4byte	0xdf4
	.byte	0
	.byte	0x14
	.4byte	.LASF118
	.byte	0x1
	.byte	0x22
	.byte	0x12
	.4byte	0x11c
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0xdb9
	.byte	0x15
	.4byte	.LASF93
	.byte	0x1
	.byte	0x22
	.byte	0x27
	.4byte	0x134
	.4byte	.LLST0
	.byte	0x1c
	.string	"tag"
	.byte	0x1
	.byte	0x22
	.byte	0x35
	.4byte	0x140
	.4byte	.LLST1
	.byte	0x16
	.4byte	.LASF105
	.byte	0x1
	.byte	0x24
	.byte	0x9
	.4byte	0x11c
	.4byte	.LLST2
	.byte	0x17
	.string	"i"
	.byte	0x1
	.byte	0x25
	.byte	0xc
	.4byte	0x134
	.4byte	.LLST3
	.byte	0x22
	.8byte	.LVL8
	.4byte	0xdf4
	.byte	0x22
	.8byte	.LVL12
	.4byte	0xe00
	.byte	0x22
	.8byte	.LVL13
	.4byte	0xe0c
	.byte	0
	.byte	0x26
	.4byte	.LASF119
	.4byte	.LASF119
	.byte	0xc
	.byte	0x35
	.byte	0x11
	.byte	0x26
	.4byte	.LASF120
	.4byte	.LASF120
	.byte	0xe
	.byte	0xc
	.byte	0x8
	.byte	0x26
	.4byte	.LASF121
	.4byte	.LASF121
	.byte	0x7
	.byte	0x40
	.byte	0xb
	.byte	0x26
	.4byte	.LASF122
	.4byte	.LASF122
	.byte	0x7
	.byte	0x33
	.byte	0x12
	.byte	0x27
	.4byte	.LASF129
	.4byte	.LASF130
	.byte	0xf
	.byte	0
	.byte	0x26
	.4byte	.LASF123
	.4byte	.LASF123
	.byte	0xb
	.byte	0x3f
	.byte	0x11
	.byte	0x26
	.4byte	.LASF124
	.4byte	.LASF124
	.byte	0xc
	.byte	0x26
	.byte	0x12
	.byte	0x26
	.4byte	.LASF125
	.4byte	.LASF125
	.byte	0xc
	.byte	0x37
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x15
	.byte	0
	.byte	0x27
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
	.byte	0x9
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
	.byte	0xa
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
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
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
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
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x18
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1b
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
	.byte	0x1c
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
	.byte	0x1d
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
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
	.byte	0x1f
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
	.byte	0x20
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
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x21
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
	.byte	0x22
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x23
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
	.byte	0x24
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x25
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
	.byte	0
	.byte	0
	.byte	0x26
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
	.byte	0x27
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
.LLST40:
	.8byte	.LVL104-.Ltext0
	.8byte	.LVL108-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL108-.Ltext0
	.8byte	.LVL111-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL111-.Ltext0
	.8byte	.LVL117-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL117-.Ltext0
	.8byte	.LVL119-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL119-.Ltext0
	.8byte	.LFE27-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST41:
	.8byte	.LVL104-.Ltext0
	.8byte	.LVL108-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL108-.Ltext0
	.8byte	.LVL118-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL118-.Ltext0
	.8byte	.LFE27-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST42:
	.8byte	.LVL105-.Ltext0
	.8byte	.LVL107-.Ltext0
	.2byte	0x5
	.byte	0x83
	.byte	0
	.byte	0x3a
	.byte	0x25
	.byte	0x9f
	.8byte	.LVL107-.Ltext0
	.8byte	.LVL111-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL111-.Ltext0
	.8byte	.LVL112-.Ltext0
	.2byte	0x5
	.byte	0x83
	.byte	0
	.byte	0x3a
	.byte	0x25
	.byte	0x9f
	.8byte	.LVL112-.Ltext0
	.8byte	.LVL117-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST43:
	.8byte	.LVL108-.Ltext0
	.8byte	.LVL111-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL112-.Ltext0
	.8byte	.LVL113-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL113-.Ltext0
	.8byte	.LVL117-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST44:
	.8byte	.LVL106-.Ltext0
	.8byte	.LVL108-.Ltext0
	.2byte	0x6
	.byte	0x7f
	.byte	0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.8byte	.LVL111-.Ltext0
	.8byte	.LVL113-.Ltext0
	.2byte	0x6
	.byte	0x7f
	.byte	0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST45:
	.8byte	.LVL114-.Ltext0
	.8byte	.LVL116-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL116-.Ltext0
	.8byte	.LVL117-.Ltext0
	.2byte	0x3
	.byte	0x7e
	.byte	0x7f
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST46:
	.8byte	.LVL115-.Ltext0
	.8byte	.LVL117-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x2f
	.8byte	0
	.8byte	0
.LLST38:
	.8byte	.LVL100-.Ltext0
	.8byte	.LVL102-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL102-.Ltext0
	.8byte	.LFE26-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST39:
	.8byte	.LVL101-.Ltext0
	.8byte	.LVL102-.Ltext0
	.2byte	0x5
	.byte	0x7a
	.byte	0
	.byte	0x31
	.byte	0x26
	.byte	0x9f
	.8byte	.LVL102-.Ltext0
	.8byte	.LVL103-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL103-1-.Ltext0
	.8byte	.LFE26-.Ltext0
	.2byte	0x6
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x31
	.byte	0x26
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST36:
	.8byte	.LVL98-.Ltext0
	.8byte	.LVL99-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL99-1-.Ltext0
	.8byte	.LFE25-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST37:
	.8byte	.LVL98-.Ltext0
	.8byte	.LVL99-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL99-1-.Ltext0
	.8byte	.LFE25-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST34:
	.8byte	.LVL94-.Ltext0
	.8byte	.LVL96-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL96-.Ltext0
	.8byte	.LFE24-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST35:
	.8byte	.LVL95-.Ltext0
	.8byte	.LVL96-.Ltext0
	.2byte	0x5
	.byte	0x7a
	.byte	0
	.byte	0x31
	.byte	0x26
	.byte	0x9f
	.8byte	.LVL96-.Ltext0
	.8byte	.LVL97-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL97-1-.Ltext0
	.8byte	.LFE24-.Ltext0
	.2byte	0x6
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x31
	.byte	0x26
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST32:
	.8byte	.LVL89-.Ltext0
	.8byte	.LVL91-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL91-.Ltext0
	.8byte	.LFE23-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST33:
	.8byte	.LVL90-.Ltext0
	.8byte	.LVL91-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL91-.Ltext0
	.8byte	.LFE23-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST31:
	.8byte	.LVL86-.Ltext0
	.8byte	.LVL87-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL87-.Ltext0
	.8byte	.LVL88-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL88-1-.Ltext0
	.8byte	.LFE22-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST30:
	.8byte	.LVL84-.Ltext0
	.8byte	.LVL85-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL85-1-.Ltext0
	.8byte	.LFE21-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST24:
	.8byte	.LVL64-.Ltext0
	.8byte	.LVL70-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL70-.Ltext0
	.8byte	.LVL81-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	.LVL81-.Ltext0
	.8byte	.LFE20-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST25:
	.8byte	.LVL64-.Ltext0
	.8byte	.LVL69-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL69-.Ltext0
	.8byte	.LVL80-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL80-.Ltext0
	.8byte	.LFE20-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST26:
	.8byte	.LVL65-.Ltext0
	.8byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	0
	.8byte	0
.LLST27:
	.8byte	.LVL66-.Ltext0
	.8byte	.LVL67-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL67-.Ltext0
	.8byte	.LVL78-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST28:
	.8byte	.LVL72-.Ltext0
	.8byte	.LVL73-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL73-.Ltext0
	.8byte	.LVL79-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST29:
	.8byte	.LVL77-.Ltext0
	.8byte	.LVL83-.Ltext0
	.2byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.8byte	.LVL83-.Ltext0
	.8byte	.LFE20-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST18:
	.8byte	.LVL53-.Ltext0
	.8byte	.LVL54-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL54-1-.Ltext0
	.8byte	.LVL56-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL56-.Ltext0
	.8byte	.LFE19-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST19:
	.8byte	.LVL54-.Ltext0
	.8byte	.LVL55-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST20:
	.8byte	.LVL57-.Ltext0
	.8byte	.LVL58-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL58-.Ltext0
	.8byte	.LVL61-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL61-.Ltext0
	.8byte	.LFE18-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST21:
	.8byte	.LVL57-.Ltext0
	.8byte	.LVL59-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL59-1-.Ltext0
	.8byte	.LFE18-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST22:
	.8byte	.LVL57-.Ltext0
	.8byte	.LVL59-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL59-1-.Ltext0
	.8byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL62-.Ltext0
	.8byte	.LFE18-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST23:
	.8byte	.LVL57-.Ltext0
	.8byte	.LVL59-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL59-1-.Ltext0
	.8byte	.LVL63-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL63-.Ltext0
	.8byte	.LFE18-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5d
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST15:
	.8byte	.LVL46-.Ltext0
	.8byte	.LVL47-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL47-1-.Ltext0
	.8byte	.LVL52-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL52-.Ltext0
	.8byte	.LFE17-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST16:
	.8byte	.LVL46-.Ltext0
	.8byte	.LVL47-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL47-1-.Ltext0
	.8byte	.LVL51-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL51-.Ltext0
	.8byte	.LFE17-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST17:
	.8byte	.LVL48-.Ltext0
	.8byte	.LVL50-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL50-.Ltext0
	.8byte	.LFE17-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST11:
	.8byte	.LVL33-.Ltext0
	.8byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL35-.Ltext0
	.8byte	.LVL41-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL41-.Ltext0
	.8byte	.LVL42-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL42-.Ltext0
	.8byte	.LFE16-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST12:
	.8byte	.LVL37-.Ltext0
	.8byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL44-.Ltext0
	.8byte	.LVL45-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL45-.Ltext0
	.8byte	.LFE16-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST13:
	.8byte	.LVL39-.Ltext0
	.8byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL40-.Ltext0
	.8byte	.LVL41-.Ltext0
	.2byte	0x8
	.byte	0x79
	.byte	0x8
	.byte	0x9
	.byte	0xf8
	.byte	0x1a
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.8byte	.LVL41-.Ltext0
	.8byte	.LVL42-.Ltext0
	.2byte	0xb
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x23
	.byte	0x8
	.byte	0x9
	.byte	0xf8
	.byte	0x1a
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST14:
	.8byte	.LVL34-.Ltext0
	.8byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL36-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x5
	.byte	0x78
	.byte	0
	.byte	0x33
	.byte	0x25
	.byte	0x9f
	.8byte	.LVL38-.Ltext0
	.8byte	.LVL41-.Ltext0
	.2byte	0x5
	.byte	0x79
	.byte	0x8
	.byte	0x33
	.byte	0x25
	.byte	0x9f
	.8byte	.LVL41-.Ltext0
	.8byte	.LVL42-.Ltext0
	.2byte	0x8
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x23
	.byte	0x8
	.byte	0x33
	.byte	0x25
	.byte	0x9f
	.8byte	.LVL42-.Ltext0
	.8byte	.LFE16-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST10:
	.8byte	.LVL31-.Ltext0
	.8byte	.LVL32-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL32-1-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL24-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL27-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL24-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL28-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL28-1-.Ltext0
	.8byte	.LVL29-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL29-.Ltext0
	.8byte	.LVL30-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL30-1-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL24-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL28-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL28-1-.Ltext0
	.8byte	.LVL29-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	.LVL29-.Ltext0
	.8byte	.LVL30-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL30-1-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL21-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL22-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL22-1-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.byte	0x8
	.byte	0x9f
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL21-.Ltext0
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
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL4-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL8-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL8-1-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL12-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL12-1-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL13-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL13-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL14-.Ltext0
	.8byte	.LFE12-.Ltext0
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
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF92:
	.string	"caml_alloc_dummy_float"
.LASF61:
	.string	"limit"
.LASF105:
	.string	"result"
.LASF51:
	.string	"caml_young_alloc_start"
.LASF128:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF97:
	.string	"caml_convert_flag_list"
.LASF12:
	.string	"caml_timing_hook"
.LASF104:
	.string	"caml__frame"
.LASF55:
	.string	"caml_young_trigger"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF69:
	.string	"caml_custom_elt"
.LASF31:
	.string	"caml_gc_subphase"
.LASF130:
	.string	"__builtin_memcpy"
.LASF107:
	.string	"caml__dummy_v"
.LASF54:
	.string	"caml_young_limit"
.LASF129:
	.string	"memcpy"
.LASF52:
	.string	"caml_young_alloc_end"
.LASF82:
	.string	"caml_stack_threshold"
.LASF116:
	.string	"profinfo"
.LASF102:
	.string	"caml_alloc_array"
.LASF126:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF21:
	.string	"value"
.LASF64:
	.string	"caml_ref_table"
.LASF40:
	.string	"caml_gc_sweep_hp"
.LASF15:
	.string	"caml_minor_gc_begin_hook"
.LASF114:
	.string	"caml_alloc_tuple"
.LASF124:
	.string	"caml_alloc_shr"
.LASF57:
	.string	"caml_in_minor_collection"
.LASF79:
	.string	"caml_local_roots"
.LASF83:
	.string	"caml_extern_sp"
.LASF86:
	.string	"caml_stack_usage_hook"
.LASF24:
	.string	"tag_t"
.LASF85:
	.string	"caml_trap_barrier"
.LASF119:
	.string	"caml_modify"
.LASF109:
	.string	"caml_copy_string"
.LASF103:
	.string	"funct"
.LASF46:
	.string	"caml_major_gc_hook"
.LASF115:
	.string	"caml_alloc_small_with_my_or_given_profinfo"
.LASF118:
	.string	"caml_alloc"
.LASF45:
	.string	"caml_gc_clock"
.LASF77:
	.string	"nitems"
.LASF18:
	.string	"caml_finalise_end_hook"
.LASF123:
	.string	"caml_gc_dispatch"
.LASF2:
	.string	"long long int"
.LASF89:
	.string	"caml__temp_i"
.LASF42:
	.string	"caml_major_ring"
.LASF60:
	.string	"threshold"
.LASF78:
	.string	"tables"
.LASF8:
	.string	"intnat"
.LASF0:
	.string	"long int"
.LASF67:
	.string	"offset"
.LASF63:
	.string	"reserve"
.LASF87:
	.string	"dummy"
.LASF72:
	.string	"caml_huge_fallback_count"
.LASF70:
	.string	"block"
.LASF29:
	.string	"caml_fl_cur_wsz"
.LASF20:
	.string	"caml_runtime_warnings"
.LASF22:
	.string	"header_t"
.LASF96:
	.string	"caml_alloc_dummy"
.LASF14:
	.string	"caml_major_slice_end_hook"
.LASF25:
	.string	"caml_atom_table"
.LASF3:
	.string	"long double"
.LASF17:
	.string	"caml_finalise_begin_hook"
.LASF58:
	.string	"caml_extra_heap_resources_minor"
.LASF36:
	.string	"caml_dependent_allocated"
.LASF88:
	.string	"newval"
.LASF112:
	.string	"caml_alloc_string"
.LASF23:
	.string	"mlsize_t"
.LASF74:
	.string	"caml__roots_block"
.LASF99:
	.string	"flags"
.LASF9:
	.string	"uintnat"
.LASF48:
	.string	"caml_young_end"
.LASF93:
	.string	"wosize"
.LASF4:
	.string	"unsigned int"
.LASF113:
	.string	"offset_index"
.LASF108:
	.string	"caml__temp_result"
.LASF100:
	.string	"caml_copy_string_array"
.LASF66:
	.string	"ephe"
.LASF13:
	.string	"caml_major_slice_begin_hook"
.LASF6:
	.string	"short unsigned int"
.LASF84:
	.string	"caml_trapsp"
.LASF110:
	.string	"caml_alloc_final"
.LASF47:
	.string	"caml_young_start"
.LASF11:
	.string	"char"
.LASF91:
	.string	"caml_update_dummy"
.LASF117:
	.string	"caml_alloc_small"
.LASF120:
	.string	"strlen"
.LASF43:
	.string	"caml_major_ring_index"
.LASF98:
	.string	"list"
.LASF81:
	.string	"caml_stack_high"
.LASF94:
	.string	"caml_alloc_dummy_function"
.LASF30:
	.string	"caml_gc_phase"
.LASF56:
	.string	"caml_minor_heap_wsz"
.LASF19:
	.string	"caml_verb_gc"
.LASF16:
	.string	"caml_minor_gc_end_hook"
.LASF111:
	.string	"caml_alloc_initialized_string"
.LASF41:
	.string	"caml_major_window"
.LASF27:
	.string	"final_fun"
.LASF122:
	.string	"caml_alloc_custom"
.LASF125:
	.string	"caml_check_urgent_gc"
.LASF1:
	.string	"long unsigned int"
.LASF127:
	.string	"alloc.c"
.LASF34:
	.string	"double"
.LASF26:
	.string	"caml_global_data"
.LASF90:
	.string	"caml__temp_d"
.LASF62:
	.string	"size"
.LASF49:
	.string	"caml_code_area_start"
.LASF37:
	.string	"caml_fl_wsz_at_phase_change"
.LASF71:
	.string	"caml_custom_table"
.LASF50:
	.string	"caml_code_area_end"
.LASF33:
	.string	"caml_extra_heap_resources"
.LASF28:
	.string	"caml_compare_unordered"
.LASF76:
	.string	"ntables"
.LASF106:
	.string	"caml__roots_v"
.LASF35:
	.string	"caml_dependent_size"
.LASF38:
	.string	"caml_heap_start"
.LASF95:
	.string	"arity"
.LASF101:
	.string	"caml_alloc_float_array"
.LASF10:
	.string	"asize_t"
.LASF53:
	.string	"caml_young_ptr"
.LASF39:
	.string	"total_heap_size"
.LASF80:
	.string	"caml_stack_low"
.LASF59:
	.string	"base"
.LASF44:
	.string	"caml_major_work_credit"
.LASF121:
	.string	"caml_final_custom_operations"
.LASF68:
	.string	"caml_ephe_ref_table"
.LASF65:
	.string	"caml_ephe_ref_elt"
.LASF75:
	.string	"next"
.LASF73:
	.string	"caml_use_huge_pages"
.LASF32:
	.string	"caml_allocated_words"
	.ident	"GCC: (GNU) 9.2.0"
