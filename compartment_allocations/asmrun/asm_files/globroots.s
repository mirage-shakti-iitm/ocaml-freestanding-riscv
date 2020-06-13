	.file	"globroots.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.type	random_level, @function
random_level:
.LFB8:
	.file 1 "globroots.c"
	.loc 1 53 1
	.cfi_startproc
	.loc 1 54 3
	.loc 1 55 3
.LVL0:
	.loc 1 59 3
	.loc 1 59 33 is_stmt 0
	lla	a3,random_seed
	lw	a5,0(a3)
	li	a4,69632
	addiw	a4,a4,-563
	mulw	a5,a5,a4
	.loc 1 59 41
	li	a4,24576
	addiw	a4,a4,597
	addw	a5,a5,a4
	sext.w	a4,a5
	.loc 1 59 19
	sw	a5,0(a3)
.LVL1:
	.loc 1 63 3 is_stmt 1
	.loc 1 55 7 is_stmt 0
	li	a0,0
.LVL2:
.L2:
	.loc 1 63 9 is_stmt 1 discriminator 1
	.loc 1 63 13 is_stmt 0 discriminator 1
	li	a5,-1073741824
	and	a5,a4,a5
	sext.w	a5,a5
	.loc 1 63 9 discriminator 1
	li	a3,-1073741824
	bne	a5,a3,.L4
	.loc 1 63 46 is_stmt 1 discriminator 2
	.loc 1 63 51 is_stmt 0 discriminator 2
	addiw	a0,a0,1
.LVL3:
	.loc 1 63 55 is_stmt 1 discriminator 2
	.loc 1 63 57 is_stmt 0 discriminator 2
	slliw	a4,a4,2
.LVL4:
	j	.L2
.LVL5:
.L4:
	.loc 1 66 1
	ret
	.cfi_endproc
.LFE8:
	.size	random_level, .-random_level
	.align	1
	.type	caml_iterate_global_roots, @function
caml_iterate_global_roots:
.LFB11:
	.loc 1 151 1 is_stmt 1
	.cfi_startproc
.LVL6:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	mv	s1,a0
	.loc 1 152 3
	.loc 1 154 3
	.loc 1 154 11 is_stmt 0
	ld	s0,8(a1)
.LVL7:
.L6:
	.loc 1 154 35 is_stmt 1 discriminator 1
	.loc 1 154 3 is_stmt 0 discriminator 1
	beq	s0,zero,.L9
	.loc 1 155 5 is_stmt 1 discriminator 3
	.loc 1 155 11 is_stmt 0 discriminator 3
	ld	a1,0(s0)
	.loc 1 155 5 discriminator 3
	ld	a0,0(a1)
	jalr	s1
.LVL8:
	.loc 1 154 47 is_stmt 1 discriminator 3
	.loc 1 154 50 is_stmt 0 discriminator 3
	ld	s0,8(s0)
.LVL9:
	j	.L6
.L9:
	.loc 1 157 1
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
.LVL10:
	ld	s1,8(sp)
	.cfi_restore 9
.LVL11:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	caml_iterate_global_roots, .-caml_iterate_global_roots
	.align	1
	.type	caml_insert_global_root, @function
caml_insert_global_root:
.LFB9:
	.loc 1 72 1 is_stmt 1
	.cfi_startproc
.LVL12:
	addi	sp,sp,-176
	.cfi_def_cfa_offset 176
	sd	ra,168(sp)
	sd	s0,160(sp)
	sd	s1,152(sp)
	sd	s2,144(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	mv	s1,a0
	mv	s0,a1
	.loc 1 73 3
	.loc 1 74 3
	.loc 1 75 3
	.loc 1 77 3
	.loc 1 80 3
.LVL13:
	.loc 1 82 3
	.loc 1 82 10 is_stmt 0
	lw	a3,144(a0)
.LVL14:
	.loc 1 80 5
	mv	a5,a0
	.loc 1 82 3
	j	.L11
.LVL15:
.L12:
	.loc 1 88 5 is_stmt 1 discriminator 2
	.loc 1 88 15 is_stmt 0 discriminator 2
	slli	a5,a3,3
.LVL16:
	addi	a4,sp,144
	add	a5,a4,a5
	sd	a2,-136(a5)
	.loc 1 82 37 is_stmt 1 discriminator 2
	.loc 1 82 38 is_stmt 0 discriminator 2
	addiw	a3,a3,-1
.LVL17:
	mv	a5,a2
.LVL18:
.L11:
	.loc 1 82 29 is_stmt 1 discriminator 1
	.loc 1 82 3 is_stmt 0 discriminator 1
	blt	a3,zero,.L22
.LVL19:
.L13:
	.loc 1 83 5 is_stmt 1
	.loc 1 84 7
	mv	a2,a5
	.loc 1 84 9 is_stmt 0
	slli	a4,a3,3
	add	a5,a5,a4
.LVL20:
	ld	a5,8(a5)
.LVL21:
	.loc 1 85 7 is_stmt 1
	.loc 1 85 10 is_stmt 0
	beq	a5,zero,.L12
	.loc 1 85 25 discriminator 1
	ld	a4,0(a5)
	.loc 1 85 21 discriminator 1
	bltu	a4,s0,.L13
	j	.L12
.LVL22:
.L22:
	.loc 1 90 3 is_stmt 1
	.loc 1 90 5 is_stmt 0
	ld	a5,8(a5)
.LVL23:
	.loc 1 92 3 is_stmt 1
	.loc 1 92 6 is_stmt 0
	beq	a5,zero,.L14
	.loc 1 92 21 discriminator 1
	ld	a5,0(a5)
.LVL24:
	.loc 1 92 17 discriminator 1
	beq	a5,s0,.L10
.L14:
	.loc 1 94 3 is_stmt 1
	.loc 1 94 15 is_stmt 0
	call	random_level
.LVL25:
	mv	s2,a0
.LVL26:
	.loc 1 95 3 is_stmt 1
	.loc 1 95 27 is_stmt 0
	lw	a5,144(s1)
	.loc 1 95 6
	bge	a5,a0,.L16
	.loc 1 96 5 is_stmt 1
	.loc 1 96 12 is_stmt 0
	addiw	a5,a5,1
.LVL27:
	.loc 1 96 5
	j	.L17
.LVL28:
.L18:
	.loc 1 97 7 is_stmt 1 discriminator 3
	.loc 1 97 17 is_stmt 0 discriminator 3
	slli	a4,a5,3
	addi	a3,sp,144
	add	a4,a3,a4
	sd	s1,-136(a4)
	.loc 1 96 51 is_stmt 1 discriminator 3
	.loc 1 96 52 is_stmt 0 discriminator 3
	addiw	a5,a5,1
.LVL29:
.L17:
	.loc 1 96 35 is_stmt 1 discriminator 1
	.loc 1 96 5 is_stmt 0 discriminator 1
	ble	a5,s2,.L18
	.loc 1 98 5 is_stmt 1
	.loc 1 98 21 is_stmt 0
	sw	s2,144(s1)
.LVL30:
.L16:
	.loc 1 100 3 is_stmt 1
	.loc 1 100 50 is_stmt 0
	addi	a0,s2,2
.LVL31:
	.loc 1 100 7
	slli	a0,a0,3
	call	caml_stat_alloc
.LVL32:
	.loc 1 102 3 is_stmt 1
	.loc 1 102 11 is_stmt 0
	sd	s0,0(a0)
	.loc 1 103 3 is_stmt 1
.LVL33:
	.loc 1 103 10 is_stmt 0
	li	a3,0
	.loc 1 103 3
	j	.L19
.LVL34:
.L20:
	.loc 1 104 5 is_stmt 1 discriminator 3
	.loc 1 104 27 is_stmt 0 discriminator 3
	slli	a5,a3,3
	addi	a4,sp,144
	add	a4,a4,a5
	ld	a4,-136(a4)
	.loc 1 104 39 discriminator 3
	add	a4,a4,a5
	ld	a2,8(a4)
	.loc 1 104 19 discriminator 3
	add	a5,a0,a5
	sd	a2,8(a5)
	.loc 1 105 5 is_stmt 1 discriminator 3
	.loc 1 105 27 is_stmt 0 discriminator 3
	sd	a0,8(a4)
	.loc 1 103 31 is_stmt 1 discriminator 3
	.loc 1 103 32 is_stmt 0 discriminator 3
	addiw	a3,a3,1
.LVL35:
.L19:
	.loc 1 103 15 is_stmt 1 discriminator 1
	.loc 1 103 3 is_stmt 0 discriminator 1
	ble	a3,s2,.L20
.LVL36:
.L10:
	.loc 1 107 1
	ld	ra,168(sp)
	.cfi_restore 1
	ld	s0,160(sp)
	.cfi_restore 8
.LVL37:
	ld	s1,152(sp)
	.cfi_restore 9
.LVL38:
	ld	s2,144(sp)
	.cfi_restore 18
	addi	sp,sp,176
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	caml_insert_global_root, .-caml_insert_global_root
	.align	1
	.type	caml_delete_global_root, @function
caml_delete_global_root:
.LFB10:
	.loc 1 113 1 is_stmt 1
	.cfi_startproc
.LVL39:
	addi	sp,sp,-160
	.cfi_def_cfa_offset 160
	sd	ra,152(sp)
	sd	s0,144(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	mv	s0,a0
	.loc 1 114 3
	.loc 1 115 3
	.loc 1 116 3
	.loc 1 118 3
	.loc 1 121 3
.LVL40:
	.loc 1 123 3
	.loc 1 123 10 is_stmt 0
	lw	a3,144(a0)
.LVL41:
	.loc 1 121 5
	mv	a5,a0
	.loc 1 123 3
	j	.L24
.LVL42:
.L25:
	.loc 1 129 5 is_stmt 1 discriminator 2
	.loc 1 129 15 is_stmt 0 discriminator 2
	slli	a5,a3,3
.LVL43:
	addi	a4,sp,144
	add	a5,a4,a5
	sd	a2,-136(a5)
	.loc 1 123 37 is_stmt 1 discriminator 2
	.loc 1 123 38 is_stmt 0 discriminator 2
	addiw	a3,a3,-1
.LVL44:
	mv	a5,a2
.LVL45:
.L24:
	.loc 1 123 29 is_stmt 1 discriminator 1
	.loc 1 123 3 is_stmt 0 discriminator 1
	blt	a3,zero,.L37
.LVL46:
.L26:
	.loc 1 124 5 is_stmt 1
	.loc 1 125 7
	mv	a2,a5
	.loc 1 125 9 is_stmt 0
	slli	a4,a3,3
	add	a5,a5,a4
.LVL47:
	ld	a5,8(a5)
.LVL48:
	.loc 1 126 7 is_stmt 1
	.loc 1 126 10 is_stmt 0
	beq	a5,zero,.L25
	.loc 1 126 25 discriminator 1
	ld	a4,0(a5)
	.loc 1 126 21 discriminator 1
	bltu	a4,a1,.L26
	j	.L25
.LVL49:
.L37:
	.loc 1 131 3 is_stmt 1
	.loc 1 131 5 is_stmt 0
	ld	a0,8(a5)
.LVL50:
	.loc 1 133 3 is_stmt 1
	.loc 1 133 6 is_stmt 0
	beq	a0,zero,.L23
	.loc 1 133 21 discriminator 2
	ld	a5,0(a0)
	.loc 1 133 17 discriminator 2
	beq	a5,a1,.L38
.LVL51:
.L23:
	.loc 1 145 1
	ld	ra,152(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,144(sp)
	.cfi_restore 8
.LVL52:
	addi	sp,sp,160
	.cfi_def_cfa_offset 0
	jr	ra
.LVL53:
.L30:
	.cfi_restore_state
	.loc 1 135 37 is_stmt 1 discriminator 2
	.loc 1 135 38 is_stmt 0 discriminator 2
	addiw	a4,a4,1
.LVL54:
.L28:
	.loc 1 135 15 is_stmt 1 discriminator 1
	.loc 1 135 28 is_stmt 0 discriminator 1
	lw	a5,144(s0)
	.loc 1 135 3 discriminator 1
	blt	a5,a4,.L39
	.loc 1 136 5 is_stmt 1
	.loc 1 136 15 is_stmt 0
	slli	a5,a4,3
	addi	a3,sp,144
	add	a3,a3,a5
	ld	a3,-136(a3)
	.loc 1 136 27
	add	a5,a3,a5
	ld	a5,8(a5)
	.loc 1 136 8
	bne	a5,a0,.L30
	.loc 1 137 7 is_stmt 1
	.loc 1 137 41 is_stmt 0
	slli	a5,a4,3
	add	a2,a0,a5
	ld	a2,8(a2)
	.loc 1 137 29
	add	a3,a3,a5
	sd	a2,8(a3)
	j	.L30
.LVL55:
.L38:
	.loc 1 135 10
	li	a4,0
	j	.L28
.LVL56:
.L39:
	.loc 1 140 3 is_stmt 1
	call	caml_stat_free
.LVL57:
	.loc 1 142 3
	.loc 1 142 9 is_stmt 0
	j	.L32
.L34:
	.loc 1 144 5 is_stmt 1
	.loc 1 144 20 is_stmt 0
	addiw	a5,a5,-1
	sw	a5,144(s0)
.L32:
	.loc 1 142 9 is_stmt 1
	.loc 1 142 18 is_stmt 0
	lw	a5,144(s0)
	.loc 1 142 9
	ble	a5,zero,.L23
	.loc 1 143 27 discriminator 1
	slli	a4,a5,3
	add	a4,s0,a4
	ld	a4,8(a4)
	.loc 1 142 30 discriminator 1
	beq	a4,zero,.L34
	j	.L23
	.cfi_endproc
.LFE10:
	.size	caml_delete_global_root, .-caml_delete_global_root
	.align	1
	.type	caml_empty_global_roots, @function
caml_empty_global_roots:
.LFB12:
	.loc 1 162 1 is_stmt 1
	.cfi_startproc
.LVL58:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	mv	s0,a0
	.loc 1 163 3
	.loc 1 164 3
	.loc 1 166 3
	.loc 1 168 3
	.loc 1 168 11 is_stmt 0
	ld	a0,8(a0)
.LVL59:
.L41:
	.loc 1 168 35 is_stmt 1 discriminator 1
	.loc 1 168 3 is_stmt 0 discriminator 1
	beq	a0,zero,.L46
	.loc 1 169 5 is_stmt 1
	.loc 1 169 10 is_stmt 0
	ld	s1,8(a0)
.LVL60:
	.loc 1 170 5 is_stmt 1
	call	caml_stat_free
.LVL61:
	.loc 1 171 5
	.loc 1 171 8 is_stmt 0
	mv	a0,s1
	j	.L41
.LVL62:
.L46:
	.loc 1 173 10
	li	a5,0
	j	.L43
.LVL63:
.L44:
	.loc 1 173 42 is_stmt 1 discriminator 3
	.loc 1 173 63 is_stmt 0 discriminator 3
	slli	a4,a5,3
	add	a4,s0,a4
	sd	zero,8(a4)
	.loc 1 173 37 is_stmt 1 discriminator 3
	.loc 1 173 38 is_stmt 0 discriminator 3
	addiw	a5,a5,1
.LVL64:
.L43:
	.loc 1 173 15 is_stmt 1 discriminator 1
	.loc 1 173 28 is_stmt 0 discriminator 1
	lw	a4,144(s0)
	.loc 1 173 3 discriminator 1
	bge	a4,a5,.L44
	.loc 1 174 3 is_stmt 1
	.loc 1 174 19 is_stmt 0
	sw	zero,144(s0)
	.loc 1 175 1
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
.LVL65:
	ld	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	caml_empty_global_roots, .-caml_empty_global_roots
	.align	1
	.globl	caml_register_global_root
	.type	caml_register_global_root, @function
caml_register_global_root:
.LFB13:
	.loc 1 189 1 is_stmt 1
	.cfi_startproc
.LVL66:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	mv	a1,a0
	.loc 1 190 3
	.loc 1 191 3
	lla	a0,.LANCHOR0
.LVL67:
	call	caml_insert_global_root
.LVL68:
	.loc 1 192 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE13:
	.size	caml_register_global_root, .-caml_register_global_root
	.align	1
	.globl	caml_remove_global_root
	.type	caml_remove_global_root, @function
caml_remove_global_root:
.LFB14:
	.loc 1 197 1 is_stmt 1
	.cfi_startproc
.LVL69:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	mv	a1,a0
	.loc 1 198 3
	lla	a0,.LANCHOR0
.LVL70:
	call	caml_delete_global_root
.LVL71:
	.loc 1 199 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	caml_remove_global_root, .-caml_remove_global_root
	.align	1
	.globl	caml_register_generational_global_root
	.type	caml_register_generational_global_root, @function
caml_register_generational_global_root:
.LFB15:
	.loc 1 204 1 is_stmt 1
	.cfi_startproc
.LVL72:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	mv	s0,a0
	.loc 1 205 3
	.loc 1 205 9 is_stmt 0
	ld	a0,0(a0)
.LVL73:
	.loc 1 206 3 is_stmt 1
	.loc 1 207 3
	.loc 1 207 7 is_stmt 0
	andi	a5,a0,1
	.loc 1 207 6
	bne	a5,zero,.L51
	.loc 1 208 5 is_stmt 1
	.loc 1 208 9 is_stmt 0
	ld	a4,caml_young_end
	bgeu	a0,a4,.L53
	.loc 1 208 9 discriminator 1
	ld	a4,caml_young_start
	bgtu	a0,a4,.L55
.L53:
	.loc 1 210 10 is_stmt 1
	.loc 1 210 14 is_stmt 0
	call	caml_page_table_lookup
.LVL74:
	andi	a0,a0,1
	.loc 1 210 13
	bne	a0,zero,.L56
.L51:
	.loc 1 213 1
	ld	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
.LVL75:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL76:
.L55:
	.cfi_restore_state
	.loc 1 209 7 is_stmt 1
	mv	a1,s0
	lla	a0,.LANCHOR0+152
.LVL77:
	call	caml_insert_global_root
.LVL78:
	j	.L51
.L56:
	.loc 1 211 7
	mv	a1,s0
	lla	a0,.LANCHOR0+304
	call	caml_insert_global_root
.LVL79:
	.loc 1 213 1 is_stmt 0
	j	.L51
	.cfi_endproc
.LFE15:
	.size	caml_register_generational_global_root, .-caml_register_generational_global_root
	.align	1
	.globl	caml_remove_generational_global_root
	.type	caml_remove_generational_global_root, @function
caml_remove_generational_global_root:
.LFB16:
	.loc 1 218 1 is_stmt 1
	.cfi_startproc
.LVL80:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.loc 1 219 3
	.loc 1 219 9 is_stmt 0
	ld	s1,0(a0)
.LVL81:
	.loc 1 220 3 is_stmt 1
	.loc 1 220 7 is_stmt 0
	andi	a5,s1,1
	.loc 1 220 6
	beq	a5,zero,.L61
.LVL82:
.L57:
	.loc 1 226 1
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	ld	s1,8(sp)
	.cfi_restore 9
.LVL83:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL84:
.L61:
	.cfi_restore_state
	mv	s0,a0
	.loc 1 221 5 is_stmt 1
	.loc 1 221 9 is_stmt 0
	mv	a0,s1
.LVL85:
	call	caml_page_table_lookup
.LVL86:
	andi	a0,a0,3
	.loc 1 221 8
	bne	a0,zero,.L62
.L59:
	.loc 1 223 5 is_stmt 1
	.loc 1 223 9 is_stmt 0
	mv	a0,s1
	call	caml_page_table_lookup
.LVL87:
	andi	a0,a0,1
	.loc 1 223 8
	beq	a0,zero,.L57
	.loc 1 224 7 is_stmt 1
	mv	a1,s0
	lla	a0,.LANCHOR0+304
	call	caml_delete_global_root
.LVL88:
	.loc 1 226 1 is_stmt 0
	j	.L57
.L62:
	.loc 1 222 7 is_stmt 1
	mv	a1,s0
	lla	a0,.LANCHOR0+152
	call	caml_delete_global_root
.LVL89:
	j	.L59
	.cfi_endproc
.LFE16:
	.size	caml_remove_generational_global_root, .-caml_remove_generational_global_root
	.align	1
	.globl	caml_modify_generational_global_root
	.type	caml_modify_generational_global_root, @function
caml_modify_generational_global_root:
.LFB17:
	.loc 1 231 1
	.cfi_startproc
.LVL90:
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
	mv	s3,a0
	mv	s0,a1
	.loc 1 232 3
	.loc 1 232 9 is_stmt 0
	ld	s2,0(a0)
.LVL91:
	.loc 1 238 3 is_stmt 1
	.loc 1 238 7 is_stmt 0
	andi	s1,a1,1
	.loc 1 238 6
	bne	s1,zero,.L64
	.loc 1 238 27 discriminator 1
	ld	a5,caml_young_end
	bgeu	a1,a5,.L64
	.loc 1 238 27 discriminator 2
	ld	a5,caml_young_start
	bleu	a1,a5,.L64
	.loc 1 239 7
	andi	a5,s2,1
	.loc 1 238 44
	beq	a5,zero,.L72
.LVL92:
.L64:
	.loc 1 244 8 is_stmt 1
	.loc 1 244 13 is_stmt 0
	andi	a5,s2,1
	.loc 1 244 11
	beq	a5,zero,.L66
	.loc 1 244 30 discriminator 1
	bne	s1,zero,.L66
	.loc 1 249 5 is_stmt 1
	.loc 1 249 9 is_stmt 0
	ld	a5,caml_young_end
	bgeu	s0,a5,.L67
	.loc 1 249 9 discriminator 1
	ld	a5,caml_young_start
	bgtu	s0,a5,.L68
.L67:
	.loc 1 251 10 is_stmt 1
	.loc 1 251 14 is_stmt 0
	mv	a0,s0
	call	caml_page_table_lookup
.LVL93:
	andi	a0,a0,1
	.loc 1 251 13
	beq	a0,zero,.L65
	.loc 1 252 7 is_stmt 1
	mv	a1,s3
	lla	a0,.LANCHOR0+304
	call	caml_insert_global_root
.LVL94:
	j	.L65
.LVL95:
.L72:
	.loc 1 239 27 is_stmt 0
	mv	a0,s2
.LVL96:
	call	caml_page_table_lookup
.LVL97:
	andi	a0,a0,1
	.loc 1 239 24
	beq	a0,zero,.L64
	.loc 1 240 5 is_stmt 1
	mv	a1,s3
	lla	a0,.LANCHOR0+304
	call	caml_delete_global_root
.LVL98:
	.loc 1 241 5
	mv	a1,s3
	lla	a0,.LANCHOR0+152
	call	caml_insert_global_root
.LVL99:
	j	.L65
.L68:
	.loc 1 250 7
	mv	a1,s3
	lla	a0,.LANCHOR0+152
	call	caml_insert_global_root
.LVL100:
	j	.L65
.L66:
	.loc 1 254 8
	.loc 1 254 11 is_stmt 0
	bne	a5,zero,.L65
	.loc 1 254 29 discriminator 1
	bne	s1,zero,.L73
.L65:
	.loc 1 265 3 is_stmt 1
	.loc 1 265 6 is_stmt 0
	sd	s0,0(s3)
	.loc 1 266 1
	ld	ra,40(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
.LVL101:
	ld	s1,24(sp)
	.cfi_restore 9
	ld	s2,16(sp)
	.cfi_restore 18
.LVL102:
	ld	s3,8(sp)
	.cfi_restore 19
.LVL103:
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.LVL104:
.L73:
	.cfi_restore_state
	.loc 1 259 5 is_stmt 1
	.loc 1 259 9 is_stmt 0
	mv	a0,s2
	call	caml_page_table_lookup
.LVL105:
	andi	a0,a0,3
	.loc 1 259 8
	bne	a0,zero,.L74
.L70:
	.loc 1 261 5 is_stmt 1
	.loc 1 261 9 is_stmt 0
	mv	a0,s2
	call	caml_page_table_lookup
.LVL106:
	andi	a0,a0,1
	.loc 1 261 8
	beq	a0,zero,.L65
	.loc 1 262 7 is_stmt 1
	mv	a1,s3
	lla	a0,.LANCHOR0+304
	call	caml_delete_global_root
.LVL107:
	j	.L65
.L74:
	.loc 1 260 7
	mv	a1,s3
	lla	a0,.LANCHOR0+152
	call	caml_delete_global_root
.LVL108:
	j	.L70
	.cfi_endproc
.LFE17:
	.size	caml_modify_generational_global_root, .-caml_modify_generational_global_root
	.align	1
	.globl	caml_scan_global_roots
	.type	caml_scan_global_roots, @function
caml_scan_global_roots:
.LFB18:
	.loc 1 271 1
	.cfi_startproc
.LVL109:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	mv	s0,a0
	.loc 1 272 3
	lla	a1,.LANCHOR0
	call	caml_iterate_global_roots
.LVL110:
	.loc 1 273 3
	lla	a1,.LANCHOR0+152
	mv	a0,s0
	call	caml_iterate_global_roots
.LVL111:
	.loc 1 274 3
	lla	a1,.LANCHOR0+304
	mv	a0,s0
	call	caml_iterate_global_roots
.LVL112:
	.loc 1 275 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
.LVL113:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE18:
	.size	caml_scan_global_roots, .-caml_scan_global_roots
	.align	1
	.globl	caml_scan_global_young_roots
	.type	caml_scan_global_young_roots, @function
caml_scan_global_young_roots:
.LFB19:
	.loc 1 280 1 is_stmt 1
	.cfi_startproc
.LVL114:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	mv	s0,a0
	.loc 1 281 3
	.loc 1 283 3
	lla	s1,.LANCHOR0
	mv	a1,s1
	call	caml_iterate_global_roots
.LVL115:
	.loc 1 284 3
	lla	a1,.LANCHOR0+152
	mv	a0,s0
	call	caml_iterate_global_roots
.LVL116:
	.loc 1 286 3
	.loc 1 286 11 is_stmt 0
	ld	s0,160(s1)
.LVL117:
.L78:
	.loc 1 287 8 is_stmt 1 discriminator 1
	.loc 1 286 3 is_stmt 0 discriminator 1
	beq	s0,zero,.L81
	.loc 1 288 5 is_stmt 1 discriminator 1
	ld	a1,0(s0)
	lla	a0,.LANCHOR0+304
	call	caml_insert_global_root
.LVL118:
	.loc 1 287 20 discriminator 1
	.loc 1 287 23 is_stmt 0 discriminator 1
	ld	s0,8(s0)
.LVL119:
	j	.L78
.L81:
	.loc 1 290 3 is_stmt 1
	lla	a0,.LANCHOR0+152
	call	caml_empty_global_roots
.LVL120:
	.loc 1 291 1 is_stmt 0
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
.LVL121:
	ld	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE19:
	.size	caml_scan_global_young_roots, .-caml_scan_global_young_roots
	.globl	caml_global_roots_old
	.globl	caml_global_roots_young
	.globl	caml_global_roots
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	caml_global_roots, @object
	.size	caml_global_roots, 152
caml_global_roots:
	.zero	152
	.type	caml_global_roots_young, @object
	.size	caml_global_roots_young, 152
caml_global_roots_young:
	.zero	152
	.type	caml_global_roots_old, @object
	.size	caml_global_roots_old, 152
caml_global_roots_old:
	.zero	152
	.section	.sbss,"aw",@nobits
	.align	2
	.type	random_seed, @object
	.size	random_seed, 4
random_seed:
	.zero	4
	.text
.Letext0:
	.file 2 "caml/config.h"
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 4 "caml/misc.h"
	.file 5 "caml/mlvalues.h"
	.file 6 "caml/freelist.h"
	.file 7 "caml/major_gc.h"
	.file 8 "caml/address_class.h"
	.file 9 "caml/minor_gc.h"
	.file 10 "caml/memory.h"
	.file 11 "caml/roots.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xd82
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF110
	.byte	0xc
	.4byte	.LASF111
	.4byte	.LASF112
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x4e
	.byte	0x1a
	.4byte	0x40
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.byte	0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF2
	.byte	0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF4
	.byte	0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x5b
	.byte	0xe
	.4byte	0x47
	.byte	0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x5c
	.byte	0x17
	.4byte	0x4e
	.byte	0x3
	.4byte	.LASF8
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.4byte	0x4e
	.byte	0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.byte	0x4
	.byte	0x10
	.byte	0x4
	.4byte	.LASF10
	.byte	0x3
	.4byte	.LASF11
	.byte	0x4
	.byte	0x21
	.byte	0x10
	.4byte	0x7b
	.byte	0x3
	.4byte	.LASF12
	.byte	0x4
	.byte	0x28
	.byte	0x10
	.4byte	0xad
	.byte	0x5
	.byte	0x8
	.4byte	0xb3
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.byte	0x3
	.4byte	.LASF14
	.byte	0x4
	.byte	0x5c
	.byte	0x10
	.4byte	0xc6
	.byte	0x5
	.byte	0x8
	.4byte	0xcc
	.byte	0x6
	.byte	0x7
	.4byte	.LASF15
	.byte	0x4
	.byte	0x5d
	.byte	0x19
	.4byte	0xba
	.byte	0x7
	.4byte	.LASF16
	.byte	0x4
	.byte	0x5d
	.byte	0x36
	.4byte	0xba
	.byte	0x7
	.4byte	.LASF17
	.byte	0x4
	.byte	0x5e
	.byte	0x19
	.4byte	0xba
	.byte	0x7
	.4byte	.LASF18
	.byte	0x4
	.byte	0x5e
	.byte	0x33
	.4byte	0xba
	.byte	0x7
	.4byte	.LASF19
	.byte	0x4
	.byte	0x5f
	.byte	0x19
	.4byte	0xba
	.byte	0x7
	.4byte	.LASF20
	.byte	0x4
	.byte	0x5f
	.byte	0x33
	.4byte	0xba
	.byte	0x8
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x169
	.byte	0x10
	.4byte	0x6f
	.byte	0x8
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x171
	.byte	0x10
	.4byte	0x6f
	.byte	0x3
	.4byte	.LASF23
	.byte	0x5
	.byte	0x3c
	.byte	0x10
	.4byte	0x63
	.byte	0x3
	.4byte	.LASF24
	.byte	0x5
	.byte	0x3d
	.byte	0x11
	.4byte	0x6f
	.byte	0x3
	.4byte	.LASF25
	.byte	0x5
	.byte	0x3e
	.byte	0x11
	.4byte	0x6f
	.byte	0x9
	.4byte	0x13b
	.4byte	0x15e
	.byte	0xa
	.byte	0
	.byte	0x8
	.4byte	.LASF26
	.byte	0x5
	.2byte	0x15c
	.byte	0x15
	.4byte	0x153
	.byte	0x8
	.4byte	.LASF27
	.byte	0x5
	.2byte	0x171
	.byte	0xe
	.4byte	0x12f
	.byte	0x7
	.4byte	.LASF28
	.byte	0x6
	.byte	0x1a
	.byte	0x10
	.4byte	0x95
	.byte	0x7
	.4byte	.LASF29
	.byte	0x7
	.byte	0x24
	.byte	0xc
	.4byte	0x2d
	.byte	0x7
	.4byte	.LASF30
	.byte	0x7
	.byte	0x25
	.byte	0xc
	.4byte	0x2d
	.byte	0x7
	.4byte	.LASF31
	.byte	0x7
	.byte	0x26
	.byte	0x10
	.4byte	0x6f
	.byte	0x7
	.4byte	.LASF32
	.byte	0x7
	.byte	0x27
	.byte	0xf
	.4byte	0x1b4
	.byte	0x4
	.byte	0x8
	.byte	0x4
	.4byte	.LASF33
	.byte	0x7
	.4byte	.LASF34
	.byte	0x7
	.byte	0x28
	.byte	0x10
	.4byte	0x6f
	.byte	0x7
	.4byte	.LASF35
	.byte	0x7
	.byte	0x28
	.byte	0x25
	.4byte	0x6f
	.byte	0x7
	.4byte	.LASF36
	.byte	0x7
	.byte	0x29
	.byte	0x10
	.4byte	0x6f
	.byte	0x7
	.4byte	.LASF37
	.byte	0x7
	.byte	0x3e
	.byte	0x12
	.4byte	0xad
	.byte	0x7
	.4byte	.LASF38
	.byte	0x7
	.byte	0x3f
	.byte	0x10
	.4byte	0x6f
	.byte	0x7
	.4byte	.LASF39
	.byte	0x7
	.byte	0x40
	.byte	0xe
	.4byte	0xad
	.byte	0x7
	.4byte	.LASF40
	.byte	0x7
	.byte	0x42
	.byte	0xc
	.4byte	0x2d
	.byte	0x9
	.4byte	0x1b4
	.4byte	0x21f
	.byte	0xb
	.4byte	0x4e
	.byte	0x31
	.byte	0
	.byte	0xc
	.4byte	.LASF41
	.byte	0x7
	.byte	0x43
	.byte	0x8
	.4byte	0x20f
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0xc
	.4byte	.LASF42
	.byte	0x7
	.byte	0x44
	.byte	0x5
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0xc
	.4byte	.LASF43
	.byte	0x7
	.byte	0x45
	.byte	0x8
	.4byte	0x1b4
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0x7
	.4byte	.LASF44
	.byte	0x7
	.byte	0x46
	.byte	0xf
	.4byte	0x1b4
	.byte	0x7
	.4byte	.LASF45
	.byte	0x7
	.byte	0x4a
	.byte	0x13
	.4byte	0xc6
	.byte	0x7
	.4byte	.LASF46
	.byte	0x8
	.byte	0x31
	.byte	0xf
	.4byte	0x285
	.byte	0x5
	.byte	0x8
	.4byte	0x12f
	.byte	0x7
	.4byte	.LASF47
	.byte	0x8
	.byte	0x31
	.byte	0x22
	.4byte	0x285
	.byte	0x7
	.4byte	.LASF48
	.byte	0x8
	.byte	0x32
	.byte	0xf
	.4byte	0xad
	.byte	0x7
	.4byte	.LASF49
	.byte	0x8
	.byte	0x32
	.byte	0x27
	.4byte	0xad
	.byte	0x7
	.4byte	.LASF50
	.byte	0x9
	.byte	0x18
	.byte	0x13
	.4byte	0x285
	.byte	0x7
	.4byte	.LASF51
	.byte	0x9
	.byte	0x18
	.byte	0x2c
	.4byte	0x285
	.byte	0x7
	.4byte	.LASF52
	.byte	0x9
	.byte	0x19
	.byte	0x13
	.4byte	0x285
	.byte	0x7
	.4byte	.LASF53
	.byte	0x9
	.byte	0x19
	.byte	0x24
	.4byte	0x285
	.byte	0x7
	.4byte	.LASF54
	.byte	0x9
	.byte	0x1a
	.byte	0x13
	.4byte	0x285
	.byte	0x7
	.4byte	.LASF55
	.byte	0x9
	.byte	0x1b
	.byte	0x10
	.4byte	0x95
	.byte	0x7
	.4byte	.LASF56
	.byte	0x9
	.byte	0x1c
	.byte	0xc
	.4byte	0x2d
	.byte	0x7
	.4byte	.LASF57
	.byte	0x9
	.byte	0x1d
	.byte	0xf
	.4byte	0x1b4
	.byte	0xd
	.4byte	.LASF63
	.byte	0x38
	.byte	0x9
	.byte	0x29
	.byte	0x8
	.4byte	0x378
	.byte	0xe
	.4byte	.LASF58
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x378
	.byte	0
	.byte	0xf
	.string	"end"
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x378
	.byte	0x8
	.byte	0xe
	.4byte	.LASF59
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x378
	.byte	0x10
	.byte	0xf
	.string	"ptr"
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x378
	.byte	0x18
	.byte	0xe
	.4byte	.LASF60
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x378
	.byte	0x20
	.byte	0xe
	.4byte	.LASF61
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x95
	.byte	0x28
	.byte	0xe
	.4byte	.LASF62
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x95
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x285
	.byte	0x7
	.4byte	.LASF63
	.byte	0x9
	.byte	0x2a
	.byte	0x22
	.4byte	0x30f
	.byte	0xd
	.4byte	.LASF64
	.byte	0x10
	.byte	0x9
	.byte	0x2c
	.byte	0x8
	.4byte	0x3b2
	.byte	0xe
	.4byte	.LASF65
	.byte	0x9
	.byte	0x2d
	.byte	0x9
	.4byte	0x12f
	.byte	0
	.byte	0xe
	.4byte	.LASF66
	.byte	0x9
	.byte	0x2e
	.byte	0xc
	.4byte	0x147
	.byte	0x8
	.byte	0
	.byte	0xd
	.4byte	.LASF67
	.byte	0x38
	.byte	0x9
	.byte	0x31
	.byte	0x8
	.4byte	0x41b
	.byte	0xe
	.4byte	.LASF58
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x41b
	.byte	0
	.byte	0xf
	.string	"end"
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x41b
	.byte	0x8
	.byte	0xe
	.4byte	.LASF59
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x41b
	.byte	0x10
	.byte	0xf
	.string	"ptr"
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x41b
	.byte	0x18
	.byte	0xe
	.4byte	.LASF60
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x41b
	.byte	0x20
	.byte	0xe
	.4byte	.LASF61
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x95
	.byte	0x28
	.byte	0xe
	.4byte	.LASF62
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x95
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x38a
	.byte	0x7
	.4byte	.LASF67
	.byte	0x9
	.byte	0x32
	.byte	0x27
	.4byte	0x3b2
	.byte	0xd
	.4byte	.LASF68
	.byte	0x18
	.byte	0x9
	.byte	0x34
	.byte	0x8
	.4byte	0x462
	.byte	0xe
	.4byte	.LASF69
	.byte	0x9
	.byte	0x35
	.byte	0x9
	.4byte	0x12f
	.byte	0
	.byte	0xf
	.string	"mem"
	.byte	0x9
	.byte	0x36
	.byte	0xc
	.4byte	0x147
	.byte	0x8
	.byte	0xf
	.string	"max"
	.byte	0x9
	.byte	0x37
	.byte	0xc
	.4byte	0x147
	.byte	0x10
	.byte	0
	.byte	0xd
	.4byte	.LASF70
	.byte	0x38
	.byte	0x9
	.byte	0x3a
	.byte	0x8
	.4byte	0x4cb
	.byte	0xe
	.4byte	.LASF58
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4cb
	.byte	0
	.byte	0xf
	.string	"end"
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4cb
	.byte	0x8
	.byte	0xe
	.4byte	.LASF59
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4cb
	.byte	0x10
	.byte	0xf
	.string	"ptr"
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4cb
	.byte	0x18
	.byte	0xe
	.4byte	.LASF60
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4cb
	.byte	0x20
	.byte	0xe
	.4byte	.LASF61
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x95
	.byte	0x28
	.byte	0xe
	.4byte	.LASF62
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x95
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x42d
	.byte	0x7
	.4byte	.LASF70
	.byte	0x9
	.byte	0x3b
	.byte	0x25
	.4byte	0x462
	.byte	0x7
	.4byte	.LASF71
	.byte	0xa
	.byte	0x3f
	.byte	0x10
	.4byte	0x2d
	.byte	0x7
	.4byte	.LASF72
	.byte	0xa
	.byte	0xb7
	.byte	0x10
	.4byte	0x6f
	.byte	0xd
	.4byte	.LASF73
	.byte	0x40
	.byte	0xa
	.byte	0xf3
	.byte	0x8
	.4byte	0x537
	.byte	0xe
	.4byte	.LASF74
	.byte	0xa
	.byte	0xf4
	.byte	0x1d
	.4byte	0x537
	.byte	0
	.byte	0xe
	.4byte	.LASF75
	.byte	0xa
	.byte	0xf5
	.byte	0xa
	.4byte	0x63
	.byte	0x8
	.byte	0xe
	.4byte	.LASF76
	.byte	0xa
	.byte	0xf6
	.byte	0xa
	.4byte	0x63
	.byte	0x10
	.byte	0xe
	.4byte	.LASF77
	.byte	0xa
	.byte	0xf7
	.byte	0xa
	.4byte	0x53d
	.byte	0x18
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x4f5
	.byte	0x9
	.4byte	0x285
	.4byte	0x54d
	.byte	0xb
	.4byte	0x4e
	.byte	0x4
	.byte	0
	.byte	0x7
	.4byte	.LASF78
	.byte	0xa
	.byte	0xfa
	.byte	0x26
	.4byte	0x537
	.byte	0x3
	.4byte	.LASF79
	.byte	0xb
	.byte	0x18
	.byte	0x10
	.4byte	0x565
	.byte	0x5
	.byte	0x8
	.4byte	0x56b
	.byte	0x10
	.4byte	0x57b
	.byte	0x11
	.4byte	0x12f
	.byte	0x11
	.4byte	0x285
	.byte	0
	.byte	0x7
	.4byte	.LASF80
	.byte	0xb
	.byte	0x1e
	.byte	0x10
	.4byte	0x6f
	.byte	0x10
	.4byte	0x592
	.byte	0x11
	.4byte	0x559
	.byte	0
	.byte	0x7
	.4byte	.LASF81
	.byte	0xb
	.byte	0x28
	.byte	0x13
	.4byte	0x59e
	.byte	0x5
	.byte	0x8
	.4byte	0x587
	.byte	0xd
	.4byte	.LASF82
	.byte	0x10
	.byte	0x1
	.byte	0x1e
	.byte	0x8
	.4byte	0x5cc
	.byte	0xe
	.4byte	.LASF83
	.byte	0x1
	.byte	0x1f
	.byte	0xb
	.4byte	0x285
	.byte	0
	.byte	0xe
	.4byte	.LASF84
	.byte	0x1
	.byte	0x20
	.byte	0x18
	.4byte	0x5cc
	.byte	0x8
	.byte	0
	.byte	0x9
	.4byte	0x5dc
	.4byte	0x5dc
	.byte	0xb
	.4byte	0x4e
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x5a4
	.byte	0xd
	.4byte	.LASF85
	.byte	0x98
	.byte	0x1
	.byte	0x25
	.byte	0x8
	.4byte	0x617
	.byte	0xe
	.4byte	.LASF83
	.byte	0x1
	.byte	0x26
	.byte	0xb
	.4byte	0x285
	.byte	0
	.byte	0xe
	.4byte	.LASF84
	.byte	0x1
	.byte	0x27
	.byte	0x18
	.4byte	0x617
	.byte	0x8
	.byte	0xe
	.4byte	.LASF86
	.byte	0x1
	.byte	0x28
	.byte	0x7
	.4byte	0x2d
	.byte	0x90
	.byte	0
	.byte	0x9
	.4byte	0x5dc
	.4byte	0x627
	.byte	0xb
	.4byte	0x4e
	.byte	0x10
	.byte	0
	.byte	0x12
	.4byte	.LASF90
	.byte	0x1
	.byte	0x32
	.byte	0x11
	.4byte	0x34
	.byte	0x9
	.byte	0x3
	.8byte	random_seed
	.byte	0xc
	.4byte	.LASF87
	.byte	0x1
	.byte	0xb3
	.byte	0x19
	.4byte	0x5e2
	.byte	0x9
	.byte	0x3
	.8byte	caml_global_roots
	.byte	0xc
	.4byte	.LASF88
	.byte	0x1
	.byte	0xb5
	.byte	0x19
	.4byte	0x5e2
	.byte	0x9
	.byte	0x3
	.8byte	caml_global_roots_young
	.byte	0xc
	.4byte	.LASF89
	.byte	0x1
	.byte	0xb7
	.byte	0x19
	.4byte	0x5e2
	.byte	0x9
	.byte	0x3
	.8byte	caml_global_roots_old
	.byte	0x13
	.4byte	.LASF91
	.byte	0x1
	.2byte	0x117
	.byte	0x6
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x73b
	.byte	0x14
	.string	"f"
	.byte	0x1
	.2byte	0x117
	.byte	0x33
	.4byte	0x559
	.4byte	.LLST29
	.byte	0x15
	.string	"gr"
	.byte	0x1
	.2byte	0x119
	.byte	0x18
	.4byte	0x5dc
	.4byte	.LLST30
	.byte	0x16
	.8byte	.LVL115
	.4byte	0xba6
	.4byte	0x6db
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x16
	.8byte	.LVL116
	.4byte	0xba6
	.4byte	0x700
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+152
	.byte	0
	.byte	0x16
	.8byte	.LVL118
	.4byte	0xc76
	.4byte	0x71f
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+304
	.byte	0
	.byte	0x18
	.8byte	.LVL120
	.4byte	0xb39
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+152
	.byte	0
	.byte	0
	.byte	0x13
	.4byte	.LASF92
	.byte	0x1
	.2byte	0x10e
	.byte	0x6
	.8byte	.LFB18
	.8byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x7d5
	.byte	0x14
	.string	"f"
	.byte	0x1
	.2byte	0x10e
	.byte	0x2d
	.4byte	0x559
	.4byte	.LLST28
	.byte	0x16
	.8byte	.LVL110
	.4byte	0xba6
	.4byte	0x78e
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0
	.byte	0
	.byte	0x16
	.8byte	.LVL111
	.4byte	0xba6
	.4byte	0x7b3
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+152
	.byte	0
	.byte	0x18
	.8byte	.LVL112
	.4byte	0xba6
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+304
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LASF93
	.byte	0x1
	.byte	0xe6
	.byte	0x11
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0x95c
	.byte	0x1a
	.string	"r"
	.byte	0x1
	.byte	0xe6
	.byte	0x3d
	.4byte	0x285
	.4byte	.LLST25
	.byte	0x1b
	.4byte	.LASF94
	.byte	0x1
	.byte	0xe6
	.byte	0x46
	.4byte	0x12f
	.4byte	.LLST26
	.byte	0x1c
	.4byte	.LASF95
	.byte	0x1
	.byte	0xe8
	.byte	0x9
	.4byte	0x12f
	.4byte	.LLST27
	.byte	0x16
	.8byte	.LVL93
	.4byte	0xd61
	.4byte	0x839
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x16
	.8byte	.LVL94
	.4byte	0xc76
	.4byte	0x85e
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+304
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0
	.byte	0x16
	.8byte	.LVL97
	.4byte	0xd61
	.4byte	0x876
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x16
	.8byte	.LVL98
	.4byte	0xbf2
	.4byte	0x89b
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+304
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0
	.byte	0x16
	.8byte	.LVL99
	.4byte	0xc76
	.4byte	0x8c0
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+152
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0
	.byte	0x16
	.8byte	.LVL100
	.4byte	0xc76
	.4byte	0x8e5
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+152
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0
	.byte	0x16
	.8byte	.LVL105
	.4byte	0xd61
	.4byte	0x8fd
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x16
	.8byte	.LVL106
	.4byte	0xd61
	.4byte	0x915
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x16
	.8byte	.LVL107
	.4byte	0xbf2
	.4byte	0x93a
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+304
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0
	.byte	0x18
	.8byte	.LVL108
	.4byte	0xbf2
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+152
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LASF96
	.byte	0x1
	.byte	0xd9
	.byte	0x11
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0xa0d
	.byte	0x1a
	.string	"r"
	.byte	0x1
	.byte	0xd9
	.byte	0x3d
	.4byte	0x285
	.4byte	.LLST23
	.byte	0x1d
	.string	"v"
	.byte	0x1
	.byte	0xdb
	.byte	0x9
	.4byte	0x12f
	.4byte	.LLST24
	.byte	0x16
	.8byte	.LVL86
	.4byte	0xd61
	.4byte	0x9ae
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x16
	.8byte	.LVL87
	.4byte	0xd61
	.4byte	0x9c6
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x16
	.8byte	.LVL88
	.4byte	0xbf2
	.4byte	0x9eb
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+304
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x18
	.8byte	.LVL89
	.4byte	0xbf2
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+152
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LASF97
	.byte	0x1
	.byte	0xcb
	.byte	0x11
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0xa9b
	.byte	0x1a
	.string	"r"
	.byte	0x1
	.byte	0xcb
	.byte	0x3f
	.4byte	0x285
	.4byte	.LLST21
	.byte	0x1d
	.string	"v"
	.byte	0x1
	.byte	0xcd
	.byte	0x9
	.4byte	0x12f
	.4byte	.LLST22
	.byte	0x1e
	.8byte	.LVL74
	.4byte	0xd61
	.byte	0x16
	.8byte	.LVL78
	.4byte	0xc76
	.4byte	0xa79
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+152
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x18
	.8byte	.LVL79
	.4byte	0xc76
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+304
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LASF98
	.byte	0x1
	.byte	0xc4
	.byte	0x11
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0xaea
	.byte	0x1a
	.string	"r"
	.byte	0x1
	.byte	0xc4
	.byte	0x30
	.4byte	0x285
	.4byte	.LLST20
	.byte	0x18
	.8byte	.LVL71
	.4byte	0xbf2
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LASF99
	.byte	0x1
	.byte	0xbc
	.byte	0x11
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0xb39
	.byte	0x1a
	.string	"r"
	.byte	0x1
	.byte	0xbc
	.byte	0x32
	.4byte	0x285
	.4byte	.LLST19
	.byte	0x18
	.8byte	.LVL68
	.4byte	0xc76
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.byte	0x1f
	.4byte	.LASF101
	.byte	0x1
	.byte	0xa1
	.byte	0xd
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0xba0
	.byte	0x1b
	.4byte	.LASF100
	.byte	0x1
	.byte	0xa1
	.byte	0x3f
	.4byte	0xba0
	.4byte	.LLST16
	.byte	0x1d
	.string	"gr"
	.byte	0x1
	.byte	0xa3
	.byte	0x18
	.4byte	0x5dc
	.4byte	.LLST17
	.byte	0x1c
	.4byte	.LASF74
	.byte	0x1
	.byte	0xa3
	.byte	0x1e
	.4byte	0x5dc
	.4byte	.LLST18
	.byte	0x20
	.string	"i"
	.byte	0x1
	.byte	0xa4
	.byte	0x7
	.4byte	0x2d
	.byte	0x1
	.byte	0x5f
	.byte	0x1e
	.8byte	.LVL61
	.4byte	0xd6d
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x5e2
	.byte	0x21
	.4byte	.LASF102
	.byte	0x1
	.byte	0x95
	.byte	0xd
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0xbf2
	.byte	0x1a
	.string	"f"
	.byte	0x1
	.byte	0x95
	.byte	0x37
	.4byte	0x559
	.4byte	.LLST2
	.byte	0x1b
	.4byte	.LASF100
	.byte	0x1
	.byte	0x96
	.byte	0x41
	.4byte	0xba0
	.4byte	.LLST3
	.byte	0x1d
	.string	"gr"
	.byte	0x1
	.byte	0x98
	.byte	0x18
	.4byte	0x5dc
	.4byte	.LLST4
	.byte	0
	.byte	0x1f
	.4byte	.LASF103
	.byte	0x1
	.byte	0x6f
	.byte	0xd
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0xc76
	.byte	0x1b
	.4byte	.LASF100
	.byte	0x1
	.byte	0x6f
	.byte	0x3f
	.4byte	0xba0
	.4byte	.LLST11
	.byte	0x1a
	.string	"r"
	.byte	0x1
	.byte	0x70
	.byte	0x2d
	.4byte	0x285
	.4byte	.LLST12
	.byte	0x12
	.4byte	.LASF104
	.byte	0x1
	.byte	0x72
	.byte	0x18
	.4byte	0x617
	.byte	0x3
	.byte	0x91
	.byte	0xe8,0x7e
	.byte	0x1d
	.string	"e"
	.byte	0x1
	.byte	0x73
	.byte	0x18
	.4byte	0x5dc
	.4byte	.LLST13
	.byte	0x1d
	.string	"f"
	.byte	0x1
	.byte	0x73
	.byte	0x1d
	.4byte	0x5dc
	.4byte	.LLST14
	.byte	0x1d
	.string	"i"
	.byte	0x1
	.byte	0x74
	.byte	0x7
	.4byte	0x2d
	.4byte	.LLST15
	.byte	0x1e
	.8byte	.LVL57
	.4byte	0xd6d
	.byte	0
	.byte	0x1f
	.4byte	.LASF105
	.byte	0x1
	.byte	0x46
	.byte	0xd
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0xd20
	.byte	0x1b
	.4byte	.LASF100
	.byte	0x1
	.byte	0x46
	.byte	0x3f
	.4byte	0xba0
	.4byte	.LLST5
	.byte	0x1a
	.string	"r"
	.byte	0x1
	.byte	0x47
	.byte	0x2d
	.4byte	0x285
	.4byte	.LLST6
	.byte	0x12
	.4byte	.LASF104
	.byte	0x1
	.byte	0x49
	.byte	0x18
	.4byte	0x617
	.byte	0x3
	.byte	0x91
	.byte	0xd8,0x7e
	.byte	0x1d
	.string	"e"
	.byte	0x1
	.byte	0x4a
	.byte	0x18
	.4byte	0x5dc
	.4byte	.LLST7
	.byte	0x1d
	.string	"f"
	.byte	0x1
	.byte	0x4a
	.byte	0x1d
	.4byte	0x5dc
	.4byte	.LLST8
	.byte	0x1d
	.string	"i"
	.byte	0x1
	.byte	0x4b
	.byte	0x7
	.4byte	0x2d
	.4byte	.LLST9
	.byte	0x1c
	.4byte	.LASF106
	.byte	0x1
	.byte	0x4b
	.byte	0xa
	.4byte	0x2d
	.4byte	.LLST10
	.byte	0x1e
	.8byte	.LVL25
	.4byte	0xd20
	.byte	0x18
	.8byte	.LVL32
	.4byte	0xd79
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x4
	.byte	0x82
	.byte	0x2
	.byte	0x33
	.byte	0x24
	.byte	0
	.byte	0
	.byte	0x22
	.4byte	.LASF113
	.byte	0x1
	.byte	0x34
	.byte	0xc
	.4byte	0x2d
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0xd61
	.byte	0x1d
	.string	"r"
	.byte	0x1
	.byte	0x36
	.byte	0xc
	.4byte	0x34
	.4byte	.LLST0
	.byte	0x1c
	.4byte	.LASF86
	.byte	0x1
	.byte	0x37
	.byte	0x7
	.4byte	0x2d
	.4byte	.LLST1
	.byte	0
	.byte	0x23
	.4byte	.LASF107
	.4byte	.LASF107
	.byte	0x8
	.byte	0x3d
	.byte	0x5
	.byte	0x23
	.4byte	.LASF108
	.4byte	.LASF108
	.byte	0xa
	.byte	0x85
	.byte	0x11
	.byte	0x23
	.4byte	.LASF109
	.4byte	.LASF109
	.byte	0xa
	.byte	0x67
	.byte	0x1c
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
	.byte	0xe
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
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
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
	.byte	0x13
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
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
	.byte	0x14
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
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
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x17
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1c
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
	.byte	0x1d
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
	.byte	0x1e
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1f
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
	.byte	0x20
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
	.byte	0x21
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
	.byte	0x22
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
	.byte	0x23
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
.LLST29:
	.8byte	.LVL114-.Ltext0
	.8byte	.LVL115-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL115-1-.Ltext0
	.8byte	.LVL117-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL117-.Ltext0
	.8byte	.LFE19-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST30:
	.8byte	.LVL117-.Ltext0
	.8byte	.LVL121-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST28:
	.8byte	.LVL109-.Ltext0
	.8byte	.LVL110-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL110-1-.Ltext0
	.8byte	.LVL113-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL113-.Ltext0
	.8byte	.LFE18-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST25:
	.8byte	.LVL90-.Ltext0
	.8byte	.LVL92-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL92-.Ltext0
	.8byte	.LVL95-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL95-.Ltext0
	.8byte	.LVL96-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL96-.Ltext0
	.8byte	.LVL103-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL103-.Ltext0
	.8byte	.LVL104-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL104-.Ltext0
	.8byte	.LFE17-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST26:
	.8byte	.LVL90-.Ltext0
	.8byte	.LVL92-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL92-.Ltext0
	.8byte	.LVL101-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL101-.Ltext0
	.8byte	.LVL103-.Ltext0
	.2byte	0x2
	.byte	0x83
	.byte	0
	.8byte	.LVL103-.Ltext0
	.8byte	.LVL104-.Ltext0
	.2byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.8byte	.LVL104-.Ltext0
	.8byte	.LFE17-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST27:
	.8byte	.LVL91-.Ltext0
	.8byte	.LVL102-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL104-.Ltext0
	.8byte	.LFE17-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST23:
	.8byte	.LVL80-.Ltext0
	.8byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL82-.Ltext0
	.8byte	.LVL84-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL84-.Ltext0
	.8byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL85-.Ltext0
	.8byte	.LFE16-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST24:
	.8byte	.LVL81-.Ltext0
	.8byte	.LVL83-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL84-.Ltext0
	.8byte	.LFE16-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST21:
	.8byte	.LVL72-.Ltext0
	.8byte	.LVL73-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL73-.Ltext0
	.8byte	.LVL75-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL75-.Ltext0
	.8byte	.LVL76-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL76-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST22:
	.8byte	.LVL73-.Ltext0
	.8byte	.LVL74-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL76-.Ltext0
	.8byte	.LVL77-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL77-.Ltext0
	.8byte	.LVL78-1-.Ltext0
	.2byte	0x2
	.byte	0x78
	.byte	0
	.8byte	0
	.8byte	0
.LLST20:
	.8byte	.LVL69-.Ltext0
	.8byte	.LVL70-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL70-.Ltext0
	.8byte	.LVL71-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL71-1-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST19:
	.8byte	.LVL66-.Ltext0
	.8byte	.LVL67-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL67-.Ltext0
	.8byte	.LVL68-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL68-1-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST16:
	.8byte	.LVL58-.Ltext0
	.8byte	.LVL59-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL59-.Ltext0
	.8byte	.LVL65-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL65-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST17:
	.8byte	.LVL59-.Ltext0
	.8byte	.LVL61-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL61-.Ltext0
	.8byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL62-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST18:
	.8byte	.LVL60-.Ltext0
	.8byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL11-.Ltext0
	.8byte	.LFE11-.Ltext0
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
	.byte	0x5b
	.8byte	.LVL7-.Ltext0
	.8byte	.LFE11-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST11:
	.8byte	.LVL39-.Ltext0
	.8byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL52-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL52-.Ltext0
	.8byte	.LVL53-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL53-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST12:
	.8byte	.LVL39-.Ltext0
	.8byte	.LVL51-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL51-.Ltext0
	.8byte	.LVL53-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL53-.Ltext0
	.8byte	.LVL57-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL57-1-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST13:
	.8byte	.LVL40-.Ltext0
	.8byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL45-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL45-.Ltext0
	.8byte	.LVL47-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL47-.Ltext0
	.8byte	.LVL49-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL49-.Ltext0
	.8byte	.LVL50-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL50-.Ltext0
	.8byte	.LVL51-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL53-.Ltext0
	.8byte	.LVL57-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST14:
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL43-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL43-.Ltext0
	.8byte	.LVL44-.Ltext0
	.2byte	0x9
	.byte	0x7d
	.byte	0
	.byte	0x33
	.byte	0x24
	.byte	0x7c
	.byte	0
	.byte	0x22
	.byte	0x23
	.byte	0x8
	.8byte	.LVL48-.Ltext0
	.8byte	.LVL49-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST15:
	.8byte	.LVL41-.Ltext0
	.8byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL45-.Ltext0
	.8byte	.LVL51-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL53-.Ltext0
	.8byte	.LVL55-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL55-.Ltext0
	.8byte	.LVL56-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL56-.Ltext0
	.8byte	.LVL57-1-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL38-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL25-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL25-1-.Ltext0
	.8byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL37-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL13-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL22-.Ltext0
	.8byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL32-.Ltext0
	.8byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x9
	.byte	0x7d
	.byte	0
	.byte	0x33
	.byte	0x24
	.byte	0x7c
	.byte	0
	.byte	0x22
	.byte	0x23
	.byte	0x8
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL25-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x8
	.byte	0x79
	.byte	0x90,0x1
	.byte	0x94
	.byte	0x4
	.byte	0x23
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL28-.Ltext0
	.8byte	.LVL30-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL33-.Ltext0
	.8byte	.LVL34-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL34-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	0
	.8byte	0
.LLST10:
	.8byte	.LVL26-.Ltext0
	.8byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL5-.Ltext0
	.8byte	.LFE8-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL5-.Ltext0
	.8byte	.LFE8-.Ltext0
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
.LASF60:
	.string	"limit"
.LASF84:
	.string	"forward"
.LASF50:
	.string	"caml_young_alloc_start"
.LASF112:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF14:
	.string	"caml_timing_hook"
.LASF98:
	.string	"caml_remove_global_root"
.LASF96:
	.string	"caml_remove_generational_global_root"
.LASF101:
	.string	"caml_empty_global_roots"
.LASF54:
	.string	"caml_young_trigger"
.LASF3:
	.string	"short int"
.LASF8:
	.string	"size_t"
.LASF68:
	.string	"caml_custom_elt"
.LASF30:
	.string	"caml_gc_subphase"
.LASF93:
	.string	"caml_modify_generational_global_root"
.LASF95:
	.string	"oldval"
.LASF53:
	.string	"caml_young_limit"
.LASF107:
	.string	"caml_page_table_lookup"
.LASF51:
	.string	"caml_young_alloc_end"
.LASF90:
	.string	"random_seed"
.LASF111:
	.string	"globroots.c"
.LASF110:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF23:
	.string	"value"
.LASF63:
	.string	"caml_ref_table"
.LASF39:
	.string	"caml_gc_sweep_hp"
.LASF17:
	.string	"caml_minor_gc_begin_hook"
.LASF82:
	.string	"global_root"
.LASF56:
	.string	"caml_in_minor_collection"
.LASF102:
	.string	"caml_iterate_global_roots"
.LASF78:
	.string	"caml_local_roots"
.LASF88:
	.string	"caml_global_roots_young"
.LASF83:
	.string	"root"
.LASF89:
	.string	"caml_global_roots_old"
.LASF79:
	.string	"scanning_action"
.LASF45:
	.string	"caml_major_gc_hook"
.LASF44:
	.string	"caml_gc_clock"
.LASF76:
	.string	"nitems"
.LASF20:
	.string	"caml_finalise_end_hook"
.LASF97:
	.string	"caml_register_generational_global_root"
.LASF9:
	.string	"long long int"
.LASF80:
	.string	"caml_incremental_roots_count"
.LASF81:
	.string	"caml_scan_roots_hook"
.LASF41:
	.string	"caml_major_ring"
.LASF59:
	.string	"threshold"
.LASF104:
	.string	"update"
.LASF77:
	.string	"tables"
.LASF6:
	.string	"intnat"
.LASF1:
	.string	"long int"
.LASF12:
	.string	"addr"
.LASF62:
	.string	"reserve"
.LASF92:
	.string	"caml_scan_global_roots"
.LASF71:
	.string	"caml_huge_fallback_count"
.LASF69:
	.string	"block"
.LASF28:
	.string	"caml_fl_cur_wsz"
.LASF22:
	.string	"caml_runtime_warnings"
.LASF24:
	.string	"header_t"
.LASF85:
	.string	"global_root_list"
.LASF47:
	.string	"caml_young_end"
.LASF16:
	.string	"caml_major_slice_end_hook"
.LASF26:
	.string	"caml_atom_table"
.LASF103:
	.string	"caml_delete_global_root"
.LASF10:
	.string	"long double"
.LASF19:
	.string	"caml_finalise_begin_hook"
.LASF57:
	.string	"caml_extra_heap_resources_minor"
.LASF106:
	.string	"new_level"
.LASF35:
	.string	"caml_dependent_allocated"
.LASF94:
	.string	"newval"
.LASF113:
	.string	"random_level"
.LASF25:
	.string	"mlsize_t"
.LASF73:
	.string	"caml__roots_block"
.LASF7:
	.string	"uintnat"
.LASF5:
	.string	"uint32_t"
.LASF0:
	.string	"unsigned int"
.LASF65:
	.string	"ephe"
.LASF15:
	.string	"caml_major_slice_begin_hook"
.LASF4:
	.string	"short unsigned int"
.LASF66:
	.string	"offset"
.LASF46:
	.string	"caml_young_start"
.LASF13:
	.string	"char"
.LASF42:
	.string	"caml_major_ring_index"
.LASF29:
	.string	"caml_gc_phase"
.LASF55:
	.string	"caml_minor_heap_wsz"
.LASF21:
	.string	"caml_verb_gc"
.LASF18:
	.string	"caml_minor_gc_end_hook"
.LASF40:
	.string	"caml_major_window"
.LASF108:
	.string	"caml_stat_free"
.LASF2:
	.string	"long unsigned int"
.LASF48:
	.string	"caml_code_area_start"
.LASF33:
	.string	"double"
.LASF109:
	.string	"caml_stat_alloc"
.LASF86:
	.string	"level"
.LASF27:
	.string	"caml_global_data"
.LASF61:
	.string	"size"
.LASF105:
	.string	"caml_insert_global_root"
.LASF36:
	.string	"caml_fl_wsz_at_phase_change"
.LASF70:
	.string	"caml_custom_table"
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
.LASF11:
	.string	"asize_t"
.LASF52:
	.string	"caml_young_ptr"
.LASF87:
	.string	"caml_global_roots"
.LASF38:
	.string	"total_heap_size"
.LASF58:
	.string	"base"
.LASF43:
	.string	"caml_major_work_credit"
.LASF99:
	.string	"caml_register_global_root"
.LASF67:
	.string	"caml_ephe_ref_table"
.LASF64:
	.string	"caml_ephe_ref_elt"
.LASF74:
	.string	"next"
.LASF72:
	.string	"caml_use_huge_pages"
.LASF91:
	.string	"caml_scan_global_young_roots"
.LASF100:
	.string	"rootlist"
	.ident	"GCC: (GNU) 9.2.0"
