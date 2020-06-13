	.file	"callback.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.type	hash_value_name, @function
hash_value_name:
.LFB13:
	.file 1 "callback.c"
	.loc 1 213 1
	.cfi_startproc
.LVL0:
	.loc 1 214 3
	.loc 1 215 3
	.loc 1 215 10 is_stmt 0
	li	a5,0
.LVL1:
.L2:
	.loc 1 215 15 is_stmt 1 discriminator 1
	lbu	a3,0(a0)
	.loc 1 215 3 is_stmt 0 discriminator 1
	beq	a3,zero,.L4
	.loc 1 215 35 is_stmt 1 discriminator 3
	.loc 1 215 41 is_stmt 0 discriminator 3
	slliw	a4,a5,2
	addw	a4,a4,a5
	slliw	a4,a4,2
	subw	a5,a4,a5
.LVL2:
	.loc 1 215 37 discriminator 3
	addw	a5,a5,a3
	.loc 1 215 27 is_stmt 1 discriminator 3
	.loc 1 215 31 is_stmt 0 discriminator 3
	addi	a0,a0,1
.LVL3:
	j	.L2
.LVL4:
.L4:
	.loc 1 216 3 is_stmt 1
	.loc 1 217 1 is_stmt 0
	li	a0,13
.LVL5:
	remuw	a0,a5,a0
	ret
	.cfi_endproc
.LFE13:
	.size	hash_value_name, .-hash_value_name
	.align	1
	.globl	caml_callbackN_exn
	.type	caml_callbackN_exn, @function
caml_callbackN_exn:
.LFB8:
	.loc 1 137 1 is_stmt 1
	.cfi_startproc
.LVL6:
	addi	sp,sp,-272
	.cfi_def_cfa_offset 272
	sd	ra,264(sp)
	sd	s0,256(sp)
	sd	s1,248(sp)
	sd	s2,240(sp)
	sd	s3,232(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	sd	a0,8(sp)
	mv	s1,a1
	mv	s2,a2
	.loc 1 138 3
	lla	a4,caml_local_roots
	ld	s3,0(a4)
.LVL7:
	.loc 1 138 3
	.loc 1 138 3
	sd	s3,160(sp)
	li	a5,1
	sd	a5,176(sp)
	sd	a5,168(sp)
	addi	a3,sp,8
	sd	a3,184(sp)
.LVL8:
	.loc 1 139 3
	.loc 1 139 3
	addi	a3,sp,160
	sd	a3,96(sp)
	sd	a1,112(sp)
	sd	a5,104(sp)
	sd	a2,120(sp)
.LVL9:
	.loc 1 140 3
	.loc 1 140 3
	.loc 1 140 3
	addi	a3,sp,96
	sd	a3,24(sp)
	addi	a3,sp,24
	sd	a3,0(a4)
	sd	a5,40(sp)
	sd	a5,32(sp)
	addi	a5,sp,88
	sd	a5,48(sp)
.LVL10:
	.loc 1 141 3
	.loc 1 143 3
	.loc 1 143 7 is_stmt 0
	sd	a0,88(sp)
	.loc 1 144 3 is_stmt 1
.LVL11:
	.loc 1 144 10 is_stmt 0
	li	s0,0
	.loc 1 144 3
	j	.L6
.LVL12:
.L7:
	.loc 1 148 7 is_stmt 1
	.loc 1 148 40 is_stmt 0
	slli	a5,s0,3
	add	a5,s2,a5
	.loc 1 148 13
	ld	a1,0(a5)
	ld	a0,88(sp)
	call	caml_callback_exn
.LVL13:
	.loc 1 148 11
	sd	a0,88(sp)
	.loc 1 149 7 is_stmt 1
	.loc 1 149 11 is_stmt 0
	andi	a4,a0,3
	.loc 1 149 10
	li	a5,2
	beq	a4,a5,.L18
	.loc 1 149 37 is_stmt 1 discriminator 2
	.loc 1 150 7 discriminator 2
	.loc 1 150 9 is_stmt 0 discriminator 2
	addiw	s0,s0,1
.LVL14:
	.loc 1 151 7 is_stmt 1 discriminator 2
.L6:
	.loc 1 144 15 discriminator 1
	.loc 1 144 3 is_stmt 0 discriminator 1
	bge	s0,s1,.L19
	.loc 1 146 5 is_stmt 1
	.loc 1 146 18 is_stmt 0
	subw	a5,s1,s0
	.loc 1 146 5
	li	a4,1
	beq	a5,a4,.L7
	li	a4,2
	beq	a5,a4,.L8
	.loc 1 158 7 is_stmt 1
	.loc 1 158 41 is_stmt 0
	slli	a1,s0,3
	add	a1,s2,a1
	.loc 1 158 50
	addi	a5,s0,1
	slli	a5,a5,3
	add	a5,s2,a5
	.loc 1 158 63
	addi	a4,s0,2
	slli	a4,a4,3
	add	a4,s2,a4
	.loc 1 158 13
	ld	a3,0(a4)
	ld	a2,0(a5)
	ld	a1,0(a1)
	ld	a0,88(sp)
	call	caml_callback3_exn
.LVL15:
	.loc 1 158 11
	sd	a0,88(sp)
	.loc 1 159 7 is_stmt 1
	.loc 1 159 11 is_stmt 0
	andi	a4,a0,3
	.loc 1 159 10
	li	a5,2
	beq	a4,a5,.L20
	.loc 1 159 37 is_stmt 1 discriminator 2
	.loc 1 160 7 discriminator 2
	.loc 1 160 9 is_stmt 0 discriminator 2
	addiw	s0,s0,3
.LVL16:
	.loc 1 161 7 is_stmt 1 discriminator 2
	j	.L6
.LVL17:
.L18:
	.loc 1 149 37 discriminator 1
.LBB2:
	.loc 1 149 37 discriminator 1
	.loc 1 149 37 discriminator 1
	sd	s3,caml_local_roots,a5
	.loc 1 149 37 discriminator 1
	j	.L5
.LVL18:
.L8:
.LBE2:
	.loc 1 153 7
	.loc 1 153 41 is_stmt 0
	slli	a4,s0,3
	add	a4,s2,a4
	.loc 1 153 50
	addi	a5,s0,1
	slli	a5,a5,3
	add	a5,s2,a5
	.loc 1 153 13
	ld	a2,0(a5)
	ld	a1,0(a4)
	ld	a0,88(sp)
	call	caml_callback2_exn
.LVL19:
	.loc 1 153 11
	sd	a0,88(sp)
	.loc 1 154 7 is_stmt 1
	.loc 1 154 11 is_stmt 0
	andi	a4,a0,3
	.loc 1 154 10
	li	a5,2
	beq	a4,a5,.L21
	.loc 1 154 37 is_stmt 1 discriminator 2
	.loc 1 155 7 discriminator 2
	.loc 1 155 9 is_stmt 0 discriminator 2
	addiw	s0,s0,2
.LVL20:
	.loc 1 156 7 is_stmt 1 discriminator 2
	j	.L6
.LVL21:
.L21:
	.loc 1 154 37 discriminator 1
.LBB3:
	.loc 1 154 37 discriminator 1
	.loc 1 154 37 discriminator 1
	sd	s3,caml_local_roots,a5
	.loc 1 154 37 discriminator 1
	j	.L5
.LVL22:
.L20:
.LBE3:
	.loc 1 159 37 discriminator 1
.LBB4:
	.loc 1 159 37 discriminator 1
	.loc 1 159 37 discriminator 1
	sd	s3,caml_local_roots,a5
	.loc 1 159 37 discriminator 1
	j	.L5
.LVL23:
.L19:
.LBE4:
	.loc 1 164 3
.LBB5:
	.loc 1 164 3
	ld	a0,88(sp)
.LVL24:
	.loc 1 164 3
	sd	s3,caml_local_roots,a5
	.loc 1 164 3
.LBE5:
	.loc 1 164 3
.LVL25:
.L5:
	.loc 1 165 1 is_stmt 0
	ld	ra,264(sp)
	.cfi_restore 1
	ld	s0,256(sp)
	.cfi_restore 8
.LVL26:
	ld	s1,248(sp)
	.cfi_restore 9
	ld	s2,240(sp)
	.cfi_restore 18
.LVL27:
	ld	s3,232(sp)
	.cfi_restore 19
.LVL28:
	addi	sp,sp,272
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	caml_callbackN_exn, .-caml_callbackN_exn
	.align	1
	.globl	caml_callback
	.type	caml_callback, @function
caml_callback:
.LFB9:
	.loc 1 172 1 is_stmt 1
	.cfi_startproc
.LVL29:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 173 3
	.loc 1 173 15 is_stmt 0
	call	caml_callback_exn
.LVL30:
	.loc 1 174 3 is_stmt 1
	.loc 1 174 7 is_stmt 0
	andi	a4,a0,3
	.loc 1 174 6
	li	a5,2
	beq	a4,a5,.L25
	.loc 1 176 1
	ld	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L25:
	.cfi_restore_state
	.loc 1 174 33 is_stmt 1 discriminator 1
	andi	a0,a0,-4
.LVL31:
	call	caml_raise
.LVL32:
	.cfi_endproc
.LFE9:
	.size	caml_callback, .-caml_callback
	.align	1
	.globl	caml_callback2
	.type	caml_callback2, @function
caml_callback2:
.LFB10:
	.loc 1 179 1
	.cfi_startproc
.LVL33:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 180 3
	.loc 1 180 15 is_stmt 0
	call	caml_callback2_exn
.LVL34:
	.loc 1 181 3 is_stmt 1
	.loc 1 181 7 is_stmt 0
	andi	a4,a0,3
	.loc 1 181 6
	li	a5,2
	beq	a4,a5,.L29
	.loc 1 183 1
	ld	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L29:
	.cfi_restore_state
	.loc 1 181 33 is_stmt 1 discriminator 1
	andi	a0,a0,-4
.LVL35:
	call	caml_raise
.LVL36:
	.cfi_endproc
.LFE10:
	.size	caml_callback2, .-caml_callback2
	.align	1
	.globl	caml_callback3
	.type	caml_callback3, @function
caml_callback3:
.LFB11:
	.loc 1 187 1
	.cfi_startproc
.LVL37:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 188 3
	.loc 1 188 15 is_stmt 0
	call	caml_callback3_exn
.LVL38:
	.loc 1 189 3 is_stmt 1
	.loc 1 189 7 is_stmt 0
	andi	a4,a0,3
	.loc 1 189 6
	li	a5,2
	beq	a4,a5,.L33
	.loc 1 191 1
	ld	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L33:
	.cfi_restore_state
	.loc 1 189 33 is_stmt 1 discriminator 1
	andi	a0,a0,-4
.LVL39:
	call	caml_raise
.LVL40:
	.cfi_endproc
.LFE11:
	.size	caml_callback3, .-caml_callback3
	.align	1
	.globl	caml_callbackN
	.type	caml_callbackN, @function
caml_callbackN:
.LFB12:
	.loc 1 194 1
	.cfi_startproc
.LVL41:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 195 3
	.loc 1 195 15 is_stmt 0
	call	caml_callbackN_exn
.LVL42:
	.loc 1 196 3 is_stmt 1
	.loc 1 196 7 is_stmt 0
	andi	a4,a0,3
	.loc 1 196 6
	li	a5,2
	beq	a4,a5,.L37
	.loc 1 198 1
	ld	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L37:
	.cfi_restore_state
	.loc 1 196 33 is_stmt 1 discriminator 1
	andi	a0,a0,-4
.LVL43:
	call	caml_raise
.LVL44:
	.cfi_endproc
.LFE12:
	.size	caml_callbackN, .-caml_callbackN
	.align	1
	.globl	caml_register_named_value
	.type	caml_register_named_value, @function
caml_register_named_value:
.LFB14:
	.loc 1 220 1
	.cfi_startproc
.LVL45:
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	sd	s4,16(sp)
	sd	s5,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	mv	s2,a0
	mv	s4,a1
	.loc 1 221 3
	.loc 1 222 3
	.loc 1 222 16 is_stmt 0
	mv	s1,a0
.LVL46:
	.loc 1 223 3 is_stmt 1
	.loc 1 223 20 is_stmt 0
	call	strlen
.LVL47:
	mv	s3,a0
.LVL48:
	.loc 1 224 3 is_stmt 1
	.loc 1 224 20 is_stmt 0
	mv	a0,s2
.LVL49:
	call	hash_value_name
.LVL50:
	sext.w	s5,a0
.LVL51:
	.loc 1 226 3 is_stmt 1
	.loc 1 226 11 is_stmt 0
	slli	a5,a0,32
	srli	a5,a5,32
	slli	a5,a5,3
	lla	a0,.LANCHOR0
	add	a5,a0,a5
	ld	s0,0(a5)
.LVL52:
.L39:
	.loc 1 226 35 is_stmt 1 discriminator 1
	.loc 1 226 3 is_stmt 0 discriminator 1
	beq	s0,zero,.L44
	.loc 1 227 5 is_stmt 1
	.loc 1 227 9 is_stmt 0
	addi	a1,s0,16
	mv	a0,s1
	call	strcmp
.LVL53:
	.loc 1 227 8
	beq	a0,zero,.L45
	.loc 1 226 47 is_stmt 1 discriminator 2
	.loc 1 226 50 is_stmt 0 discriminator 2
	ld	s0,8(s0)
.LVL54:
	j	.L39
.L45:
	.loc 1 228 7 is_stmt 1
	.loc 1 228 15 is_stmt 0
	sd	s4,0(s0)
	.loc 1 229 7 is_stmt 1
	.loc 1 229 14 is_stmt 0
	j	.L41
.L44:
	.loc 1 232 3 is_stmt 1
	.loc 1 233 11 is_stmt 0
	addi	a0,s3,24
	call	caml_stat_alloc
.LVL55:
	mv	s0,a0
.LVL56:
	.loc 1 234 3 is_stmt 1
	addi	a2,s3,1
	mv	a1,s2
	addi	a0,a0,16
	call	memcpy
.LVL57:
	.loc 1 235 3
	.loc 1 235 11 is_stmt 0
	sd	s4,0(s0)
	.loc 1 236 3 is_stmt 1
	.loc 1 236 31 is_stmt 0
	slli	s5,s5,32
.LVL58:
	srli	s5,s5,32
	slli	s5,s5,3
	lla	a5,.LANCHOR0
	add	s5,a5,s5
	ld	a5,0(s5)
	.loc 1 236 12
	sd	a5,8(s0)
	.loc 1 237 3 is_stmt 1
	.loc 1 237 24 is_stmt 0
	sd	s0,0(s5)
	.loc 1 238 3 is_stmt 1
	mv	a0,s0
	call	caml_register_global_root
.LVL59:
	.loc 1 239 3
.L41:
	.loc 1 240 1 is_stmt 0
	li	a0,1
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
.LVL60:
	ld	s1,40(sp)
	.cfi_restore 9
.LVL61:
	ld	s2,32(sp)
	.cfi_restore 18
.LVL62:
	ld	s3,24(sp)
	.cfi_restore 19
.LVL63:
	ld	s4,16(sp)
	.cfi_restore 20
.LVL64:
	ld	s5,8(sp)
	.cfi_restore 21
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	caml_register_named_value, .-caml_register_named_value
	.align	1
	.globl	caml_named_value
	.type	caml_named_value, @function
caml_named_value:
.LFB15:
	.loc 1 243 1 is_stmt 1
	.cfi_startproc
.LVL65:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	mv	s1,a0
	.loc 1 244 3
	.loc 1 245 3
	.loc 1 245 31 is_stmt 0
	call	hash_value_name
.LVL66:
	.loc 1 245 11
	slli	a0,a0,32
	srli	a0,a0,32
	slli	a0,a0,3
	lla	a5,.LANCHOR0
	add	a0,a5,a0
	ld	s0,0(a0)
.LVL67:
.L47:
	.loc 1 246 8 is_stmt 1 discriminator 1
	.loc 1 245 3 is_stmt 0 discriminator 1
	beq	s0,zero,.L46
	.loc 1 248 5 is_stmt 1
	.loc 1 248 9 is_stmt 0
	addi	a1,s0,16
	mv	a0,s1
	call	strcmp
.LVL68:
	.loc 1 248 8
	beq	a0,zero,.L46
	.loc 1 247 8 is_stmt 1
	.loc 1 247 11 is_stmt 0
	ld	s0,8(s0)
.LVL69:
	j	.L47
.L46:
	.loc 1 251 1
	mv	a0,s0
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
.LVL70:
	ld	s1,8(sp)
	.cfi_restore 9
.LVL71:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE15:
	.size	caml_named_value, .-caml_named_value
	.align	1
	.globl	caml_iterate_named_values
	.type	caml_iterate_named_values, @function
caml_iterate_named_values:
.LFB16:
	.loc 1 254 1 is_stmt 1
	.cfi_startproc
.LVL72:
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
	mv	s1,a0
	.loc 1 255 3
	.loc 1 256 3
.LVL73:
	.loc 1 256 9 is_stmt 0
	li	s2,0
	.loc 1 256 3
	j	.L53
.LVL74:
.L59:
	.loc 1 256 36 is_stmt 1 discriminator 2
	.loc 1 256 37 is_stmt 0 discriminator 2
	addiw	s2,s2,1
.LVL75:
.L53:
	.loc 1 256 14 is_stmt 1 discriminator 1
	.loc 1 256 3 is_stmt 0 discriminator 1
	li	a5,12
	bgt	s2,a5,.L58
.LBB6:
	.loc 1 257 5 is_stmt 1
	.loc 1 258 5
	.loc 1 258 13 is_stmt 0
	slli	a4,s2,3
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	ld	s0,0(a5)
.LVL76:
.L54:
	.loc 1 258 37 is_stmt 1 discriminator 1
	.loc 1 258 5 is_stmt 0 discriminator 1
	beq	s0,zero,.L59
	.loc 1 259 7 is_stmt 1 discriminator 3
	addi	a1,s0,16
	mv	a0,s0
	jalr	s1
.LVL77:
	.loc 1 258 49 discriminator 3
	.loc 1 258 52 is_stmt 0 discriminator 3
	ld	s0,8(s0)
.LVL78:
	j	.L54
.LVL79:
.L58:
.LBE6:
	.loc 1 262 1
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	ld	s1,8(sp)
	.cfi_restore 9
.LVL80:
	ld	s2,0(sp)
	.cfi_restore 18
.LVL81:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE16:
	.size	caml_iterate_named_values, .-caml_iterate_named_values
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	named_value_table, @object
	.size	named_value_table, 104
named_value_table:
	.zero	104
	.text
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 3 "caml/config.h"
	.file 4 "caml/misc.h"
	.file 5 "caml/mlvalues.h"
	.file 6 "caml/callback.h"
	.file 7 "/home/sai/ocaml-freestanding-riscv/nolibc/include/signal.h"
	.file 8 "caml/fail.h"
	.file 9 "caml/freelist.h"
	.file 10 "caml/major_gc.h"
	.file 11 "caml/address_class.h"
	.file 12 "caml/minor_gc.h"
	.file 13 "caml/memory.h"
	.file 14 "/home/sai/ocaml-freestanding-riscv/nolibc/include/string.h"
	.file 15 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xccb
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF117
	.byte	0xc
	.4byte	.LASF118
	.4byte	.LASF119
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
	.byte	0xa
	.4byte	0x128
	.4byte	0x14b
	.byte	0xb
	.byte	0
	.byte	0x9
	.4byte	.LASF24
	.byte	0x5
	.2byte	0x15c
	.byte	0x15
	.4byte	0x140
	.byte	0x9
	.4byte	.LASF25
	.byte	0x5
	.2byte	0x171
	.byte	0xe
	.4byte	0x11c
	.byte	0x3
	.4byte	.LASF26
	.byte	0x6
	.byte	0x2f
	.byte	0x10
	.4byte	0x171
	.byte	0x5
	.byte	0x8
	.4byte	0x177
	.byte	0xc
	.4byte	0x187
	.byte	0xd
	.4byte	0x187
	.byte	0xd
	.4byte	0x95
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x11c
	.byte	0x8
	.4byte	.LASF27
	.byte	0x6
	.byte	0x39
	.byte	0x10
	.4byte	0x47
	.byte	0x3
	.4byte	.LASF28
	.byte	0x7
	.byte	0x4
	.byte	0xd
	.4byte	0x47
	.byte	0xe
	.4byte	.LASF61
	.byte	0x4
	.byte	0x8
	.byte	0x2c
	.byte	0x8
	.4byte	0x1c0
	.byte	0xf
	.string	"buf"
	.byte	0x8
	.byte	0x2d
	.byte	0xe
	.4byte	0x199
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	.LASF29
	.byte	0x8
	.byte	0x3e
	.byte	0x24
	.4byte	0x1cc
	.byte	0x5
	.byte	0x8
	.4byte	0x1a5
	.byte	0x8
	.4byte	.LASF30
	.byte	0x8
	.byte	0x3f
	.byte	0xe
	.4byte	0x11c
	.byte	0x8
	.4byte	.LASF31
	.byte	0x9
	.byte	0x1a
	.byte	0x10
	.4byte	0x89
	.byte	0x8
	.4byte	.LASF32
	.byte	0xa
	.byte	0x24
	.byte	0xc
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF33
	.byte	0xa
	.byte	0x25
	.byte	0xc
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF34
	.byte	0xa
	.byte	0x26
	.byte	0x10
	.4byte	0x7d
	.byte	0x8
	.4byte	.LASF35
	.byte	0xa
	.byte	0x27
	.byte	0xf
	.4byte	0x21a
	.byte	0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF36
	.byte	0x8
	.4byte	.LASF37
	.byte	0xa
	.byte	0x28
	.byte	0x10
	.4byte	0x7d
	.byte	0x8
	.4byte	.LASF38
	.byte	0xa
	.byte	0x28
	.byte	0x25
	.4byte	0x7d
	.byte	0x8
	.4byte	.LASF39
	.byte	0xa
	.byte	0x29
	.byte	0x10
	.4byte	0x7d
	.byte	0x8
	.4byte	.LASF40
	.byte	0xa
	.byte	0x3e
	.byte	0x12
	.4byte	0x95
	.byte	0x8
	.4byte	.LASF41
	.byte	0xa
	.byte	0x3f
	.byte	0x10
	.4byte	0x7d
	.byte	0x8
	.4byte	.LASF42
	.byte	0xa
	.byte	0x40
	.byte	0xe
	.4byte	0x95
	.byte	0x8
	.4byte	.LASF43
	.byte	0xa
	.byte	0x42
	.byte	0xc
	.4byte	0x47
	.byte	0xa
	.4byte	0x21a
	.4byte	0x285
	.byte	0x10
	.4byte	0x40
	.byte	0x31
	.byte	0
	.byte	0x11
	.4byte	.LASF44
	.byte	0xa
	.byte	0x43
	.byte	0x8
	.4byte	0x275
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0x11
	.4byte	.LASF45
	.byte	0xa
	.byte	0x44
	.byte	0x5
	.4byte	0x47
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0x11
	.4byte	.LASF46
	.byte	0xa
	.byte	0x45
	.byte	0x8
	.4byte	0x21a
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0x8
	.4byte	.LASF47
	.byte	0xa
	.byte	0x46
	.byte	0xf
	.4byte	0x21a
	.byte	0x8
	.4byte	.LASF48
	.byte	0xa
	.byte	0x4a
	.byte	0x13
	.4byte	0xb3
	.byte	0x8
	.4byte	.LASF49
	.byte	0xb
	.byte	0x31
	.byte	0xf
	.4byte	0x187
	.byte	0x8
	.4byte	.LASF50
	.byte	0xb
	.byte	0x31
	.byte	0x22
	.4byte	0x187
	.byte	0x8
	.4byte	.LASF51
	.byte	0xb
	.byte	0x32
	.byte	0xf
	.4byte	0x95
	.byte	0x8
	.4byte	.LASF52
	.byte	0xb
	.byte	0x32
	.byte	0x27
	.4byte	0x95
	.byte	0x8
	.4byte	.LASF53
	.byte	0xc
	.byte	0x18
	.byte	0x13
	.4byte	0x187
	.byte	0x8
	.4byte	.LASF54
	.byte	0xc
	.byte	0x18
	.byte	0x2c
	.4byte	0x187
	.byte	0x8
	.4byte	.LASF55
	.byte	0xc
	.byte	0x19
	.byte	0x13
	.4byte	0x187
	.byte	0x8
	.4byte	.LASF56
	.byte	0xc
	.byte	0x19
	.byte	0x24
	.4byte	0x187
	.byte	0x8
	.4byte	.LASF57
	.byte	0xc
	.byte	0x1a
	.byte	0x13
	.4byte	0x187
	.byte	0x8
	.4byte	.LASF58
	.byte	0xc
	.byte	0x1b
	.byte	0x10
	.4byte	0x89
	.byte	0x8
	.4byte	.LASF59
	.byte	0xc
	.byte	0x1c
	.byte	0xc
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF60
	.byte	0xc
	.byte	0x1d
	.byte	0xf
	.4byte	0x21a
	.byte	0xe
	.4byte	.LASF62
	.byte	0x38
	.byte	0xc
	.byte	0x29
	.byte	0x8
	.4byte	0x3d8
	.byte	0x12
	.4byte	.LASF63
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x3d8
	.byte	0
	.byte	0xf
	.string	"end"
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x3d8
	.byte	0x8
	.byte	0x12
	.4byte	.LASF64
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x3d8
	.byte	0x10
	.byte	0xf
	.string	"ptr"
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x3d8
	.byte	0x18
	.byte	0x12
	.4byte	.LASF65
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x3d8
	.byte	0x20
	.byte	0x12
	.4byte	.LASF66
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x89
	.byte	0x28
	.byte	0x12
	.4byte	.LASF67
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x187
	.byte	0x8
	.4byte	.LASF62
	.byte	0xc
	.byte	0x2a
	.byte	0x22
	.4byte	0x36f
	.byte	0xe
	.4byte	.LASF68
	.byte	0x10
	.byte	0xc
	.byte	0x2c
	.byte	0x8
	.4byte	0x412
	.byte	0x12
	.4byte	.LASF69
	.byte	0xc
	.byte	0x2d
	.byte	0x9
	.4byte	0x11c
	.byte	0
	.byte	0x12
	.4byte	.LASF70
	.byte	0xc
	.byte	0x2e
	.byte	0xc
	.4byte	0x134
	.byte	0x8
	.byte	0
	.byte	0xe
	.4byte	.LASF71
	.byte	0x38
	.byte	0xc
	.byte	0x31
	.byte	0x8
	.4byte	0x47b
	.byte	0x12
	.4byte	.LASF63
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x47b
	.byte	0
	.byte	0xf
	.string	"end"
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x47b
	.byte	0x8
	.byte	0x12
	.4byte	.LASF64
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x47b
	.byte	0x10
	.byte	0xf
	.string	"ptr"
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x47b
	.byte	0x18
	.byte	0x12
	.4byte	.LASF65
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x47b
	.byte	0x20
	.byte	0x12
	.4byte	.LASF66
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x89
	.byte	0x28
	.byte	0x12
	.4byte	.LASF67
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x3ea
	.byte	0x8
	.4byte	.LASF71
	.byte	0xc
	.byte	0x32
	.byte	0x27
	.4byte	0x412
	.byte	0xe
	.4byte	.LASF72
	.byte	0x18
	.byte	0xc
	.byte	0x34
	.byte	0x8
	.4byte	0x4c2
	.byte	0x12
	.4byte	.LASF73
	.byte	0xc
	.byte	0x35
	.byte	0x9
	.4byte	0x11c
	.byte	0
	.byte	0xf
	.string	"mem"
	.byte	0xc
	.byte	0x36
	.byte	0xc
	.4byte	0x134
	.byte	0x8
	.byte	0xf
	.string	"max"
	.byte	0xc
	.byte	0x37
	.byte	0xc
	.4byte	0x134
	.byte	0x10
	.byte	0
	.byte	0xe
	.4byte	.LASF74
	.byte	0x38
	.byte	0xc
	.byte	0x3a
	.byte	0x8
	.4byte	0x52b
	.byte	0x12
	.4byte	.LASF63
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x52b
	.byte	0
	.byte	0xf
	.string	"end"
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x52b
	.byte	0x8
	.byte	0x12
	.4byte	.LASF64
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x52b
	.byte	0x10
	.byte	0xf
	.string	"ptr"
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x52b
	.byte	0x18
	.byte	0x12
	.4byte	.LASF65
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x52b
	.byte	0x20
	.byte	0x12
	.4byte	.LASF66
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x89
	.byte	0x28
	.byte	0x12
	.4byte	.LASF67
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x48d
	.byte	0x8
	.4byte	.LASF74
	.byte	0xc
	.byte	0x3b
	.byte	0x25
	.4byte	0x4c2
	.byte	0x8
	.4byte	.LASF75
	.byte	0xd
	.byte	0x3f
	.byte	0x10
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF76
	.byte	0xd
	.byte	0xb7
	.byte	0x10
	.4byte	0x7d
	.byte	0xe
	.4byte	.LASF77
	.byte	0x40
	.byte	0xd
	.byte	0xf3
	.byte	0x8
	.4byte	0x597
	.byte	0x12
	.4byte	.LASF78
	.byte	0xd
	.byte	0xf4
	.byte	0x1d
	.4byte	0x597
	.byte	0
	.byte	0x12
	.4byte	.LASF79
	.byte	0xd
	.byte	0xf5
	.byte	0xa
	.4byte	0x71
	.byte	0x8
	.byte	0x12
	.4byte	.LASF80
	.byte	0xd
	.byte	0xf6
	.byte	0xa
	.4byte	0x71
	.byte	0x10
	.byte	0x12
	.4byte	.LASF81
	.byte	0xd
	.byte	0xf7
	.byte	0xa
	.4byte	0x59d
	.byte	0x18
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x555
	.byte	0xa
	.4byte	0x187
	.4byte	0x5ad
	.byte	0x10
	.4byte	0x40
	.byte	0x4
	.byte	0
	.byte	0x8
	.4byte	.LASF82
	.byte	0xd
	.byte	0xfa
	.byte	0x26
	.4byte	0x597
	.byte	0xe
	.4byte	.LASF83
	.byte	0x18
	.byte	0x1
	.byte	0xca
	.byte	0x8
	.4byte	0x5ee
	.byte	0xf
	.string	"val"
	.byte	0x1
	.byte	0xcb
	.byte	0x9
	.4byte	0x11c
	.byte	0
	.byte	0x12
	.4byte	.LASF78
	.byte	0x1
	.byte	0xcc
	.byte	0x18
	.4byte	0x5ee
	.byte	0x8
	.byte	0x12
	.4byte	.LASF84
	.byte	0x1
	.byte	0xcd
	.byte	0x8
	.4byte	0x5f4
	.byte	0x10
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x5b9
	.byte	0xa
	.4byte	0x9b
	.4byte	0x604
	.byte	0x10
	.4byte	0x40
	.byte	0
	.byte	0
	.byte	0xa
	.4byte	0x5ee
	.4byte	0x614
	.byte	0x10
	.4byte	0x40
	.byte	0xc
	.byte	0
	.byte	0x13
	.4byte	.LASF85
	.byte	0x1
	.byte	0xd2
	.byte	0x1d
	.4byte	0x604
	.byte	0x9
	.byte	0x3
	.8byte	named_value_table
	.byte	0x14
	.4byte	.LASF120
	.byte	0x1
	.byte	0xfd
	.byte	0x11
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x69d
	.byte	0x15
	.string	"f"
	.byte	0x1
	.byte	0xfd
	.byte	0x3d
	.4byte	0x165
	.4byte	.LLST35
	.byte	0x16
	.string	"i"
	.byte	0x1
	.byte	0xff
	.byte	0x7
	.4byte	0x47
	.4byte	.LLST36
	.byte	0x17
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.byte	0x18
	.string	"nv"
	.byte	0x1
	.2byte	0x101
	.byte	0x1a
	.4byte	0x5ee
	.4byte	.LLST37
	.byte	0x19
	.8byte	.LVL77
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
	.byte	0x78
	.byte	0x10
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1b
	.4byte	.LASF86
	.byte	0x1
	.byte	0xf2
	.byte	0x14
	.4byte	0x187
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x711
	.byte	0x1c
	.4byte	.LASF84
	.byte	0x1
	.byte	0xf2
	.byte	0x31
	.4byte	0x711
	.4byte	.LLST33
	.byte	0x16
	.string	"nv"
	.byte	0x1
	.byte	0xf4
	.byte	0x18
	.4byte	0x5ee
	.4byte	.LLST34
	.byte	0x1d
	.8byte	.LVL66
	.4byte	0x835
	.4byte	0x6f6
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x1e
	.8byte	.LVL68
	.4byte	0xc62
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0x10
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0xa2
	.byte	0x1b
	.4byte	.LASF87
	.byte	0x1
	.byte	0xdb
	.byte	0x10
	.4byte	0x11c
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x835
	.byte	0x1c
	.4byte	.LASF88
	.byte	0x1
	.byte	0xdb
	.byte	0x30
	.4byte	0x11c
	.4byte	.LLST27
	.byte	0x15
	.string	"val"
	.byte	0x1
	.byte	0xdb
	.byte	0x3d
	.4byte	0x11c
	.4byte	.LLST28
	.byte	0x16
	.string	"nv"
	.byte	0x1
	.byte	0xdd
	.byte	0x18
	.4byte	0x5ee
	.4byte	.LLST29
	.byte	0x1f
	.4byte	.LASF84
	.byte	0x1
	.byte	0xde
	.byte	0x10
	.4byte	0x711
	.4byte	.LLST30
	.byte	0x1f
	.4byte	.LASF89
	.byte	0x1
	.byte	0xdf
	.byte	0xa
	.4byte	0x34
	.4byte	.LLST31
	.byte	0x16
	.string	"h"
	.byte	0x1
	.byte	0xe0
	.byte	0x10
	.4byte	0x5c
	.4byte	.LLST32
	.byte	0x1d
	.8byte	.LVL47
	.4byte	0xc6e
	.4byte	0x7ae
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x1d
	.8byte	.LVL50
	.4byte	0x835
	.4byte	0x7c6
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x1d
	.8byte	.LVL53
	.4byte	0xc62
	.4byte	0x7e4
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0x10
	.byte	0
	.byte	0x1d
	.8byte	.LVL55
	.4byte	0xc7a
	.4byte	0x7fc
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x83
	.byte	0x18
	.byte	0
	.byte	0x1d
	.8byte	.LVL57
	.4byte	0xc86
	.4byte	0x820
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0x10
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
	.byte	0x83
	.byte	0x1
	.byte	0
	.byte	0x1e
	.8byte	.LVL59
	.4byte	0xc91
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x20
	.4byte	.LASF121
	.byte	0x1
	.byte	0xd4
	.byte	0x15
	.4byte	0x5c
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0x876
	.byte	0x1c
	.4byte	.LASF84
	.byte	0x1
	.byte	0xd4
	.byte	0x31
	.4byte	0x711
	.4byte	.LLST0
	.byte	0x16
	.string	"h"
	.byte	0x1
	.byte	0xd6
	.byte	0x10
	.4byte	0x5c
	.4byte	.LLST1
	.byte	0
	.byte	0x1b
	.4byte	.LASF90
	.byte	0x1
	.byte	0xc1
	.byte	0x12
	.4byte	0x11c
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x906
	.byte	0x1c
	.4byte	.LASF91
	.byte	0x1
	.byte	0xc1
	.byte	0x28
	.4byte	0x11c
	.4byte	.LLST23
	.byte	0x1c
	.4byte	.LASF92
	.byte	0x1
	.byte	0xc1
	.byte	0x35
	.4byte	0x47
	.4byte	.LLST24
	.byte	0x1c
	.4byte	.LASF93
	.byte	0x1
	.byte	0xc1
	.byte	0x41
	.4byte	0x187
	.4byte	.LLST25
	.byte	0x16
	.string	"res"
	.byte	0x1
	.byte	0xc3
	.byte	0x9
	.4byte	0x11c
	.4byte	.LLST26
	.byte	0x1d
	.8byte	.LVL42
	.4byte	0xacb
	.4byte	0x8f8
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x1a
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0
	.byte	0x21
	.8byte	.LVL44
	.4byte	0xc9e
	.byte	0
	.byte	0x1b
	.4byte	.LASF94
	.byte	0x1
	.byte	0xb9
	.byte	0x12
	.4byte	0x11c
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x9b4
	.byte	0x1c
	.4byte	.LASF91
	.byte	0x1
	.byte	0xb9
	.byte	0x28
	.4byte	0x11c
	.4byte	.LLST18
	.byte	0x1c
	.4byte	.LASF95
	.byte	0x1
	.byte	0xb9
	.byte	0x37
	.4byte	0x11c
	.4byte	.LLST19
	.byte	0x1c
	.4byte	.LASF96
	.byte	0x1
	.byte	0xb9
	.byte	0x43
	.4byte	0x11c
	.4byte	.LLST20
	.byte	0x1c
	.4byte	.LASF97
	.byte	0x1
	.byte	0xba
	.byte	0x28
	.4byte	0x11c
	.4byte	.LLST21
	.byte	0x16
	.string	"res"
	.byte	0x1
	.byte	0xbc
	.byte	0x9
	.4byte	0x11c
	.4byte	.LLST22
	.byte	0x1d
	.8byte	.LVL38
	.4byte	0xcaa
	.4byte	0x9a6
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
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x1a
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x1a
	.byte	0x1
	.byte	0x5d
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5d
	.byte	0
	.byte	0x21
	.8byte	.LVL40
	.4byte	0xc9e
	.byte	0
	.byte	0x1b
	.4byte	.LASF98
	.byte	0x1
	.byte	0xb2
	.byte	0x12
	.4byte	0x11c
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0xa4b
	.byte	0x1c
	.4byte	.LASF91
	.byte	0x1
	.byte	0xb2
	.byte	0x28
	.4byte	0x11c
	.4byte	.LLST14
	.byte	0x1c
	.4byte	.LASF95
	.byte	0x1
	.byte	0xb2
	.byte	0x37
	.4byte	0x11c
	.4byte	.LLST15
	.byte	0x1c
	.4byte	.LASF96
	.byte	0x1
	.byte	0xb2
	.byte	0x43
	.4byte	0x11c
	.4byte	.LLST16
	.byte	0x16
	.string	"res"
	.byte	0x1
	.byte	0xb4
	.byte	0x9
	.4byte	0x11c
	.4byte	.LLST17
	.byte	0x1d
	.8byte	.LVL34
	.4byte	0xcb6
	.4byte	0xa3d
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
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x1a
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0
	.byte	0x21
	.8byte	.LVL36
	.4byte	0xc9e
	.byte	0
	.byte	0x1b
	.4byte	.LASF99
	.byte	0x1
	.byte	0xab
	.byte	0x12
	.4byte	0x11c
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0xacb
	.byte	0x1c
	.4byte	.LASF91
	.byte	0x1
	.byte	0xab
	.byte	0x27
	.4byte	0x11c
	.4byte	.LLST11
	.byte	0x15
	.string	"arg"
	.byte	0x1
	.byte	0xab
	.byte	0x36
	.4byte	0x11c
	.4byte	.LLST12
	.byte	0x16
	.string	"res"
	.byte	0x1
	.byte	0xad
	.byte	0x9
	.4byte	0x11c
	.4byte	.LLST13
	.byte	0x1d
	.8byte	.LVL30
	.4byte	0xcc2
	.4byte	0xabd
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
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0x21
	.8byte	.LVL32
	.4byte	0xc9e
	.byte	0
	.byte	0x1b
	.4byte	.LASF100
	.byte	0x1
	.byte	0x88
	.byte	0x12
	.4byte	0x11c
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0xc62
	.byte	0x1c
	.4byte	.LASF91
	.byte	0x1
	.byte	0x88
	.byte	0x2b
	.4byte	0x11c
	.4byte	.LLST2
	.byte	0x1c
	.4byte	.LASF92
	.byte	0x1
	.byte	0x88
	.byte	0x38
	.4byte	0x47
	.4byte	.LLST3
	.byte	0x1c
	.4byte	.LASF93
	.byte	0x1
	.byte	0x88
	.byte	0x44
	.4byte	0x187
	.4byte	.LLST4
	.byte	0x1f
	.4byte	.LASF101
	.byte	0x1
	.byte	0x8a
	.byte	0x3
	.4byte	0x597
	.4byte	.LLST5
	.byte	0x13
	.4byte	.LASF102
	.byte	0x1
	.byte	0x8a
	.byte	0x3
	.4byte	0x555
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x7f
	.byte	0x22
	.4byte	.LASF103
	.byte	0x1
	.byte	0x8a
	.byte	0x3
	.4byte	0x47
	.byte	0
	.byte	0x13
	.4byte	.LASF104
	.byte	0x1
	.byte	0x8b
	.byte	0x3
	.4byte	0x555
	.byte	0x3
	.byte	0x91
	.byte	0xd0,0x7e
	.byte	0x22
	.4byte	.LASF105
	.byte	0x1
	.byte	0x8b
	.byte	0x3
	.4byte	0x47
	.byte	0
	.byte	0x23
	.string	"res"
	.byte	0x1
	.byte	0x8c
	.byte	0x3
	.4byte	0x11c
	.byte	0x3
	.byte	0x91
	.byte	0xc8,0x7e
	.byte	0x13
	.4byte	.LASF106
	.byte	0x1
	.byte	0x8c
	.byte	0x3
	.4byte	0x555
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7e
	.byte	0x22
	.4byte	.LASF107
	.byte	0x1
	.byte	0x8c
	.byte	0x3
	.4byte	0x47
	.byte	0
	.byte	0x16
	.string	"i"
	.byte	0x1
	.byte	0x8d
	.byte	0x7
	.4byte	0x47
	.4byte	.LLST6
	.byte	0x24
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0xbc8
	.byte	0x1f
	.4byte	.LASF108
	.byte	0x1
	.byte	0x95
	.byte	0x25
	.4byte	0x11c
	.4byte	.LLST7
	.byte	0
	.byte	0x24
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0xbee
	.byte	0x1f
	.4byte	.LASF108
	.byte	0x1
	.byte	0x9a
	.byte	0x25
	.4byte	0x11c
	.4byte	.LLST8
	.byte	0
	.byte	0x24
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0xc14
	.byte	0x1f
	.4byte	.LASF108
	.byte	0x1
	.byte	0x9f
	.byte	0x25
	.4byte	0x11c
	.4byte	.LLST9
	.byte	0
	.byte	0x24
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.4byte	0xc3a
	.byte	0x1f
	.4byte	.LASF108
	.byte	0x1
	.byte	0xa4
	.byte	0x3
	.4byte	0x11c
	.4byte	.LLST10
	.byte	0
	.byte	0x21
	.8byte	.LVL13
	.4byte	0xcc2
	.byte	0x21
	.8byte	.LVL15
	.4byte	0xcaa
	.byte	0x21
	.8byte	.LVL19
	.4byte	0xcb6
	.byte	0
	.byte	0x25
	.4byte	.LASF109
	.4byte	.LASF109
	.byte	0xe
	.byte	0xb
	.byte	0x5
	.byte	0x25
	.4byte	.LASF110
	.4byte	.LASF110
	.byte	0xe
	.byte	0xc
	.byte	0x8
	.byte	0x25
	.4byte	.LASF111
	.4byte	.LASF111
	.byte	0xd
	.byte	0x67
	.byte	0x1c
	.byte	0x26
	.4byte	.LASF122
	.4byte	.LASF123
	.byte	0xf
	.byte	0
	.byte	0x27
	.4byte	.LASF112
	.4byte	.LASF112
	.byte	0xd
	.2byte	0x22b
	.byte	0x11
	.byte	0x25
	.4byte	.LASF113
	.4byte	.LASF113
	.byte	0x8
	.byte	0x49
	.byte	0x11
	.byte	0x25
	.4byte	.LASF114
	.4byte	.LASF114
	.byte	0x6
	.byte	0x26
	.byte	0x12
	.byte	0x25
	.4byte	.LASF115
	.4byte	.LASF115
	.byte	0x6
	.byte	0x25
	.byte	0x12
	.byte	0x25
	.4byte	.LASF116
	.4byte	.LASF116
	.byte	0x6
	.byte	0x24
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
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x16
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
	.byte	0x17
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x18
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
	.byte	0x19
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
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
	.byte	0x1c
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
	.byte	0x1d
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
	.byte	0x1e
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x20
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
	.byte	0x21
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x22
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
	.byte	0x23
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
	.byte	0x24
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
	.byte	0x25
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
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST35:
	.8byte	.LVL72-.Ltext0
	.8byte	.LVL74-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL74-.Ltext0
	.8byte	.LVL80-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL80-.Ltext0
	.8byte	.LFE16-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST36:
	.8byte	.LVL73-.Ltext0
	.8byte	.LVL74-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL74-.Ltext0
	.8byte	.LVL81-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST37:
	.8byte	.LVL74-.Ltext0
	.8byte	.LVL75-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL76-.Ltext0
	.8byte	.LVL79-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST33:
	.8byte	.LVL65-.Ltext0
	.8byte	.LVL66-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL66-1-.Ltext0
	.8byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL71-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST34:
	.8byte	.LVL67-.Ltext0
	.8byte	.LVL70-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL70-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST27:
	.8byte	.LVL45-.Ltext0
	.8byte	.LVL47-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL47-1-.Ltext0
	.8byte	.LVL61-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL61-.Ltext0
	.8byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL62-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST28:
	.8byte	.LVL45-.Ltext0
	.8byte	.LVL47-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL47-1-.Ltext0
	.8byte	.LVL64-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	.LVL64-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST29:
	.8byte	.LVL52-.Ltext0
	.8byte	.LVL60-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST30:
	.8byte	.LVL46-.Ltext0
	.8byte	.LVL47-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL47-1-.Ltext0
	.8byte	.LVL61-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL61-.Ltext0
	.8byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL62-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST31:
	.8byte	.LVL48-.Ltext0
	.8byte	.LVL49-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL49-.Ltext0
	.8byte	.LVL63-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST32:
	.8byte	.LVL51-.Ltext0
	.8byte	.LVL58-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL4-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST23:
	.8byte	.LVL41-.Ltext0
	.8byte	.LVL42-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL42-1-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST24:
	.8byte	.LVL41-.Ltext0
	.8byte	.LVL42-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL42-1-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST25:
	.8byte	.LVL41-.Ltext0
	.8byte	.LVL42-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL42-1-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST26:
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL43-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST18:
	.8byte	.LVL37-.Ltext0
	.8byte	.LVL38-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL38-1-.Ltext0
	.8byte	.LFE11-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST19:
	.8byte	.LVL37-.Ltext0
	.8byte	.LVL38-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL38-1-.Ltext0
	.8byte	.LFE11-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST20:
	.8byte	.LVL37-.Ltext0
	.8byte	.LVL38-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL38-1-.Ltext0
	.8byte	.LFE11-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST21:
	.8byte	.LVL37-.Ltext0
	.8byte	.LVL38-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL38-1-.Ltext0
	.8byte	.LFE11-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5d
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST22:
	.8byte	.LVL38-.Ltext0
	.8byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST14:
	.8byte	.LVL33-.Ltext0
	.8byte	.LVL34-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL34-1-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST15:
	.8byte	.LVL33-.Ltext0
	.8byte	.LVL34-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL34-1-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST16:
	.8byte	.LVL33-.Ltext0
	.8byte	.LVL34-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL34-1-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST17:
	.8byte	.LVL34-.Ltext0
	.8byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST11:
	.8byte	.LVL29-.Ltext0
	.8byte	.LVL30-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL30-1-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST12:
	.8byte	.LVL29-.Ltext0
	.8byte	.LVL30-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL30-1-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST13:
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL12-.Ltext0
	.8byte	.LFE8-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL27-.Ltext0
	.8byte	.LFE8-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL22-.Ltext0
	.8byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST10:
	.8byte	.LVL24-.Ltext0
	.8byte	.LVL25-.Ltext0
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
.LASF104:
	.string	"caml__roots_args"
.LASF65:
	.string	"limit"
.LASF91:
	.string	"closure"
.LASF53:
	.string	"caml_young_alloc_start"
.LASF119:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF28:
	.string	"sigjmp_buf"
.LASF12:
	.string	"caml_timing_hook"
.LASF101:
	.string	"caml__frame"
.LASF95:
	.string	"arg1"
.LASF98:
	.string	"caml_callback2"
.LASF94:
	.string	"caml_callback3"
.LASF115:
	.string	"caml_callback2_exn"
.LASF57:
	.string	"caml_young_trigger"
.LASF107:
	.string	"caml__dummy_res"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF72:
	.string	"caml_custom_elt"
.LASF33:
	.string	"caml_gc_subphase"
.LASF105:
	.string	"caml__dummy_args"
.LASF123:
	.string	"__builtin_memcpy"
.LASF43:
	.string	"caml_major_window"
.LASF56:
	.string	"caml_young_limit"
.LASF122:
	.string	"memcpy"
.LASF79:
	.string	"ntables"
.LASF86:
	.string	"caml_named_value"
.LASF54:
	.string	"caml_young_alloc_end"
.LASF90:
	.string	"caml_callbackN"
.LASF117:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF21:
	.string	"value"
.LASF62:
	.string	"caml_ref_table"
.LASF61:
	.string	"longjmp_buffer"
.LASF15:
	.string	"caml_minor_gc_begin_hook"
.LASF85:
	.string	"named_value_table"
.LASF59:
	.string	"caml_in_minor_collection"
.LASF82:
	.string	"caml_local_roots"
.LASF87:
	.string	"caml_register_named_value"
.LASF27:
	.string	"caml_callback_depth"
.LASF48:
	.string	"caml_major_gc_hook"
.LASF83:
	.string	"named_value"
.LASF47:
	.string	"caml_gc_clock"
.LASF97:
	.string	"arg3"
.LASF80:
	.string	"nitems"
.LASF18:
	.string	"caml_finalise_end_hook"
.LASF89:
	.string	"namelen"
.LASF2:
	.string	"long long int"
.LASF42:
	.string	"caml_gc_sweep_hp"
.LASF44:
	.string	"caml_major_ring"
.LASF64:
	.string	"threshold"
.LASF81:
	.string	"tables"
.LASF8:
	.string	"intnat"
.LASF0:
	.string	"long int"
.LASF70:
	.string	"offset"
.LASF67:
	.string	"reserve"
.LASF108:
	.string	"caml__temp_result"
.LASF75:
	.string	"caml_huge_fallback_count"
.LASF73:
	.string	"block"
.LASF31:
	.string	"caml_fl_cur_wsz"
.LASF20:
	.string	"caml_runtime_warnings"
.LASF22:
	.string	"header_t"
.LASF84:
	.string	"name"
.LASF14:
	.string	"caml_major_slice_end_hook"
.LASF24:
	.string	"caml_atom_table"
.LASF3:
	.string	"long double"
.LASF17:
	.string	"caml_finalise_begin_hook"
.LASF60:
	.string	"caml_extra_heap_resources_minor"
.LASF38:
	.string	"caml_dependent_allocated"
.LASF23:
	.string	"mlsize_t"
.LASF77:
	.string	"caml__roots_block"
.LASF9:
	.string	"uintnat"
.LASF50:
	.string	"caml_young_end"
.LASF4:
	.string	"unsigned int"
.LASF93:
	.string	"args"
.LASF109:
	.string	"strcmp"
.LASF69:
	.string	"ephe"
.LASF121:
	.string	"hash_value_name"
.LASF13:
	.string	"caml_major_slice_begin_hook"
.LASF6:
	.string	"short unsigned int"
.LASF120:
	.string	"caml_iterate_named_values"
.LASF49:
	.string	"caml_young_start"
.LASF11:
	.string	"char"
.LASF102:
	.string	"caml__roots_closure"
.LASF113:
	.string	"caml_raise"
.LASF110:
	.string	"strlen"
.LASF45:
	.string	"caml_major_ring_index"
.LASF32:
	.string	"caml_gc_phase"
.LASF58:
	.string	"caml_minor_heap_wsz"
.LASF19:
	.string	"caml_verb_gc"
.LASF16:
	.string	"caml_minor_gc_end_hook"
.LASF103:
	.string	"caml__dummy_closure"
.LASF29:
	.string	"caml_external_raise"
.LASF88:
	.string	"vname"
.LASF1:
	.string	"long unsigned int"
.LASF51:
	.string	"caml_code_area_start"
.LASF76:
	.string	"caml_use_huge_pages"
.LASF36:
	.string	"double"
.LASF30:
	.string	"caml_exn_bucket"
.LASF25:
	.string	"caml_global_data"
.LASF92:
	.string	"narg"
.LASF66:
	.string	"size"
.LASF116:
	.string	"caml_callback_exn"
.LASF39:
	.string	"caml_fl_wsz_at_phase_change"
.LASF74:
	.string	"caml_custom_table"
.LASF52:
	.string	"caml_code_area_end"
.LASF35:
	.string	"caml_extra_heap_resources"
.LASF34:
	.string	"caml_allocated_words"
.LASF26:
	.string	"caml_named_action"
.LASF37:
	.string	"caml_dependent_size"
.LASF40:
	.string	"caml_heap_start"
.LASF100:
	.string	"caml_callbackN_exn"
.LASF96:
	.string	"arg2"
.LASF114:
	.string	"caml_callback3_exn"
.LASF10:
	.string	"asize_t"
.LASF55:
	.string	"caml_young_ptr"
.LASF41:
	.string	"total_heap_size"
.LASF63:
	.string	"base"
.LASF46:
	.string	"caml_major_work_credit"
.LASF112:
	.string	"caml_register_global_root"
.LASF71:
	.string	"caml_ephe_ref_table"
.LASF68:
	.string	"caml_ephe_ref_elt"
.LASF99:
	.string	"caml_callback"
.LASF78:
	.string	"next"
.LASF118:
	.string	"callback.c"
.LASF111:
	.string	"caml_stat_alloc"
.LASF106:
	.string	"caml__roots_res"
	.ident	"GCC: (GNU) 9.2.0"
