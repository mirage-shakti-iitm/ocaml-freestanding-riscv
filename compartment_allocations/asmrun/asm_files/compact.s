	.file	"compact.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.type	init_compact_allocate, @function
init_compact_allocate:
.LFB11:
	.file 1 "compact.c"
	.loc 1 129 1
	.cfi_startproc
	.loc 1 130 3
	.loc 1 130 9 is_stmt 0
	ld	a5,caml_heap_start
.LVL0:
	.loc 1 131 3 is_stmt 1
.L2:
	.loc 1 131 9
	beq	a5,zero,.L4
	.loc 1 132 5
	.loc 1 132 22 is_stmt 0
	sd	zero,-24(a5)
	.loc 1 133 5 is_stmt 1
	.loc 1 133 8 is_stmt 0
	ld	a5,-8(a5)
.LVL1:
	j	.L2
.L4:
	.loc 1 135 3 is_stmt 1
	.loc 1 135 14 is_stmt 0
	ld	a5,caml_heap_start
.LVL2:
	sd	a5,compact_fl,a4
	.loc 1 136 1
	ret
	.cfi_endproc
.LFE11:
	.size	init_compact_allocate, .-init_compact_allocate
	.align	1
	.type	compact_allocate, @function
compact_allocate:
.LFB12:
	.loc 1 140 1 is_stmt 1
	.cfi_startproc
.LVL3:
	.loc 1 141 3
	.loc 1 143 3
.L6:
	.loc 1 143 9
	.loc 1 143 10 is_stmt 0
	ld	a5,compact_fl
	ld	a4,-16(a5)
	.loc 1 143 36
	ld	a3,-24(a5)
	.loc 1 143 34
	sub	a4,a4,a3
	.loc 1 143 9
	li	a3,32
	bgtu	a4,a3,.L9
	.loc 1 144 13
	ld	a3,-8(a5)
	ld	a4,-16(a3)
	.loc 1 145 15
	ld	a2,-24(a3)
	.loc 1 145 13
	sub	a4,a4,a2
	.loc 1 144 10
	li	a2,32
	bgtu	a4,a2,.L9
	.loc 1 147 5 is_stmt 1
	.loc 1 147 16 is_stmt 0
	sd	a3,compact_fl,a5
	j	.L6
.LVL4:
.L10:
	.loc 1 151 5 is_stmt 1
	.loc 1 151 11 is_stmt 0
	ld	a5,-8(a5)
.LVL5:
.L9:
	.loc 1 152 5 is_stmt 1
	.loc 1 150 9
	.loc 1 150 10 is_stmt 0
	ld	a4,-16(a5)
	.loc 1 150 31
	ld	a3,-24(a5)
	.loc 1 150 29
	sub	a4,a4,a3
	.loc 1 150 9
	bltu	a4,a0,.L10
	.loc 1 154 3 is_stmt 1
.LVL6:
	.loc 1 155 3
	.loc 1 155 23 is_stmt 0
	add	a0,a3,a0
.LVL7:
	sd	a0,-24(a5)
	.loc 1 156 3 is_stmt 1
	.loc 1 157 1 is_stmt 0
	add	a0,a5,a3
.LVL8:
	ret
	.cfi_endproc
.LFE12:
	.size	compact_allocate, .-compact_allocate
	.align	1
	.type	invert_pointer_at, @function
invert_pointer_at:
.LFB9:
	.loc 1 67 1 is_stmt 1
	.cfi_startproc
.LVL9:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.loc 1 68 3
	.loc 1 68 8 is_stmt 0
	ld	s1,0(a0)
.LVL10:
	.loc 1 69 3 is_stmt 1
	.loc 1 73 3
	.loc 1 73 7 is_stmt 0
	andi	a5,s1,3
	.loc 1 73 6
	beq	a5,zero,.L21
.LVL11:
.L11:
	.loc 1 119 1
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	ld	s1,8(sp)
	.cfi_restore 9
.LVL12:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL13:
.L21:
	.cfi_restore_state
	mv	s0,a0
	.loc 1 73 26 discriminator 1
	mv	a0,s1
.LVL14:
	call	caml_page_table_lookup
.LVL15:
	andi	a0,a0,1
	.loc 1 73 23 discriminator 1
	beq	a0,zero,.L11
	.loc 1 74 5 is_stmt 1
	.loc 1 74 13 is_stmt 0
	ld	a4,-8(s1)
	andi	a5,a4,3
	.loc 1 74 5
	li	a3,2
	beq	a5,a3,.L13
	bgtu	a5,a3,.L14
	beq	a5,zero,.L15
	li	a3,1
	bne	a5,a3,.L11
.LBB2:
	.loc 1 86 9 is_stmt 1
	.loc 1 86 33 is_stmt 0
	srli	a4,a4,10
	slli	a5,a4,3
	.loc 1 86 31
	sub	a1,s1,a5
.LVL16:
	.loc 1 88 9 is_stmt 1
	.loc 1 88 29 is_stmt 0
	addi	a3,a1,-8
.LVL17:
	.loc 1 90 9 is_stmt 1
.L17:
	.loc 1 90 15 discriminator 1
	.loc 1 90 16 is_stmt 0 discriminator 1
	ld	a5,0(a3)
	andi	a2,a5,3
	.loc 1 90 15 discriminator 1
	bne	a2,zero,.L22
	.loc 1 90 35 is_stmt 1 discriminator 2
	.loc 1 90 38 is_stmt 0 discriminator 2
	mv	a3,a5
.LVL18:
	j	.L17
.LVL19:
.L14:
.LBE2:
	.loc 1 74 5
	li	a3,3
	bne	a5,a3,.L11
.L15:
	.loc 1 77 7 is_stmt 1
	.loc 1 77 10 is_stmt 0
	sd	a4,0(s0)
	.loc 1 78 7 is_stmt 1
	.loc 1 78 18 is_stmt 0
	sd	s0,-8(s1)
	.loc 1 79 7 is_stmt 1
	j	.L11
.LVL20:
.L22:
.LBB3:
	.loc 1 91 9
	.loc 1 92 9
	.loc 1 92 13 is_stmt 0
	srli	a2,a5,2
	andi	a2,a2,255
	.loc 1 92 12
	li	a0,247
	beq	a2,a0,.L23
	.loc 1 102 11 is_stmt 1
	.loc 1 105 11
	.loc 1 105 24 is_stmt 0
	srli	a5,a5,10
	slli	a5,a5,3
	add	a5,a5,a1
	.loc 1 105 54
	ori	a5,a5,1
	.loc 1 105 14
	sd	a5,0(s0)
	.loc 1 107 11 is_stmt 1
	.loc 1 107 24 is_stmt 0
	ori	s0,s0,2
.LVL21:
	.loc 1 107 22
	sd	s0,-8(s1)
	.loc 1 109 11 is_stmt 1
	.loc 1 109 17 is_stmt 0
	addi	a4,a4,-1
	slli	a5,a4,10
	ori	a5,a5,999
	.loc 1 109 15
	sd	a5,0(a3)
	j	.L11
.LVL22:
.L23:
	.loc 1 95 11 is_stmt 1
	.loc 1 95 14 is_stmt 0
	sd	a5,0(s0)
	.loc 1 97 11 is_stmt 1
	.loc 1 97 24 is_stmt 0
	ori	s0,s0,2
.LVL23:
	.loc 1 97 22
	sd	s0,-8(s1)
	.loc 1 100 11 is_stmt 1
	.loc 1 100 17 is_stmt 0
	addi	a5,a4,-1
	slli	a5,a5,10
	ori	a5,a5,999
	.loc 1 100 15
	sd	a5,0(a3)
	j	.L11
.LVL24:
.L13:
.LBE3:
	.loc 1 114 7 is_stmt 1
	.loc 1 114 10 is_stmt 0
	sd	a4,0(s0)
	.loc 1 115 7 is_stmt 1
	.loc 1 115 20 is_stmt 0
	ori	s0,s0,2
.LVL25:
	.loc 1 115 18
	sd	s0,-8(s1)
	.loc 1 116 7 is_stmt 1
	.loc 1 119 1 is_stmt 0
	j	.L11
	.cfi_endproc
.LFE9:
	.size	invert_pointer_at, .-invert_pointer_at
	.align	1
	.globl	caml_invert_root
	.type	caml_invert_root, @function
caml_invert_root:
.LFB10:
	.loc 1 122 1 is_stmt 1
	.cfi_startproc
.LVL26:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 123 3
	mv	a0,a1
.LVL27:
	call	invert_pointer_at
.LVL28:
	.loc 1 124 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	caml_invert_root, .-caml_invert_root
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Compacting heap...\n"
	.align	3
.LC1:
	.string	"done.\n"
	.text
	.align	1
	.type	do_compaction, @function
do_compaction:
.LFB13:
	.loc 1 160 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	sd	s0,64(sp)
	sd	s1,56(sp)
	sd	s2,48(sp)
	sd	s3,40(sp)
	sd	s4,32(sp)
	sd	s5,24(sp)
	sd	s6,16(sp)
	sd	s7,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.loc 1 161 3
	.loc 1 162 3
	.loc 1 163 3
	lla	a1,.LC0
	li	a0,16
	call	caml_gc_message
.LVL29:
	.loc 1 171 5
	.loc 1 171 8 is_stmt 0
	ld	a6,caml_heap_start
.LVL30:
	.loc 1 172 5 is_stmt 1
	.loc 1 172 11 is_stmt 0
	j	.L27
.LVL31:
.L29:
.LBB4:
.LBB5:
	.loc 1 184 11 is_stmt 1
	.loc 1 186 11
	.loc 1 186 23 is_stmt 0
	andi	a2,a5,-1024
	slliw	a5,a5,2
.LVL32:
	andi	a5,a5,1020
	or	a5,a2,a5
	ori	a5,a5,3
	.loc 1 186 21
	sd	a5,0(a3)
.LVL33:
.L30:
	.loc 1 188 9 is_stmt 1
	.loc 1 188 11 is_stmt 0
	addi	a5,a4,1
	slli	a5,a5,3
	add	a3,a3,a5
.LVL34:
.L28:
.LBE5:
	.loc 1 176 13 is_stmt 1
	bgeu	a3,a0,.L91
.LBB6:
	.loc 1 177 9
	.loc 1 177 18 is_stmt 0
	ld	a5,0(a3)
.LVL35:
	.loc 1 178 9 is_stmt 1
	.loc 1 178 18 is_stmt 0
	srli	a4,a5,10
.LVL36:
	.loc 1 180 9 is_stmt 1
	.loc 1 180 13 is_stmt 0
	andi	a1,a5,768
	.loc 1 180 12
	li	a2,512
	bne	a1,a2,.L29
	.loc 1 182 11 is_stmt 1
	.loc 1 182 23 is_stmt 0
	andi	a5,a5,-1024
.LVL37:
	ori	a5,a5,1011
	.loc 1 182 21
	sd	a5,0(a3)
.LVL38:
	j	.L30
.LVL39:
.L91:
.LBE6:
	.loc 1 190 7 is_stmt 1
	.loc 1 190 10 is_stmt 0
	ld	a6,-8(a6)
.LVL40:
.L27:
.LBE4:
	.loc 1 172 11 is_stmt 1
	beq	a6,zero,.L92
.LBB7:
	.loc 1 173 7
.LVL41:
	.loc 1 175 7
	.loc 1 175 20 is_stmt 0
	ld	a0,-16(a6)
	.loc 1 175 13
	add	a0,a6,a0
.LVL42:
	.loc 1 176 7 is_stmt 1
	.loc 1 173 17 is_stmt 0
	mv	a3,a6
	.loc 1 176 13
	j	.L28
.LVL43:
.L92:
.LBE7:
	.loc 1 202 5 is_stmt 1
	li	a1,1
	lla	a0,caml_invert_root
	call	caml_do_roots
.LVL44:
	.loc 1 204 5
	call	caml_final_invert_finalisable_values
.LVL45:
	.loc 1 206 5
	.loc 1 206 8 is_stmt 0
	ld	s0,caml_heap_start
.LVL46:
	.loc 1 207 5 is_stmt 1
	.loc 1 207 11 is_stmt 0
	j	.L33
.LVL47:
.L96:
.LBB8:
.LBB9:
	.loc 1 218 9 is_stmt 1
	.loc 1 218 14 is_stmt 0
	srli	s1,a5,10
	.loc 1 218 12
	addi	s1,s1,1
.LVL48:
	.loc 1 219 9 is_stmt 1
	.loc 1 219 13 is_stmt 0
	srli	a5,a5,2
.LVL49:
	.loc 1 219 11
	andi	a5,a5,0xff
.LVL50:
	.loc 1 221 9 is_stmt 1
	.loc 1 221 12 is_stmt 0
	li	a4,249
	beq	a5,a4,.L93
.L37:
	.loc 1 230 9 is_stmt 1
	.loc 1 230 12 is_stmt 0
	li	a4,250
	bleu	a5,a4,.L94
.LVL51:
.L41:
	.loc 1 233 9 is_stmt 1
	.loc 1 233 11 is_stmt 0
	slli	s1,s1,3
.LVL52:
	add	s3,s3,s1
.LVL53:
.L34:
.LBE9:
	.loc 1 211 13 is_stmt 1
	bgeu	s3,s4,.L95
.LBB10:
	.loc 1 212 9
	.loc 1 212 14 is_stmt 0
	ld	a5,0(s3)
.LVL54:
	.loc 1 213 9 is_stmt 1
	.loc 1 214 9
	.loc 1 215 9
	.loc 1 217 9
.L35:
	.loc 1 217 15 discriminator 1
	.loc 1 217 16 is_stmt 0 discriminator 1
	andi	a4,a5,3
	.loc 1 217 15 discriminator 1
	bne	a4,zero,.L96
	.loc 1 217 33 is_stmt 1 discriminator 2
	.loc 1 217 35 is_stmt 0 discriminator 2
	ld	a5,0(a5)
.LVL55:
	j	.L35
.LVL56:
.L93:
	.loc 1 223 11 is_stmt 1
	.loc 1 223 23 is_stmt 0
	slli	a5,s1,3
.LVL57:
	.loc 1 223 19
	add	a5,s3,a5
.LVL58:
	.loc 1 224 11 is_stmt 1
	.loc 1 224 13 is_stmt 0
	ld	a5,0(a5)
.LVL59:
	.loc 1 225 11 is_stmt 1
	.loc 1 225 17 is_stmt 0
	j	.L38
.L39:
	.loc 1 225 35 is_stmt 1 discriminator 2
	.loc 1 225 53 is_stmt 0 discriminator 2
	andi	a5,a5,-4
.LVL60:
	.loc 1 225 37 discriminator 2
	ld	a5,0(a5)
.LVL61:
.L38:
	.loc 1 225 17 is_stmt 1 discriminator 1
	.loc 1 225 18 is_stmt 0 discriminator 1
	andi	a4,a5,3
	.loc 1 225 17 discriminator 1
	li	a3,3
	bne	a4,a3,.L39
	.loc 1 226 11 is_stmt 1
	.loc 1 226 16 is_stmt 0
	srli	s1,a5,10
.LVL62:
	.loc 1 226 14
	addi	s1,s1,1
.LVL63:
	.loc 1 227 11 is_stmt 1
	.loc 1 227 15 is_stmt 0
	srli	a5,a5,2
.LVL64:
	.loc 1 227 13
	andi	a5,a5,0xff
.LVL65:
	j	.L37
.LVL66:
.L42:
	.loc 1 231 36 is_stmt 1 discriminator 3
	.loc 1 231 58 is_stmt 0 discriminator 3
	slli	a0,s2,3
	.loc 1 231 36 discriminator 3
	add	a0,s3,a0
	call	invert_pointer_at
.LVL67:
	.loc 1 231 31 is_stmt 1 discriminator 3
	.loc 1 231 32 is_stmt 0 discriminator 3
	addi	s2,s2,1
.LVL68:
.L40:
	.loc 1 231 23 is_stmt 1 discriminator 1
	.loc 1 231 11 is_stmt 0 discriminator 1
	bgtu	s1,s2,.L42
	j	.L41
.LVL69:
.L94:
	.loc 1 231 18
	li	s2,1
	j	.L40
.LVL70:
.L95:
.LBE10:
	.loc 1 235 7 is_stmt 1
	.loc 1 235 10 is_stmt 0
	ld	s0,-8(s0)
.LVL71:
.L33:
.LBE8:
	.loc 1 207 11 is_stmt 1
	beq	s0,zero,.L97
.LBB11:
	.loc 1 208 7
.LVL72:
	.loc 1 209 7
	.loc 1 209 20 is_stmt 0
	ld	s4,-16(s0)
	.loc 1 209 13
	add	s4,s0,s4
.LVL73:
	.loc 1 211 7 is_stmt 1
	.loc 1 208 13 is_stmt 0
	mv	s3,s0
	.loc 1 211 13
	j	.L34
.LVL74:
.L97:
.LBE11:
.LBB12:
	.loc 1 239 14
	lla	s5,caml_ephe_list_head
	j	.L51
.LVL75:
.L47:
	.loc 1 248 33 is_stmt 1 discriminator 2
	.loc 1 248 35 is_stmt 0 discriminator 2
	ld	a5,0(a5)
.LVL76:
.L46:
	.loc 1 248 15 is_stmt 1 discriminator 1
	.loc 1 248 16 is_stmt 0 discriminator 1
	andi	a4,a5,3
	.loc 1 248 15 discriminator 1
	beq	a4,zero,.L47
	.loc 1 249 9 is_stmt 1
	.loc 1 249 12 is_stmt 0
	srli	s1,a5,10
.LVL77:
	.loc 1 250 9 is_stmt 1
	.loc 1 250 16 is_stmt 0
	li	s2,1
	.loc 1 250 9
	j	.L48
.LVL78:
.L99:
	.loc 1 252 13 is_stmt 1
	call	invert_pointer_at
.LVL79:
.L49:
	.loc 1 250 29 discriminator 2
	.loc 1 250 30 is_stmt 0 discriminator 2
	addi	s2,s2,1
.LVL80:
.L48:
	.loc 1 250 21 is_stmt 1 discriminator 1
	.loc 1 250 9 is_stmt 0 discriminator 1
	bgeu	s2,s1,.L98
	.loc 1 251 11 is_stmt 1
	.loc 1 251 15 is_stmt 0
	slli	a0,s2,3
	add	a0,a0,s3
	ld	a4,0(a0)
	.loc 1 251 27
	ld	a5,caml_ephe_none
	.loc 1 251 14
	beq	a4,a5,.L49
	j	.L99
.L98:
	.loc 1 255 9 is_stmt 1
	mv	a0,s5
	call	invert_pointer_at
.LVL81:
	.loc 1 256 9
	.loc 1 256 12 is_stmt 0
	mv	s5,s4
.LVL82:
	.loc 1 244 13 is_stmt 1
.L51:
	.loc 1 240 7
	.loc 1 241 7
	.loc 1 242 7
	.loc 1 244 7
	.loc 1 245 9
	.loc 1 245 11 is_stmt 0
	ld	s4,0(s5)
.LVL83:
	.loc 1 246 9 is_stmt 1
	.loc 1 246 12 is_stmt 0
	beq	s4,zero,.L45
	.loc 1 247 9 is_stmt 1
	.loc 1 247 13 is_stmt 0
	mv	s3,s4
	.loc 1 247 11
	ld	a5,-8(s4)
.LVL84:
	.loc 1 248 9 is_stmt 1
	.loc 1 248 15 is_stmt 0
	j	.L46
.LVL85:
.L45:
.LBE12:
	.loc 1 265 5 is_stmt 1
	call	init_compact_allocate
.LVL86:
	.loc 1 266 5
	.loc 1 266 8 is_stmt 0
	ld	s5,caml_heap_start
.LVL87:
	.loc 1 267 5 is_stmt 1
	.loc 1 267 11 is_stmt 0
	j	.L52
.LVL88:
.L102:
.LBB13:
.LBB14:
.LBB15:
	.loc 1 285 11 is_stmt 1
	.loc 1 285 16 is_stmt 0
	srli	s7,a5,10
	.loc 1 285 14
	addi	s7,s7,1
.LVL89:
	.loc 1 286 11 is_stmt 1
	.loc 1 286 15 is_stmt 0
	srli	a5,a5,2
.LVL90:
	.loc 1 286 13
	andi	s6,a5,0xff
.LVL91:
	.loc 1 290 11 is_stmt 1
	.loc 1 290 14 is_stmt 0
	li	a5,249
	beq	s6,a5,.L100
	.loc 1 282 17
	mv	s1,s0
.L58:
.LVL92:
	.loc 1 300 11 is_stmt 1
	.loc 1 300 20 is_stmt 0
	slli	s4,s7,3
	mv	a0,s4
	call	compact_allocate
.LVL93:
	.loc 1 301 11 is_stmt 1
	.loc 1 301 13 is_stmt 0
	ld	a5,0(s2)
.LVL94:
	.loc 1 302 11 is_stmt 1
	.loc 1 302 17 is_stmt 0
	j	.L61
.LVL95:
.L100:
	.loc 1 292 13 is_stmt 1
	.loc 1 292 25 is_stmt 0
	slli	a4,s7,3
	.loc 1 292 21
	add	s1,s2,a4
.LVL96:
	.loc 1 293 13 is_stmt 1
	.loc 1 293 15 is_stmt 0
	ld	a5,0(s1)
.LVL97:
	.loc 1 294 13 is_stmt 1
	.loc 1 295 13
	.loc 1 295 19 is_stmt 0
	j	.L59
.L60:
	.loc 1 295 37 is_stmt 1 discriminator 2
	.loc 1 295 55 is_stmt 0 discriminator 2
	andi	a5,a5,-4
.LVL98:
	.loc 1 295 39 discriminator 2
	ld	a5,0(a5)
.LVL99:
.L59:
	.loc 1 295 19 is_stmt 1 discriminator 1
	.loc 1 295 20 is_stmt 0 discriminator 1
	andi	a4,a5,3
	.loc 1 295 19 discriminator 1
	li	a3,3
	bne	a4,a3,.L60
	.loc 1 296 13 is_stmt 1
	.loc 1 296 18 is_stmt 0
	srli	s7,a5,10
.LVL100:
	.loc 1 296 16
	addi	s7,s7,1
.LVL101:
	.loc 1 297 13 is_stmt 1
	.loc 1 297 17 is_stmt 0
	srli	a5,a5,2
.LVL102:
	.loc 1 297 15
	andi	s6,a5,0xff
.LVL103:
	j	.L58
.LVL104:
.L62:
.LBB16:
	.loc 1 303 13 is_stmt 1
	.loc 1 303 27 is_stmt 0
	mv	a4,a5
	.loc 1 303 18
	ld	a5,0(a5)
.LVL105:
	.loc 1 304 13 is_stmt 1
	.loc 1 304 35 is_stmt 0
	addi	a3,a0,8
	.loc 1 304 26
	sd	a3,0(a4)
	.loc 1 305 13 is_stmt 1
.LVL106:
.L61:
.LBE16:
	.loc 1 302 17
	.loc 1 302 18 is_stmt 0
	andi	a4,a5,3
	.loc 1 302 17
	beq	a4,zero,.L62
	.loc 1 307 11 is_stmt 1
	.loc 1 307 16 is_stmt 0
	addi	s7,s7,-1
.LVL107:
	slli	s7,s7,10
.LVL108:
	add	s6,s6,s7
.LVL109:
	.loc 1 307 14
	sd	s6,0(s2)
	.loc 1 310 11 is_stmt 1
	.loc 1 310 14 is_stmt 0
	bne	s1,zero,.L63
.LVL110:
.L64:
	.loc 1 330 11 is_stmt 1
	.loc 1 330 13 is_stmt 0
	add	s2,s2,s4
.LVL111:
.LBE15:
	.loc 1 274 57
	j	.L53
.LVL112:
.L66:
.LBB18:
.LBB17:
	.loc 1 316 17 is_stmt 1
	.loc 1 317 17
	.loc 1 317 19 is_stmt 0
	andi	a3,a4,-4
.LVL113:
	.loc 1 318 17 is_stmt 1
	.loc 1 318 22 is_stmt 0
	ld	a4,0(a3)
.LVL114:
	.loc 1 319 17 is_stmt 1
	.loc 1 319 39 is_stmt 0
	sub	a5,s1,s2
	addi	a5,a5,8
	add	a5,a0,a5
	.loc 1 319 30
	sd	a5,0(a3)
	.loc 1 320 17 is_stmt 1
.LVL115:
.L65:
.LBE17:
	.loc 1 315 21
	.loc 1 315 22 is_stmt 0
	andi	a5,a4,3
	.loc 1 315 21
	li	a3,2
	beq	a5,a3,.L66
	.loc 1 322 15 is_stmt 1
	.loc 1 326 15
	.loc 1 326 26 is_stmt 0
	sub	a5,s1,s2
	srai	a5,a5,3
	slli	a5,a5,10
	addi	a5,a5,249
	.loc 1 326 24
	sd	a5,0(s1)
	.loc 1 327 15 is_stmt 1
	.loc 1 327 23 is_stmt 0
	mv	s1,a4
.LVL116:
.L63:
	.loc 1 312 19 is_stmt 1
	.loc 1 312 20 is_stmt 0
	andi	a5,s1,3
	.loc 1 312 19
	li	a4,3
	beq	a5,a4,.L64
	.loc 1 313 15 is_stmt 1
	.loc 1 313 50 is_stmt 0
	andi	s1,s1,-4
.LVL117:
	.loc 1 314 15 is_stmt 1
	.loc 1 314 17 is_stmt 0
	ld	a4,0(s1)
.LVL118:
	.loc 1 315 15 is_stmt 1
	.loc 1 315 21 is_stmt 0
	j	.L65
.LVL119:
.L89:
.LBE18:
	.loc 1 332 11 is_stmt 1
	.loc 1 338 11
	.loc 1 338 16 is_stmt 0
	srli	a3,a5,10
	andi	a5,a5,-1024
.LVL120:
	or	a5,a4,a5
	addi	a5,a5,512
	.loc 1 338 14
	sd	a5,0(s2)
.LVL121:
	.loc 1 339 11 is_stmt 1
	.loc 1 339 13 is_stmt 0
	addi	a5,a3,1
	slli	a5,a5,3
	add	s2,s2,a5
.LVL122:
.L53:
.LBE14:
	.loc 1 271 13 is_stmt 1
	bgeu	s2,s3,.L101
.LBB20:
	.loc 1 272 9
	.loc 1 272 14 is_stmt 0
	ld	a5,0(s2)
.LVL123:
	.loc 1 274 9 is_stmt 1
	.loc 1 274 13 is_stmt 0
	andi	a4,a5,3
	.loc 1 274 12
	beq	a4,zero,.L56
	.loc 1 274 32 discriminator 1
	srli	a4,a5,2
	andi	a4,a4,255
	.loc 1 274 29 discriminator 1
	li	a3,249
	bne	a4,a3,.L89
.L56:
.LBB19:
	.loc 1 284 17 is_stmt 1 discriminator 1
	.loc 1 284 18 is_stmt 0 discriminator 1
	andi	a4,a5,3
	.loc 1 284 17 discriminator 1
	bne	a4,zero,.L102
	.loc 1 284 35 is_stmt 1 discriminator 2
	.loc 1 284 37 is_stmt 0 discriminator 2
	ld	a5,0(a5)
.LVL124:
	j	.L56
.LVL125:
.L101:
.LBE19:
.LBE20:
	.loc 1 342 7 is_stmt 1
	.loc 1 342 10 is_stmt 0
	ld	s5,-8(s5)
.LVL126:
.L52:
.LBE13:
	.loc 1 267 11 is_stmt 1
	beq	s5,zero,.L103
.LBB21:
	.loc 1 268 7
.LVL127:
	.loc 1 270 7
	.loc 1 270 20 is_stmt 0
	ld	s3,-16(s5)
	.loc 1 270 13
	add	s3,s5,s3
.LVL128:
	.loc 1 271 7 is_stmt 1
	.loc 1 268 13 is_stmt 0
	mv	s2,s5
	.loc 1 271 13
	j	.L53
.LVL129:
.L103:
.LBE21:
	.loc 1 350 5 is_stmt 1
	call	init_compact_allocate
.LVL130:
	.loc 1 351 5
	.loc 1 351 8 is_stmt 0
	ld	s3,caml_heap_start
.LVL131:
	.loc 1 352 5 is_stmt 1
	.loc 1 352 11 is_stmt 0
	j	.L71
.LVL132:
.L105:
.LBB22:
.LBB23:
.LBB24:
	.loc 1 359 11 is_stmt 1
	.loc 1 359 23 is_stmt 0
	srli	s0,a5,10
	addi	s0,s0,1
	.loc 1 359 18
	slli	s0,s0,3
.LVL133:
	.loc 1 360 11 is_stmt 1
	.loc 1 360 26 is_stmt 0
	mv	a0,s0
	call	compact_allocate
.LVL134:
	.loc 1 361 11 is_stmt 1
	mv	a2,s0
	mv	a1,s1
	call	memmove
.LVL135:
	.loc 1 362 11
	.loc 1 362 13 is_stmt 0
	add	s1,s1,s0
.LVL136:
.L72:
.LBE24:
.LBE23:
	.loc 1 356 13 is_stmt 1
	bgeu	s1,s2,.L104
.LBB25:
	.loc 1 357 9
	.loc 1 357 14 is_stmt 0
	ld	a5,0(s1)
.LVL137:
	.loc 1 358 9 is_stmt 1
	.loc 1 358 13 is_stmt 0
	andi	a4,a5,768
	.loc 1 358 12
	beq	a4,zero,.L105
	.loc 1 364 11 is_stmt 1
	.loc 1 365 11
	.loc 1 365 16 is_stmt 0
	srli	a5,a5,10
.LVL138:
	.loc 1 365 13
	addi	a5,a5,1
	slli	a5,a5,3
	add	s1,s1,a5
.LVL139:
	j	.L72
.L104:
.LBE25:
	.loc 1 368 7 is_stmt 1
	.loc 1 368 10 is_stmt 0
	ld	s3,-8(s3)
.LVL140:
.L71:
.LBE22:
	.loc 1 352 11 is_stmt 1
	beq	s3,zero,.L106
.LBB26:
	.loc 1 353 7
.LVL141:
	.loc 1 355 7
	.loc 1 355 20 is_stmt 0
	ld	s2,-16(s3)
	.loc 1 355 13
	add	s2,s3,s2
.LVL142:
	.loc 1 356 7 is_stmt 1
	.loc 1 353 13 is_stmt 0
	mv	s1,s3
	.loc 1 356 13
	j	.L72
.LVL143:
.L106:
.LBE26:
.LBB27:
	.loc 1 375 5 is_stmt 1
	.loc 1 376 5
	.loc 1 377 5
	.loc 1 379 5
	.loc 1 379 8 is_stmt 0
	ld	a0,caml_heap_start
.LVL144:
	.loc 1 380 5 is_stmt 1
	.loc 1 379 8 is_stmt 0
	mv	a5,a0
	.loc 1 376 13
	li	s1,0
	.loc 1 375 13
	li	a2,0
	.loc 1 380 11
	j	.L77
.LVL145:
.L78:
	.loc 1 385 7 is_stmt 1
	.loc 1 385 10 is_stmt 0
	ld	a5,-8(a5)
.LVL146:
.L77:
	.loc 1 380 11 is_stmt 1
	beq	a5,zero,.L107
	.loc 1 381 7
	.loc 1 381 11 is_stmt 0
	ld	a4,-24(a5)
	.loc 1 381 10
	beq	a4,zero,.L78
	.loc 1 382 9 is_stmt 1
	.loc 1 382 17 is_stmt 0
	srli	a3,a4,3
	.loc 1 382 14
	add	a2,a2,a3
.LVL147:
	.loc 1 383 9 is_stmt 1
	.loc 1 383 17 is_stmt 0
	ld	a3,-16(a5)
	sub	a4,a3,a4
	srli	a4,a4,3
	.loc 1 383 14
	add	s1,s1,a4
.LVL148:
	j	.L78
.L107:
	.loc 1 390 5 is_stmt 1
	.loc 1 390 40 is_stmt 0
	li	s0,100
	divu	s0,a2,s0
	.loc 1 390 46
	addi	s0,s0,1
	.loc 1 390 32
	ld	a5,caml_percent_free
.LVL149:
	.loc 1 390 12
	mul	s0,s0,a5
.LVL150:
	.loc 1 391 5 is_stmt 1
	.loc 1 392 5
	.loc 1 392 11 is_stmt 0
	j	.L80
.LVL151:
.L82:
.LBB28:
	.loc 1 399 11 is_stmt 1
	call	caml_shrink_heap
.LVL152:
.L81:
.LBE28:
	.loc 1 375 13 is_stmt 0
	mv	a0,s2
.LVL153:
.L80:
	.loc 1 392 11 is_stmt 1
	beq	a0,zero,.L108
.LBB29:
	.loc 1 393 7
	.loc 1 393 13 is_stmt 0
	ld	s2,-8(a0)
.LVL154:
	.loc 1 395 7 is_stmt 1
	.loc 1 395 11 is_stmt 0
	ld	a5,-24(a0)
	.loc 1 395 10
	bne	a5,zero,.L81
	.loc 1 396 9 is_stmt 1
	.loc 1 396 12 is_stmt 0
	bgeu	s1,s0,.L82
	.loc 1 397 11 is_stmt 1
	.loc 1 397 19 is_stmt 0
	ld	a5,-16(a0)
	srli	a5,a5,3
	.loc 1 397 16
	add	s1,s1,a5
.LVL155:
	j	.L81
.LVL156:
.L108:
.LBE29:
.LBE27:
	.loc 1 408 5 is_stmt 1
	.loc 1 408 8 is_stmt 0
	ld	s0,caml_heap_start
.LVL157:
	.loc 1 409 5 is_stmt 1
	call	caml_fl_reset
.LVL158:
	.loc 1 410 5
	.loc 1 410 11 is_stmt 0
	j	.L84
.L85:
	.loc 1 416 7 is_stmt 1
	.loc 1 416 10 is_stmt 0
	ld	s0,-8(s0)
.LVL159:
.L84:
	.loc 1 410 11 is_stmt 1
	beq	s0,zero,.L109
	.loc 1 411 7
	.loc 1 411 11 is_stmt 0
	ld	a5,-16(s0)
	.loc 1 411 29
	ld	a0,-24(s0)
	.loc 1 411 10
	bleu	a5,a0,.L85
	.loc 1 412 9 is_stmt 1
	.loc 1 413 32 is_stmt 0
	sub	a5,a5,a0
	.loc 1 412 9
	li	a3,0
	li	a2,1
	srli	a1,a5,3
	add	a0,s0,a0
	call	caml_make_free_blocks
.LVL160:
	j	.L85
.L109:
	.loc 1 419 3 is_stmt 1
	lla	a4,caml_stat_compactions
	ld	a5,0(a4)
	addi	a5,a5,1
	sd	a5,0(a4)
	.loc 1 420 3
	lla	a1,.LC1
	li	a0,16
	call	caml_gc_message
.LVL161:
	.loc 1 421 1 is_stmt 0
	ld	ra,72(sp)
	.cfi_restore 1
	ld	s0,64(sp)
	.cfi_restore 8
.LVL162:
	ld	s1,56(sp)
	.cfi_restore 9
.LVL163:
	ld	s2,48(sp)
	.cfi_restore 18
	ld	s3,40(sp)
	.cfi_restore 19
	ld	s4,32(sp)
	.cfi_restore 20
	ld	s5,24(sp)
	.cfi_restore 21
	ld	s6,16(sp)
	.cfi_restore 22
	ld	s7,8(sp)
	.cfi_restore 23
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE13:
	.size	do_compaction, .-do_compaction
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"Recompacting heap (target=%luk words)\n"
	.text
	.align	1
	.globl	caml_compact_heap
	.type	caml_compact_heap, @function
caml_compact_heap:
.LFB14:
	.loc 1 426 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.loc 1 427 3
	.loc 1 428 35
	.loc 1 430 3
	.loc 1 431 3
	.loc 1 432 3
	.loc 1 433 3
	.loc 1 435 3
	call	do_compaction
.LVL164:
	.loc 1 436 40
	.loc 1 462 3
	.loc 1 462 29 is_stmt 0
	lla	s1,caml_stat_heap_wsz
	ld	a0,0(s1)
	ld	a5,caml_fl_cur_wsz
	.loc 1 462 8
	sub	a5,a0,a5
.LVL165:
	.loc 1 463 3 is_stmt 1
	.loc 1 463 49 is_stmt 0
	li	a0,100
	divu	a0,a5,a0
	.loc 1 463 55
	addi	a0,a0,1
	.loc 1 463 41
	ld	a4,caml_percent_free
	mul	a0,a0,a4
	.loc 1 463 21
	add	a0,a0,a5
.LVL166:
	.loc 1 465 3 is_stmt 1
	.loc 1 465 16 is_stmt 0
	addi	a0,a0,512
.LVL167:
	call	caml_clip_heap_chunk_wsz
.LVL168:
	.loc 1 473 3 is_stmt 1
	.loc 1 473 39 is_stmt 0
	ld	a4,0(s1)
	srli	a5,a4,63
	add	a5,a5,a4
	srai	a5,a5,1
	.loc 1 473 6
	bgtu	a5,a0,.L115
.LVL169:
.L110:
	.loc 1 504 1
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	ld	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL170:
.L115:
	.cfi_restore_state
	mv	s0,a0
.LBB30:
	.loc 1 475 5 is_stmt 1
	.loc 1 477 5
	srli	a2,a0,10
	lla	a1,.LC2
	li	a0,16
.LVL171:
	call	caml_gc_message
.LVL172:
	.loc 1 481 5
	.loc 1 481 13 is_stmt 0
	slli	a0,s0,3
	call	caml_alloc_for_heap
.LVL173:
	mv	s0,a0
.LVL174:
	.loc 1 482 5 is_stmt 1
	.loc 1 482 8 is_stmt 0
	beq	a0,zero,.L110
	.loc 1 485 5 is_stmt 1
	.loc 1 486 28 is_stmt 0
	ld	a1,-16(a0)
	.loc 1 485 5
	li	a3,512
	li	a2,0
	srli	a1,a1,3
	call	caml_make_free_blocks
.LVL175:
	.loc 1 487 5 is_stmt 1
	.loc 1 487 54 is_stmt 0
	ld	a2,-16(s0)
	.loc 1 487 9
	add	a2,s0,a2
	mv	a1,s0
	li	a0,1
	call	caml_page_table_add
.LVL176:
	.loc 1 487 8
	bne	a0,zero,.L116
	.loc 1 491 5 is_stmt 1
	.loc 1 491 24 is_stmt 0
	lla	a5,caml_heap_start
	ld	a4,0(a5)
	sd	a4,-8(s0)
	.loc 1 492 5 is_stmt 1
	.loc 1 492 21 is_stmt 0
	sd	s0,0(a5)
	.loc 1 493 5 is_stmt 1
	lla	a4,caml_stat_heap_chunks
	ld	a5,0(a4)
	addi	a5,a5,1
	sd	a5,0(a4)
	.loc 1 494 5
	.loc 1 494 27 is_stmt 0
	ld	a5,-16(s0)
	srli	a5,a5,3
	.loc 1 494 24
	lla	a4,caml_stat_heap_wsz
	ld	a3,0(a4)
	add	a5,a5,a3
	sd	a5,0(a4)
	.loc 1 495 5 is_stmt 1
	.loc 1 495 28 is_stmt 0
	ld	a4,caml_stat_top_heap_wsz
	.loc 1 495 8
	ble	a5,a4,.L113
	.loc 1 496 7 is_stmt 1
	.loc 1 496 30 is_stmt 0
	sd	a5,caml_stat_top_heap_wsz,a4
.L113:
	.loc 1 498 5 is_stmt 1
	call	do_compaction
.LVL177:
	.loc 1 499 5
	.loc 1 500 5
	.loc 1 501 5
	.loc 1 502 47
	j	.L110
.L116:
	.loc 1 488 7
	mv	a0,s0
	call	caml_free_for_heap
.LVL178:
	.loc 1 489 7
	j	.L110
.LBE30:
	.cfi_endproc
.LFE14:
	.size	caml_compact_heap, .-caml_compact_heap
	.section	.rodata.str1.8
	.align	3
.LC6:
	.string	"FL size at phase change = %lu words\n"
	.align	3
.LC7:
	.string	"FL current size = %lu words\n"
	.align	3
.LC8:
	.string	"Estimated overhead = %lu%%\n"
	.align	3
.LC9:
	.string	"Automatic compaction triggered.\n"
	.align	3
.LC10:
	.string	"Measured overhead: %lu%%\n"
	.align	3
.LC11:
	.string	"Automatic compaction aborted.\n"
	.text
	.align	1
	.globl	caml_compact_heap_maybe
	.type	caml_compact_heap_maybe, @function
caml_compact_heap_maybe:
.LFB15:
	.loc 1 507 1
	.cfi_startproc
	.loc 1 516 3
	.loc 1 517 3
	.loc 1 518 3
	.loc 1 518 24 is_stmt 0
	ld	a4,caml_percent_max
	.loc 1 518 6
	li	a5,999424
	addi	a5,a5,575
	bgtu	a4,a5,.L132
	.loc 1 519 3 is_stmt 1
	.loc 1 519 35 is_stmt 0
	ld	a4,caml_stat_major_collections
	.loc 1 519 6
	li	a5,2
	bgt	a4,a5,.L135
.L132:
	ret
.L135:
	.loc 1 507 1
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	fsd	fs0,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 40, -24
	.loc 1 520 3 is_stmt 1
	.loc 1 520 33 is_stmt 0
	li	a0,0
	call	caml_clip_heap_chunk_wsz
.LVL179:
	.loc 1 520 31
	slli	a0,a0,1
	.loc 1 520 26
	ld	a5,caml_stat_heap_wsz
	.loc 1 520 6
	bgeu	a0,a5,.L117
	.loc 1 528 3 is_stmt 1
	.loc 1 528 12 is_stmt 0
	ld	a3,caml_fl_cur_wsz
	fcvt.d.lu	fa5,a3
	fld	fa4,.LC4,a4
	fmul.d	fa5,fa5,fa4
	.loc 1 528 36
	ld	a2,caml_fl_wsz_at_phase_change
	fcvt.d.lu	fa4,a2
	fadd.d	fa4,fa4,fa4
	.loc 1 528 30
	fsub.d	fa5,fa5,fa4
	.loc 1 528 6
	fcvt.s.d	fa5,fa5
.LVL180:
	.loc 1 529 3 is_stmt 1
	.loc 1 529 6 is_stmt 0
	fmv.s.x	fa4,zero
	flt.s	a4,fa5,fa4
	bne	a4,zero,.L136
.L119:
	.loc 1 531 3 is_stmt 1
	.loc 1 531 10 is_stmt 0
	fcvt.s.l	fa4,a5
	.loc 1 531 6
	fle.s	a5,fa4,fa5
	bne	a5,zero,.L125
	.loc 1 534 5 is_stmt 1
	.loc 1 534 16 is_stmt 0
	fcvt.d.s	fs0,fa5
	fld	fa3,.LC5,a5
	fmul.d	fs0,fs0,fa3
	.loc 1 534 43
	fsub.s	fa5,fa4,fa5
.LVL181:
	fcvt.d.s	fa5,fa5
	.loc 1 534 21
	fdiv.d	fs0,fs0,fa5
	.loc 1 534 8
	fcvt.s.d	fs0,fs0
.LVL182:
	.loc 1 535 5 is_stmt 1
	.loc 1 535 8 is_stmt 0
	flw	fa5,.LC3,a5
	fgt.s	a5,fs0,fa5
	beq	a5,zero,.L121
	.loc 1 535 28
	flw	fs0,.LC3,a5
.LVL183:
	j	.L121
.LVL184:
.L136:
	.loc 1 529 15 is_stmt 1 discriminator 1
	.loc 1 529 18 is_stmt 0 discriminator 1
	fcvt.s.lu	fa5,a3
.LVL185:
	j	.L119
.L125:
	.loc 1 532 8
	flw	fs0,.LC3,a5
.LVL186:
.L121:
	.loc 1 537 3 is_stmt 1
	lla	a1,.LC6
	li	a0,512
	call	caml_gc_message
.LVL187:
	.loc 1 540 3
	ld	a2,caml_fl_cur_wsz
	lla	a1,.LC7
	li	a0,512
	call	caml_gc_message
.LVL188:
	.loc 1 543 3
	fcvt.lu.s a2,fs0,rtz
	lla	a1,.LC8
	li	a0,512
	call	caml_gc_message
.LVL189:
	.loc 1 546 3
	.loc 1 546 10 is_stmt 0
	ld	a5,caml_percent_max
	fcvt.s.lu	fa5,a5
	.loc 1 546 6
	fle.s	a5,fa5,fs0
	bne	a5,zero,.L137
.LVL190:
.L117:
	.loc 1 562 1
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	fld	fs0,8(sp)
	.cfi_restore 40
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL191:
.L137:
	.cfi_restore_state
	.loc 1 547 5 is_stmt 1
	lla	a1,.LC9
	li	a0,512
	call	caml_gc_message
.LVL192:
	.loc 1 548 5
	call	caml_empty_minor_heap
.LVL193:
	.loc 1 549 5
	call	caml_finish_major_cycle
.LVL194:
	.loc 1 551 5
	.loc 1 551 8 is_stmt 0
	ld	a5,caml_fl_cur_wsz
	fcvt.s.lu	fa4,a5
.LVL195:
	.loc 1 552 5 is_stmt 1
	.loc 1 552 16 is_stmt 0
	fcvt.d.s	fs0,fa4
.LVL196:
	fld	fa5,.LC5,a5
	fmul.d	fs0,fs0,fa5
	.loc 1 552 43
	ld	a5,caml_stat_heap_wsz
	fcvt.s.l	fa5,a5
	fsub.s	fa5,fa5,fa4
	fcvt.d.s	fa5,fa5
	.loc 1 552 21
	fdiv.d	fs0,fs0,fa5
	.loc 1 552 8
	fcvt.s.d	fs0,fs0
.LVL197:
	.loc 1 553 5 is_stmt 1
	fcvt.lu.s a2,fs0,rtz
	lla	a1,.LC10
	li	a0,512
	call	caml_gc_message
.LVL198:
	.loc 1 556 5
	.loc 1 556 12 is_stmt 0
	ld	a5,caml_percent_max
	fcvt.s.lu	fa5,a5
	.loc 1 556 8
	fle.s	a5,fa5,fs0
	beq	a5,zero,.L130
	.loc 1 557 10 is_stmt 1
	call	caml_compact_heap
.LVL199:
	j	.L117
.L130:
	.loc 1 559 10
	lla	a1,.LC11
	li	a0,512
	call	caml_gc_message
.LVL200:
	j	.L117
	.cfi_endproc
.LFE15:
	.size	caml_compact_heap_maybe, .-caml_compact_heap_maybe
	.comm	caml_percent_max,8,8
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
	.section	.srodata.cst4,"aM",@progbits,4
	.align	2
.LC3:
	.word	1232348160
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC4:
	.word	0
	.word	1074266112
	.align	3
.LC5:
	.word	0
	.word	1079574528
	.section	.sbss,"aw",@nobits
	.align	3
	.type	compact_fl, @object
	.size	compact_fl, 8
compact_fl:
	.zero	8
	.text
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 3 "caml/config.h"
	.file 4 "caml/misc.h"
	.file 5 "caml/mlvalues.h"
	.file 6 "caml/address_class.h"
	.file 7 "caml/freelist.h"
	.file 8 "caml/major_gc.h"
	.file 9 "caml/minor_gc.h"
	.file 10 "caml/memory.h"
	.file 11 "caml/roots.h"
	.file 12 "caml/gc_ctrl.h"
	.file 13 "caml/weak.h"
	.file 14 "/home/sai/ocaml-freestanding-riscv/nolibc/include/string.h"
	.file 15 "caml/finalise.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xf5a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF129
	.byte	0xc
	.4byte	.LASF130
	.4byte	.LASF131
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.byte	0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF1
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF2
	.byte	0x3
	.4byte	.LASF8
	.byte	0x2
	.byte	0xd1
	.byte	0x17
	.4byte	0x2d
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF3
	.byte	0x2
	.byte	0x10
	.byte	0x4
	.4byte	.LASF4
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF6
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x3
	.4byte	.LASF9
	.byte	0x3
	.byte	0x5b
	.byte	0xe
	.4byte	0x3b
	.byte	0x3
	.4byte	.LASF10
	.byte	0x3
	.byte	0x5c
	.byte	0x17
	.4byte	0x2d
	.byte	0x3
	.4byte	.LASF11
	.byte	0x4
	.byte	0x21
	.byte	0x10
	.4byte	0x42
	.byte	0x5
	.byte	0x8
	.4byte	0xa2
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.byte	0x3
	.4byte	.LASF13
	.byte	0x4
	.byte	0x5c
	.byte	0x10
	.4byte	0xb5
	.byte	0x5
	.byte	0x8
	.4byte	0xbb
	.byte	0x6
	.byte	0x7
	.4byte	.LASF14
	.byte	0x4
	.byte	0x5d
	.byte	0x19
	.4byte	0xa9
	.byte	0x7
	.4byte	.LASF15
	.byte	0x4
	.byte	0x5d
	.byte	0x36
	.4byte	0xa9
	.byte	0x7
	.4byte	.LASF16
	.byte	0x4
	.byte	0x5e
	.byte	0x19
	.4byte	0xa9
	.byte	0x7
	.4byte	.LASF17
	.byte	0x4
	.byte	0x5e
	.byte	0x33
	.4byte	0xa9
	.byte	0x7
	.4byte	.LASF18
	.byte	0x4
	.byte	0x5f
	.byte	0x19
	.4byte	0xa9
	.byte	0x7
	.4byte	.LASF19
	.byte	0x4
	.byte	0x5f
	.byte	0x33
	.4byte	0xa9
	.byte	0x8
	.byte	0x8
	.byte	0x9
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x169
	.byte	0x10
	.4byte	0x84
	.byte	0x9
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x171
	.byte	0x10
	.4byte	0x84
	.byte	0x3
	.4byte	.LASF22
	.byte	0x5
	.byte	0x3c
	.byte	0x10
	.4byte	0x78
	.byte	0x3
	.4byte	.LASF23
	.byte	0x5
	.byte	0x3d
	.byte	0x11
	.4byte	0x84
	.byte	0x3
	.4byte	.LASF24
	.byte	0x5
	.byte	0x3e
	.byte	0x11
	.4byte	0x84
	.byte	0x3
	.4byte	.LASF25
	.byte	0x5
	.byte	0x3f
	.byte	0x16
	.4byte	0x63
	.byte	0x3
	.4byte	.LASF26
	.byte	0x5
	.byte	0x40
	.byte	0x11
	.4byte	0x84
	.byte	0xa
	.4byte	0x12c
	.4byte	0x167
	.byte	0xb
	.byte	0
	.byte	0x9
	.4byte	.LASF27
	.byte	0x5
	.2byte	0x15c
	.byte	0x15
	.4byte	0x15c
	.byte	0x9
	.4byte	.LASF28
	.byte	0x5
	.2byte	0x171
	.byte	0xe
	.4byte	0x120
	.byte	0x7
	.4byte	.LASF29
	.byte	0x6
	.byte	0x31
	.byte	0xf
	.4byte	0x18d
	.byte	0x5
	.byte	0x8
	.4byte	0x120
	.byte	0x7
	.4byte	.LASF30
	.byte	0x6
	.byte	0x31
	.byte	0x22
	.4byte	0x18d
	.byte	0x7
	.4byte	.LASF31
	.byte	0x6
	.byte	0x32
	.byte	0xf
	.4byte	0x9c
	.byte	0x7
	.4byte	.LASF32
	.byte	0x6
	.byte	0x32
	.byte	0x27
	.4byte	0x9c
	.byte	0x7
	.4byte	.LASF33
	.byte	0x7
	.byte	0x1a
	.byte	0x10
	.4byte	0x90
	.byte	0xc
	.byte	0x20
	.byte	0x8
	.byte	0x18
	.byte	0x9
	.4byte	0x201
	.byte	0xd
	.4byte	.LASF34
	.byte	0x8
	.byte	0x19
	.byte	0x9
	.4byte	0x104
	.byte	0
	.byte	0xd
	.4byte	.LASF35
	.byte	0x8
	.byte	0x1a
	.byte	0xb
	.4byte	0x90
	.byte	0x8
	.byte	0xd
	.4byte	.LASF36
	.byte	0x8
	.byte	0x1b
	.byte	0xb
	.4byte	0x90
	.byte	0x10
	.byte	0xd
	.4byte	.LASF37
	.byte	0x8
	.byte	0x1c
	.byte	0x9
	.4byte	0x9c
	.byte	0x18
	.byte	0
	.byte	0x3
	.4byte	.LASF38
	.byte	0x8
	.byte	0x1d
	.byte	0x3
	.4byte	0x1c3
	.byte	0x7
	.4byte	.LASF39
	.byte	0x8
	.byte	0x24
	.byte	0xc
	.4byte	0x4e
	.byte	0x7
	.4byte	.LASF40
	.byte	0x8
	.byte	0x25
	.byte	0xc
	.4byte	0x4e
	.byte	0x7
	.4byte	.LASF41
	.byte	0x8
	.byte	0x26
	.byte	0x10
	.4byte	0x84
	.byte	0x7
	.4byte	.LASF42
	.byte	0x8
	.byte	0x27
	.byte	0xf
	.4byte	0x23d
	.byte	0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF43
	.byte	0x7
	.4byte	.LASF44
	.byte	0x8
	.byte	0x28
	.byte	0x10
	.4byte	0x84
	.byte	0x7
	.4byte	.LASF45
	.byte	0x8
	.byte	0x28
	.byte	0x25
	.4byte	0x84
	.byte	0x7
	.4byte	.LASF46
	.byte	0x8
	.byte	0x29
	.byte	0x10
	.4byte	0x84
	.byte	0x7
	.4byte	.LASF47
	.byte	0x8
	.byte	0x3e
	.byte	0x12
	.4byte	0x9c
	.byte	0x7
	.4byte	.LASF48
	.byte	0x8
	.byte	0x3f
	.byte	0x10
	.4byte	0x84
	.byte	0x7
	.4byte	.LASF49
	.byte	0x8
	.byte	0x40
	.byte	0xe
	.4byte	0x9c
	.byte	0x7
	.4byte	.LASF50
	.byte	0x8
	.byte	0x42
	.byte	0xc
	.4byte	0x4e
	.byte	0xa
	.4byte	0x23d
	.4byte	0x2a8
	.byte	0xe
	.4byte	0x2d
	.byte	0x31
	.byte	0
	.byte	0xf
	.4byte	.LASF51
	.byte	0x8
	.byte	0x43
	.byte	0x8
	.4byte	0x298
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0xf
	.4byte	.LASF52
	.byte	0x8
	.byte	0x44
	.byte	0x5
	.4byte	0x4e
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0xf
	.4byte	.LASF53
	.byte	0x8
	.byte	0x45
	.byte	0x8
	.4byte	0x23d
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0x7
	.4byte	.LASF54
	.byte	0x8
	.byte	0x46
	.byte	0xf
	.4byte	0x23d
	.byte	0x7
	.4byte	.LASF55
	.byte	0x8
	.byte	0x4a
	.byte	0x13
	.4byte	0xb5
	.byte	0x7
	.4byte	.LASF56
	.byte	0x9
	.byte	0x18
	.byte	0x13
	.4byte	0x18d
	.byte	0x7
	.4byte	.LASF57
	.byte	0x9
	.byte	0x18
	.byte	0x2c
	.4byte	0x18d
	.byte	0x7
	.4byte	.LASF58
	.byte	0x9
	.byte	0x19
	.byte	0x13
	.4byte	0x18d
	.byte	0x7
	.4byte	.LASF59
	.byte	0x9
	.byte	0x19
	.byte	0x24
	.4byte	0x18d
	.byte	0x7
	.4byte	.LASF60
	.byte	0x9
	.byte	0x1a
	.byte	0x13
	.4byte	0x18d
	.byte	0x7
	.4byte	.LASF61
	.byte	0x9
	.byte	0x1b
	.byte	0x10
	.4byte	0x90
	.byte	0x7
	.4byte	.LASF62
	.byte	0x9
	.byte	0x1c
	.byte	0xc
	.4byte	0x4e
	.byte	0x7
	.4byte	.LASF63
	.byte	0x9
	.byte	0x1d
	.byte	0xf
	.4byte	0x23d
	.byte	0x10
	.4byte	.LASF68
	.byte	0x38
	.byte	0x9
	.byte	0x29
	.byte	0x8
	.4byte	0x3cb
	.byte	0xd
	.4byte	.LASF64
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x3cb
	.byte	0
	.byte	0x11
	.string	"end"
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x3cb
	.byte	0x8
	.byte	0xd
	.4byte	.LASF65
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x3cb
	.byte	0x10
	.byte	0x11
	.string	"ptr"
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x3cb
	.byte	0x18
	.byte	0xd
	.4byte	.LASF66
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x3cb
	.byte	0x20
	.byte	0xd
	.4byte	.LASF36
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x90
	.byte	0x28
	.byte	0xd
	.4byte	.LASF67
	.byte	0x9
	.byte	0x29
	.byte	0x17
	.4byte	0x90
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x18d
	.byte	0x7
	.4byte	.LASF68
	.byte	0x9
	.byte	0x2a
	.byte	0x22
	.4byte	0x362
	.byte	0x10
	.4byte	.LASF69
	.byte	0x10
	.byte	0x9
	.byte	0x2c
	.byte	0x8
	.4byte	0x405
	.byte	0xd
	.4byte	.LASF70
	.byte	0x9
	.byte	0x2d
	.byte	0x9
	.4byte	0x120
	.byte	0
	.byte	0xd
	.4byte	.LASF71
	.byte	0x9
	.byte	0x2e
	.byte	0xc
	.4byte	0x138
	.byte	0x8
	.byte	0
	.byte	0x10
	.4byte	.LASF72
	.byte	0x38
	.byte	0x9
	.byte	0x31
	.byte	0x8
	.4byte	0x46e
	.byte	0xd
	.4byte	.LASF64
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x46e
	.byte	0
	.byte	0x11
	.string	"end"
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x46e
	.byte	0x8
	.byte	0xd
	.4byte	.LASF65
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x46e
	.byte	0x10
	.byte	0x11
	.string	"ptr"
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x46e
	.byte	0x18
	.byte	0xd
	.4byte	.LASF66
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x46e
	.byte	0x20
	.byte	0xd
	.4byte	.LASF36
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x90
	.byte	0x28
	.byte	0xd
	.4byte	.LASF67
	.byte	0x9
	.byte	0x31
	.byte	0x1c
	.4byte	0x90
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x3dd
	.byte	0x7
	.4byte	.LASF72
	.byte	0x9
	.byte	0x32
	.byte	0x27
	.4byte	0x405
	.byte	0x10
	.4byte	.LASF73
	.byte	0x18
	.byte	0x9
	.byte	0x34
	.byte	0x8
	.4byte	0x4b5
	.byte	0xd
	.4byte	.LASF34
	.byte	0x9
	.byte	0x35
	.byte	0x9
	.4byte	0x120
	.byte	0
	.byte	0x11
	.string	"mem"
	.byte	0x9
	.byte	0x36
	.byte	0xc
	.4byte	0x138
	.byte	0x8
	.byte	0x11
	.string	"max"
	.byte	0x9
	.byte	0x37
	.byte	0xc
	.4byte	0x138
	.byte	0x10
	.byte	0
	.byte	0x10
	.4byte	.LASF74
	.byte	0x38
	.byte	0x9
	.byte	0x3a
	.byte	0x8
	.4byte	0x51e
	.byte	0xd
	.4byte	.LASF64
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x51e
	.byte	0
	.byte	0x11
	.string	"end"
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x51e
	.byte	0x8
	.byte	0xd
	.4byte	.LASF65
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x51e
	.byte	0x10
	.byte	0x11
	.string	"ptr"
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x51e
	.byte	0x18
	.byte	0xd
	.4byte	.LASF66
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x51e
	.byte	0x20
	.byte	0xd
	.4byte	.LASF36
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x90
	.byte	0x28
	.byte	0xd
	.4byte	.LASF67
	.byte	0x9
	.byte	0x3a
	.byte	0x1a
	.4byte	0x90
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x480
	.byte	0x7
	.4byte	.LASF74
	.byte	0x9
	.byte	0x3b
	.byte	0x25
	.4byte	0x4b5
	.byte	0x7
	.4byte	.LASF75
	.byte	0xa
	.byte	0x3f
	.byte	0x10
	.4byte	0x4e
	.byte	0x7
	.4byte	.LASF76
	.byte	0xa
	.byte	0xb7
	.byte	0x10
	.4byte	0x84
	.byte	0x10
	.4byte	.LASF77
	.byte	0x40
	.byte	0xa
	.byte	0xf3
	.byte	0x8
	.4byte	0x58a
	.byte	0xd
	.4byte	.LASF37
	.byte	0xa
	.byte	0xf4
	.byte	0x1d
	.4byte	0x58a
	.byte	0
	.byte	0xd
	.4byte	.LASF78
	.byte	0xa
	.byte	0xf5
	.byte	0xa
	.4byte	0x78
	.byte	0x8
	.byte	0xd
	.4byte	.LASF79
	.byte	0xa
	.byte	0xf6
	.byte	0xa
	.4byte	0x78
	.byte	0x10
	.byte	0xd
	.4byte	.LASF80
	.byte	0xa
	.byte	0xf7
	.byte	0xa
	.4byte	0x590
	.byte	0x18
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x548
	.byte	0xa
	.4byte	0x18d
	.4byte	0x5a0
	.byte	0xe
	.4byte	0x2d
	.byte	0x4
	.byte	0
	.byte	0x7
	.4byte	.LASF81
	.byte	0xa
	.byte	0xfa
	.byte	0x26
	.4byte	0x58a
	.byte	0x3
	.4byte	.LASF82
	.byte	0xb
	.byte	0x18
	.byte	0x10
	.4byte	0x5b8
	.byte	0x5
	.byte	0x8
	.4byte	0x5be
	.byte	0x12
	.4byte	0x5ce
	.byte	0x13
	.4byte	0x120
	.byte	0x13
	.4byte	0x18d
	.byte	0
	.byte	0x7
	.4byte	.LASF83
	.byte	0xb
	.byte	0x1e
	.byte	0x10
	.4byte	0x84
	.byte	0x12
	.4byte	0x5e5
	.byte	0x13
	.4byte	0x5ac
	.byte	0
	.byte	0x7
	.4byte	.LASF84
	.byte	0xb
	.byte	0x28
	.byte	0x13
	.4byte	0x5f1
	.byte	0x5
	.byte	0x8
	.4byte	0x5da
	.byte	0x7
	.4byte	.LASF85
	.byte	0xc
	.byte	0x18
	.byte	0x6
	.4byte	0x23d
	.byte	0x7
	.4byte	.LASF86
	.byte	0xc
	.byte	0x19
	.byte	0x6
	.4byte	0x23d
	.byte	0x7
	.4byte	.LASF87
	.byte	0xc
	.byte	0x1a
	.byte	0x6
	.4byte	0x23d
	.byte	0x7
	.4byte	.LASF88
	.byte	0xc
	.byte	0x1d
	.byte	0x6
	.4byte	0x78
	.byte	0x7
	.4byte	.LASF89
	.byte	0xc
	.byte	0x1e
	.byte	0x6
	.4byte	0x78
	.byte	0x7
	.4byte	.LASF90
	.byte	0xc
	.byte	0x1f
	.byte	0x6
	.4byte	0x78
	.byte	0x7
	.4byte	.LASF91
	.byte	0xc
	.byte	0x20
	.byte	0x6
	.4byte	0x78
	.byte	0x7
	.4byte	.LASF92
	.byte	0xc
	.byte	0x21
	.byte	0x6
	.4byte	0x78
	.byte	0x7
	.4byte	.LASF93
	.byte	0xc
	.byte	0x22
	.byte	0x6
	.4byte	0x78
	.byte	0x7
	.4byte	.LASF94
	.byte	0xd
	.byte	0x19
	.byte	0xe
	.4byte	0x120
	.byte	0x7
	.4byte	.LASF95
	.byte	0xd
	.byte	0x1a
	.byte	0xe
	.4byte	0x120
	.byte	0x7
	.4byte	.LASF96
	.byte	0x1
	.byte	0x21
	.byte	0x10
	.4byte	0x84
	.byte	0x3
	.4byte	.LASF97
	.byte	0x1
	.byte	0x40
	.byte	0x11
	.4byte	0x84
	.byte	0x14
	.4byte	.LASF99
	.byte	0x1
	.byte	0x7e
	.byte	0xe
	.4byte	0x9c
	.byte	0x9
	.byte	0x3
	.8byte	compact_fl
	.byte	0x15
	.4byte	.LASF98
	.byte	0x1
	.2byte	0x1a7
	.byte	0x9
	.4byte	0x84
	.byte	0x9
	.byte	0x3
	.8byte	caml_percent_max
	.byte	0x16
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x1fa
	.byte	0x6
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x830
	.byte	0x17
	.string	"fw"
	.byte	0x1
	.2byte	0x204
	.byte	0x9
	.4byte	0x34
	.4byte	.LLST43
	.byte	0x17
	.string	"fp"
	.byte	0x1
	.2byte	0x204
	.byte	0xd
	.4byte	0x34
	.4byte	.LLST44
	.byte	0x18
	.8byte	.LVL179
	.4byte	0xeb4
	.4byte	0x716
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x18
	.8byte	.LVL187
	.4byte	0xec0
	.4byte	0x73c
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xa
	.2byte	0x200
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC6
	.byte	0
	.byte	0x18
	.8byte	.LVL188
	.4byte	0xec0
	.4byte	0x762
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xa
	.2byte	0x200
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC7
	.byte	0
	.byte	0x18
	.8byte	.LVL189
	.4byte	0xec0
	.4byte	0x791
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xa
	.2byte	0x200
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC8
	.byte	0x19
	.byte	0x1
	.byte	0x5c
	.byte	0x5
	.byte	0xf5
	.byte	0x28
	.byte	0x34
	.byte	0xf7
	.byte	0x2d
	.byte	0
	.byte	0x18
	.8byte	.LVL192
	.4byte	0xec0
	.4byte	0x7b7
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xa
	.2byte	0x200
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC9
	.byte	0
	.byte	0x1a
	.8byte	.LVL193
	.4byte	0xecd
	.byte	0x1a
	.8byte	.LVL194
	.4byte	0xed9
	.byte	0x18
	.8byte	.LVL198
	.4byte	0xec0
	.4byte	0x800
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xa
	.2byte	0x200
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC10
	.byte	0x19
	.byte	0x1
	.byte	0x5c
	.byte	0x5
	.byte	0xf5
	.byte	0x28
	.byte	0x34
	.byte	0xf7
	.byte	0x2d
	.byte	0
	.byte	0x1a
	.8byte	.LVL199
	.4byte	0x830
	.byte	0x1b
	.8byte	.LVL200
	.4byte	0xec0
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xa
	.2byte	0x200
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC11
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LASF101
	.byte	0x1
	.2byte	0x1a9
	.byte	0x6
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x959
	.byte	0x1c
	.4byte	.LASF102
	.byte	0x1
	.2byte	0x1ab
	.byte	0xb
	.4byte	0x84
	.4byte	.LLST41
	.byte	0x1c
	.4byte	.LASF103
	.byte	0x1
	.2byte	0x1ab
	.byte	0x17
	.4byte	0x84
	.4byte	.LLST42
	.byte	0x1d
	.8byte	.LBB30
	.8byte	.LBE30-.LBB30
	.4byte	0x93e
	.byte	0x1e
	.4byte	.LASF104
	.byte	0x1
	.2byte	0x1db
	.byte	0xb
	.4byte	0x9c
	.byte	0x1
	.byte	0x58
	.byte	0x18
	.8byte	.LVL172
	.4byte	0xec0
	.4byte	0x8c1
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x40
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC2
	.byte	0x19
	.byte	0x1
	.byte	0x5c
	.byte	0x4
	.byte	0x78
	.byte	0
	.byte	0x3a
	.byte	0x25
	.byte	0
	.byte	0x18
	.8byte	.LVL173
	.4byte	0xee5
	.4byte	0x8db
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x4
	.byte	0x78
	.byte	0
	.byte	0x33
	.byte	0x24
	.byte	0
	.byte	0x18
	.8byte	.LVL175
	.4byte	0xef1
	.4byte	0x8ff
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0x19
	.byte	0x1
	.byte	0x5d
	.byte	0x3
	.byte	0xa
	.2byte	0x200
	.byte	0
	.byte	0x18
	.8byte	.LVL176
	.4byte	0xefd
	.4byte	0x91c
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x1a
	.8byte	.LVL177
	.4byte	0x959
	.byte	0x1b
	.8byte	.LVL178
	.4byte	0xf09
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1a
	.8byte	.LVL164
	.4byte	0x959
	.byte	0x1a
	.8byte	.LVL168
	.4byte	0xeb4
	.byte	0
	.byte	0x1f
	.4byte	.LASF111
	.byte	0x1
	.byte	0x9f
	.byte	0xd
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0xd61
	.byte	0x20
	.string	"ch"
	.byte	0x1
	.byte	0xa1
	.byte	0x9
	.4byte	0x9c
	.4byte	.LLST9
	.byte	0x21
	.4byte	.LASF105
	.byte	0x1
	.byte	0xa1
	.byte	0xe
	.4byte	0x9c
	.4byte	.LLST10
	.byte	0x22
	.4byte	.Ldebug_ranges0+0x30
	.4byte	0x9d2
	.byte	0x20
	.string	"p"
	.byte	0x1
	.byte	0xad
	.byte	0x11
	.4byte	0xd61
	.4byte	.LLST11
	.byte	0x23
	.4byte	.Ldebug_ranges0+0x60
	.byte	0x20
	.string	"hd"
	.byte	0x1
	.byte	0xb1
	.byte	0x12
	.4byte	0x12c
	.4byte	.LLST12
	.byte	0x20
	.string	"sz"
	.byte	0x1
	.byte	0xb2
	.byte	0x12
	.4byte	0x138
	.4byte	.LLST13
	.byte	0
	.byte	0
	.byte	0x22
	.4byte	.Ldebug_ranges0+0x90
	.4byte	0xa52
	.byte	0x20
	.string	"p"
	.byte	0x1
	.byte	0xd0
	.byte	0xd
	.4byte	0xd67
	.4byte	.LLST14
	.byte	0x23
	.4byte	.Ldebug_ranges0+0xc0
	.byte	0x20
	.string	"q"
	.byte	0x1
	.byte	0xd4
	.byte	0xe
	.4byte	0x687
	.4byte	.LLST15
	.byte	0x20
	.string	"sz"
	.byte	0x1
	.byte	0xd5
	.byte	0x10
	.4byte	0x42
	.4byte	.LLST16
	.byte	0x20
	.string	"i"
	.byte	0x1
	.byte	0xd5
	.byte	0x14
	.4byte	0x42
	.4byte	.LLST17
	.byte	0x20
	.string	"t"
	.byte	0x1
	.byte	0xd6
	.byte	0xf
	.4byte	0x144
	.4byte	.LLST18
	.byte	0x21
	.4byte	.LASF106
	.byte	0x1
	.byte	0xd7
	.byte	0xf
	.4byte	0xd67
	.4byte	.LLST19
	.byte	0x1b
	.8byte	.LVL67
	.4byte	0xe3c
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.byte	0x82
	.byte	0
	.byte	0x33
	.byte	0x24
	.byte	0x83
	.byte	0
	.byte	0x22
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1d
	.8byte	.LBB12
	.8byte	.LBE12-.LBB12
	.4byte	0xad1
	.byte	0x20
	.string	"pp"
	.byte	0x1
	.byte	0xef
	.byte	0xe
	.4byte	0x18d
	.4byte	.LLST20
	.byte	0x20
	.string	"p"
	.byte	0x1
	.byte	0xf0
	.byte	0xd
	.4byte	0x120
	.4byte	.LLST21
	.byte	0x20
	.string	"q"
	.byte	0x1
	.byte	0xf1
	.byte	0xc
	.4byte	0x687
	.4byte	.LLST22
	.byte	0x20
	.string	"sz"
	.byte	0x1
	.byte	0xf2
	.byte	0xe
	.4byte	0x42
	.4byte	.LLST23
	.byte	0x20
	.string	"i"
	.byte	0x1
	.byte	0xf2
	.byte	0x12
	.4byte	0x42
	.4byte	.LLST24
	.byte	0x1a
	.8byte	.LVL79
	.4byte	0xe3c
	.byte	0x1b
	.8byte	.LVL81
	.4byte	0xe3c
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x85
	.byte	0
	.byte	0
	.byte	0
	.byte	0x22
	.4byte	.Ldebug_ranges0+0xf0
	.4byte	0xba8
	.byte	0x17
	.string	"p"
	.byte	0x1
	.2byte	0x10c
	.byte	0xd
	.4byte	0xd67
	.4byte	.LLST25
	.byte	0x23
	.4byte	.Ldebug_ranges0+0x120
	.byte	0x17
	.string	"q"
	.byte	0x1
	.2byte	0x110
	.byte	0xe
	.4byte	0x687
	.4byte	.LLST26
	.byte	0x23
	.4byte	.Ldebug_ranges0+0x150
	.byte	0x17
	.string	"sz"
	.byte	0x1
	.2byte	0x114
	.byte	0x12
	.4byte	0x42
	.4byte	.LLST27
	.byte	0x17
	.string	"t"
	.byte	0x1
	.2byte	0x115
	.byte	0x11
	.4byte	0x144
	.4byte	.LLST28
	.byte	0x1c
	.4byte	.LASF107
	.byte	0x1
	.2byte	0x116
	.byte	0x11
	.4byte	0x9c
	.4byte	.LLST29
	.byte	0x1c
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x11a
	.byte	0x11
	.4byte	0xd67
	.4byte	.LLST30
	.byte	0x1d
	.8byte	.LBB16
	.8byte	.LBE16-.LBB16
	.4byte	0xb6a
	.byte	0x1c
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x12f
	.byte	0x12
	.4byte	0x687
	.4byte	.LLST31
	.byte	0
	.byte	0x1d
	.8byte	.LBB17
	.8byte	.LBE17-.LBB17
	.4byte	0xb91
	.byte	0x1c
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x13c
	.byte	0x16
	.4byte	0x687
	.4byte	.LLST32
	.byte	0
	.byte	0x1b
	.8byte	.LVL93
	.4byte	0xd6d
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x84
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x22
	.4byte	.Ldebug_ranges0+0x190
	.4byte	0xc3b
	.byte	0x17
	.string	"p"
	.byte	0x1
	.2byte	0x161
	.byte	0xd
	.4byte	0xd67
	.4byte	.LLST33
	.byte	0x23
	.4byte	.Ldebug_ranges0+0x1c0
	.byte	0x17
	.string	"q"
	.byte	0x1
	.2byte	0x165
	.byte	0xe
	.4byte	0x687
	.4byte	.LLST34
	.byte	0x24
	.8byte	.LBB24
	.8byte	.LBE24-.LBB24
	.byte	0x17
	.string	"sz"
	.byte	0x1
	.2byte	0x167
	.byte	0x12
	.4byte	0x42
	.4byte	.LLST35
	.byte	0x1c
	.4byte	.LASF107
	.byte	0x1
	.2byte	0x168
	.byte	0x11
	.4byte	0x9c
	.4byte	.LLST36
	.byte	0x18
	.8byte	.LVL134
	.4byte	0xd6d
	.4byte	0xc1e
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x1b
	.8byte	.LVL135
	.4byte	0xf15
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1d
	.8byte	.LBB27
	.8byte	.LBE27-.LBB27
	.4byte	0xca8
	.byte	0x1c
	.4byte	.LASF103
	.byte	0x1
	.2byte	0x177
	.byte	0xd
	.4byte	0x90
	.4byte	.LLST37
	.byte	0x1c
	.4byte	.LASF108
	.byte	0x1
	.2byte	0x178
	.byte	0xd
	.4byte	0x90
	.4byte	.LLST38
	.byte	0x1c
	.4byte	.LASF109
	.byte	0x1
	.2byte	0x179
	.byte	0xd
	.4byte	0x90
	.4byte	.LLST39
	.byte	0x23
	.4byte	.Ldebug_ranges0+0x1f0
	.byte	0x1c
	.4byte	.LASF110
	.byte	0x1
	.2byte	0x189
	.byte	0xd
	.4byte	0x9c
	.4byte	.LLST40
	.byte	0x1a
	.8byte	.LVL152
	.4byte	0xf21
	.byte	0
	.byte	0
	.byte	0x18
	.8byte	.LVL29
	.4byte	0xec0
	.4byte	0xccc
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x40
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC0
	.byte	0
	.byte	0x18
	.8byte	.LVL44
	.4byte	0xf2d
	.4byte	0xcf0
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	caml_invert_root
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x1a
	.8byte	.LVL45
	.4byte	0xf39
	.byte	0x1a
	.8byte	.LVL86
	.4byte	0xdbe
	.byte	0x1a
	.8byte	.LVL130
	.4byte	0xdbe
	.byte	0x1a
	.8byte	.LVL158
	.4byte	0xf45
	.byte	0x18
	.8byte	.LVL160
	.4byte	0xef1
	.4byte	0xd40
	.byte	0x19
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x31
	.byte	0x19
	.byte	0x1
	.byte	0x5d
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x1b
	.8byte	.LVL161
	.4byte	0xec0
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x40
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x12c
	.byte	0x5
	.byte	0x8
	.4byte	0x687
	.byte	0x25
	.4byte	.LASF132
	.byte	0x1
	.byte	0x8b
	.byte	0xe
	.4byte	0x9c
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0xdbe
	.byte	0x26
	.4byte	.LASF36
	.byte	0x1
	.byte	0x8b
	.byte	0x29
	.4byte	0x138
	.4byte	.LLST1
	.byte	0x14
	.4byte	.LASF104
	.byte	0x1
	.byte	0x8d
	.byte	0x9
	.4byte	0x9c
	.byte	0x1
	.byte	0x5f
	.byte	0x20
	.string	"adr"
	.byte	0x1
	.byte	0x8d
	.byte	0x11
	.4byte	0x9c
	.4byte	.LLST2
	.byte	0
	.byte	0x1f
	.4byte	.LASF112
	.byte	0x1
	.byte	0x80
	.byte	0xd
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0xdec
	.byte	0x20
	.string	"ch"
	.byte	0x1
	.byte	0x82
	.byte	0x9
	.4byte	0x9c
	.4byte	.LLST0
	.byte	0
	.byte	0x27
	.4byte	.LASF113
	.byte	0x1
	.byte	0x79
	.byte	0x6
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0xe3c
	.byte	0x28
	.string	"v"
	.byte	0x1
	.byte	0x79
	.byte	0x1e
	.4byte	0x120
	.4byte	.LLST7
	.byte	0x28
	.string	"p"
	.byte	0x1
	.byte	0x79
	.byte	0x28
	.4byte	0x18d
	.4byte	.LLST8
	.byte	0x1b
	.8byte	.LVL28
	.4byte	0xe3c
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0
	.byte	0x1f
	.4byte	.LASF114
	.byte	0x1
	.byte	0x42
	.byte	0xd
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0xeb4
	.byte	0x28
	.string	"p"
	.byte	0x1
	.byte	0x42
	.byte	0x26
	.4byte	0xd67
	.4byte	.LLST3
	.byte	0x20
	.string	"q"
	.byte	0x1
	.byte	0x44
	.byte	0x8
	.4byte	0x687
	.4byte	.LLST4
	.byte	0x22
	.4byte	.Ldebug_ranges0+0
	.4byte	0xe9f
	.byte	0x20
	.string	"val"
	.byte	0x1
	.byte	0x56
	.byte	0xf
	.4byte	0x120
	.4byte	.LLST5
	.byte	0x20
	.string	"hp"
	.byte	0x1
	.byte	0x58
	.byte	0xf
	.4byte	0xd67
	.4byte	.LLST6
	.byte	0
	.byte	0x1b
	.8byte	.LVL15
	.4byte	0xf51
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0
	.byte	0x29
	.4byte	.LASF115
	.4byte	.LASF115
	.byte	0x8
	.byte	0x4d
	.byte	0x9
	.byte	0x2a
	.4byte	.LASF116
	.4byte	.LASF116
	.byte	0x4
	.2byte	0x16a
	.byte	0x6
	.byte	0x29
	.4byte	.LASF117
	.4byte	.LASF117
	.byte	0x9
	.byte	0x3e
	.byte	0xd
	.byte	0x29
	.4byte	.LASF118
	.4byte	.LASF118
	.byte	0x8
	.byte	0x51
	.byte	0x6
	.byte	0x29
	.4byte	.LASF119
	.4byte	.LASF119
	.byte	0xa
	.byte	0x39
	.byte	0x12
	.byte	0x29
	.4byte	.LASF120
	.4byte	.LASF120
	.byte	0x7
	.byte	0x21
	.byte	0x6
	.byte	0x29
	.4byte	.LASF121
	.4byte	.LASF121
	.byte	0xa
	.byte	0xc1
	.byte	0x5
	.byte	0x29
	.4byte	.LASF122
	.4byte	.LASF122
	.byte	0xa
	.byte	0x3a
	.byte	0x11
	.byte	0x29
	.4byte	.LASF123
	.4byte	.LASF123
	.byte	0xe
	.byte	0x9
	.byte	0x7
	.byte	0x29
	.4byte	.LASF124
	.4byte	.LASF124
	.byte	0x1
	.byte	0x22
	.byte	0xd
	.byte	0x29
	.4byte	.LASF125
	.4byte	.LASF125
	.byte	0xb
	.byte	0x1d
	.byte	0x6
	.byte	0x29
	.4byte	.LASF126
	.4byte	.LASF126
	.byte	0xf
	.byte	0x1b
	.byte	0x6
	.byte	0x29
	.4byte	.LASF127
	.4byte	.LASF127
	.byte	0x7
	.byte	0x1e
	.byte	0x6
	.byte	0x29
	.4byte	.LASF128
	.4byte	.LASF128
	.byte	0x6
	.byte	0x3d
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
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
	.byte	0xd
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
	.byte	0x15
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x18
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
	.byte	0x19
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
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
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1d
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
	.byte	0x1e
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x21
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
	.byte	0x22
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x23
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x24
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x25
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
	.byte	0x26
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
	.byte	0x27
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
	.byte	0x28
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
	.byte	0x29
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
	.byte	0x2a
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
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST43:
	.8byte	.LVL180-.Ltext0
	.8byte	.LVL181-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x2f
	.8byte	.LVL184-.Ltext0
	.8byte	.LVL186-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x2f
	.8byte	.LVL195-.Ltext0
	.8byte	.LVL198-1-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x2e
	.8byte	0
	.8byte	0
.LLST44:
	.8byte	.LVL182-.Ltext0
	.8byte	.LVL183-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x28
	.8byte	.LVL186-.Ltext0
	.8byte	.LVL190-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x28
	.8byte	.LVL191-.Ltext0
	.8byte	.LVL196-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x28
	.8byte	.LVL197-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x28
	.8byte	0
	.8byte	0
.LLST41:
	.8byte	.LVL166-.Ltext0
	.8byte	.LVL167-.Ltext0
	.2byte	0x4
	.byte	0x7a
	.byte	0x80,0x4
	.byte	0x9f
	.8byte	.LVL167-.Ltext0
	.8byte	.LVL168-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL168-.Ltext0
	.8byte	.LVL169-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL170-.Ltext0
	.8byte	.LVL171-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL171-.Ltext0
	.8byte	.LVL174-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST42:
	.8byte	.LVL165-.Ltext0
	.8byte	.LVL168-1-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL44-1-.Ltext0
	.2byte	0x1
	.byte	0x60
	.8byte	.LVL46-.Ltext0
	.8byte	.LVL87-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL87-.Ltext0
	.8byte	.LVL131-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	.LVL131-.Ltext0
	.8byte	.LVL144-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL144-.Ltext0
	.8byte	.LVL145-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL145-.Ltext0
	.8byte	.LVL149-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL150-.Ltext0
	.8byte	.LVL152-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL153-.Ltext0
	.8byte	.LVL157-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL157-.Ltext0
	.8byte	.LVL162-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST10:
	.8byte	.LVL31-.Ltext0
	.8byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL43-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL47-.Ltext0
	.8byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	.LVL73-.Ltext0
	.8byte	.LVL74-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	.LVL88-.Ltext0
	.8byte	.LVL126-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL128-.Ltext0
	.8byte	.LVL129-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL132-.Ltext0
	.8byte	.LVL140-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL142-.Ltext0
	.8byte	.LVL143-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST11:
	.8byte	.LVL31-.Ltext0
	.8byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL41-.Ltext0
	.8byte	.LVL43-.Ltext0
	.2byte	0x1
	.byte	0x60
	.8byte	0
	.8byte	0
.LLST12:
	.8byte	.LVL31-.Ltext0
	.8byte	.LVL32-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL32-.Ltext0
	.8byte	.LVL33-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.byte	0
	.8byte	.LVL35-.Ltext0
	.8byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL37-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.byte	0
	.8byte	0
	.8byte	0
.LLST13:
	.8byte	.LVL31-.Ltext0
	.8byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL36-.Ltext0
	.8byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST14:
	.8byte	.LVL47-.Ltext0
	.8byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL72-.Ltext0
	.8byte	.LVL74-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST15:
	.8byte	.LVL47-.Ltext0
	.8byte	.LVL49-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL54-.Ltext0
	.8byte	.LVL56-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL59-.Ltext0
	.8byte	.LVL60-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL61-.Ltext0
	.8byte	.LVL64-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST16:
	.8byte	.LVL48-.Ltext0
	.8byte	.LVL52-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL56-.Ltext0
	.8byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL63-.Ltext0
	.8byte	.LVL70-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST17:
	.8byte	.LVL66-.Ltext0
	.8byte	.LVL69-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST18:
	.8byte	.LVL50-.Ltext0
	.8byte	.LVL51-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL56-.Ltext0
	.8byte	.LVL57-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL65-.Ltext0
	.8byte	.LVL66-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL69-.Ltext0
	.8byte	.LVL70-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST19:
	.8byte	.LVL58-.Ltext0
	.8byte	.LVL59-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL59-.Ltext0
	.8byte	.LVL62-.Ltext0
	.2byte	0x8
	.byte	0x79
	.byte	0
	.byte	0x33
	.byte	0x24
	.byte	0x83
	.byte	0
	.byte	0x22
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST20:
	.8byte	.LVL75-.Ltext0
	.8byte	.LVL87-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	0
	.8byte	0
.LLST21:
	.8byte	.LVL75-.Ltext0
	.8byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL83-.Ltext0
	.8byte	.LVL88-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	0
	.8byte	0
.LLST22:
	.8byte	.LVL75-.Ltext0
	.8byte	.LVL78-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL84-.Ltext0
	.8byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST23:
	.8byte	.LVL77-.Ltext0
	.8byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST24:
	.8byte	.LVL77-.Ltext0
	.8byte	.LVL78-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	.LVL78-.Ltext0
	.8byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST25:
	.8byte	.LVL88-.Ltext0
	.8byte	.LVL126-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL127-.Ltext0
	.8byte	.LVL129-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	0
	.8byte	0
.LLST26:
	.8byte	.LVL88-.Ltext0
	.8byte	.LVL90-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL94-.Ltext0
	.8byte	.LVL95-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL97-.Ltext0
	.8byte	.LVL98-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL99-.Ltext0
	.8byte	.LVL102-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL104-.Ltext0
	.8byte	.LVL105-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL105-.Ltext0
	.8byte	.LVL106-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL106-.Ltext0
	.8byte	.LVL110-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL112-.Ltext0
	.8byte	.LVL113-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL113-.Ltext0
	.8byte	.LVL115-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL115-.Ltext0
	.8byte	.LVL116-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL118-.Ltext0
	.8byte	.LVL119-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL119-.Ltext0
	.8byte	.LVL120-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL120-.Ltext0
	.8byte	.LVL121-.Ltext0
	.2byte	0x2
	.byte	0x82
	.byte	0
	.8byte	.LVL123-.Ltext0
	.8byte	.LVL125-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST27:
	.8byte	.LVL89-.Ltext0
	.8byte	.LVL100-.Ltext0
	.2byte	0x1
	.byte	0x67
	.8byte	.LVL101-.Ltext0
	.8byte	.LVL107-.Ltext0
	.2byte	0x1
	.byte	0x67
	.8byte	.LVL107-.Ltext0
	.8byte	.LVL108-.Ltext0
	.2byte	0x3
	.byte	0x87
	.byte	0x1
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST28:
	.8byte	.LVL91-.Ltext0
	.8byte	.LVL109-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	0
	.8byte	0
.LLST29:
	.8byte	.LVL93-.Ltext0
	.8byte	.LVL95-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL104-.Ltext0
	.8byte	.LVL119-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST30:
	.8byte	.LVL92-.Ltext0
	.8byte	.LVL95-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL96-.Ltext0
	.8byte	.LVL119-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST31:
	.8byte	.LVL105-.Ltext0
	.8byte	.LVL106-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST32:
	.8byte	.LVL114-.Ltext0
	.8byte	.LVL115-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST33:
	.8byte	.LVL132-.Ltext0
	.8byte	.LVL140-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL141-.Ltext0
	.8byte	.LVL143-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST34:
	.8byte	.LVL132-.Ltext0
	.8byte	.LVL134-1-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL137-.Ltext0
	.8byte	.LVL138-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL138-.Ltext0
	.8byte	.LVL139-.Ltext0
	.2byte	0x2
	.byte	0x79
	.byte	0
	.8byte	0
	.8byte	0
.LLST35:
	.8byte	.LVL133-.Ltext0
	.8byte	.LVL136-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST36:
	.8byte	.LVL134-.Ltext0
	.8byte	.LVL135-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST37:
	.8byte	.LVL143-.Ltext0
	.8byte	.LVL145-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL145-.Ltext0
	.8byte	.LVL151-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST38:
	.8byte	.LVL143-.Ltext0
	.8byte	.LVL145-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL145-.Ltext0
	.8byte	.LVL163-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST39:
	.8byte	.LVL150-.Ltext0
	.8byte	.LVL157-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST40:
	.8byte	.LVL151-.Ltext0
	.8byte	.LVL153-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL154-.Ltext0
	.8byte	.LVL156-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL7-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x6
	.byte	0x7f
	.byte	0
	.byte	0x7d
	.byte	0
	.byte	0x22
	.byte	0x9f
	.8byte	.LVL8-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL26-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL27-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL26-.Ltext0
	.8byte	.LVL28-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL28-1-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL13-.Ltext0
	.8byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL22-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL22-.Ltext0
	.8byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL24-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL24-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL25-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL10-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL13-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL24-.Ltext0
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
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.8byte	.LBB2-.Ltext0
	.8byte	.LBE2-.Ltext0
	.8byte	.LBB3-.Ltext0
	.8byte	.LBE3-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB4-.Ltext0
	.8byte	.LBE4-.Ltext0
	.8byte	.LBB7-.Ltext0
	.8byte	.LBE7-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB5-.Ltext0
	.8byte	.LBE5-.Ltext0
	.8byte	.LBB6-.Ltext0
	.8byte	.LBE6-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB8-.Ltext0
	.8byte	.LBE8-.Ltext0
	.8byte	.LBB11-.Ltext0
	.8byte	.LBE11-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB9-.Ltext0
	.8byte	.LBE9-.Ltext0
	.8byte	.LBB10-.Ltext0
	.8byte	.LBE10-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB13-.Ltext0
	.8byte	.LBE13-.Ltext0
	.8byte	.LBB21-.Ltext0
	.8byte	.LBE21-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB14-.Ltext0
	.8byte	.LBE14-.Ltext0
	.8byte	.LBB20-.Ltext0
	.8byte	.LBE20-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB15-.Ltext0
	.8byte	.LBE15-.Ltext0
	.8byte	.LBB18-.Ltext0
	.8byte	.LBE18-.Ltext0
	.8byte	.LBB19-.Ltext0
	.8byte	.LBE19-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB22-.Ltext0
	.8byte	.LBE22-.Ltext0
	.8byte	.LBB26-.Ltext0
	.8byte	.LBE26-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB23-.Ltext0
	.8byte	.LBE23-.Ltext0
	.8byte	.LBB25-.Ltext0
	.8byte	.LBE25-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB28-.Ltext0
	.8byte	.LBE28-.Ltext0
	.8byte	.LBB29-.Ltext0
	.8byte	.LBE29-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF97:
	.string	"word"
.LASF66:
	.string	"limit"
.LASF56:
	.string	"caml_young_alloc_start"
.LASF131:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF100:
	.string	"caml_compact_heap_maybe"
.LASF118:
	.string	"caml_finish_major_cycle"
.LASF99:
	.string	"compact_fl"
.LASF13:
	.string	"caml_timing_hook"
.LASF110:
	.string	"next_chunk"
.LASF96:
	.string	"caml_percent_free"
.LASF60:
	.string	"caml_young_trigger"
.LASF6:
	.string	"short int"
.LASF8:
	.string	"size_t"
.LASF73:
	.string	"caml_custom_elt"
.LASF40:
	.string	"caml_gc_subphase"
.LASF89:
	.string	"caml_stat_major_collections"
.LASF130:
	.string	"compact.c"
.LASF59:
	.string	"caml_young_limit"
.LASF128:
	.string	"caml_page_table_lookup"
.LASF57:
	.string	"caml_young_alloc_end"
.LASF92:
	.string	"caml_stat_compactions"
.LASF116:
	.string	"caml_gc_message"
.LASF129:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF22:
	.string	"value"
.LASF68:
	.string	"caml_ref_table"
.LASF49:
	.string	"caml_gc_sweep_hp"
.LASF16:
	.string	"caml_minor_gc_begin_hook"
.LASF26:
	.string	"color_t"
.LASF106:
	.string	"infixes"
.LASF112:
	.string	"init_compact_allocate"
.LASF81:
	.string	"caml_local_roots"
.LASF25:
	.string	"tag_t"
.LASF101:
	.string	"caml_compact_heap"
.LASF91:
	.string	"caml_stat_top_heap_wsz"
.LASF82:
	.string	"scanning_action"
.LASF55:
	.string	"caml_major_gc_hook"
.LASF103:
	.string	"live"
.LASF54:
	.string	"caml_gc_clock"
.LASF79:
	.string	"nitems"
.LASF19:
	.string	"caml_finalise_end_hook"
.LASF3:
	.string	"long long int"
.LASF83:
	.string	"caml_incremental_roots_count"
.LASF84:
	.string	"caml_scan_roots_hook"
.LASF51:
	.string	"caml_major_ring"
.LASF65:
	.string	"threshold"
.LASF80:
	.string	"tables"
.LASF9:
	.string	"intnat"
.LASF2:
	.string	"long int"
.LASF71:
	.string	"offset"
.LASF67:
	.string	"reserve"
.LASF102:
	.string	"target_wsz"
.LASF75:
	.string	"caml_huge_fallback_count"
.LASF34:
	.string	"block"
.LASF33:
	.string	"caml_fl_cur_wsz"
.LASF21:
	.string	"caml_runtime_warnings"
.LASF23:
	.string	"header_t"
.LASF1:
	.string	"float"
.LASF111:
	.string	"do_compaction"
.LASF98:
	.string	"caml_percent_max"
.LASF15:
	.string	"caml_major_slice_end_hook"
.LASF27:
	.string	"caml_atom_table"
.LASF109:
	.string	"wanted"
.LASF4:
	.string	"long double"
.LASF18:
	.string	"caml_finalise_begin_hook"
.LASF63:
	.string	"caml_extra_heap_resources_minor"
.LASF123:
	.string	"memmove"
.LASF45:
	.string	"caml_dependent_allocated"
.LASF114:
	.string	"invert_pointer_at"
.LASF132:
	.string	"compact_allocate"
.LASF24:
	.string	"mlsize_t"
.LASF119:
	.string	"caml_alloc_for_heap"
.LASF77:
	.string	"caml__roots_block"
.LASF10:
	.string	"uintnat"
.LASF30:
	.string	"caml_young_end"
.LASF122:
	.string	"caml_free_for_heap"
.LASF5:
	.string	"unsigned int"
.LASF85:
	.string	"caml_stat_minor_words"
.LASF121:
	.string	"caml_page_table_add"
.LASF113:
	.string	"caml_invert_root"
.LASF70:
	.string	"ephe"
.LASF14:
	.string	"caml_major_slice_begin_hook"
.LASF7:
	.string	"short unsigned int"
.LASF126:
	.string	"caml_final_invert_finalisable_values"
.LASF104:
	.string	"chunk"
.LASF29:
	.string	"caml_young_start"
.LASF12:
	.string	"char"
.LASF115:
	.string	"caml_clip_heap_chunk_wsz"
.LASF38:
	.string	"heap_chunk_head"
.LASF124:
	.string	"caml_shrink_heap"
.LASF52:
	.string	"caml_major_ring_index"
.LASF95:
	.string	"caml_ephe_none"
.LASF120:
	.string	"caml_make_free_blocks"
.LASF117:
	.string	"caml_empty_minor_heap"
.LASF39:
	.string	"caml_gc_phase"
.LASF61:
	.string	"caml_minor_heap_wsz"
.LASF20:
	.string	"caml_verb_gc"
.LASF17:
	.string	"caml_minor_gc_end_hook"
.LASF94:
	.string	"caml_ephe_list_head"
.LASF50:
	.string	"caml_major_window"
.LASF107:
	.string	"newadr"
.LASF0:
	.string	"long unsigned int"
.LASF31:
	.string	"caml_code_area_start"
.LASF43:
	.string	"double"
.LASF88:
	.string	"caml_stat_minor_collections"
.LASF28:
	.string	"caml_global_data"
.LASF105:
	.string	"chend"
.LASF36:
	.string	"size"
.LASF62:
	.string	"caml_in_minor_collection"
.LASF86:
	.string	"caml_stat_promoted_words"
.LASF90:
	.string	"caml_stat_heap_wsz"
.LASF46:
	.string	"caml_fl_wsz_at_phase_change"
.LASF74:
	.string	"caml_custom_table"
.LASF93:
	.string	"caml_stat_heap_chunks"
.LASF32:
	.string	"caml_code_area_end"
.LASF42:
	.string	"caml_extra_heap_resources"
.LASF41:
	.string	"caml_allocated_words"
.LASF78:
	.string	"ntables"
.LASF44:
	.string	"caml_dependent_size"
.LASF47:
	.string	"caml_heap_start"
.LASF125:
	.string	"caml_do_roots"
.LASF127:
	.string	"caml_fl_reset"
.LASF35:
	.string	"caml_alloc"
.LASF11:
	.string	"asize_t"
.LASF58:
	.string	"caml_young_ptr"
.LASF48:
	.string	"total_heap_size"
.LASF64:
	.string	"base"
.LASF53:
	.string	"caml_major_work_credit"
.LASF108:
	.string	"free"
.LASF72:
	.string	"caml_ephe_ref_table"
.LASF69:
	.string	"caml_ephe_ref_elt"
.LASF37:
	.string	"next"
.LASF87:
	.string	"caml_stat_major_words"
.LASF76:
	.string	"caml_use_huge_pages"
	.ident	"GCC: (GNU) 9.2.0"
