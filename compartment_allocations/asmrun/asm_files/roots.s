	.file	"roots.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.type	count_descriptors, @function
count_descriptors:
.LFB9:
	.file 1 "roots.c"
	.loc 1 64 42
	.cfi_startproc
.LVL0:
	.loc 1 65 3
	.loc 1 66 3
	.loc 1 67 3
	.loc 1 65 10 is_stmt 0
	li	a5,0
.LVL1:
.L2:
	.loc 1 67 3 is_stmt 1 discriminator 1
	beq	a0,zero,.L4
	.loc 1 68 5 discriminator 3
	.loc 1 68 33 is_stmt 0 discriminator 3
	ld	a4,0(a0)
	.loc 1 68 18 discriminator 3
	ld	a4,0(a4)
	.loc 1 68 15 discriminator 3
	add	a5,a5,a4
.LVL2:
	.loc 1 67 3 is_stmt 1 discriminator 3
	ld	a0,8(a0)
.LVL3:
	j	.L2
.L4:
	.loc 1 70 3
	.loc 1 71 1 is_stmt 0
	sext.w	a0,a5
.LVL4:
	ret
	.cfi_endproc
.LFE9:
	.size	count_descriptors, .-count_descriptors
	.align	1
	.type	frametables_list_tail, @function
frametables_list_tail:
.LFB10:
	.loc 1 73 48 is_stmt 1
	.cfi_startproc
.LVL5:
	mv	a5,a0
	.loc 1 74 3
.LVL6:
	.loc 1 75 3
	.loc 1 74 15 is_stmt 0
	li	a0,0
.LVL7:
.L6:
	.loc 1 75 3 is_stmt 1 discriminator 1
	beq	a5,zero,.L8
	.loc 1 76 5 discriminator 3
.LVL8:
	.loc 1 75 3 discriminator 3
	.loc 1 76 10 is_stmt 0 discriminator 3
	mv	a0,a5
	.loc 1 75 3 discriminator 3
	ld	a5,8(a5)
.LVL9:
	j	.L6
.L8:
	.loc 1 79 1
	ret
	.cfi_endproc
.LFE10:
	.size	frametables_list_tail, .-frametables_list_tail
	.align	1
	.type	next_frame_descr, @function
next_frame_descr:
.LFB11:
	.loc 1 81 56 is_stmt 1
	.cfi_startproc
.LVL10:
	mv	a4,a0
	.loc 1 82 3
	.loc 1 83 3
	.loc 1 86 23 is_stmt 0
	lhu	a5,10(a0)
	.loc 1 86 20
	slli	a5,a5,1
	.loc 1 85 53
	add	a5,a5,a0
	.loc 1 86 58
	addi	a5,a5,19
	.loc 1 83 9
	andi	a0,a5,-8
.LVL11:
	.loc 1 88 3 is_stmt 1
	.loc 1 88 8 is_stmt 0
	lhu	a5,8(a4)
	.loc 1 88 6
	andi	a5,a5,1
	beq	a5,zero,.L10
	.loc 1 88 26 is_stmt 1 discriminator 1
	.loc 1 88 32 is_stmt 0 discriminator 1
	addi	a0,a0,8
.LVL12:
.L10:
	.loc 1 89 3 is_stmt 1
	.loc 1 90 1 is_stmt 0
	ret
	.cfi_endproc
.LFE11:
	.size	next_frame_descr, .-next_frame_descr
	.align	1
	.type	fill_hashtable, @function
fill_hashtable:
.LFB12:
	.loc 1 92 47 is_stmt 1
	.cfi_startproc
.LVL13:
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
	.loc 1 93 3
	.loc 1 94 3
	.loc 1 95 3
	.loc 1 96 3
	.loc 1 97 3
.LVL14:
	.loc 1 99 3
	j	.L12
.LVL15:
.L15:
	.loc 1 106 9
	.loc 1 106 15 is_stmt 0
	addi	a5,a5,1
.LVL16:
	.loc 1 106 11
	and	a5,a2,a5
.LVL17:
.L14:
	.loc 1 105 13 is_stmt 1
	.loc 1 105 36 is_stmt 0
	slli	a4,a5,3
	ld	a3,caml_frame_descriptors
	add	a4,a3,a4
	ld	a3,0(a4)
	.loc 1 105 13
	bne	a3,zero,.L15
	.loc 1 108 7 is_stmt 1 discriminator 2
	.loc 1 108 33 is_stmt 0 discriminator 2
	sd	a0,0(a4)
	.loc 1 109 7 is_stmt 1 discriminator 2
	.loc 1 109 11 is_stmt 0 discriminator 2
	call	next_frame_descr
.LVL18:
	.loc 1 103 26 is_stmt 1 discriminator 2
	.loc 1 103 27 is_stmt 0 discriminator 2
	addi	s0,s0,1
.LVL19:
.L13:
	.loc 1 103 17 is_stmt 1 discriminator 1
	.loc 1 103 5 is_stmt 0 discriminator 1
	bge	s0,s1,.L19
	.loc 1 104 7 is_stmt 1
	.loc 1 104 11 is_stmt 0
	ld	a5,0(a0)
	srli	a5,a5,3
	lw	a2,caml_frame_descriptors_mask
	.loc 1 104 9
	and	a5,a5,a2
.LVL20:
	.loc 1 105 7 is_stmt 1
	.loc 1 105 13 is_stmt 0
	j	.L14
.LVL21:
.L19:
	.loc 1 99 3 is_stmt 1 discriminator 2
	ld	s2,8(s2)
.LVL22:
.L12:
	.loc 1 99 3 discriminator 1
	beq	s2,zero,.L20
	.loc 1 100 5
	.loc 1 100 9 is_stmt 0
	ld	a0,0(s2)
.LVL23:
	.loc 1 101 5 is_stmt 1
	.loc 1 101 9 is_stmt 0
	ld	s1,0(a0)
.LVL24:
	.loc 1 102 5 is_stmt 1
	.loc 1 102 7 is_stmt 0
	addi	a0,a0,8
.LVL25:
	.loc 1 103 5 is_stmt 1
	.loc 1 103 12 is_stmt 0
	li	s0,0
	.loc 1 103 5
	j	.L13
.LVL26:
.L20:
	.loc 1 112 1
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	ld	s1,8(sp)
	.cfi_restore 9
	ld	s2,0(sp)
	.cfi_restore 18
.LVL27:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	fill_hashtable, .-fill_hashtable
	.align	1
	.type	remove_entry, @function
remove_entry:
.LFB16:
	.loc 1 168 43 is_stmt 1
	.cfi_startproc
.LVL28:
	.loc 1 169 3
	.loc 1 170 3
	.loc 1 171 3
	.loc 1 173 3
	.loc 1 173 7 is_stmt 0
	ld	a3,0(a0)
	srli	a3,a3,3
	lw	a2,caml_frame_descriptors_mask
	.loc 1 173 5
	and	a3,a3,a2
.LVL29:
	.loc 1 174 3 is_stmt 1
.L22:
	.loc 1 174 9
	.loc 1 174 32 is_stmt 0
	slli	a5,a3,3
	ld	a4,caml_frame_descriptors
	add	a5,a4,a5
	ld	a5,0(a5)
	.loc 1 174 9
	beq	a5,a0,.L24
	.loc 1 175 5 is_stmt 1
	.loc 1 175 11 is_stmt 0
	addi	a3,a3,1
.LVL30:
	.loc 1 175 7
	and	a3,a2,a3
.LVL31:
	j	.L22
.LVL32:
.L28:
	.loc 1 189 35 discriminator 1
	bltu	a5,a4,.L29
	.loc 1 190 19
	bleu	a3,a5,.L29
.LVL33:
.L25:
	.loc 1 182 3 is_stmt 1
	.loc 1 182 9 is_stmt 0
	addi	a5,a5,1
.LVL34:
	.loc 1 182 13
	lw	a4,caml_frame_descriptors_mask
	.loc 1 182 5
	and	a5,a5,a4
.LVL35:
	.loc 1 184 3 is_stmt 1
	.loc 1 184 28 is_stmt 0
	ld	a0,caml_frame_descriptors
	slli	a2,a5,3
	add	a2,a0,a2
	ld	a1,0(a2)
	.loc 1 184 5
	beq	a1,zero,.L30
	.loc 1 185 3 is_stmt 1
	.loc 1 185 7 is_stmt 0
	ld	a2,0(a1)
	srli	a2,a2,3
	.loc 1 185 5
	and	a4,a4,a2
.LVL36:
	.loc 1 188 3 is_stmt 1
	.loc 1 188 5 is_stmt 0
	bgeu	a3,a4,.L27
	.loc 1 188 19 discriminator 1
	bgeu	a5,a4,.L25
.L27:
	.loc 1 188 35 discriminator 3
	bleu	a3,a5,.L28
	.loc 1 189 19
	bgeu	a3,a4,.L28
	j	.L25
.L29:
	.loc 1 194 3 is_stmt 1
	.loc 1 194 25 is_stmt 0
	add	a0,a0,a6
	.loc 1 194 29
	sd	a1,0(a0)
	.loc 1 195 3 is_stmt 1
	.loc 1 182 5 is_stmt 0
	mv	a3,a5
.LVL37:
.L24:
	.loc 1 179 3 is_stmt 1
	.loc 1 180 3
	.loc 1 180 25 is_stmt 0
	slli	a6,a3,3
	ld	a5,caml_frame_descriptors
	add	a5,a5,a6
	.loc 1 180 29
	sd	zero,0(a5)
	mv	a5,a3
	j	.L25
.LVL38:
.L30:
	.loc 1 196 1
	ret
	.cfi_endproc
.LFE16:
	.size	remove_entry, .-remove_entry
	.align	1
	.type	cons, @function
cons:
.LFB8:
	.loc 1 49 41 is_stmt 1
	.cfi_startproc
.LVL39:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	mv	s1,a0
	mv	s0,a1
	.loc 1 50 3
	.loc 1 50 15 is_stmt 0
	li	a0,16
.LVL40:
	call	caml_stat_alloc
.LVL41:
	.loc 1 51 3 is_stmt 1
	.loc 1 51 13 is_stmt 0
	sd	s1,0(a0)
	.loc 1 52 3 is_stmt 1
	.loc 1 52 13 is_stmt 0
	sd	s0,8(a0)
	.loc 1 53 3 is_stmt 1
	.loc 1 54 1 is_stmt 0
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
.LVL42:
	ld	s1,8(sp)
	.cfi_restore 9
.LVL43:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	cons, .-cons
	.align	1
	.type	init_frame_descriptors, @function
init_frame_descriptors:
.LFB13:
	.loc 1 115 1 is_stmt 1
	.cfi_startproc
.LVL44:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	mv	s1,a0
	.loc 1 116 3
	.loc 1 117 3
.LVL45:
	.loc 1 119 3
	.loc 1 121 3
	.loc 1 121 10 is_stmt 0
	call	frametables_list_tail
.LVL46:
	mv	s0,a0
.LVL47:
	.loc 1 122 3 is_stmt 1
	.loc 1 122 14 is_stmt 0
	mv	a0,s1
	call	count_descriptors
.LVL48:
	.loc 1 123 3 is_stmt 1
	.loc 1 123 41 is_stmt 0
	lw	a4,caml_frame_descriptors_mask
	addiw	a4,a4,1
.LVL49:
	.loc 1 126 3 is_stmt 1
	.loc 1 126 27 is_stmt 0
	ld	a5,num_descr
	add	a5,a0,a5
	.loc 1 126 39
	slli	a3,a5,1
	.loc 1 126 5
	ble	a3,a4,.L34
	.loc 1 129 5 is_stmt 1
	.loc 1 129 16 is_stmt 0
	lla	a5,frametables
	ld	a4,0(a5)
.LVL50:
	sd	a4,8(s0)
	.loc 1 130 5 is_stmt 1
	.loc 1 130 17 is_stmt 0
	sd	zero,0(a5)
	.loc 1 134 5 is_stmt 1
	.loc 1 134 17 is_stmt 0
	mv	a0,s1
.LVL51:
	call	count_descriptors
.LVL52:
	mv	a4,a0
	.loc 1 134 15
	sd	a0,num_descr,a5
	.loc 1 136 5 is_stmt 1
.LVL53:
	.loc 1 137 5
	.loc 1 136 13 is_stmt 0
	li	s0,4
.LVL54:
.L35:
	.loc 1 137 11 is_stmt 1 discriminator 1
	.loc 1 137 24 is_stmt 0 discriminator 1
	slli	a5,a4,1
	.loc 1 137 11 discriminator 1
	ble	a5,s0,.L42
	.loc 1 137 37 is_stmt 1 discriminator 2
	.loc 1 137 45 is_stmt 0 discriminator 2
	slli	s0,s0,1
.LVL55:
	j	.L35
.L42:
	.loc 1 139 5 is_stmt 1
	.loc 1 139 43 is_stmt 0
	addiw	a5,s0,-1
	.loc 1 139 33
	sw	a5,caml_frame_descriptors_mask,a4
	.loc 1 140 5 is_stmt 1
	.loc 1 140 8 is_stmt 0
	ld	a0,caml_frame_descriptors
	.loc 1 140 7
	beq	a0,zero,.L37
	.loc 1 140 32 is_stmt 1 discriminator 1
	call	caml_stat_free
.LVL56:
.L37:
	.loc 1 141 5
	.loc 1 142 24 is_stmt 0
	slli	a0,s0,3
	call	caml_stat_alloc
.LVL57:
	.loc 1 141 28
	sd	a0,caml_frame_descriptors,a5
	.loc 1 143 5 is_stmt 1
.LVL58:
	.loc 1 143 12 is_stmt 0
	li	a5,0
	.loc 1 143 5
	j	.L38
.LVL59:
.L39:
	.loc 1 143 35 is_stmt 1 discriminator 3
	.loc 1 143 57 is_stmt 0 discriminator 3
	slli	a3,a5,3
	ld	a4,caml_frame_descriptors
	add	a4,a4,a3
	.loc 1 143 61 discriminator 3
	sd	zero,0(a4)
	.loc 1 143 30 is_stmt 1 discriminator 3
	.loc 1 143 31 is_stmt 0 discriminator 3
	addi	a5,a5,1
.LVL60:
.L38:
	.loc 1 143 17 is_stmt 1 discriminator 1
	.loc 1 143 5 is_stmt 0 discriminator 1
	bgt	s0,a5,.L39
	.loc 1 145 5 is_stmt 1
	mv	a0,s1
	call	fill_hashtable
.LVL61:
.L40:
	.loc 1 152 3
	.loc 1 152 15 is_stmt 0
	sd	s1,frametables,a5
	.loc 1 153 1
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	ld	s1,8(sp)
	.cfi_restore 9
.LVL62:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL63:
.L34:
	.cfi_restore_state
	.loc 1 147 5 is_stmt 1
	.loc 1 147 15 is_stmt 0
	sd	a5,num_descr,a4
.LVL64:
	.loc 1 148 5 is_stmt 1
	mv	a0,s1
.LVL65:
	call	fill_hashtable
.LVL66:
	.loc 1 149 5
	.loc 1 149 16 is_stmt 0
	ld	a5,frametables
	sd	a5,8(s0)
	j	.L40
	.cfi_endproc
.LFE13:
	.size	init_frame_descriptors, .-init_frame_descriptors
	.align	1
	.globl	caml_init_frame_descriptors
	.type	caml_init_frame_descriptors, @function
caml_init_frame_descriptors:
.LFB14:
	.loc 1 155 40 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.loc 1 156 3
	.loc 1 157 3
.LVL67:
	.loc 1 158 3
	.loc 1 157 9 is_stmt 0
	li	a1,0
	.loc 1 158 10
	li	s0,0
.LVL68:
.L44:
	.loc 1 158 15 is_stmt 1 discriminator 1
	.loc 1 158 30 is_stmt 0 discriminator 1
	slli	a4,s0,3
	lla	a5,caml_frametable
	add	a5,a5,a4
	ld	a0,0(a5)
	.loc 1 158 3 discriminator 1
	beq	a0,zero,.L47
	.loc 1 159 5 is_stmt 1 discriminator 3
	.loc 1 159 23 is_stmt 0 discriminator 3
	call	cons
.LVL69:
	mv	a1,a0
.LVL70:
	.loc 1 158 40 is_stmt 1 discriminator 3
	.loc 1 158 41 is_stmt 0 discriminator 3
	addi	s0,s0,1
.LVL71:
	j	.L44
.LVL72:
.L47:
	.loc 1 160 3 is_stmt 1
	mv	a0,a1
	call	init_frame_descriptors
.LVL73:
	.loc 1 161 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
.LVL74:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	caml_init_frame_descriptors, .-caml_init_frame_descriptors
	.align	1
	.globl	caml_register_frametable
	.type	caml_register_frametable, @function
caml_register_frametable:
.LFB15:
	.loc 1 163 46 is_stmt 1
	.cfi_startproc
.LVL75:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 164 3
	.loc 1 164 27 is_stmt 0
	li	a1,0
	call	cons
.LVL76:
	.loc 1 165 3 is_stmt 1
	call	init_frame_descriptors
.LVL77:
	.loc 1 166 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE15:
	.size	caml_register_frametable, .-caml_register_frametable
	.align	1
	.globl	caml_unregister_frametable
	.type	caml_unregister_frametable, @function
caml_unregister_frametable:
.LFB17:
	.loc 1 198 48 is_stmt 1
	.cfi_startproc
.LVL78:
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
	mv	s2,a0
	.loc 1 199 3
	.loc 1 200 3
	.loc 1 201 3
	.loc 1 201 9 is_stmt 0
	ld	s4,frametables
.LVL79:
	.loc 1 202 3 is_stmt 1
	.loc 1 204 3
	.loc 1 204 7 is_stmt 0
	ld	s3,0(a0)
.LVL80:
	.loc 1 205 3 is_stmt 1
	.loc 1 205 5 is_stmt 0
	addi	s0,a0,8
.LVL81:
	.loc 1 206 3 is_stmt 1
	.loc 1 206 10 is_stmt 0
	li	s1,0
.LVL82:
.L51:
	.loc 1 206 15 is_stmt 1 discriminator 1
	.loc 1 206 3 is_stmt 0 discriminator 1
	bge	s1,s3,.L58
	.loc 1 207 5 is_stmt 1 discriminator 3
	mv	a0,s0
	call	remove_entry
.LVL83:
	.loc 1 208 5 discriminator 3
	.loc 1 208 9 is_stmt 0 discriminator 3
	mv	a0,s0
	call	next_frame_descr
.LVL84:
	mv	s0,a0
.LVL85:
	.loc 1 206 24 is_stmt 1 discriminator 3
	.loc 1 206 25 is_stmt 0 discriminator 3
	addi	s1,s1,1
.LVL86:
	j	.L51
.L58:
	.loc 1 211 3 is_stmt 1
	ld	a0,frametables
.LVL87:
.L53:
	.loc 1 211 3 discriminator 1
	beq	a0,zero,.L50
	.loc 1 212 5
	.loc 1 212 11 is_stmt 0
	ld	a5,0(a0)
	.loc 1 212 7
	beq	a5,s2,.L59
	.loc 1 217 5 is_stmt 1 discriminator 2
.LVL88:
	.loc 1 211 3 discriminator 2
	.loc 1 217 14 is_stmt 0 discriminator 2
	mv	s4,a0
	.loc 1 211 3 discriminator 2
	ld	a0,8(a0)
.LVL89:
	j	.L53
.L59:
	.loc 1 213 7 is_stmt 1
	.loc 1 213 27 is_stmt 0
	ld	a5,8(a0)
	.loc 1 213 22
	sd	a5,8(s4)
	.loc 1 214 7 is_stmt 1
	call	caml_stat_free
.LVL90:
	.loc 1 215 7
.L50:
	.loc 1 219 1 is_stmt 0
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
.LVL91:
	ld	s1,24(sp)
	.cfi_restore 9
.LVL92:
	ld	s2,16(sp)
	.cfi_restore 18
.LVL93:
	ld	s3,8(sp)
	.cfi_restore 19
.LVL94:
	ld	s4,0(sp)
	.cfi_restore 20
.LVL95:
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE17:
	.size	caml_unregister_frametable, .-caml_unregister_frametable
	.align	1
	.globl	caml_register_dyn_global
	.type	caml_register_dyn_global, @function
caml_register_dyn_global:
.LFB18:
	.loc 1 231 40 is_stmt 1
	.cfi_startproc
.LVL96:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.loc 1 232 3
	.loc 1 232 22 is_stmt 0
	lla	s0,caml_dyn_globals
	ld	a1,0(s0)
	call	cons
.LVL97:
	.loc 1 232 20
	sd	a0,0(s0)
	.loc 1 233 1
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE18:
	.size	caml_register_dyn_global, .-caml_register_dyn_global
	.align	1
	.globl	caml_oldify_local_roots
	.type	caml_oldify_local_roots, @function
caml_oldify_local_roots:
.LFB19:
	.loc 1 238 1 is_stmt 1
	.cfi_startproc
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
	.loc 1 239 3
	.loc 1 240 3
	.loc 1 241 3
	.loc 1 242 3
	.loc 1 243 3
	.loc 1 244 3
	.loc 1 248 3
	.loc 1 250 3
	.loc 1 251 3
	.loc 1 252 3
	.loc 1 253 3
	.loc 1 256 3
	.loc 1 256 10 is_stmt 0
	lw	s2,caml_globals_scanned
.LVL98:
	.loc 1 256 3
	j	.L63
.LVL99:
.L64:
	.loc 1 261 9 is_stmt 1 discriminator 11
	.loc 1 260 42 discriminator 11
	.loc 1 260 43 is_stmt 0 discriminator 11
	addiw	s0,s0,1
.LVL100:
.L66:
	.loc 1 260 19 is_stmt 1 discriminator 2
	.loc 1 260 23 is_stmt 0 discriminator 2
	ld	a4,0(s1)
	ld	a5,-8(a4)
	srli	a5,a5,10
	.loc 1 260 7 discriminator 2
	bgeu	s0,a5,.L97
	.loc 1 261 9 is_stmt 1
.LBB2:
	.loc 1 261 9
	slli	a1,s0,3
	add	a1,a1,a4
	ld	a0,0(a1)
.LVL101:
	.loc 1 261 9
	andi	a5,a0,1
	bne	a5,zero,.L64
	.loc 1 261 9 is_stmt 0 discriminator 1
	ld	a5,caml_young_end
	bgeu	a0,a5,.L64
	.loc 1 261 9 discriminator 3
	ld	a5,caml_young_start
	bleu	a0,a5,.L64
	.loc 1 261 9 is_stmt 1
	call	caml_oldify_one
.LVL102:
	j	.L64
.L97:
.LBE2:
	.loc 1 259 45 discriminator 2
	.loc 1 259 49 is_stmt 0 discriminator 2
	addi	s1,s1,8
.LVL103:
.L68:
	.loc 1 259 33 is_stmt 1 discriminator 1
	ld	a5,0(s1)
	.loc 1 259 5 is_stmt 0 discriminator 1
	beq	a5,zero,.L98
	.loc 1 260 14
	li	s0,0
	j	.L66
.L98:
	.loc 1 258 8 is_stmt 1
	.loc 1 258 9 is_stmt 0
	addiw	s2,s2,1
.LVL104:
.L63:
	.loc 1 257 8 is_stmt 1 discriminator 1
	.loc 1 257 10 is_stmt 0 discriminator 1
	ld	a4,caml_globals_inited
	.loc 1 256 3 discriminator 1
	bgt	s2,a4,.L67
	.loc 1 257 48
	slli	a3,s2,3
	lla	a5,caml_globals
	add	a5,a5,a3
	ld	s1,0(a5)
	.loc 1 257 33
	bne	s1,zero,.L68
.L67:
	.loc 1 265 3 is_stmt 1
	.loc 1 265 24 is_stmt 0
	sd	a4,caml_globals_scanned,a5
	.loc 1 268 3 is_stmt 1
	ld	s2,caml_dyn_globals
.LVL105:
	j	.L69
.LVL106:
.L71:
	.loc 1 271 9 discriminator 11
	.loc 1 270 42 discriminator 11
	.loc 1 270 43 is_stmt 0 discriminator 11
	addiw	s0,s0,1
.LVL107:
.L73:
	.loc 1 270 19 is_stmt 1 discriminator 2
	.loc 1 270 23 is_stmt 0 discriminator 2
	ld	a4,0(s1)
	ld	a5,-8(a4)
	srli	a5,a5,10
	.loc 1 270 7 discriminator 2
	bgeu	s0,a5,.L99
	.loc 1 271 9 is_stmt 1
.LBB3:
	.loc 1 271 9
	slli	a1,s0,3
	add	a1,a1,a4
	ld	a0,0(a1)
.LVL108:
	.loc 1 271 9
	andi	a5,a0,1
	bne	a5,zero,.L71
	.loc 1 271 9 is_stmt 0 discriminator 1
	ld	a5,caml_young_end
	bgeu	a0,a5,.L71
	.loc 1 271 9 discriminator 3
	ld	a5,caml_young_start
	bleu	a0,a5,.L71
	.loc 1 271 9 is_stmt 1
	call	caml_oldify_one
.LVL109:
	j	.L71
.L99:
.LBE3:
	.loc 1 269 49 discriminator 2
	.loc 1 269 53 is_stmt 0 discriminator 2
	addi	s1,s1,8
.LVL110:
.L70:
	.loc 1 269 37 is_stmt 1 discriminator 1
	ld	a5,0(s1)
	.loc 1 269 5 is_stmt 0 discriminator 1
	beq	a5,zero,.L100
	.loc 1 270 14
	li	s0,0
	j	.L73
.L100:
	.loc 1 268 3 is_stmt 1 discriminator 2
	ld	s2,8(s2)
.LVL111:
.L69:
	.loc 1 268 3 discriminator 1
	beq	s2,zero,.L101
	.loc 1 269 5
	.loc 1 269 14 is_stmt 0
	ld	s1,0(s2)
.LVL112:
	.loc 1 269 5
	j	.L70
.LVL113:
.L101:
	.loc 1 277 3 is_stmt 1
	.loc 1 277 6 is_stmt 0
	ld	s1,caml_bottom_of_stack
.LVL114:
	.loc 1 278 3 is_stmt 1
	.loc 1 278 11 is_stmt 0
	ld	a2,caml_last_return_address
.LVL115:
	.loc 1 279 3 is_stmt 1
	.loc 1 279 8 is_stmt 0
	ld	s2,caml_gc_regs
.LVL116:
	.loc 1 280 3 is_stmt 1
	.loc 1 280 6 is_stmt 0
	bne	s1,zero,.L75
.LVL117:
.L76:
	.loc 1 326 3 is_stmt 1
	.loc 1 326 11 is_stmt 0
	ld	s1,caml_local_roots
.LVL118:
	.loc 1 326 3
	j	.L86
.LVL119:
.L77:
	.loc 1 289 7 is_stmt 1
	.loc 1 289 10 is_stmt 0
	lhu	a4,8(s0)
	li	a5,65536
.LVL120:
	addi	a5,a5,-1
	bne	a4,a5,.L102
.LBB4:
	.loc 1 316 9 is_stmt 1
.LVL121:
	.loc 1 317 9
	.loc 1 317 12 is_stmt 0
	ld	a5,16(s1)
.LVL122:
	.loc 1 318 9 is_stmt 1
	.loc 1 318 17 is_stmt 0
	ld	a2,24(s1)
.LVL123:
	.loc 1 319 9 is_stmt 1
	.loc 1 319 14 is_stmt 0
	ld	s2,32(s1)
.LVL124:
	.loc 1 321 9 is_stmt 1
	.loc 1 321 12 is_stmt 0
	beq	a5,zero,.L76
.LVL125:
.L85:
.LBE4:
	.loc 1 270 14
	mv	s1,a5
.LVL126:
.L75:
	.loc 1 281 5 is_stmt 1
	.loc 1 283 7
	.loc 1 283 11 is_stmt 0
	srli	a5,a2,3
	lw	a1,caml_frame_descriptors_mask
	.loc 1 283 9
	and	a5,a5,a1
.LVL127:
.L78:
	.loc 1 284 7 is_stmt 1
	.loc 1 285 9
	.loc 1 285 35 is_stmt 0
	slli	a4,a5,3
	ld	a3,caml_frame_descriptors
	add	a4,a3,a4
	.loc 1 285 11
	ld	s0,0(a4)
.LVL128:
	.loc 1 286 9 is_stmt 1
	.loc 1 286 14 is_stmt 0
	ld	a4,0(s0)
	.loc 1 286 12
	beq	a4,a2,.L77
	.loc 1 287 9 is_stmt 1
	.loc 1 287 15 is_stmt 0
	addi	a5,a5,1
.LVL129:
	.loc 1 287 11
	and	a5,a1,a5
.LVL130:
	.loc 1 284 12 is_stmt 1
	.loc 1 285 11 is_stmt 0
	j	.L78
.LVL131:
.L102:
	.loc 1 291 9 is_stmt 1
	.loc 1 291 16 is_stmt 0
	addi	s4,s0,12
.LVL132:
	.loc 1 291 33
	lhu	s3,10(s0)
.LVL133:
	.loc 1 291 9
	j	.L80
.LVL134:
.L81:
	.loc 1 296 13 is_stmt 1
	.loc 1 296 18 is_stmt 0
	add	a1,s1,a1
.LVL135:
	j	.L82
.LVL136:
.L83:
	.loc 1 298 11 is_stmt 1 discriminator 11
	.loc 1 291 55 discriminator 11
	.loc 1 291 56 is_stmt 0 discriminator 11
	addiw	s3,s3,-1
.LVL137:
	.loc 1 291 61 discriminator 11
	addi	s4,s4,2
.LVL138:
.L80:
	.loc 1 291 48 is_stmt 1 discriminator 2
	.loc 1 291 9 is_stmt 0 discriminator 2
	ble	s3,zero,.L103
	.loc 1 292 11 is_stmt 1
	.loc 1 292 17 is_stmt 0
	lhu	a1,0(s4)
	.loc 1 292 15
	sext.w	a5,a1
.LVL139:
	.loc 1 293 11 is_stmt 1
	.loc 1 293 14 is_stmt 0
	andi	a4,a1,1
	beq	a4,zero,.L81
	.loc 1 294 13 is_stmt 1
	.loc 1 294 32 is_stmt 0
	srli	a1,a5,1
	.loc 1 294 25
	slli	a1,a1,3
	.loc 1 294 18
	add	a1,s2,a1
.LVL140:
.L82:
	.loc 1 298 11 is_stmt 1
.LBB5:
	.loc 1 298 11
	ld	a0,0(a1)
.LVL141:
	.loc 1 298 11
	andi	a5,a0,1
.LVL142:
	bne	a5,zero,.L83
	.loc 1 298 11 is_stmt 0 discriminator 1
	ld	a5,caml_young_end
	bgeu	a0,a5,.L83
	.loc 1 298 11 discriminator 3
	ld	a5,caml_young_start
	bleu	a0,a5,.L83
	.loc 1 298 11 is_stmt 1
	call	caml_oldify_one
.LVL143:
	j	.L83
.L103:
.LBE5:
	.loc 1 302 9
	.loc 1 302 17 is_stmt 0
	lhu	a5,8(s0)
	.loc 1 302 30
	andi	a5,a5,-4
	.loc 1 302 12
	add	a5,s1,a5
.LVL144:
	.loc 1 306 9 is_stmt 1
	.loc 1 306 19 is_stmt 0
	ld	a2,-8(a5)
.LVL145:
	j	.L85
.LVL146:
.L87:
	.loc 1 330 9 is_stmt 1 discriminator 11
	.loc 1 328 35 discriminator 11
	.loc 1 328 36 is_stmt 0 discriminator 11
	addiw	s0,s0,1
.LVL147:
.L89:
	.loc 1 328 19 is_stmt 1 discriminator 2
	.loc 1 328 25 is_stmt 0 discriminator 2
	ld	a5,16(s1)
	.loc 1 328 7 discriminator 2
	bge	s0,a5,.L104
	.loc 1 329 9 is_stmt 1
	.loc 1 329 28 is_stmt 0
	addi	a5,s2,2
	slli	a5,a5,3
	add	a5,s1,a5
	ld	a1,8(a5)
	.loc 1 329 31
	slli	a5,s0,3
	.loc 1 329 14
	add	a1,a1,a5
.LVL148:
	.loc 1 330 9 is_stmt 1
.LBB6:
	.loc 1 330 9
	ld	a0,0(a1)
.LVL149:
	.loc 1 330 9
	andi	a5,a0,1
	bne	a5,zero,.L87
	.loc 1 330 9 is_stmt 0 discriminator 1
	ld	a5,caml_young_end
	bgeu	a0,a5,.L87
	.loc 1 330 9 discriminator 3
	ld	a5,caml_young_start
	bleu	a0,a5,.L87
	.loc 1 330 9 is_stmt 1
	call	caml_oldify_one
.LVL150:
	j	.L87
.L104:
.LBE6:
	.loc 1 327 34 discriminator 2
	.loc 1 327 35 is_stmt 0 discriminator 2
	addiw	s2,s2,1
.LVL151:
.L90:
	.loc 1 327 17 is_stmt 1 discriminator 1
	.loc 1 327 23 is_stmt 0 discriminator 1
	ld	a5,8(s1)
	.loc 1 327 5 discriminator 1
	bge	s2,a5,.L105
	.loc 1 328 14
	li	s0,0
	j	.L89
.L105:
	.loc 1 326 43 is_stmt 1 discriminator 2
	.loc 1 326 46 is_stmt 0 discriminator 2
	ld	s1,0(s1)
.LVL152:
.L86:
	.loc 1 326 31 is_stmt 1 discriminator 1
	.loc 1 326 3 is_stmt 0 discriminator 1
	beq	s1,zero,.L106
	.loc 1 327 12
	li	s2,0
	j	.L90
.L106:
	.loc 1 335 3 is_stmt 1
	lla	a0,caml_oldify_one
	call	caml_scan_global_young_roots
.LVL153:
	.loc 1 337 3
	call	caml_final_oldify_young_roots
.LVL154:
	.loc 1 339 3
	.loc 1 339 28 is_stmt 0
	ld	a5,caml_scan_roots_hook
	.loc 1 339 6
	beq	a5,zero,.L62
	.loc 1 339 37 is_stmt 1 discriminator 1
	.loc 1 339 38 is_stmt 0 discriminator 1
	lla	a0,caml_oldify_one
	jalr	a5
.LVL155:
.L62:
	.loc 1 340 1
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	ld	s1,24(sp)
	.cfi_restore 9
.LVL156:
	ld	s2,16(sp)
	.cfi_restore 18
	ld	s3,8(sp)
	.cfi_restore 19
	ld	s4,0(sp)
	.cfi_restore 20
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE19:
	.size	caml_oldify_local_roots, .-caml_oldify_local_roots
	.align	1
	.globl	caml_darken_all_roots_slice
	.type	caml_darken_all_roots_slice, @function
caml_darken_all_roots_slice:
.LFB21:
	.loc 1 358 1 is_stmt 1
	.cfi_startproc
.LVL157:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	mv	s0,a0
	.loc 1 359 3
	.loc 1 360 3
	.loc 1 361 3
	.loc 1 362 3
	.loc 1 363 3
.LVL158:
	.loc 1 364 29
	.loc 1 367 3
	.loc 1 367 7 is_stmt 0
	lw	a5,do_resume.2287
	.loc 1 367 6
	bne	a5,zero,.L116
	.loc 1 371 3 is_stmt 1
	.loc 1 371 10 is_stmt 0
	sw	zero,i.2284,a5
	.loc 1 363 10
	mv	s1,a0
.LVL159:
.L109:
	.loc 1 371 15 is_stmt 1 discriminator 1
	.loc 1 371 27 is_stmt 0 discriminator 1
	lw	a5,i.2284
	slli	a4,a5,3
	lla	a5,caml_globals
	add	a5,a5,a4
	ld	a5,0(a5)
	.loc 1 371 3 discriminator 1
	beq	a5,zero,.L118
	.loc 1 372 5 is_stmt 1
	.loc 1 372 14 is_stmt 0
	sd	a5,glob.2286,a4
.L110:
	.loc 1 372 33 is_stmt 1 discriminator 1
	ld	a5,glob.2286
	ld	a5,0(a5)
	.loc 1 372 5 is_stmt 0 discriminator 1
	bne	a5,zero,.L114
	.loc 1 371 37 is_stmt 1 discriminator 2
	.loc 1 371 38 is_stmt 0 discriminator 2
	lla	a4,i.2284
	lw	a5,0(a4)
	addiw	a5,a5,1
	sw	a5,0(a4)
	j	.L109
.L114:
	.loc 1 373 7 is_stmt 1
	.loc 1 373 14 is_stmt 0
	sw	zero,j.2285,a5
	.loc 1 373 7
	j	.L111
.L113:
	.loc 1 374 9 is_stmt 1
	.loc 1 374 22 is_stmt 0
	slli	a3,a3,3
	add	a1,a3,a1
	.loc 1 374 9
	ld	a0,0(a1)
	call	caml_darken
.LVL160:
	.loc 1 375 9 is_stmt 1
	addi	s1,s1,-1
.LVL161:
	.loc 1 376 9
	.loc 1 376 12 is_stmt 0
	bne	s1,zero,.L108
	.loc 1 377 11 is_stmt 1
	.loc 1 377 23 is_stmt 0
	lla	a4,roots_count.2288
	ld	a5,0(a4)
	add	s0,a5,s0
.LVL162:
	sd	s0,0(a4)
	.loc 1 378 11 is_stmt 1
	.loc 1 378 21 is_stmt 0
	li	a5,1
	sw	a5,do_resume.2287,a4
	.loc 1 379 11 is_stmt 1
	j	.L107
.LVL163:
.L116:
	.loc 1 363 10 is_stmt 0
	mv	s1,a0
.LVL164:
.L108:
	.loc 1 381 15 is_stmt 1 discriminator 2
	.loc 1 373 42 discriminator 2
	.loc 1 373 43 is_stmt 0 discriminator 2
	lla	a4,j.2285
	lw	a5,0(a4)
	addiw	a5,a5,1
	sw	a5,0(a4)
.L111:
	.loc 1 373 19 is_stmt 1 discriminator 1
	.loc 1 373 21 is_stmt 0 discriminator 1
	lw	a3,j.2285
	.loc 1 373 23 discriminator 1
	ld	a5,glob.2286
	ld	a1,0(a5)
	ld	a4,-8(a1)
	srli	a4,a4,10
	.loc 1 373 7 discriminator 1
	bltu	a3,a4,.L113
	.loc 1 372 45 is_stmt 1 discriminator 2
	.loc 1 372 49 is_stmt 0 discriminator 2
	addi	a5,a5,8
	sd	a5,glob.2286,a4
	j	.L110
.L118:
	.loc 1 387 3 is_stmt 1
	.loc 1 387 46 is_stmt 0
	lla	a5,roots_count.2288
	ld	a0,0(a5)
	add	s0,s0,a0
.LVL165:
	.loc 1 387 53
	sub	s0,s0,s1
	.loc 1 387 32
	sd	s0,caml_incremental_roots_count,a4
	.loc 1 389 3 is_stmt 1
	.loc 1 389 13 is_stmt 0
	sw	zero,do_resume.2287,a4
	.loc 1 390 3 is_stmt 1
	.loc 1 390 15 is_stmt 0
	sd	zero,0(a5)
.L112:
	.loc 1 394 57 is_stmt 1
	.loc 1 395 3
.L107:
	.loc 1 396 1 is_stmt 0
	mv	a0,s1
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	ld	s1,8(sp)
	.cfi_restore 9
.LVL166:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	caml_darken_all_roots_slice, .-caml_darken_all_roots_slice
	.align	1
	.globl	caml_do_local_roots
	.type	caml_do_local_roots, @function
caml_do_local_roots:
.LFB23:
	.loc 1 441 1 is_stmt 1
	.cfi_startproc
.LVL167:
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	sd	s4,16(sp)
	sd	s5,8(sp)
	sd	s6,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	mv	s2,a0
	mv	s0,a1
	mv	s3,a3
	mv	s1,a4
	.loc 1 442 3
	.loc 1 443 3
	.loc 1 444 3
	.loc 1 445 3
	.loc 1 446 3
	.loc 1 447 3
	.loc 1 451 3
	.loc 1 453 3
	.loc 1 454 3
	.loc 1 456 3
.LVL168:
	.loc 1 457 3
	.loc 1 458 3
	.loc 1 459 3
	.loc 1 459 6 is_stmt 0
	bne	a1,zero,.L120
	j	.L132
.LVL169:
.L122:
	.loc 1 468 7 is_stmt 1
	.loc 1 468 10 is_stmt 0
	lhu	a4,8(s4)
	li	a5,65536
.LVL170:
	addi	a5,a5,-1
	bne	a4,a5,.L137
.LBB7:
	.loc 1 492 9 is_stmt 1
.LVL171:
	.loc 1 493 9
	.loc 1 493 12 is_stmt 0
	ld	a5,16(s0)
.LVL172:
	.loc 1 494 9 is_stmt 1
	.loc 1 494 17 is_stmt 0
	ld	a2,24(s0)
.LVL173:
	.loc 1 495 9 is_stmt 1
	.loc 1 495 14 is_stmt 0
	ld	s3,32(s0)
.LVL174:
	.loc 1 497 9 is_stmt 1
	.loc 1 497 12 is_stmt 0
	beq	a5,zero,.L132
.LVL175:
.L129:
.LBE7:
	.loc 1 441 1
	mv	s0,a5
.LVL176:
.L120:
	.loc 1 460 5 is_stmt 1
	.loc 1 462 7
	.loc 1 462 11 is_stmt 0
	srli	a5,a2,3
	lw	a3,caml_frame_descriptors_mask
	.loc 1 462 9
	and	a5,a5,a3
.LVL177:
.L123:
	.loc 1 463 7 is_stmt 1
	.loc 1 464 9
	.loc 1 464 35 is_stmt 0
	slli	a4,a5,3
	ld	a0,caml_frame_descriptors
	add	a4,a0,a4
	.loc 1 464 11
	ld	s4,0(a4)
.LVL178:
	.loc 1 465 9 is_stmt 1
	.loc 1 465 14 is_stmt 0
	ld	a4,0(s4)
	.loc 1 465 12
	beq	a4,a2,.L122
	.loc 1 466 9 is_stmt 1
	.loc 1 466 15 is_stmt 0
	addi	a5,a5,1
.LVL179:
	.loc 1 466 11
	and	a5,a3,a5
.LVL180:
	.loc 1 463 12 is_stmt 1
	.loc 1 464 11 is_stmt 0
	j	.L123
.LVL181:
.L137:
	.loc 1 470 9 is_stmt 1
	.loc 1 470 16 is_stmt 0
	addi	s6,s4,12
.LVL182:
	.loc 1 470 33
	lhu	s5,10(s4)
.LVL183:
	.loc 1 470 9
	j	.L125
.LVL184:
.L126:
	.loc 1 475 13 is_stmt 1
	.loc 1 475 18 is_stmt 0
	add	a1,s0,a1
.LVL185:
.L127:
	.loc 1 477 11 is_stmt 1 discriminator 2
	ld	a0,0(a1)
	jalr	s2
.LVL186:
	.loc 1 470 55 discriminator 2
	.loc 1 470 56 is_stmt 0 discriminator 2
	addiw	s5,s5,-1
.LVL187:
	.loc 1 470 61 discriminator 2
	addi	s6,s6,2
.LVL188:
.L125:
	.loc 1 470 48 is_stmt 1 discriminator 1
	.loc 1 470 9 is_stmt 0 discriminator 1
	ble	s5,zero,.L138
	.loc 1 471 11 is_stmt 1
	.loc 1 471 17 is_stmt 0
	lhu	a1,0(s6)
	.loc 1 471 15
	sext.w	a5,a1
.LVL189:
	.loc 1 472 11 is_stmt 1
	.loc 1 472 14 is_stmt 0
	andi	a4,a1,1
	beq	a4,zero,.L126
	.loc 1 473 13 is_stmt 1
	.loc 1 473 32 is_stmt 0
	srli	a1,a5,1
	.loc 1 473 25
	slli	a1,a1,3
	.loc 1 473 18
	add	a1,s3,a1
.LVL190:
	j	.L127
.LVL191:
.L138:
	.loc 1 481 9 is_stmt 1
	.loc 1 481 17 is_stmt 0
	lhu	a5,8(s4)
	.loc 1 481 30
	andi	a5,a5,-4
	.loc 1 481 12
	add	a5,s0,a5
.LVL192:
	.loc 1 485 9 is_stmt 1
	.loc 1 485 19 is_stmt 0
	ld	a2,-8(a5)
.LVL193:
	j	.L129
.LVL194:
.L130:
	.loc 1 505 9 is_stmt 1 discriminator 3
	.loc 1 505 28 is_stmt 0 discriminator 3
	addi	a5,s3,2
	slli	a5,a5,3
	add	a5,s1,a5
	ld	a1,8(a5)
	.loc 1 505 31 discriminator 3
	slli	a5,s0,3
	.loc 1 505 14 discriminator 3
	add	a1,a1,a5
.LVL195:
	.loc 1 506 9 is_stmt 1 discriminator 3
	ld	a0,0(a1)
	jalr	s2
.LVL196:
	.loc 1 504 35 discriminator 3
	.loc 1 504 36 is_stmt 0 discriminator 3
	addiw	s0,s0,1
.LVL197:
.L131:
	.loc 1 504 19 is_stmt 1 discriminator 1
	.loc 1 504 25 is_stmt 0 discriminator 1
	ld	a5,16(s1)
	.loc 1 504 7 discriminator 1
	blt	s0,a5,.L130
	.loc 1 503 34 is_stmt 1 discriminator 2
	.loc 1 503 35 is_stmt 0 discriminator 2
	addiw	s3,s3,1
.LVL198:
.L133:
	.loc 1 503 17 is_stmt 1 discriminator 1
	.loc 1 503 23 is_stmt 0 discriminator 1
	ld	a5,8(s1)
	.loc 1 503 5 discriminator 1
	bge	s3,a5,.L139
	.loc 1 504 14
	li	s0,0
	j	.L131
.L139:
	.loc 1 502 38 is_stmt 1 discriminator 2
	.loc 1 502 41 is_stmt 0 discriminator 2
	ld	s1,0(s1)
.LVL199:
.L132:
	.loc 1 502 26 is_stmt 1 discriminator 1
	.loc 1 502 3 is_stmt 0 discriminator 1
	beq	s1,zero,.L140
	.loc 1 503 12
	li	s3,0
	j	.L133
.L140:
	.loc 1 510 1
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
	ld	s1,40(sp)
	.cfi_restore 9
.LVL200:
	ld	s2,32(sp)
	.cfi_restore 18
.LVL201:
	ld	s3,24(sp)
	.cfi_restore 19
	ld	s4,16(sp)
	.cfi_restore 20
	ld	s5,8(sp)
	.cfi_restore 21
	ld	s6,0(sp)
	.cfi_restore 22
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE23:
	.size	caml_do_local_roots, .-caml_do_local_roots
	.align	1
	.globl	caml_do_roots
	.type	caml_do_roots, @function
caml_do_roots:
.LFB22:
	.loc 1 399 1 is_stmt 1
	.cfi_startproc
.LVL202:
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
	mv	s1,a0
	.loc 1 400 3
	.loc 1 401 3
	.loc 1 402 3
	.loc 1 403 40
	.loc 1 405 3
	.loc 1 405 6 is_stmt 0
	bne	a1,zero,.L153
.LVL203:
.L143:
	.loc 1 415 3 is_stmt 1
	ld	s3,caml_dyn_globals
.LVL204:
	j	.L147
.LVL205:
.L158:
	.loc 1 408 47 discriminator 2
	.loc 1 408 51 is_stmt 0 discriminator 2
	addi	s2,s2,8
.LVL206:
.L146:
	.loc 1 408 35 is_stmt 1 discriminator 1
	ld	a5,0(s2)
	.loc 1 408 7 is_stmt 0 discriminator 1
	beq	a5,zero,.L157
	.loc 1 409 16
	li	s0,0
.L145:
.LVL207:
	.loc 1 409 21 is_stmt 1 discriminator 1
	.loc 1 409 25 is_stmt 0 discriminator 1
	ld	a4,0(s2)
	ld	a5,-8(a4)
	srli	a5,a5,10
	.loc 1 409 9 discriminator 1
	bgeu	s0,a5,.L158
	.loc 1 410 11 is_stmt 1 discriminator 3
	.loc 1 410 14 is_stmt 0 discriminator 3
	slli	a1,s0,3
	add	a1,a1,a4
	.loc 1 410 11 discriminator 3
	ld	a0,0(a1)
	jalr	s1
.LVL208:
	.loc 1 409 44 is_stmt 1 discriminator 3
	.loc 1 409 45 is_stmt 0 discriminator 3
	addiw	s0,s0,1
.LVL209:
	j	.L145
.L157:
	.loc 1 407 39 is_stmt 1 discriminator 2
	.loc 1 407 40 is_stmt 0 discriminator 2
	addiw	s3,s3,1
.LVL210:
.L142:
	.loc 1 407 17 is_stmt 1 discriminator 1
	.loc 1 407 29 is_stmt 0 discriminator 1
	slli	a4,s3,3
	lla	a5,caml_globals
	add	a5,a5,a4
	ld	s2,0(a5)
	.loc 1 407 5 discriminator 1
	bne	s2,zero,.L146
	j	.L143
.LVL211:
.L153:
	.loc 1 407 12
	li	s3,0
	j	.L142
.LVL212:
.L149:
	.loc 1 418 9 is_stmt 1 discriminator 3
	.loc 1 418 12 is_stmt 0 discriminator 3
	slli	a1,s0,3
	add	a1,a1,a4
	.loc 1 418 9 discriminator 3
	ld	a0,0(a1)
	jalr	s1
.LVL213:
	.loc 1 417 42 is_stmt 1 discriminator 3
	.loc 1 417 43 is_stmt 0 discriminator 3
	addiw	s0,s0,1
.LVL214:
.L150:
	.loc 1 417 19 is_stmt 1 discriminator 1
	.loc 1 417 23 is_stmt 0 discriminator 1
	ld	a4,0(s2)
	ld	a5,-8(a4)
	srli	a5,a5,10
	.loc 1 417 7 discriminator 1
	bltu	s0,a5,.L149
	.loc 1 416 49 is_stmt 1 discriminator 2
	.loc 1 416 53 is_stmt 0 discriminator 2
	addi	s2,s2,8
.LVL215:
.L148:
	.loc 1 416 37 is_stmt 1 discriminator 1
	ld	a5,0(s2)
	.loc 1 416 5 is_stmt 0 discriminator 1
	beq	a5,zero,.L159
	.loc 1 417 14
	li	s0,0
	j	.L150
.L159:
	.loc 1 415 3 is_stmt 1 discriminator 2
	ld	s3,8(s3)
.LVL216:
.L147:
	.loc 1 415 3 discriminator 1
	beq	s3,zero,.L160
	.loc 1 416 5
	.loc 1 416 14 is_stmt 0
	ld	s2,0(s3)
.LVL217:
	.loc 1 416 5
	j	.L148
.LVL218:
.L160:
	.loc 1 422 54 is_stmt 1
	.loc 1 424 3
	ld	a4,caml_local_roots
	ld	a3,caml_gc_regs
	ld	a2,caml_last_return_address
	ld	a1,caml_bottom_of_stack
	mv	a0,s1
	call	caml_do_local_roots
.LVL219:
	.loc 1 426 45
	.loc 1 428 3
	mv	a0,s1
	call	caml_scan_global_roots
.LVL220:
	.loc 1 429 41
	.loc 1 431 3
	mv	a0,s1
	call	caml_final_do_roots
.LVL221:
	.loc 1 432 49
	.loc 1 434 3
	.loc 1 434 28 is_stmt 0
	ld	a5,caml_scan_roots_hook
	.loc 1 434 6
	beq	a5,zero,.L141
	.loc 1 434 37 is_stmt 1 discriminator 1
	.loc 1 434 38 is_stmt 0 discriminator 1
	mv	a0,s1
	jalr	a5
.LVL222:
	.loc 1 435 44 is_stmt 1 discriminator 1
.L141:
	.loc 1 436 1 is_stmt 0
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	ld	s1,24(sp)
	.cfi_restore 9
.LVL223:
	ld	s2,16(sp)
	.cfi_restore 18
	ld	s3,8(sp)
	.cfi_restore 19
.LVL224:
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE22:
	.size	caml_do_roots, .-caml_do_roots
	.align	1
	.globl	caml_darken_all_roots_start
	.type	caml_darken_all_roots_start, @function
caml_darken_all_roots_start:
.LFB20:
	.loc 1 349 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 350 3
	li	a1,0
	lla	a0,caml_darken
	call	caml_do_roots
.LVL225:
	.loc 1 351 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE20:
	.size	caml_darken_all_roots_start, .-caml_darken_all_roots_start
	.align	1
	.globl	caml_stack_usage
	.type	caml_stack_usage, @function
caml_stack_usage:
.LFB24:
	.loc 1 515 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.loc 1 516 3
	.loc 1 517 3
	.loc 1 517 36 is_stmt 0
	ld	s0,caml_top_of_stack
	ld	a5,caml_bottom_of_stack
	sub	s0,s0,a5
	srai	s0,s0,3
	.loc 1 517 6
	mv	a0,s0
.LVL226:
	.loc 1 518 3 is_stmt 1
	.loc 1 518 29 is_stmt 0
	ld	a5,caml_stack_usage_hook
	.loc 1 518 6
	beq	a5,zero,.L163
	.loc 1 519 5 is_stmt 1
	.loc 1 519 12 is_stmt 0
	jalr	a5
.LVL227:
	.loc 1 519 8
	add	a0,s0,a0
.LVL228:
	.loc 1 520 3 is_stmt 1
.L163:
	.loc 1 521 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE24:
	.size	caml_stack_usage, .-caml_stack_usage
	.globl	caml_stack_usage_hook
	.globl	caml_incremental_roots_count
	.globl	caml_globals_inited
	.comm	caml_gc_regs,8,8
	.globl	caml_last_return_address
	.globl	caml_bottom_of_stack
	.comm	caml_top_of_stack,8,8
	.globl	caml_frame_descriptors_mask
	.globl	caml_frame_descriptors
	.globl	caml_scan_roots_hook
	.globl	caml_local_roots
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
	.section	.sbss,"aw",@nobits
	.align	3
	.type	roots_count.2288, @object
	.size	roots_count.2288, 8
roots_count.2288:
	.zero	8
	.type	j.2285, @object
	.size	j.2285, 4
j.2285:
	.zero	4
	.zero	4
	.type	glob.2286, @object
	.size	glob.2286, 8
glob.2286:
	.zero	8
	.type	i.2284, @object
	.size	i.2284, 4
i.2284:
	.zero	4
	.type	do_resume.2287, @object
	.size	do_resume.2287, 4
do_resume.2287:
	.zero	4
	.type	caml_stack_usage_hook, @object
	.size	caml_stack_usage_hook, 8
caml_stack_usage_hook:
	.zero	8
	.type	caml_incremental_roots_count, @object
	.size	caml_incremental_roots_count, 8
caml_incremental_roots_count:
	.zero	8
	.type	caml_dyn_globals, @object
	.size	caml_dyn_globals, 8
caml_dyn_globals:
	.zero	8
	.type	caml_globals_scanned, @object
	.size	caml_globals_scanned, 8
caml_globals_scanned:
	.zero	8
	.type	caml_globals_inited, @object
	.size	caml_globals_inited, 8
caml_globals_inited:
	.zero	8
	.type	caml_bottom_of_stack, @object
	.size	caml_bottom_of_stack, 8
caml_bottom_of_stack:
	.zero	8
	.type	num_descr, @object
	.size	num_descr, 8
num_descr:
	.zero	8
	.type	frametables, @object
	.size	frametables, 8
frametables:
	.zero	8
	.type	caml_frame_descriptors_mask, @object
	.size	caml_frame_descriptors_mask, 4
caml_frame_descriptors_mask:
	.zero	4
	.zero	4
	.type	caml_frame_descriptors, @object
	.size	caml_frame_descriptors, 8
caml_frame_descriptors:
	.zero	8
	.type	caml_scan_roots_hook, @object
	.size	caml_scan_roots_hook, 8
caml_scan_roots_hook:
	.zero	8
	.type	caml_local_roots, @object
	.size	caml_local_roots, 8
caml_local_roots:
	.zero	8
	.section	.sdata,"aw"
	.align	3
	.type	caml_last_return_address, @object
	.size	caml_last_return_address, 8
caml_last_return_address:
	.dword	1
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
	.file 12 "caml/stack.h"
	.file 13 "/home/sai/ocaml-freestanding-riscv/nolibc/include/stdio.h"
	.file 14 "caml/globroots.h"
	.file 15 "caml/finalise.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x13e8
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF161
	.byte	0xc
	.4byte	.LASF162
	.4byte	.LASF163
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.byte	0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1
	.byte	0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF2
	.byte	0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF4
	.byte	0x4
	.4byte	.LASF5
	.byte	0x2
	.byte	0x5b
	.byte	0xe
	.4byte	0x3b
	.byte	0x4
	.4byte	.LASF6
	.byte	0x2
	.byte	0x5c
	.byte	0x17
	.4byte	0x42
	.byte	0x4
	.4byte	.LASF7
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.4byte	0x42
	.byte	0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x3
	.byte	0x10
	.byte	0x4
	.4byte	.LASF9
	.byte	0x4
	.4byte	.LASF10
	.byte	0x4
	.byte	0x21
	.byte	0x10
	.4byte	0x6f
	.byte	0x4
	.4byte	.LASF11
	.byte	0x4
	.byte	0x28
	.byte	0x10
	.4byte	0xa1
	.byte	0x5
	.byte	0x8
	.4byte	0xa7
	.byte	0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.byte	0x6
	.4byte	0xa7
	.byte	0x4
	.4byte	.LASF13
	.byte	0x4
	.byte	0x5c
	.byte	0x10
	.4byte	0xbf
	.byte	0x5
	.byte	0x8
	.4byte	0xc5
	.byte	0x7
	.byte	0x8
	.4byte	.LASF14
	.byte	0x4
	.byte	0x5d
	.byte	0x19
	.4byte	0xb3
	.byte	0x8
	.4byte	.LASF15
	.byte	0x4
	.byte	0x5d
	.byte	0x36
	.4byte	0xb3
	.byte	0x8
	.4byte	.LASF16
	.byte	0x4
	.byte	0x5e
	.byte	0x19
	.4byte	0xb3
	.byte	0x8
	.4byte	.LASF17
	.byte	0x4
	.byte	0x5e
	.byte	0x33
	.4byte	0xb3
	.byte	0x8
	.4byte	.LASF18
	.byte	0x4
	.byte	0x5f
	.byte	0x19
	.4byte	0xb3
	.byte	0x8
	.4byte	.LASF19
	.byte	0x4
	.byte	0x5f
	.byte	0x33
	.4byte	0xb3
	.byte	0x9
	.byte	0x8
	.byte	0xa
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x169
	.byte	0x10
	.4byte	0x63
	.byte	0xa
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x171
	.byte	0x10
	.4byte	0x63
	.byte	0x4
	.4byte	.LASF22
	.byte	0x5
	.byte	0x3c
	.byte	0x10
	.4byte	0x57
	.byte	0x4
	.4byte	.LASF23
	.byte	0x5
	.byte	0x3d
	.byte	0x11
	.4byte	0x63
	.byte	0x4
	.4byte	.LASF24
	.byte	0x5
	.byte	0x3e
	.byte	0x11
	.4byte	0x63
	.byte	0xb
	.4byte	0x136
	.4byte	0x159
	.byte	0xc
	.byte	0
	.byte	0xa
	.4byte	.LASF25
	.byte	0x5
	.2byte	0x15c
	.byte	0x15
	.4byte	0x14e
	.byte	0xa
	.4byte	.LASF26
	.byte	0x5
	.2byte	0x171
	.byte	0xe
	.4byte	0x12a
	.byte	0x8
	.4byte	.LASF27
	.byte	0x6
	.byte	0x1a
	.byte	0x10
	.4byte	0x89
	.byte	0x8
	.4byte	.LASF28
	.byte	0x7
	.byte	0x24
	.byte	0xc
	.4byte	0x2d
	.byte	0x8
	.4byte	.LASF29
	.byte	0x7
	.byte	0x25
	.byte	0xc
	.4byte	0x2d
	.byte	0x8
	.4byte	.LASF30
	.byte	0x7
	.byte	0x26
	.byte	0x10
	.4byte	0x63
	.byte	0x8
	.4byte	.LASF31
	.byte	0x7
	.byte	0x27
	.byte	0xf
	.4byte	0x1af
	.byte	0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF32
	.byte	0x8
	.4byte	.LASF33
	.byte	0x7
	.byte	0x28
	.byte	0x10
	.4byte	0x63
	.byte	0x8
	.4byte	.LASF34
	.byte	0x7
	.byte	0x28
	.byte	0x25
	.4byte	0x63
	.byte	0x8
	.4byte	.LASF35
	.byte	0x7
	.byte	0x29
	.byte	0x10
	.4byte	0x63
	.byte	0x8
	.4byte	.LASF36
	.byte	0x7
	.byte	0x3e
	.byte	0x12
	.4byte	0xa1
	.byte	0x8
	.4byte	.LASF37
	.byte	0x7
	.byte	0x3f
	.byte	0x10
	.4byte	0x63
	.byte	0x8
	.4byte	.LASF38
	.byte	0x7
	.byte	0x40
	.byte	0xe
	.4byte	0xa1
	.byte	0x8
	.4byte	.LASF39
	.byte	0x7
	.byte	0x42
	.byte	0xc
	.4byte	0x2d
	.byte	0xb
	.4byte	0x1af
	.4byte	0x21a
	.byte	0xd
	.4byte	0x42
	.byte	0x31
	.byte	0
	.byte	0xe
	.4byte	.LASF40
	.byte	0x7
	.byte	0x43
	.byte	0x8
	.4byte	0x20a
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0xe
	.4byte	.LASF41
	.byte	0x7
	.byte	0x44
	.byte	0x5
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0xe
	.4byte	.LASF42
	.byte	0x7
	.byte	0x45
	.byte	0x8
	.4byte	0x1af
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0x8
	.4byte	.LASF43
	.byte	0x7
	.byte	0x46
	.byte	0xf
	.4byte	0x1af
	.byte	0x8
	.4byte	.LASF44
	.byte	0x7
	.byte	0x4a
	.byte	0x13
	.4byte	0xbf
	.byte	0x8
	.4byte	.LASF45
	.byte	0x8
	.byte	0x31
	.byte	0xf
	.4byte	0x280
	.byte	0x5
	.byte	0x8
	.4byte	0x12a
	.byte	0x8
	.4byte	.LASF46
	.byte	0x8
	.byte	0x31
	.byte	0x22
	.4byte	0x280
	.byte	0x8
	.4byte	.LASF47
	.byte	0x8
	.byte	0x32
	.byte	0xf
	.4byte	0xa1
	.byte	0x8
	.4byte	.LASF48
	.byte	0x8
	.byte	0x32
	.byte	0x27
	.4byte	0xa1
	.byte	0x8
	.4byte	.LASF49
	.byte	0x9
	.byte	0x18
	.byte	0x13
	.4byte	0x280
	.byte	0x8
	.4byte	.LASF50
	.byte	0x9
	.byte	0x18
	.byte	0x2c
	.4byte	0x280
	.byte	0x8
	.4byte	.LASF51
	.byte	0x9
	.byte	0x19
	.byte	0x13
	.4byte	0x280
	.byte	0x8
	.4byte	.LASF52
	.byte	0x9
	.byte	0x19
	.byte	0x24
	.4byte	0x280
	.byte	0x8
	.4byte	.LASF53
	.byte	0x9
	.byte	0x1a
	.byte	0x13
	.4byte	0x280
	.byte	0x8
	.4byte	.LASF54
	.byte	0x9
	.byte	0x1b
	.byte	0x10
	.4byte	0x89
	.byte	0x8
	.4byte	.LASF55
	.byte	0x9
	.byte	0x1c
	.byte	0xc
	.4byte	0x2d
	.byte	0x8
	.4byte	.LASF56
	.byte	0x9
	.byte	0x1d
	.byte	0xf
	.4byte	0x1af
	.byte	0xf
	.4byte	.LASF62
	.byte	0x38
	.byte	0x9
	.byte	0x29
	.byte	0x8
	.4byte	0x373
	.byte	0x10
	.4byte	.LASF57
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x373
	.byte	0
	.byte	0x11
	.string	"end"
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x373
	.byte	0x8
	.byte	0x10
	.4byte	.LASF58
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x373
	.byte	0x10
	.byte	0x11
	.string	"ptr"
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x373
	.byte	0x18
	.byte	0x10
	.4byte	.LASF59
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x373
	.byte	0x20
	.byte	0x10
	.4byte	.LASF60
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x89
	.byte	0x28
	.byte	0x10
	.4byte	.LASF61
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x280
	.byte	0x8
	.4byte	.LASF62
	.byte	0x9
	.byte	0x2a
	.byte	0x22
	.4byte	0x30a
	.byte	0xf
	.4byte	.LASF63
	.byte	0x10
	.byte	0x9
	.byte	0x2c
	.byte	0x8
	.4byte	0x3ad
	.byte	0x10
	.4byte	.LASF64
	.byte	0x9
	.byte	0x2d
	.byte	0x9
	.4byte	0x12a
	.byte	0
	.byte	0x10
	.4byte	.LASF65
	.byte	0x9
	.byte	0x2e
	.byte	0xc
	.4byte	0x142
	.byte	0x8
	.byte	0
	.byte	0xf
	.4byte	.LASF66
	.byte	0x38
	.byte	0x9
	.byte	0x31
	.byte	0x8
	.4byte	0x416
	.byte	0x10
	.4byte	.LASF57
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x416
	.byte	0
	.byte	0x11
	.string	"end"
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x416
	.byte	0x8
	.byte	0x10
	.4byte	.LASF58
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x416
	.byte	0x10
	.byte	0x11
	.string	"ptr"
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x416
	.byte	0x18
	.byte	0x10
	.4byte	.LASF59
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x416
	.byte	0x20
	.byte	0x10
	.4byte	.LASF60
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x89
	.byte	0x28
	.byte	0x10
	.4byte	.LASF61
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x385
	.byte	0x8
	.4byte	.LASF66
	.byte	0x9
	.byte	0x32
	.byte	0x27
	.4byte	0x3ad
	.byte	0xf
	.4byte	.LASF67
	.byte	0x18
	.byte	0x9
	.byte	0x34
	.byte	0x8
	.4byte	0x45d
	.byte	0x10
	.4byte	.LASF68
	.byte	0x9
	.byte	0x35
	.byte	0x9
	.4byte	0x12a
	.byte	0
	.byte	0x11
	.string	"mem"
	.byte	0x9
	.byte	0x36
	.byte	0xc
	.4byte	0x142
	.byte	0x8
	.byte	0x11
	.string	"max"
	.byte	0x9
	.byte	0x37
	.byte	0xc
	.4byte	0x142
	.byte	0x10
	.byte	0
	.byte	0xf
	.4byte	.LASF69
	.byte	0x38
	.byte	0x9
	.byte	0x3a
	.byte	0x8
	.4byte	0x4c6
	.byte	0x10
	.4byte	.LASF57
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4c6
	.byte	0
	.byte	0x11
	.string	"end"
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4c6
	.byte	0x8
	.byte	0x10
	.4byte	.LASF58
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4c6
	.byte	0x10
	.byte	0x11
	.string	"ptr"
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4c6
	.byte	0x18
	.byte	0x10
	.4byte	.LASF59
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x4c6
	.byte	0x20
	.byte	0x10
	.4byte	.LASF60
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x89
	.byte	0x28
	.byte	0x10
	.4byte	.LASF61
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x428
	.byte	0x8
	.4byte	.LASF69
	.byte	0x9
	.byte	0x3b
	.byte	0x25
	.4byte	0x45d
	.byte	0x8
	.4byte	.LASF70
	.byte	0xa
	.byte	0x3f
	.byte	0x10
	.4byte	0x2d
	.byte	0x8
	.4byte	.LASF71
	.byte	0xa
	.byte	0xb7
	.byte	0x10
	.4byte	0x63
	.byte	0xf
	.4byte	.LASF72
	.byte	0x40
	.byte	0xa
	.byte	0xf3
	.byte	0x8
	.4byte	0x532
	.byte	0x10
	.4byte	.LASF73
	.byte	0xa
	.byte	0xf4
	.byte	0x1d
	.4byte	0x532
	.byte	0
	.byte	0x10
	.4byte	.LASF74
	.byte	0xa
	.byte	0xf5
	.byte	0xa
	.4byte	0x57
	.byte	0x8
	.byte	0x10
	.4byte	.LASF75
	.byte	0xa
	.byte	0xf6
	.byte	0xa
	.4byte	0x57
	.byte	0x10
	.byte	0x10
	.4byte	.LASF76
	.byte	0xa
	.byte	0xf7
	.byte	0xa
	.4byte	0x538
	.byte	0x18
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x4f0
	.byte	0xb
	.4byte	0x280
	.4byte	0x548
	.byte	0xd
	.4byte	0x42
	.byte	0x4
	.byte	0
	.byte	0x8
	.4byte	.LASF77
	.byte	0xa
	.byte	0xfa
	.byte	0x26
	.4byte	0x532
	.byte	0x4
	.4byte	.LASF78
	.byte	0xb
	.byte	0x18
	.byte	0x10
	.4byte	0x560
	.byte	0x5
	.byte	0x8
	.4byte	0x566
	.byte	0x12
	.4byte	0x576
	.byte	0x13
	.4byte	0x12a
	.byte	0x13
	.4byte	0x280
	.byte	0
	.byte	0x8
	.4byte	.LASF79
	.byte	0xb
	.byte	0x1e
	.byte	0x10
	.4byte	0x63
	.byte	0x12
	.4byte	0x58d
	.byte	0x13
	.4byte	0x554
	.byte	0
	.byte	0x8
	.4byte	.LASF80
	.byte	0xb
	.byte	0x28
	.byte	0x13
	.4byte	0x599
	.byte	0x5
	.byte	0x8
	.4byte	0x582
	.byte	0xf
	.4byte	.LASF81
	.byte	0x18
	.byte	0xc
	.byte	0x50
	.byte	0x8
	.4byte	0x5d4
	.byte	0x10
	.4byte	.LASF82
	.byte	0xc
	.byte	0x51
	.byte	0xa
	.4byte	0xa1
	.byte	0
	.byte	0x10
	.4byte	.LASF83
	.byte	0xc
	.byte	0x52
	.byte	0xb
	.4byte	0x63
	.byte	0x8
	.byte	0x10
	.4byte	.LASF84
	.byte	0xc
	.byte	0x53
	.byte	0xb
	.4byte	0x280
	.byte	0x10
	.byte	0
	.byte	0x14
	.byte	0x10
	.byte	0xc
	.byte	0x5b
	.byte	0x9
	.4byte	0x612
	.byte	0x10
	.4byte	.LASF85
	.byte	0xc
	.byte	0x5c
	.byte	0xb
	.4byte	0x63
	.byte	0
	.byte	0x10
	.4byte	.LASF86
	.byte	0xc
	.byte	0x5d
	.byte	0x12
	.4byte	0x50
	.byte	0x8
	.byte	0x10
	.4byte	.LASF87
	.byte	0xc
	.byte	0x5e
	.byte	0x12
	.4byte	0x50
	.byte	0xa
	.byte	0x10
	.4byte	.LASF88
	.byte	0xc
	.byte	0x5f
	.byte	0x12
	.4byte	0x612
	.byte	0xc
	.byte	0
	.byte	0xb
	.4byte	0x50
	.4byte	0x622
	.byte	0xd
	.4byte	0x42
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	.LASF89
	.byte	0xc
	.byte	0x60
	.byte	0x3
	.4byte	0x5d4
	.byte	0x8
	.4byte	.LASF90
	.byte	0xc
	.byte	0x64
	.byte	0x17
	.4byte	0x63a
	.byte	0x5
	.byte	0x8
	.4byte	0x640
	.byte	0x5
	.byte	0x8
	.4byte	0x622
	.byte	0x8
	.4byte	.LASF91
	.byte	0xc
	.byte	0x65
	.byte	0xc
	.4byte	0x2d
	.byte	0x15
	.4byte	0x63
	.byte	0x8
	.4byte	.LASF92
	.byte	0xc
	.byte	0x70
	.byte	0x12
	.4byte	0x663
	.byte	0x5
	.byte	0x8
	.4byte	0x652
	.byte	0x8
	.4byte	.LASF93
	.byte	0xc
	.byte	0x73
	.byte	0xf
	.4byte	0xa1
	.byte	0x8
	.4byte	.LASF94
	.byte	0xc
	.byte	0x74
	.byte	0xf
	.4byte	0xa1
	.byte	0x8
	.4byte	.LASF95
	.byte	0xc
	.byte	0x75
	.byte	0x10
	.4byte	0x63
	.byte	0x8
	.4byte	.LASF96
	.byte	0xc
	.byte	0x76
	.byte	0x10
	.4byte	0x280
	.byte	0x8
	.4byte	.LASF97
	.byte	0xc
	.byte	0x77
	.byte	0xf
	.4byte	0xa1
	.byte	0xb
	.4byte	0x280
	.4byte	0x6b0
	.byte	0xc
	.byte	0
	.byte	0x8
	.4byte	.LASF98
	.byte	0xc
	.byte	0x78
	.byte	0x10
	.4byte	0x6a5
	.byte	0xb
	.4byte	0xa7
	.4byte	0x6c7
	.byte	0xc
	.byte	0
	.byte	0x8
	.4byte	.LASF99
	.byte	0xc
	.byte	0x79
	.byte	0xd
	.4byte	0x6bc
	.byte	0x8
	.4byte	.LASF100
	.byte	0xc
	.byte	0x7a
	.byte	0xf
	.4byte	0x57
	.byte	0xb
	.4byte	0x6ea
	.4byte	0x6ea
	.byte	0xc
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x57
	.byte	0x8
	.4byte	.LASF101
	.byte	0xc
	.byte	0x7b
	.byte	0x11
	.4byte	0x6df
	.byte	0xf
	.4byte	.LASF102
	.byte	0x18
	.byte	0xd
	.byte	0x8
	.byte	0x10
	.4byte	0x731
	.byte	0x10
	.4byte	.LASF103
	.byte	0xd
	.byte	0x9
	.byte	0xe
	.4byte	0x756
	.byte	0
	.byte	0x10
	.4byte	.LASF104
	.byte	0xd
	.byte	0xa
	.byte	0xb
	.4byte	0xa1
	.byte	0x8
	.byte	0x10
	.4byte	.LASF105
	.byte	0xd
	.byte	0xb
	.byte	0xb
	.4byte	0xa1
	.byte	0x10
	.byte	0
	.byte	0x16
	.4byte	0x6f
	.4byte	0x74a
	.byte	0x13
	.4byte	0x74a
	.byte	0x13
	.4byte	0x750
	.byte	0x13
	.4byte	0x6f
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x6fc
	.byte	0x5
	.byte	0x8
	.4byte	0xae
	.byte	0x5
	.byte	0x8
	.4byte	0x731
	.byte	0x4
	.4byte	.LASF106
	.byte	0xd
	.byte	0xc
	.byte	0x3
	.4byte	0x6fc
	.byte	0x8
	.4byte	.LASF107
	.byte	0xd
	.byte	0x11
	.byte	0xe
	.4byte	0x774
	.byte	0x5
	.byte	0x8
	.4byte	0x75c
	.byte	0x8
	.4byte	.LASF108
	.byte	0xd
	.byte	0x12
	.byte	0xe
	.4byte	0x774
	.byte	0x8
	.4byte	.LASF109
	.byte	0xd
	.byte	0x1c
	.byte	0xe
	.4byte	0x774
	.byte	0x17
	.4byte	0x548
	.byte	0x1
	.byte	0x22
	.byte	0x1b
	.byte	0x9
	.byte	0x3
	.8byte	caml_local_roots
	.byte	0x17
	.4byte	0x58d
	.byte	0x1
	.byte	0x24
	.byte	0x8
	.byte	0x9
	.byte	0x3
	.8byte	caml_scan_roots_hook
	.byte	0x17
	.4byte	0x62e
	.byte	0x1
	.byte	0x27
	.byte	0x10
	.byte	0x9
	.byte	0x3
	.8byte	caml_frame_descriptors
	.byte	0x17
	.4byte	0x646
	.byte	0x1
	.byte	0x28
	.byte	0x5
	.byte	0x9
	.byte	0x3
	.8byte	caml_frame_descriptors_mask
	.byte	0xf
	.4byte	.LASF110
	.byte	0x10
	.byte	0x1
	.byte	0x2c
	.byte	0x10
	.4byte	0x802
	.byte	0x10
	.4byte	.LASF111
	.byte	0x1
	.byte	0x2d
	.byte	0x9
	.4byte	0x10e
	.byte	0
	.byte	0x10
	.4byte	.LASF73
	.byte	0x1
	.byte	0x2e
	.byte	0x10
	.4byte	0x802
	.byte	0x8
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x7da
	.byte	0x4
	.4byte	.LASF110
	.byte	0x1
	.byte	0x2f
	.byte	0x3
	.4byte	0x7da
	.byte	0x18
	.4byte	.LASF112
	.byte	0x1
	.byte	0x3d
	.byte	0xe
	.4byte	0x82a
	.byte	0x9
	.byte	0x3
	.8byte	frametables
	.byte	0x5
	.byte	0x8
	.4byte	0x808
	.byte	0x18
	.4byte	.LASF113
	.byte	0x1
	.byte	0x3e
	.byte	0xf
	.4byte	0x57
	.byte	0x9
	.byte	0x3
	.8byte	num_descr
	.byte	0x17
	.4byte	0x669
	.byte	0x1
	.byte	0xdf
	.byte	0x8
	.byte	0x9
	.byte	0x3
	.8byte	caml_top_of_stack
	.byte	0x17
	.4byte	0x675
	.byte	0x1
	.byte	0xe0
	.byte	0x8
	.byte	0x9
	.byte	0x3
	.8byte	caml_bottom_of_stack
	.byte	0x17
	.4byte	0x681
	.byte	0x1
	.byte	0xe1
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_last_return_address
	.byte	0x17
	.4byte	0x68d
	.byte	0x1
	.byte	0xe2
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_gc_regs
	.byte	0x17
	.4byte	0x6d3
	.byte	0x1
	.byte	0xe3
	.byte	0x8
	.byte	0x9
	.byte	0x3
	.8byte	caml_globals_inited
	.byte	0x18
	.4byte	.LASF114
	.byte	0x1
	.byte	0xe4
	.byte	0xf
	.4byte	0x57
	.byte	0x9
	.byte	0x3
	.8byte	caml_globals_scanned
	.byte	0x18
	.4byte	.LASF115
	.byte	0x1
	.byte	0xe5
	.byte	0xf
	.4byte	0x82a
	.byte	0x9
	.byte	0x3
	.8byte	caml_dyn_globals
	.byte	0x19
	.4byte	0x576
	.byte	0x1
	.2byte	0x156
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_incremental_roots_count
	.byte	0x19
	.4byte	0x657
	.byte	0x1
	.2byte	0x200
	.byte	0xb
	.byte	0x9
	.byte	0x3
	.8byte	caml_stack_usage_hook
	.byte	0x1a
	.4byte	.LASF123
	.byte	0x1
	.2byte	0x202
	.byte	0x9
	.4byte	0x63
	.8byte	.LFB24
	.8byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.4byte	0x926
	.byte	0x1b
	.string	"sz"
	.byte	0x1
	.2byte	0x204
	.byte	0xb
	.4byte	0x63
	.4byte	.LLST80
	.byte	0
	.byte	0x1c
	.4byte	.LASF119
	.byte	0x1
	.2byte	0x1b6
	.byte	0x6
	.8byte	.LFB23
	.8byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0xa7a
	.byte	0x1d
	.string	"f"
	.byte	0x1
	.2byte	0x1b6
	.byte	0x2a
	.4byte	0x554
	.4byte	.LLST56
	.byte	0x1e
	.4byte	.LASF82
	.byte	0x1
	.2byte	0x1b6
	.byte	0x34
	.4byte	0xa1
	.4byte	.LLST57
	.byte	0x1e
	.4byte	.LASF83
	.byte	0x1
	.2byte	0x1b7
	.byte	0x22
	.4byte	0x63
	.4byte	.LLST58
	.byte	0x1e
	.4byte	.LASF84
	.byte	0x1
	.2byte	0x1b7
	.byte	0x38
	.4byte	0x280
	.4byte	.LLST59
	.byte	0x1e
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x1b8
	.byte	0x35
	.4byte	0x532
	.4byte	.LLST60
	.byte	0x1b
	.string	"sp"
	.byte	0x1
	.2byte	0x1ba
	.byte	0xa
	.4byte	0xa1
	.4byte	.LLST61
	.byte	0x1f
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x1bb
	.byte	0xb
	.4byte	0x63
	.4byte	.LLST62
	.byte	0x1f
	.4byte	.LASF116
	.byte	0x1
	.2byte	0x1bc
	.byte	0xb
	.4byte	0x280
	.4byte	.LLST63
	.byte	0x1b
	.string	"d"
	.byte	0x1
	.2byte	0x1bd
	.byte	0x11
	.4byte	0x640
	.4byte	.LLST64
	.byte	0x1b
	.string	"h"
	.byte	0x1
	.2byte	0x1be
	.byte	0xb
	.4byte	0x63
	.4byte	.LLST65
	.byte	0x1b
	.string	"i"
	.byte	0x1
	.2byte	0x1bf
	.byte	0x7
	.4byte	0x2d
	.4byte	.LLST66
	.byte	0x1b
	.string	"j"
	.byte	0x1
	.2byte	0x1bf
	.byte	0xa
	.4byte	0x2d
	.4byte	.LLST67
	.byte	0x1b
	.string	"n"
	.byte	0x1
	.2byte	0x1bf
	.byte	0xd
	.4byte	0x2d
	.4byte	.LLST68
	.byte	0x1b
	.string	"ofs"
	.byte	0x1
	.2byte	0x1bf
	.byte	0x10
	.4byte	0x2d
	.4byte	.LLST69
	.byte	0x1b
	.string	"p"
	.byte	0x1
	.2byte	0x1c3
	.byte	0x14
	.4byte	0xa7a
	.4byte	.LLST70
	.byte	0x1f
	.4byte	.LASF117
	.byte	0x1
	.2byte	0x1c5
	.byte	0xb
	.4byte	0x280
	.4byte	.LLST71
	.byte	0x1b
	.string	"lr"
	.byte	0x1
	.2byte	0x1c6
	.byte	0x1d
	.4byte	0x532
	.4byte	.LLST72
	.byte	0x20
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.byte	0x1f
	.4byte	.LASF118
	.byte	0x1
	.2byte	0x1ec
	.byte	0x1f
	.4byte	0xa80
	.4byte	.LLST73
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x50
	.byte	0x5
	.byte	0x8
	.4byte	0x59f
	.byte	0x1c
	.4byte	.LASF120
	.byte	0x1
	.2byte	0x18e
	.byte	0x6
	.8byte	.LFB22
	.8byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0xb5e
	.byte	0x1d
	.string	"f"
	.byte	0x1
	.2byte	0x18e
	.byte	0x25
	.4byte	0x554
	.4byte	.LLST74
	.byte	0x1e
	.4byte	.LASF121
	.byte	0x1
	.2byte	0x18e
	.byte	0x2c
	.4byte	0x2d
	.4byte	.LLST75
	.byte	0x1b
	.string	"i"
	.byte	0x1
	.2byte	0x190
	.byte	0x7
	.4byte	0x2d
	.4byte	.LLST76
	.byte	0x1b
	.string	"j"
	.byte	0x1
	.2byte	0x190
	.byte	0xa
	.4byte	0x2d
	.4byte	.LLST77
	.byte	0x1f
	.4byte	.LASF122
	.byte	0x1
	.2byte	0x191
	.byte	0xb
	.4byte	0x280
	.4byte	.LLST78
	.byte	0x1b
	.string	"lnk"
	.byte	0x1
	.2byte	0x192
	.byte	0x9
	.4byte	0x82a
	.4byte	.LLST79
	.byte	0x21
	.8byte	.LVL219
	.4byte	0x926
	.4byte	0xb1d
	.byte	0x22
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x21
	.8byte	.LVL220
	.4byte	0x138b
	.4byte	0xb35
	.byte	0x22
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x21
	.8byte	.LVL221
	.4byte	0x1397
	.4byte	0xb4d
	.byte	0x22
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x23
	.8byte	.LVL222
	.byte	0x22
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0
	.byte	0x24
	.4byte	.LASF124
	.byte	0x1
	.2byte	0x165
	.byte	0x8
	.4byte	0x57
	.8byte	.LFB21
	.8byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0xc42
	.byte	0x1e
	.4byte	.LASF125
	.byte	0x1
	.2byte	0x165
	.byte	0x2c
	.4byte	0x57
	.4byte	.LLST54
	.byte	0x25
	.string	"i"
	.byte	0x1
	.2byte	0x167
	.byte	0xe
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	i.2284
	.byte	0x25
	.string	"j"
	.byte	0x1
	.2byte	0x167
	.byte	0x11
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	j.2285
	.byte	0x26
	.4byte	.LASF122
	.byte	0x1
	.2byte	0x168
	.byte	0x11
	.4byte	0x280
	.byte	0x9
	.byte	0x3
	.8byte	glob.2286
	.byte	0x26
	.4byte	.LASF126
	.byte	0x1
	.2byte	0x169
	.byte	0xe
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	do_resume.2287
	.byte	0x26
	.4byte	.LASF127
	.byte	0x1
	.2byte	0x16a
	.byte	0x13
	.4byte	0x142
	.byte	0x9
	.byte	0x3
	.8byte	roots_count.2288
	.byte	0x1f
	.4byte	.LASF128
	.byte	0x1
	.2byte	0x16b
	.byte	0xa
	.4byte	0x57
	.4byte	.LLST55
	.byte	0x27
	.4byte	.LASF129
	.byte	0x1
	.2byte	0x17d
	.byte	0x7
	.8byte	.L108
	.byte	0x27
	.4byte	.LASF130
	.byte	0x1
	.2byte	0x188
	.byte	0x2
	.8byte	.L112
	.byte	0x28
	.8byte	.LVL160
	.4byte	0x13a3
	.byte	0
	.byte	0x29
	.4byte	.LASF131
	.byte	0x1
	.2byte	0x15c
	.byte	0x6
	.8byte	.LFB20
	.8byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0xc75
	.byte	0x2a
	.8byte	.LVL225
	.4byte	0xa86
	.byte	0x22
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0x2b
	.4byte	.LASF132
	.byte	0x1
	.byte	0xed
	.byte	0x6
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0xe77
	.byte	0x2c
	.string	"sp"
	.byte	0x1
	.byte	0xef
	.byte	0xa
	.4byte	0xa1
	.4byte	.LLST35
	.byte	0x2d
	.4byte	.LASF85
	.byte	0x1
	.byte	0xf0
	.byte	0xb
	.4byte	0x63
	.4byte	.LLST36
	.byte	0x2d
	.4byte	.LASF116
	.byte	0x1
	.byte	0xf1
	.byte	0xb
	.4byte	0x280
	.4byte	.LLST37
	.byte	0x2c
	.string	"d"
	.byte	0x1
	.byte	0xf2
	.byte	0x11
	.4byte	0x640
	.4byte	.LLST38
	.byte	0x2c
	.string	"h"
	.byte	0x1
	.byte	0xf3
	.byte	0xb
	.4byte	0x63
	.4byte	.LLST39
	.byte	0x2c
	.string	"i"
	.byte	0x1
	.byte	0xf4
	.byte	0x7
	.4byte	0x2d
	.4byte	.LLST40
	.byte	0x2c
	.string	"j"
	.byte	0x1
	.byte	0xf4
	.byte	0xa
	.4byte	0x2d
	.4byte	.LLST41
	.byte	0x2c
	.string	"n"
	.byte	0x1
	.byte	0xf4
	.byte	0xd
	.4byte	0x2d
	.4byte	.LLST42
	.byte	0x2c
	.string	"ofs"
	.byte	0x1
	.byte	0xf4
	.byte	0x10
	.4byte	0x2d
	.4byte	.LLST43
	.byte	0x2c
	.string	"p"
	.byte	0x1
	.byte	0xf8
	.byte	0x14
	.4byte	0xa7a
	.4byte	.LLST44
	.byte	0x2d
	.4byte	.LASF122
	.byte	0x1
	.byte	0xfa
	.byte	0xb
	.4byte	0x280
	.4byte	.LLST45
	.byte	0x2d
	.4byte	.LASF117
	.byte	0x1
	.byte	0xfb
	.byte	0xb
	.4byte	0x280
	.4byte	.LLST46
	.byte	0x2c
	.string	"lr"
	.byte	0x1
	.byte	0xfc
	.byte	0x1d
	.4byte	0x532
	.4byte	.LLST47
	.byte	0x2c
	.string	"lnk"
	.byte	0x1
	.byte	0xfd
	.byte	0x9
	.4byte	0x82a
	.4byte	.LLST48
	.byte	0x2e
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0xd99
	.byte	0x1f
	.4byte	.LASF133
	.byte	0x1
	.2byte	0x105
	.byte	0x9
	.4byte	0x12a
	.4byte	.LLST49
	.byte	0x28
	.8byte	.LVL102
	.4byte	0x13af
	.byte	0
	.byte	0x2e
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0xdcd
	.byte	0x1f
	.4byte	.LASF133
	.byte	0x1
	.2byte	0x10f
	.byte	0x9
	.4byte	0x12a
	.4byte	.LLST50
	.byte	0x28
	.8byte	.LVL109
	.4byte	0x13af
	.byte	0
	.byte	0x2e
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.4byte	0xe01
	.byte	0x1f
	.4byte	.LASF133
	.byte	0x1
	.2byte	0x12a
	.byte	0xb
	.4byte	0x12a
	.4byte	.LLST52
	.byte	0x28
	.8byte	.LVL143
	.4byte	0x13af
	.byte	0
	.byte	0x2e
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0xe28
	.byte	0x1f
	.4byte	.LASF118
	.byte	0x1
	.2byte	0x13c
	.byte	0x1f
	.4byte	0xa80
	.4byte	.LLST51
	.byte	0
	.byte	0x2e
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.4byte	0xe5c
	.byte	0x1f
	.4byte	.LASF133
	.byte	0x1
	.2byte	0x14a
	.byte	0x9
	.4byte	0x12a
	.4byte	.LLST53
	.byte	0x28
	.8byte	.LVL150
	.4byte	0x13af
	.byte	0
	.byte	0x28
	.8byte	.LVL153
	.4byte	0x13bb
	.byte	0x28
	.8byte	.LVL154
	.4byte	0x13c7
	.byte	0
	.byte	0x2f
	.4byte	.LASF134
	.byte	0x1
	.byte	0xe7
	.byte	0x6
	.8byte	.LFB18
	.8byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0xeb9
	.byte	0x30
	.string	"v"
	.byte	0x1
	.byte	0xe7
	.byte	0x25
	.4byte	0x10e
	.4byte	.LLST34
	.byte	0x2a
	.8byte	.LVL97
	.4byte	0x1328
	.byte	0x22
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.byte	0x2f
	.4byte	.LASF135
	.byte	0x1
	.byte	0xc6
	.byte	0x6
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0xf71
	.byte	0x31
	.4byte	.LASF136
	.byte	0x1
	.byte	0xc6
	.byte	0x29
	.4byte	0x6ea
	.4byte	.LLST28
	.byte	0x2c
	.string	"len"
	.byte	0x1
	.byte	0xc7
	.byte	0xa
	.4byte	0x57
	.4byte	.LLST29
	.byte	0x2c
	.string	"j"
	.byte	0x1
	.byte	0xc7
	.byte	0xf
	.4byte	0x57
	.4byte	.LLST30
	.byte	0x2c
	.string	"lnk"
	.byte	0x1
	.byte	0xc8
	.byte	0x9
	.4byte	0x82a
	.4byte	.LLST31
	.byte	0x2d
	.4byte	.LASF137
	.byte	0x1
	.byte	0xc9
	.byte	0x9
	.4byte	0x82a
	.4byte	.LLST32
	.byte	0x2c
	.string	"d"
	.byte	0x1
	.byte	0xca
	.byte	0x11
	.4byte	0x640
	.4byte	.LLST33
	.byte	0x21
	.8byte	.LVL83
	.4byte	0xf71
	.4byte	0xf4b
	.byte	0x22
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x21
	.8byte	.LVL84
	.4byte	0x1243
	.4byte	0xf63
	.byte	0x22
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x28
	.8byte	.LVL90
	.4byte	0x13d3
	.byte	0
	.byte	0x32
	.4byte	.LASF141
	.byte	0x1
	.byte	0xa8
	.byte	0xd
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0xfe4
	.byte	0x30
	.string	"d"
	.byte	0x1
	.byte	0xa8
	.byte	0x28
	.4byte	0x640
	.4byte	.LLST14
	.byte	0x2c
	.string	"i"
	.byte	0x1
	.byte	0xa9
	.byte	0xb
	.4byte	0x63
	.4byte	.LLST15
	.byte	0x2c
	.string	"r"
	.byte	0x1
	.byte	0xaa
	.byte	0xb
	.4byte	0x63
	.4byte	.LLST16
	.byte	0x33
	.string	"j"
	.byte	0x1
	.byte	0xab
	.byte	0xb
	.4byte	0x63
	.byte	0x1
	.byte	0x5d
	.byte	0x34
	.string	"r1"
	.byte	0x1
	.byte	0xb2
	.byte	0x2
	.8byte	.L24
	.byte	0x34
	.string	"r2"
	.byte	0x1
	.byte	0xb5
	.byte	0x2
	.8byte	.L25
	.byte	0
	.byte	0x2f
	.4byte	.LASF138
	.byte	0x1
	.byte	0xa3
	.byte	0x6
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x104e
	.byte	0x31
	.4byte	.LASF136
	.byte	0x1
	.byte	0xa3
	.byte	0x27
	.4byte	0x6ea
	.4byte	.LLST26
	.byte	0x2d
	.4byte	.LASF139
	.byte	0x1
	.byte	0xa4
	.byte	0x9
	.4byte	0x82a
	.4byte	.LLST27
	.byte	0x21
	.8byte	.LVL76
	.4byte	0x1328
	.4byte	0x1040
	.byte	0x22
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x22
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x28
	.8byte	.LVL77
	.4byte	0x10a5
	.byte	0
	.byte	0x2f
	.4byte	.LASF140
	.byte	0x1
	.byte	0x9b
	.byte	0x6
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x10a5
	.byte	0x2c
	.string	"i"
	.byte	0x1
	.byte	0x9c
	.byte	0xa
	.4byte	0x57
	.4byte	.LLST24
	.byte	0x2d
	.4byte	.LASF139
	.byte	0x1
	.byte	0x9d
	.byte	0x9
	.4byte	0x82a
	.4byte	.LLST25
	.byte	0x28
	.8byte	.LVL69
	.4byte	0x1328
	.byte	0x28
	.8byte	.LVL73
	.4byte	0x10a5
	.byte	0
	.byte	0x32
	.4byte	.LASF142
	.byte	0x1
	.byte	0x72
	.byte	0xd
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0x11ad
	.byte	0x31
	.4byte	.LASF139
	.byte	0x1
	.byte	0x72
	.byte	0x2a
	.4byte	0x82a
	.4byte	.LLST19
	.byte	0x2d
	.4byte	.LASF143
	.byte	0x1
	.byte	0x74
	.byte	0xa
	.4byte	0x57
	.4byte	.LLST20
	.byte	0x2d
	.4byte	.LASF144
	.byte	0x1
	.byte	0x74
	.byte	0x13
	.4byte	0x57
	.4byte	.LLST21
	.byte	0x2c
	.string	"i"
	.byte	0x1
	.byte	0x74
	.byte	0x1d
	.4byte	0x57
	.4byte	.LLST22
	.byte	0x2d
	.4byte	.LASF145
	.byte	0x1
	.byte	0x75
	.byte	0x9
	.4byte	0x82a
	.4byte	.LLST23
	.byte	0x21
	.8byte	.LVL46
	.4byte	0x1282
	.4byte	0x1129
	.byte	0x22
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x21
	.8byte	.LVL48
	.4byte	0x12d5
	.4byte	0x1141
	.byte	0x22
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x21
	.8byte	.LVL52
	.4byte	0x12d5
	.4byte	0x1159
	.byte	0x22
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x28
	.8byte	.LVL56
	.4byte	0x13d3
	.byte	0x21
	.8byte	.LVL57
	.4byte	0x13df
	.4byte	0x1180
	.byte	0x22
	.byte	0x1
	.byte	0x5a
	.byte	0x4
	.byte	0x78
	.byte	0
	.byte	0x33
	.byte	0x24
	.byte	0
	.byte	0x21
	.8byte	.LVL61
	.4byte	0x11ad
	.4byte	0x1198
	.byte	0x22
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x2a
	.8byte	.LVL66
	.4byte	0x11ad
	.byte	0x22
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0
	.byte	0x32
	.4byte	.LASF146
	.byte	0x1
	.byte	0x5c
	.byte	0xd
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x1243
	.byte	0x31
	.4byte	.LASF112
	.byte	0x1
	.byte	0x5c
	.byte	0x22
	.4byte	0x82a
	.4byte	.LLST7
	.byte	0x2c
	.string	"len"
	.byte	0x1
	.byte	0x5d
	.byte	0xa
	.4byte	0x57
	.4byte	.LLST8
	.byte	0x2c
	.string	"j"
	.byte	0x1
	.byte	0x5d
	.byte	0xf
	.4byte	0x57
	.4byte	.LLST9
	.byte	0x2c
	.string	"tbl"
	.byte	0x1
	.byte	0x5e
	.byte	0xc
	.4byte	0x6ea
	.4byte	.LLST10
	.byte	0x2c
	.string	"d"
	.byte	0x1
	.byte	0x5f
	.byte	0x11
	.4byte	0x640
	.4byte	.LLST11
	.byte	0x2c
	.string	"h"
	.byte	0x1
	.byte	0x60
	.byte	0xb
	.4byte	0x63
	.4byte	.LLST12
	.byte	0x2c
	.string	"lnk"
	.byte	0x1
	.byte	0x61
	.byte	0x9
	.4byte	0x82a
	.4byte	.LLST13
	.byte	0x28
	.8byte	.LVL18
	.4byte	0x1243
	.byte	0
	.byte	0x35
	.4byte	.LASF148
	.byte	0x1
	.byte	0x51
	.byte	0x16
	.4byte	0x640
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x1282
	.byte	0x30
	.string	"d"
	.byte	0x1
	.byte	0x51
	.byte	0x35
	.4byte	0x640
	.4byte	.LLST6
	.byte	0x18
	.4byte	.LASF147
	.byte	0x1
	.byte	0x52
	.byte	0xb
	.4byte	0x63
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x35
	.4byte	.LASF149
	.byte	0x1
	.byte	0x49
	.byte	0xe
	.4byte	0x82a
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0x12d5
	.byte	0x31
	.4byte	.LASF150
	.byte	0x1
	.byte	0x49
	.byte	0x2a
	.4byte	0x82a
	.4byte	.LLST3
	.byte	0x2c
	.string	"lnk"
	.byte	0x1
	.byte	0x4a
	.byte	0x9
	.4byte	0x82a
	.4byte	.LLST4
	.byte	0x2d
	.4byte	.LASF145
	.byte	0x1
	.byte	0x4a
	.byte	0xf
	.4byte	0x82a
	.4byte	.LLST5
	.byte	0
	.byte	0x35
	.4byte	.LASF151
	.byte	0x1
	.byte	0x40
	.byte	0xc
	.4byte	0x2d
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0x1328
	.byte	0x31
	.4byte	.LASF150
	.byte	0x1
	.byte	0x40
	.byte	0x24
	.4byte	0x82a
	.4byte	.LLST0
	.byte	0x2d
	.4byte	.LASF113
	.byte	0x1
	.byte	0x41
	.byte	0xa
	.4byte	0x57
	.4byte	.LLST1
	.byte	0x2c
	.string	"lnk"
	.byte	0x1
	.byte	0x42
	.byte	0x9
	.4byte	0x82a
	.4byte	.LLST2
	.byte	0
	.byte	0x35
	.4byte	.LASF152
	.byte	0x1
	.byte	0x31
	.byte	0xe
	.4byte	0x82a
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0x138b
	.byte	0x31
	.4byte	.LASF111
	.byte	0x1
	.byte	0x31
	.byte	0x19
	.4byte	0x10e
	.4byte	.LLST17
	.byte	0x30
	.string	"tl"
	.byte	0x1
	.byte	0x31
	.byte	0x25
	.4byte	0x82a
	.4byte	.LLST18
	.byte	0x33
	.string	"lnk"
	.byte	0x1
	.byte	0x32
	.byte	0x9
	.4byte	0x82a
	.byte	0x1
	.byte	0x5a
	.byte	0x2a
	.8byte	.LVL41
	.4byte	0x13df
	.byte	0x22
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x40
	.byte	0
	.byte	0
	.byte	0x36
	.4byte	.LASF153
	.4byte	.LASF153
	.byte	0xe
	.byte	0x1a
	.byte	0x6
	.byte	0x36
	.4byte	.LASF154
	.4byte	.LASF154
	.byte	0xf
	.byte	0x1a
	.byte	0x6
	.byte	0x36
	.4byte	.LASF155
	.4byte	.LASF155
	.byte	0x7
	.byte	0x4e
	.byte	0x6
	.byte	0x36
	.4byte	.LASF156
	.4byte	.LASF156
	.byte	0x9
	.byte	0x49
	.byte	0xd
	.byte	0x36
	.4byte	.LASF157
	.4byte	.LASF157
	.byte	0xe
	.byte	0x1b
	.byte	0x6
	.byte	0x36
	.4byte	.LASF158
	.4byte	.LASF158
	.byte	0xf
	.byte	0x1c
	.byte	0x6
	.byte	0x36
	.4byte	.LASF159
	.4byte	.LASF159
	.byte	0xa
	.byte	0x85
	.byte	0x11
	.byte	0x36
	.4byte	.LASF160
	.4byte	.LASF160
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
	.byte	0x4
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0xb
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x12
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x13
	.byte	0x1
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
	.byte	0x15
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x17
	.byte	0x34
	.byte	0
	.byte	0x47
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x18
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
	.byte	0x19
	.byte	0x34
	.byte	0
	.byte	0x47
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1a
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
	.byte	0x1b
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
	.byte	0x1c
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1d
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
	.byte	0x1e
	.byte	0x5
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
	.byte	0x2
	.byte	0x17
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
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
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
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x23
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x24
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
	.byte	0x25
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x26
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x27
	.byte	0xa
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x28
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x29
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
	.byte	0x2a
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2b
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2c
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
	.byte	0x2d
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
	.byte	0x2e
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
	.byte	0x2f
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
	.byte	0x30
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
	.byte	0x31
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
	.byte	0x32
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
	.byte	0x33
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
	.byte	0x34
	.byte	0xa
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x35
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
	.byte	0x36
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
.LLST80:
	.8byte	.LVL226-.Ltext0
	.8byte	.LVL228-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL228-.Ltext0
	.8byte	.LFE24-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST56:
	.8byte	.LVL167-.Ltext0
	.8byte	.LVL169-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL169-.Ltext0
	.8byte	.LVL201-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL201-.Ltext0
	.8byte	.LFE23-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST57:
	.8byte	.LVL167-.Ltext0
	.8byte	.LVL169-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL169-.Ltext0
	.8byte	.LFE23-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST58:
	.8byte	.LVL167-.Ltext0
	.8byte	.LVL169-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL169-.Ltext0
	.8byte	.LFE23-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST59:
	.8byte	.LVL167-.Ltext0
	.8byte	.LVL169-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL169-.Ltext0
	.8byte	.LFE23-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5d
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST60:
	.8byte	.LVL167-.Ltext0
	.8byte	.LVL169-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL169-.Ltext0
	.8byte	.LVL194-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL194-.Ltext0
	.8byte	.LFE23-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5e
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST61:
	.8byte	.LVL168-.Ltext0
	.8byte	.LVL169-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL169-.Ltext0
	.8byte	.LVL172-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL172-.Ltext0
	.8byte	.LVL176-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL176-.Ltext0
	.8byte	.LVL192-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL192-.Ltext0
	.8byte	.LVL194-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST62:
	.8byte	.LVL168-.Ltext0
	.8byte	.LVL184-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL193-.Ltext0
	.8byte	.LVL194-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST63:
	.8byte	.LVL168-.Ltext0
	.8byte	.LVL169-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL169-.Ltext0
	.8byte	.LVL194-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST64:
	.8byte	.LVL169-.Ltext0
	.8byte	.LVL176-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	.LVL178-.Ltext0
	.8byte	.LVL194-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	0
	.8byte	0
.LLST65:
	.8byte	.LVL169-.Ltext0
	.8byte	.LVL170-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL177-.Ltext0
	.8byte	.LVL179-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL179-.Ltext0
	.8byte	.LVL180-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.8byte	.LVL180-.Ltext0
	.8byte	.LVL181-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST66:
	.8byte	.LVL194-.Ltext0
	.8byte	.LVL199-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST67:
	.8byte	.LVL194-.Ltext0
	.8byte	.LVL198-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST68:
	.8byte	.LVL183-.Ltext0
	.8byte	.LVL187-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	.LVL188-.Ltext0
	.8byte	.LVL194-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	0
	.8byte	0
.LLST69:
	.8byte	.LVL184-.Ltext0
	.8byte	.LVL186-1-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL189-.Ltext0
	.8byte	.LVL191-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST70:
	.8byte	.LVL182-.Ltext0
	.8byte	.LVL194-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	0
	.8byte	0
.LLST71:
	.8byte	.LVL185-.Ltext0
	.8byte	.LVL186-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL190-.Ltext0
	.8byte	.LVL191-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL195-.Ltext0
	.8byte	.LVL196-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	0
	.8byte	0
.LLST72:
	.8byte	.LVL194-.Ltext0
	.8byte	.LVL200-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST73:
	.8byte	.LVL171-.Ltext0
	.8byte	.LVL175-.Ltext0
	.2byte	0x3
	.byte	0x78
	.byte	0x10
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST74:
	.8byte	.LVL202-.Ltext0
	.8byte	.LVL203-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL203-.Ltext0
	.8byte	.LVL223-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL223-.Ltext0
	.8byte	.LFE22-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST75:
	.8byte	.LVL202-.Ltext0
	.8byte	.LVL203-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL203-.Ltext0
	.8byte	.LVL211-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL211-.Ltext0
	.8byte	.LVL212-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL212-.Ltext0
	.8byte	.LFE22-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST76:
	.8byte	.LVL205-.Ltext0
	.8byte	.LVL211-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST77:
	.8byte	.LVL205-.Ltext0
	.8byte	.LVL206-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL207-.Ltext0
	.8byte	.LVL209-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL212-.Ltext0
	.8byte	.LVL215-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST78:
	.8byte	.LVL205-.Ltext0
	.8byte	.LVL210-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL212-.Ltext0
	.8byte	.LVL216-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL217-.Ltext0
	.8byte	.LVL218-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST79:
	.8byte	.LVL204-.Ltext0
	.8byte	.LVL205-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL212-.Ltext0
	.8byte	.LVL224-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST54:
	.8byte	.LVL157-.Ltext0
	.8byte	.LVL159-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL159-.Ltext0
	.8byte	.LVL162-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL162-.Ltext0
	.8byte	.LVL163-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL163-.Ltext0
	.8byte	.LVL165-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL165-.Ltext0
	.8byte	.LFE21-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST55:
	.8byte	.LVL158-.Ltext0
	.8byte	.LVL159-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL159-.Ltext0
	.8byte	.LVL163-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL163-.Ltext0
	.8byte	.LVL164-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL164-.Ltext0
	.8byte	.LVL166-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL166-.Ltext0
	.8byte	.LFE21-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST35:
	.8byte	.LVL114-.Ltext0
	.8byte	.LVL117-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL119-.Ltext0
	.8byte	.LVL122-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL122-.Ltext0
	.8byte	.LVL126-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL126-.Ltext0
	.8byte	.LVL144-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL144-.Ltext0
	.8byte	.LVL146-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST36:
	.8byte	.LVL115-.Ltext0
	.8byte	.LVL134-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL145-.Ltext0
	.8byte	.LVL146-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST37:
	.8byte	.LVL116-.Ltext0
	.8byte	.LVL146-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST38:
	.8byte	.LVL119-.Ltext0
	.8byte	.LVL126-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL128-.Ltext0
	.8byte	.LVL146-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST39:
	.8byte	.LVL119-.Ltext0
	.8byte	.LVL120-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL127-.Ltext0
	.8byte	.LVL129-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL129-.Ltext0
	.8byte	.LVL130-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.8byte	.LVL130-.Ltext0
	.8byte	.LVL131-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST40:
	.8byte	.LVL98-.Ltext0
	.8byte	.LVL105-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL146-.Ltext0
	.8byte	.LVL152-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST41:
	.8byte	.LVL99-.Ltext0
	.8byte	.LVL103-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL106-.Ltext0
	.8byte	.LVL110-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL146-.Ltext0
	.8byte	.LVL151-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST42:
	.8byte	.LVL133-.Ltext0
	.8byte	.LVL137-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL138-.Ltext0
	.8byte	.LVL146-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST43:
	.8byte	.LVL134-.Ltext0
	.8byte	.LVL136-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL139-.Ltext0
	.8byte	.LVL142-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL142-.Ltext0
	.8byte	.LVL143-1-.Ltext0
	.2byte	0x9
	.byte	0x84
	.byte	0
	.byte	0x94
	.byte	0x2
	.byte	0xa
	.2byte	0xffff
	.byte	0x1a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST44:
	.8byte	.LVL132-.Ltext0
	.8byte	.LVL146-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	0
	.8byte	0
.LLST45:
	.8byte	.LVL99-.Ltext0
	.8byte	.LVL104-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL106-.Ltext0
	.8byte	.LVL111-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL112-.Ltext0
	.8byte	.LVL113-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST46:
	.8byte	.LVL135-.Ltext0
	.8byte	.LVL136-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL140-.Ltext0
	.8byte	.LVL143-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL148-.Ltext0
	.8byte	.LVL150-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	0
	.8byte	0
.LLST47:
	.8byte	.LVL118-.Ltext0
	.8byte	.LVL119-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL146-.Ltext0
	.8byte	.LVL156-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST48:
	.8byte	.LVL105-.Ltext0
	.8byte	.LVL116-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST49:
	.8byte	.LVL101-.Ltext0
	.8byte	.LVL102-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST50:
	.8byte	.LVL108-.Ltext0
	.8byte	.LVL109-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST52:
	.8byte	.LVL141-.Ltext0
	.8byte	.LVL143-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST51:
	.8byte	.LVL121-.Ltext0
	.8byte	.LVL125-.Ltext0
	.2byte	0x3
	.byte	0x79
	.byte	0x10
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST53:
	.8byte	.LVL149-.Ltext0
	.8byte	.LVL150-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST34:
	.8byte	.LVL96-.Ltext0
	.8byte	.LVL97-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL97-1-.Ltext0
	.8byte	.LFE18-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST28:
	.8byte	.LVL78-.Ltext0
	.8byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL82-.Ltext0
	.8byte	.LVL93-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL93-.Ltext0
	.8byte	.LFE17-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST29:
	.8byte	.LVL80-.Ltext0
	.8byte	.LVL94-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST30:
	.8byte	.LVL81-.Ltext0
	.8byte	.LVL82-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL82-.Ltext0
	.8byte	.LVL92-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST31:
	.8byte	.LVL87-.Ltext0
	.8byte	.LVL88-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL88-.Ltext0
	.8byte	.LVL89-.Ltext0
	.2byte	0x2
	.byte	0x7a
	.byte	0x8
	.8byte	.LVL89-.Ltext0
	.8byte	.LVL90-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST32:
	.8byte	.LVL79-.Ltext0
	.8byte	.LVL88-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	.LVL88-.Ltext0
	.8byte	.LVL89-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL89-.Ltext0
	.8byte	.LVL95-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	0
	.8byte	0
.LLST33:
	.8byte	.LVL81-.Ltext0
	.8byte	.LVL91-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST14:
	.8byte	.LVL28-.Ltext0
	.8byte	.LVL32-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL32-.Ltext0
	.8byte	.LFE16-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST15:
	.8byte	.LVL29-.Ltext0
	.8byte	.LVL30-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL31-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.byte	0x7f
	.byte	0x9f
	.8byte	.LVL31-.Ltext0
	.8byte	.LVL32-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL32-.Ltext0
	.8byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL34-.Ltext0
	.8byte	.LVL35-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.8byte	.LVL35-.Ltext0
	.8byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL37-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL38-.Ltext0
	.8byte	.LFE16-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST16:
	.8byte	.LVL32-.Ltext0
	.8byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL36-.Ltext0
	.8byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST26:
	.8byte	.LVL75-.Ltext0
	.8byte	.LVL76-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL76-1-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST27:
	.8byte	.LVL76-.Ltext0
	.8byte	.LVL77-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST24:
	.8byte	.LVL67-.Ltext0
	.8byte	.LVL68-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL68-.Ltext0
	.8byte	.LVL74-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST25:
	.8byte	.LVL67-.Ltext0
	.8byte	.LVL68-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL68-.Ltext0
	.8byte	.LVL69-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL70-.Ltext0
	.8byte	.LVL72-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL72-.Ltext0
	.8byte	.LVL73-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	0
	.8byte	0
.LLST19:
	.8byte	.LVL44-.Ltext0
	.8byte	.LVL46-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL46-1-.Ltext0
	.8byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL62-.Ltext0
	.8byte	.LVL63-.Ltext0
	.2byte	0x9
	.byte	0x3
	.8byte	frametables
	.8byte	.LVL63-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST20:
	.8byte	.LVL49-.Ltext0
	.8byte	.LVL50-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL50-.Ltext0
	.8byte	.LVL52-1-.Ltext0
	.2byte	0x14
	.byte	0x3
	.8byte	caml_frame_descriptors_mask
	.byte	0x94
	.byte	0x4
	.byte	0x23
	.byte	0x1
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x9f
	.8byte	.LVL53-.Ltext0
	.8byte	.LVL54-.Ltext0
	.2byte	0x2
	.byte	0x34
	.byte	0x9f
	.8byte	.LVL54-.Ltext0
	.8byte	.LVL61-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL63-.Ltext0
	.8byte	.LVL64-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL64-.Ltext0
	.8byte	.LVL66-1-.Ltext0
	.2byte	0x14
	.byte	0x3
	.8byte	caml_frame_descriptors_mask
	.byte	0x94
	.byte	0x4
	.byte	0x23
	.byte	0x1
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST21:
	.8byte	.LVL48-.Ltext0
	.8byte	.LVL51-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL63-.Ltext0
	.8byte	.LVL65-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST22:
	.8byte	.LVL58-.Ltext0
	.8byte	.LVL59-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL59-.Ltext0
	.8byte	.LVL61-1-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST23:
	.8byte	.LVL45-.Ltext0
	.8byte	.LVL47-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL47-.Ltext0
	.8byte	.LVL54-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL63-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL13-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL15-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL24-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST10:
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x2
	.byte	0x82
	.byte	0
	.8byte	0
	.8byte	0
.LLST11:
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL18-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST12:
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL18-1-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST13:
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL10-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL11-.Ltext0
	.8byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL7-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL9-.Ltext0
	.2byte	0x2
	.byte	0x7f
	.byte	0x8
	.8byte	.LVL9-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL9-.Ltext0
	.8byte	.LFE10-.Ltext0
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
	.8byte	.LFE9-.Ltext0
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
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL1-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST17:
	.8byte	.LVL39-.Ltext0
	.8byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL40-.Ltext0
	.8byte	.LVL43-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL43-.Ltext0
	.8byte	.LFE8-.Ltext0
	.2byte	0x2
	.byte	0x7a
	.byte	0
	.8byte	0
	.8byte	0
.LLST18:
	.8byte	.LVL39-.Ltext0
	.8byte	.LVL41-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL41-1-.Ltext0
	.8byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL42-.Ltext0
	.8byte	.LFE8-.Ltext0
	.2byte	0x2
	.byte	0x7a
	.byte	0x8
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
.LASF81:
	.string	"caml_context"
.LASF56:
	.string	"caml_extra_heap_resources_minor"
.LASF7:
	.string	"size_t"
.LASF55:
	.string	"caml_in_minor_collection"
.LASF75:
	.string	"nitems"
.LASF36:
	.string	"caml_heap_start"
.LASF103:
	.string	"write"
.LASF136:
	.string	"table"
.LASF94:
	.string	"caml_bottom_of_stack"
.LASF21:
	.string	"caml_runtime_warnings"
.LASF134:
	.string	"caml_register_dyn_global"
.LASF137:
	.string	"previous"
.LASF26:
	.string	"caml_global_data"
.LASF42:
	.string	"caml_major_work_credit"
.LASF23:
	.string	"header_t"
.LASF129:
	.string	"resume"
.LASF105:
	.string	"wend"
.LASF78:
	.string	"scanning_action"
.LASF11:
	.string	"addr"
.LASF97:
	.string	"caml_exception_pointer"
.LASF59:
	.string	"limit"
.LASF123:
	.string	"caml_stack_usage"
.LASF151:
	.string	"count_descriptors"
.LASF73:
	.string	"next"
.LASF100:
	.string	"caml_globals_inited"
.LASF85:
	.string	"retaddr"
.LASF46:
	.string	"caml_young_end"
.LASF13:
	.string	"caml_timing_hook"
.LASF8:
	.string	"long long int"
.LASF35:
	.string	"caml_fl_wsz_at_phase_change"
.LASF114:
	.string	"caml_globals_scanned"
.LASF98:
	.string	"caml_globals"
.LASF141:
	.string	"remove_entry"
.LASF146:
	.string	"fill_hashtable"
.LASF39:
	.string	"caml_major_window"
.LASF139:
	.string	"new_frametables"
.LASF162:
	.string	"roots.c"
.LASF149:
	.string	"frametables_list_tail"
.LASF87:
	.string	"num_live"
.LASF1:
	.string	"long int"
.LASF152:
	.string	"cons"
.LASF109:
	.string	"stdin"
.LASF113:
	.string	"num_descr"
.LASF83:
	.string	"last_retaddr"
.LASF32:
	.string	"double"
.LASF30:
	.string	"caml_allocated_words"
.LASF89:
	.string	"frame_descr"
.LASF104:
	.string	"wpos"
.LASF76:
	.string	"tables"
.LASF93:
	.string	"caml_top_of_stack"
.LASF115:
	.string	"caml_dyn_globals"
.LASF20:
	.string	"caml_verb_gc"
.LASF54:
	.string	"caml_minor_heap_wsz"
.LASF110:
	.string	"link"
.LASF37:
	.string	"total_heap_size"
.LASF40:
	.string	"caml_major_ring"
.LASF22:
	.string	"value"
.LASF49:
	.string	"caml_young_alloc_start"
.LASF138:
	.string	"caml_register_frametable"
.LASF68:
	.string	"block"
.LASF0:
	.string	"unsigned int"
.LASF27:
	.string	"caml_fl_cur_wsz"
.LASF121:
	.string	"do_globals"
.LASF155:
	.string	"caml_darken"
.LASF50:
	.string	"caml_young_alloc_end"
.LASF5:
	.string	"intnat"
.LASF2:
	.string	"long unsigned int"
.LASF88:
	.string	"live_ofs"
.LASF24:
	.string	"mlsize_t"
.LASF160:
	.string	"caml_stat_alloc"
.LASF111:
	.string	"data"
.LASF102:
	.string	"_FILE"
.LASF60:
	.string	"size"
.LASF4:
	.string	"short unsigned int"
.LASF6:
	.string	"uintnat"
.LASF161:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF122:
	.string	"glob"
.LASF67:
	.string	"caml_custom_elt"
.LASF147:
	.string	"nextd"
.LASF44:
	.string	"caml_major_gc_hook"
.LASF144:
	.string	"increase"
.LASF159:
	.string	"caml_stat_free"
.LASF143:
	.string	"tblsize"
.LASF91:
	.string	"caml_frame_descriptors_mask"
.LASF107:
	.string	"stdout"
.LASF118:
	.string	"next_context"
.LASF57:
	.string	"base"
.LASF92:
	.string	"caml_stack_usage_hook"
.LASF120:
	.string	"caml_do_roots"
.LASF41:
	.string	"caml_major_ring_index"
.LASF10:
	.string	"asize_t"
.LASF128:
	.string	"remaining_work"
.LASF145:
	.string	"tail"
.LASF158:
	.string	"caml_final_oldify_young_roots"
.LASF9:
	.string	"long double"
.LASF34:
	.string	"caml_dependent_allocated"
.LASF70:
	.string	"caml_huge_fallback_count"
.LASF77:
	.string	"caml_local_roots"
.LASF99:
	.string	"caml_globals_map"
.LASF66:
	.string	"caml_ephe_ref_table"
.LASF17:
	.string	"caml_minor_gc_end_hook"
.LASF45:
	.string	"caml_young_start"
.LASF14:
	.string	"caml_major_slice_begin_hook"
.LASF58:
	.string	"threshold"
.LASF16:
	.string	"caml_minor_gc_begin_hook"
.LASF18:
	.string	"caml_finalise_begin_hook"
.LASF140:
	.string	"caml_init_frame_descriptors"
.LASF131:
	.string	"caml_darken_all_roots_start"
.LASF3:
	.string	"short int"
.LASF95:
	.string	"caml_last_return_address"
.LASF63:
	.string	"caml_ephe_ref_elt"
.LASF86:
	.string	"frame_size"
.LASF106:
	.string	"FILE"
.LASF156:
	.string	"caml_oldify_one"
.LASF157:
	.string	"caml_scan_global_young_roots"
.LASF69:
	.string	"caml_custom_table"
.LASF90:
	.string	"caml_frame_descriptors"
.LASF142:
	.string	"init_frame_descriptors"
.LASF101:
	.string	"caml_frametable"
.LASF74:
	.string	"ntables"
.LASF43:
	.string	"caml_gc_clock"
.LASF116:
	.string	"regs"
.LASF47:
	.string	"caml_code_area_start"
.LASF12:
	.string	"char"
.LASF84:
	.string	"gc_regs"
.LASF80:
	.string	"caml_scan_roots_hook"
.LASF135:
	.string	"caml_unregister_frametable"
.LASF25:
	.string	"caml_atom_table"
.LASF112:
	.string	"frametables"
.LASF65:
	.string	"offset"
.LASF125:
	.string	"work"
.LASF132:
	.string	"caml_oldify_local_roots"
.LASF38:
	.string	"caml_gc_sweep_hp"
.LASF124:
	.string	"caml_darken_all_roots_slice"
.LASF52:
	.string	"caml_young_limit"
.LASF153:
	.string	"caml_scan_global_roots"
.LASF108:
	.string	"stderr"
.LASF127:
	.string	"roots_count"
.LASF82:
	.string	"bottom_of_stack"
.LASF61:
	.string	"reserve"
.LASF126:
	.string	"do_resume"
.LASF53:
	.string	"caml_young_trigger"
.LASF71:
	.string	"caml_use_huge_pages"
.LASF48:
	.string	"caml_code_area_end"
.LASF163:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF133:
	.string	"__oldify__v__"
.LASF130:
	.string	"suspend"
.LASF79:
	.string	"caml_incremental_roots_count"
.LASF33:
	.string	"caml_dependent_size"
.LASF31:
	.string	"caml_extra_heap_resources"
.LASF148:
	.string	"next_frame_descr"
.LASF96:
	.string	"caml_gc_regs"
.LASF119:
	.string	"caml_do_local_roots"
.LASF150:
	.string	"list"
.LASF51:
	.string	"caml_young_ptr"
.LASF19:
	.string	"caml_finalise_end_hook"
.LASF15:
	.string	"caml_major_slice_end_hook"
.LASF28:
	.string	"caml_gc_phase"
.LASF72:
	.string	"caml__roots_block"
.LASF154:
	.string	"caml_final_do_roots"
.LASF62:
	.string	"caml_ref_table"
.LASF64:
	.string	"ephe"
.LASF117:
	.string	"root"
.LASF29:
	.string	"caml_gc_subphase"
	.ident	"GCC: (GNU) 9.2.0"
