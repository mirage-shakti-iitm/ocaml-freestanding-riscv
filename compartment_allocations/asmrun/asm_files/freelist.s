	.file	"freelist.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.type	allocate_block, @function
allocate_block:
.LFB8:
	.file 1 "freelist.c"
	.loc 1 124 1
	.cfi_startproc
.LVL0:
	.loc 1 125 3
	.loc 1 125 12 is_stmt 0
	ld	a4,-8(a3)
.LVL1:
	.loc 1 126 3 is_stmt 1
	.loc 1 127 3
	.loc 1 127 7 is_stmt 0
	srli	a5,a4,10
	.loc 1 127 29
	addi	a4,a0,1
.LVL2:
	.loc 1 127 6
	bgeu	a5,a4,.L2
	.loc 1 128 5 is_stmt 1
	.loc 1 128 21 is_stmt 0
	lla	a6,caml_fl_cur_wsz
	ld	a4,0(a6)
	sub	a4,a4,a5
	addi	a4,a4,-1
	sd	a4,0(a6)
.LVL3:
	.loc 1 129 5 is_stmt 1
	.loc 1 129 19 is_stmt 0
	ld	a4,0(a3)
	.loc 1 129 17
	sd	a4,0(a2)
	.loc 1 130 5 is_stmt 1
	.loc 1 131 5
	.loc 1 131 23 is_stmt 0
	ld	a4,caml_fl_merge
	.loc 1 131 8
	beq	a4,a3,.L9
.L3:
	.loc 1 138 5 is_stmt 1
	.loc 1 138 17 is_stmt 0
	sd	zero,-8(a3)
	.loc 1 139 5 is_stmt 1
	.loc 1 139 16 is_stmt 0
	ld	a6,caml_allocation_policy
	.loc 1 139 8
	li	a4,1
	bne	a6,a4,.L4
	.loc 1 140 7 is_stmt 1
	.loc 1 140 16 is_stmt 0
	addiw	a6,a1,1
	.loc 1 140 20
	lw	a4,flp_size
	.loc 1 140 10
	bge	a6,a4,.L5
	.loc 1 140 37 discriminator 1
	slli	t1,a6,3
	lla	a7,flp
	add	a7,a7,t1
	ld	a7,0(a7)
	.loc 1 140 31 discriminator 1
	beq	a7,a3,.L10
.L5:
	.loc 1 142 13 is_stmt 1
	.loc 1 142 34 is_stmt 0
	addiw	a4,a4,-1
	sext.w	a6,a4
	.loc 1 142 16
	bne	a6,a1,.L4
	.loc 1 143 9 is_stmt 1
	.loc 1 143 24 is_stmt 0
	lla	a1,.LANCHOR0+16
.LVL4:
	.loc 1 143 47
	beq	a1,a2,.L8
	mv	a1,a2
.L6:
	.loc 1 143 16 discriminator 4
	sd	a1,beyond,a6
	.loc 1 144 9 is_stmt 1 discriminator 4
	sw	a4,flp_size,a1
	j	.L4
.LVL5:
.L9:
	.loc 1 131 31 discriminator 1
	.loc 1 131 45 is_stmt 0 discriminator 1
	sd	a2,caml_fl_merge,a4
	j	.L3
.L10:
	.loc 1 141 9 is_stmt 1
	.loc 1 141 23 is_stmt 0
	lla	a4,flp
	add	a6,a4,t1
	sd	a2,0(a6)
	j	.L4
.LVL6:
.L8:
	.loc 1 143 47
	li	a1,0
	j	.L6
.LVL7:
.L2:
	.loc 1 148 5 is_stmt 1
	.loc 1 148 21 is_stmt 0
	lla	a1,caml_fl_cur_wsz
.LVL8:
	ld	a4,0(a1)
	sub	a4,a4,a0
	sd	a4,0(a1)
.LVL9:
	.loc 1 149 5 is_stmt 1
	.loc 1 149 19 is_stmt 0
	sub	a4,a5,a0
	slli	a4,a4,10
	addi	a4,a4,512
	.loc 1 149 17
	sd	a4,-8(a3)
.L4:
	.loc 1 151 3 is_stmt 1
	.loc 1 151 14 is_stmt 0
	ld	a4,caml_allocation_policy
	.loc 1 151 6
	bne	a4,zero,.L7
	.loc 1 151 34 is_stmt 1 discriminator 1
	.loc 1 151 42 is_stmt 0 discriminator 1
	sd	a2,fl_prev,a4
.L7:
	.loc 1 152 3 is_stmt 1
	.loc 1 152 24 is_stmt 0
	sub	a5,a5,a0
	slli	a5,a5,3
	.loc 1 153 1
	add	a0,a5,a3
.LVL10:
	ret
	.cfi_endproc
.LFE8:
	.size	allocate_block, .-allocate_block
	.align	1
	.type	truncate_flp, @function
truncate_flp:
.LFB11:
	.loc 1 415 1 is_stmt 1
	.cfi_startproc
.LVL11:
	.loc 1 416 3
	.loc 1 416 15 is_stmt 0
	lla	a5,.LANCHOR0+16
	.loc 1 416 6
	beq	a5,a0,.L16
.L12:
	.loc 1 420 11 is_stmt 1
	.loc 1 420 21 is_stmt 0
	lw	a5,flp_size
	.loc 1 420 11
	ble	a5,zero,.L14
	.loc 1 420 28 discriminator 1
	addiw	a5,a5,-1
	sext.w	a4,a5
	slli	a3,a4,3
	lla	a4,flp
	add	a4,a4,a3
	ld	a4,0(a4)
	ld	a4,0(a4)
	.loc 1 420 25 discriminator 1
	blt	a4,a0,.L14
	.loc 1 421 7 is_stmt 1
	sw	a5,flp_size,a4
	j	.L12
.L16:
	.loc 1 417 5
	.loc 1 417 14 is_stmt 0
	sw	zero,flp_size,a5
	.loc 1 418 5 is_stmt 1
	.loc 1 418 12 is_stmt 0
	sd	zero,beyond,a5
	ret
.L14:
	.loc 1 422 5 is_stmt 1
	.loc 1 422 16 is_stmt 0
	ld	a5,beyond
	.loc 1 422 8
	blt	a5,a0,.L11
	.loc 1 422 28 is_stmt 1 discriminator 1
	.loc 1 422 35 is_stmt 0 discriminator 1
	sd	zero,beyond,a5
.L11:
	.loc 1 424 1
	ret
	.cfi_endproc
.LFE11:
	.size	truncate_flp, .-truncate_flp
	.align	1
	.globl	caml_fl_allocate
	.type	caml_fl_allocate, @function
caml_fl_allocate:
.LFB9:
	.loc 1 189 1 is_stmt 1
	.cfi_startproc
.LVL12:
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	li	t1,-8192
	addi	t1,t1,192
	add	sp,sp,t1
	.cfi_def_cfa_offset 8064
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.loc 1 190 3
.LVL13:
	.loc 1 191 3
	.loc 1 192 3
	.loc 1 193 3
	.loc 1 194 3
	.loc 1 195 3
	.loc 1 206 3
	ld	a5,caml_allocation_policy
	beq	a5,zero,.L18
	li	a4,1
	beq	a5,a4,.L56
	li	s2,0
.LVL14:
.L17:
	.loc 1 388 1 is_stmt 0
	mv	a0,s2
	li	t1,8192
	addi	t1,t1,-192
	add	sp,sp,t1
	.cfi_remember_state
	.cfi_def_cfa_offset 64
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
	ld	s1,40(sp)
	.cfi_restore 9
	ld	s2,32(sp)
	.cfi_restore 18
	ld	s3,24(sp)
	.cfi_restore 19
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
.LVL15:
.L18:
	.cfi_restore_state
	.loc 1 208 5 is_stmt 1
	.loc 1 210 5
	.loc 1 210 10 is_stmt 0
	ld	a4,fl_prev
.LVL16:
	.loc 1 211 5 is_stmt 1
	.loc 1 211 9 is_stmt 0
	ld	a3,0(a4)
.LVL17:
	.loc 1 212 5 is_stmt 1
	.loc 1 210 10 is_stmt 0
	mv	a2,a4
.LVL18:
.L21:
	.loc 1 212 11 is_stmt 1
	beq	a3,zero,.L61
	.loc 1 213 7
	.loc 1 214 7
	.loc 1 214 11 is_stmt 0
	ld	a5,-8(a3)
	srli	a5,a5,10
	.loc 1 214 10
	bgeu	a5,a0,.L62
	.loc 1 217 7 is_stmt 1
.LVL19:
	.loc 1 218 7
	.loc 1 217 12 is_stmt 0
	mv	a2,a3
	.loc 1 218 11
	ld	a3,0(a3)
.LVL20:
	j	.L21
.L62:
	.loc 1 215 9 is_stmt 1
	.loc 1 215 16 is_stmt 0
	li	a1,0
	addi	a0,a0,1
.LVL21:
	call	allocate_block
.LVL22:
	mv	s2,a0
	j	.L17
.LVL23:
.L61:
	.loc 1 223 5 is_stmt 1
	.loc 1 223 13 is_stmt 0
	sd	a2,fl_last,a5
	.loc 1 225 5 is_stmt 1
	.loc 1 225 10 is_stmt 0
	lla	a2,.LANCHOR0+16
.LVL24:
	.loc 1 226 5 is_stmt 1
	.loc 1 226 9 is_stmt 0
	ld	a3,.LANCHOR0+16
.LVL25:
	.loc 1 227 5 is_stmt 1
.L24:
	.loc 1 227 11
	beq	a2,a4,.L63
	.loc 1 228 7
	.loc 1 228 11 is_stmt 0
	ld	a5,-8(a3)
	srli	a5,a5,10
	.loc 1 228 10
	bgeu	a5,a0,.L64
	.loc 1 231 7 is_stmt 1
.LVL26:
	.loc 1 232 7
	.loc 1 231 12 is_stmt 0
	mv	a2,a3
	.loc 1 232 11
	ld	a3,0(a3)
.LVL27:
	j	.L24
.L64:
	.loc 1 229 9 is_stmt 1
	.loc 1 229 16 is_stmt 0
	li	a1,0
	addi	a0,a0,1
.LVL28:
	call	allocate_block
.LVL29:
	mv	s2,a0
	j	.L17
.LVL30:
.L63:
	.loc 1 238 12
	li	s2,0
	j	.L17
.LVL31:
.L67:
	.loc 1 249 9 is_stmt 1
	.loc 1 249 18 is_stmt 0
	mv	a1,s1
	addi	a0,a0,1
.LVL32:
	call	allocate_block
.LVL33:
	mv	s2,a0
.LVL34:
	.loc 1 251 9 is_stmt 1
.L28:
	.loc 1 321 5
	.loc 1 322 5
	.loc 1 322 11 is_stmt 0
	lw	a6,flp_size
	.loc 1 322 8
	ble	a6,s1,.L17
	.loc 1 323 7 is_stmt 1
	.loc 1 323 10 is_stmt 0
	ble	s1,zero,.L58
	.loc 1 324 9 is_stmt 1
	.loc 1 324 18 is_stmt 0
	addiw	a5,s1,-1
	slli	a4,a5,3
	lla	a5,flp
	add	a5,a5,a4
	ld	a5,0(a5)
	ld	a5,0(a5)
	ld	a1,-8(a5)
	.loc 1 324 16
	srli	a1,a1,10
.LVL35:
.L42:
	.loc 1 328 7 is_stmt 1
	.loc 1 328 25 is_stmt 0
	addiw	a5,a6,-1
	sext.w	a4,a5
	.loc 1 328 10
	beq	a4,s1,.L65
.LBB2:
	.loc 1 336 9 is_stmt 1
	.loc 1 337 9
.LVL36:
	.loc 1 338 9
	.loc 1 340 9
	.loc 1 340 14 is_stmt 0
	slli	a4,s1,3
	lla	a5,flp
	add	a5,a5,a4
	ld	a4,0(a5)
.LVL37:
	.loc 1 341 9 is_stmt 1
	.loc 1 337 13 is_stmt 0
	li	s3,0
	.loc 1 341 15
	j	.L45
.LVL38:
.L56:
.LBE2:
	.loc 1 206 3
	li	s1,0
.L19:
.LVL39:
	.loc 1 243 17 is_stmt 1 discriminator 1
	.loc 1 243 19 is_stmt 0 discriminator 1
	lw	a5,flp_size
	.loc 1 243 5 discriminator 1
	ble	a5,s1,.L66
	.loc 1 244 7 is_stmt 1
	.loc 1 244 12 is_stmt 0
	slli	a4,s1,3
	lla	a5,flp
	add	a5,a5,a4
	ld	a2,0(a5)
	ld	a3,0(a2)
	ld	s0,-8(a3)
	.loc 1 244 10
	srli	s0,s0,10
.LVL40:
	.loc 1 245 7 is_stmt 1
	.loc 1 245 10 is_stmt 0
	bleu	a0,s0,.L67
	.loc 1 243 31 is_stmt 1 discriminator 2
	.loc 1 243 32 is_stmt 0 discriminator 2
	addiw	s1,s1,1
.LVL41:
	j	.L19
.LVL42:
.L66:
	.loc 1 255 5 is_stmt 1
	.loc 1 255 8 is_stmt 0
	bne	a5,zero,.L30
	.loc 1 256 7 is_stmt 1
	.loc 1 256 12 is_stmt 0
	lla	a2,.LANCHOR0+16
.LVL43:
	.loc 1 257 7 is_stmt 1
	.loc 1 257 14 is_stmt 0
	li	a3,0
.LVL44:
.L32:
	.loc 1 286 18
	li	a5,0
	j	.L31
.L30:
	.loc 1 259 7 is_stmt 1
	.loc 1 259 14 is_stmt 0
	addiw	a5,a5,-1
	slli	a5,a5,3
	lla	a4,flp
	add	a5,a4,a5
	ld	a5,0(a5)
	.loc 1 259 12
	ld	a5,0(a5)
.LVL45:
	.loc 1 260 7 is_stmt 1
	.loc 1 260 16 is_stmt 0
	ld	a3,-8(a5)
	.loc 1 260 14
	srli	a3,a3,10
.LVL46:
	.loc 1 261 7 is_stmt 1
	.loc 1 261 18 is_stmt 0
	ld	a2,beyond
	.loc 1 261 10
	bne	a2,zero,.L32
	.loc 1 259 12
	mv	a2,a5
	j	.L32
.LVL47:
.L69:
	.loc 1 266 9 is_stmt 1
	.loc 1 266 17 is_stmt 0
	sd	a2,fl_last,a4
	.loc 1 267 9 is_stmt 1
	.loc 1 267 24 is_stmt 0
	lla	a4,.LANCHOR0+16
	.loc 1 267 47
	beq	a4,a2,.L34
	mv	a5,a2
.LVL48:
.L34:
	.loc 1 267 16 discriminator 4
	sd	a5,beyond,a4
	.loc 1 268 9 is_stmt 1 discriminator 4
	.loc 1 268 16 is_stmt 0 discriminator 4
	li	s2,0
	j	.L17
.LVL49:
.L70:
	.loc 1 275 13 is_stmt 1
	.loc 1 275 20 is_stmt 0
	sd	a5,beyond,a4
	.loc 1 276 13 is_stmt 1
.LVL50:
	.loc 1 282 13
	.loc 1 282 22 is_stmt 0
	mv	a3,a5
	mv	a1,s1
	addi	a0,a0,1
.LVL51:
	call	allocate_block
.LVL52:
	mv	s2,a0
.LVL53:
	.loc 1 284 13 is_stmt 1
	j	.L28
.LVL54:
.L35:
	.loc 1 286 18 is_stmt 0
	mv	a2,a5
.LVL55:
.L31:
	.loc 1 263 11 is_stmt 1
	.loc 1 263 21 is_stmt 0
	lw	s1,flp_size
	.loc 1 263 11
	li	a4,999
	bgt	s1,a4,.L68
	.loc 1 264 7 is_stmt 1
	.loc 1 264 11 is_stmt 0
	ld	a5,0(a2)
.LVL56:
	.loc 1 265 7 is_stmt 1
	.loc 1 265 10 is_stmt 0
	beq	a5,zero,.L69
	.loc 1 270 9 is_stmt 1
	.loc 1 270 14 is_stmt 0
	ld	s0,-8(a5)
	.loc 1 270 12
	srli	s0,s0,10
.LVL57:
	.loc 1 271 9 is_stmt 1
	.loc 1 271 12 is_stmt 0
	bgeu	a3,s0,.L35
	.loc 1 272 11 is_stmt 1
	.loc 1 272 25 is_stmt 0
	slli	a3,s1,3
.LVL58:
	lla	a4,flp
	add	a4,a4,a3
	sd	a2,0(a4)
	.loc 1 273 11 is_stmt 1
	addiw	a4,s1,1
	sw	a4,flp_size,a3
	.loc 1 274 11
	.loc 1 274 14 is_stmt 0
	bleu	a0,s0,.L70
	.loc 1 286 18
	mv	a3,s0
	j	.L35
.LVL59:
.L68:
	.loc 1 291 5 is_stmt 1
	.loc 1 291 12 is_stmt 0
	sd	a5,beyond,a4
	.loc 1 297 5 is_stmt 1
	.loc 1 297 8 is_stmt 0
	bne	a5,zero,.L37
	.loc 1 300 7 is_stmt 1
	.loc 1 300 27 is_stmt 0
	addiw	a5,s1,-1
.LVL60:
	.loc 1 300 12
	slli	a4,a5,3
	lla	a5,flp
	add	a5,a5,a4
	ld	a5,0(a5)
.LVL61:
.L37:
	.loc 1 302 5 is_stmt 1
	.loc 1 302 14 is_stmt 0
	ld	a4,flp+7992
	ld	a4,0(a4)
	ld	a2,-8(a4)
	.loc 1 302 12
	srli	a2,a2,10
.LVL62:
	.loc 1 303 5 is_stmt 1
	.loc 1 304 5
	.loc 1 304 9 is_stmt 0
	ld	a3,0(a5)
.LVL63:
	.loc 1 305 5 is_stmt 1
	.loc 1 305 11 is_stmt 0
	j	.L38
.LVL64:
.L39:
	.loc 1 310 13 is_stmt 1
	.loc 1 310 16 is_stmt 0
	bgeu	a4,a0,.L71
.LVL65:
.L40:
	.loc 1 313 7 is_stmt 1
	.loc 1 314 7
	.loc 1 313 12 is_stmt 0
	mv	a5,a3
	.loc 1 314 11
	ld	a3,0(a3)
.LVL66:
.L38:
	.loc 1 305 11 is_stmt 1
	beq	a3,zero,.L72
	.loc 1 306 7
	.loc 1 307 7
	.loc 1 307 12 is_stmt 0
	ld	a4,-8(a3)
	.loc 1 307 10
	srli	a4,a4,10
.LVL67:
	.loc 1 308 7 is_stmt 1
	.loc 1 308 10 is_stmt 0
	bleu	a2,a4,.L39
	.loc 1 309 9 is_stmt 1
	.loc 1 309 16 is_stmt 0
	sd	a3,beyond,a5
.LVL68:
	j	.L40
.LVL69:
.L71:
	.loc 1 311 9 is_stmt 1
	.loc 1 311 16 is_stmt 0
	mv	a2,a5
.LVL70:
	mv	a1,s1
	addi	a0,a0,1
.LVL71:
	call	allocate_block
.LVL72:
	mv	s2,a0
	j	.L17
.LVL73:
.L72:
	.loc 1 316 5 is_stmt 1
	.loc 1 316 13 is_stmt 0
	sd	a5,fl_last,a4
	.loc 1 317 5 is_stmt 1
	.loc 1 317 12 is_stmt 0
	li	s2,0
	j	.L17
.LVL74:
.L58:
	.loc 1 326 16
	li	a1,0
	j	.L42
.LVL75:
.L65:
	.loc 1 329 9 is_stmt 1
	.loc 1 329 13 is_stmt 0
	slli	s1,s1,3
.LVL76:
	lla	a4,flp
	add	a4,a4,s1
	ld	a4,0(a4)
	ld	a3,0(a4)
	ld	a4,-8(a3)
	srli	a4,a4,10
	.loc 1 329 12
	bgtu	a4,a1,.L44
	.loc 1 330 11 is_stmt 1
	.loc 1 330 18 is_stmt 0
	sd	a3,beyond,a4
	.loc 1 331 11 is_stmt 1
	sw	a5,flp_size,a4
	j	.L17
.L44:
	.loc 1 333 11
	.loc 1 333 18 is_stmt 0
	sd	zero,beyond,a5
	j	.L17
.LVL77:
.L46:
.LBB3:
	.loc 1 346 20
	mv	a4,a3
.LVL78:
.L45:
	.loc 1 341 15 is_stmt 1
	.loc 1 341 29 is_stmt 0
	addiw	a2,s1,1
	.loc 1 341 27
	slli	a3,a2,3
	lla	a5,flp
	add	a5,a5,a3
	ld	a5,0(a5)
	.loc 1 341 15
	beq	a5,a4,.L47
	.loc 1 342 11 is_stmt 1
	.loc 1 342 15 is_stmt 0
	ld	a3,0(a4)
.LVL79:
	.loc 1 343 11 is_stmt 1
	.loc 1 343 16 is_stmt 0
	ld	a5,-8(a3)
	.loc 1 343 14
	srli	a5,a5,10
.LVL80:
	.loc 1 344 11 is_stmt 1
	.loc 1 344 14 is_stmt 0
	bgeu	a1,a5,.L46
	.loc 1 345 13 is_stmt 1
	.loc 1 345 18 is_stmt 0
	addiw	a0,s3,1
.LVL81:
	.loc 1 345 22
	li	a1,-8192
.LVL82:
	slli	s3,s3,3
.LVL83:
	li	a7,8192
	addi	a7,a7,-192
	addi	t1,sp,16
	add	a7,a7,t1
	add	a1,a7,a1
	sd	a1,8(sp)
	add	s3,a1,s3
	sd	a4,192(s3)
	.loc 1 346 13 is_stmt 1
.LVL84:
	.loc 1 347 13
	.loc 1 347 16 is_stmt 0
	bleu	s0,a5,.L59
	.loc 1 345 18
	mv	s3,a0
	.loc 1 346 20
	mv	a1,a5
	j	.L46
.L59:
	.loc 1 345 18
	mv	s3,a0
.LVL85:
.L47:
	.loc 1 357 9 is_stmt 1
	.loc 1 357 33 is_stmt 0
	addw	s0,a6,s3
.LVL86:
	.loc 1 357 37
	addiw	s0,s0,-1
	sext.w	a4,s0
.LVL87:
	.loc 1 357 12
	li	a5,1000
	bgt	a4,a5,.L49
	.loc 1 358 11 is_stmt 1
	.loc 1 358 14 is_stmt 0
	li	a5,1
	bne	s3,a5,.L73
.L50:
	.loc 1 361 11 is_stmt 1
	.loc 1 361 14 is_stmt 0
	bgt	s3,zero,.L74
.LVL88:
.L51:
	.loc 1 362 11 is_stmt 1
	.loc 1 362 20 is_stmt 0
	sw	s0,flp_size,a5
	j	.L17
.LVL89:
.L73:
	.loc 1 359 13 is_stmt 1
	.loc 1 359 28 is_stmt 0
	addw	a5,s1,s3
	.loc 1 359 22
	slli	a5,a5,3
	lla	a0,flp
	.loc 1 359 33
	slli	a1,a2,3
	.loc 1 359 70
	subw	a2,a6,s1
	.loc 1 359 72
	addiw	a2,a2,-1
	.loc 1 359 13
	slli	a2,a2,3
	add	a1,a0,a1
	add	a0,a0,a5
	call	memmove
.LVL90:
	j	.L50
.L74:
	.loc 1 361 22 is_stmt 1 discriminator 1
	.loc 1 361 31 is_stmt 0 discriminator 1
	slli	s1,s1,3
.LVL91:
	.loc 1 361 22 discriminator 1
	slli	a2,s3,3
	li	a1,-8192
	addi	a1,a1,192
	li	a5,8192
	addi	a5,a5,-192
	addi	a4,sp,16
	add	a5,a5,a4
	add	a1,a5,a1
	lla	a0,flp
	add	a0,a0,s1
	call	memcpy
.LVL92:
	j	.L51
.LVL93:
.L49:
	.loc 1 364 11 is_stmt 1
	.loc 1 364 27 is_stmt 0
	addw	a4,s1,s3
	sext.w	a5,a4
	.loc 1 364 14
	li	a3,999
	bgt	a5,a3,.L53
	.loc 1 365 13 is_stmt 1
	.loc 1 365 16 is_stmt 0
	li	a3,1
	bne	s3,a3,.L75
.L54:
	.loc 1 368 13 is_stmt 1
	.loc 1 368 16 is_stmt 0
	bgt	s3,zero,.L76
.LVL94:
.L55:
	.loc 1 374 11 is_stmt 1
	.loc 1 374 20 is_stmt 0
	li	a5,999
	sw	a5,flp_size,a4
	.loc 1 375 11 is_stmt 1
	.loc 1 375 20 is_stmt 0
	ld	a5,flp+7992
	ld	a5,0(a5)
	.loc 1 375 18
	sd	a5,beyond,a4
	j	.L17
.LVL95:
.L75:
	.loc 1 366 15 is_stmt 1
	.loc 1 366 24 is_stmt 0
	slli	a5,a5,3
	lla	a0,flp
	.loc 1 366 35
	slli	a1,a2,3
	.loc 1 366 73
	li	a3,1000
	subw	a4,a3,a4
	.loc 1 366 15
	slli	a2,a4,3
	add	a1,a0,a1
	add	a0,a0,a5
	call	memmove
.LVL96:
	j	.L54
.L76:
	.loc 1 368 24 is_stmt 1 discriminator 1
	.loc 1 368 33 is_stmt 0 discriminator 1
	slli	s1,s1,3
.LVL97:
	.loc 1 368 24 discriminator 1
	slli	a2,s3,3
	li	a1,-8192
	addi	a1,a1,192
	li	a5,8192
	addi	a5,a5,-192
	addi	a4,sp,16
	add	a5,a5,a4
	add	a1,a5,a1
	lla	a0,flp
	add	a0,a0,s1
	call	memcpy
.LVL98:
	j	.L55
.LVL99:
.L53:
	.loc 1 370 13 is_stmt 1
	.loc 1 370 16 is_stmt 0
	li	a5,1000
	beq	s1,a5,.L55
	.loc 1 371 15 is_stmt 1
	.loc 1 371 24 is_stmt 0
	slli	a5,s1,3
	.loc 1 371 68
	li	a2,1000
	subw	a2,a2,s1
	.loc 1 371 15
	slli	a2,a2,3
	li	a1,-8192
	addi	a1,a1,192
	li	a4,8192
	addi	a4,a4,-192
	addi	a3,sp,16
	add	a4,a4,a3
	add	a1,a4,a1
	lla	a0,flp
	add	a0,a0,a5
	call	memcpy
.LVL100:
	j	.L55
.LBE3:
	.cfi_endproc
.LFE9:
	.size	caml_fl_allocate, .-caml_fl_allocate
	.align	1
	.globl	caml_fl_init_merge
	.type	caml_fl_init_merge, @function
caml_fl_init_merge:
.LFB10:
	.loc 1 399 1 is_stmt 1
	.cfi_startproc
	.loc 1 407 3
	.loc 1 407 17 is_stmt 0
	sd	zero,last_fragment,a5
	.loc 1 408 3 is_stmt 1
	.loc 1 408 17 is_stmt 0
	lla	a5,.LANCHOR0+16
	sd	a5,caml_fl_merge,a4
	.loc 1 412 1
	ret
	.cfi_endproc
.LFE10:
	.size	caml_fl_init_merge, .-caml_fl_init_merge
	.align	1
	.globl	caml_fl_reset
	.type	caml_fl_reset, @function
caml_fl_reset:
.LFB12:
	.loc 1 428 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 429 3
	.loc 1 429 18 is_stmt 0
	sd	zero,.LANCHOR0+16,a5
	.loc 1 430 3 is_stmt 1
	ld	a5,caml_allocation_policy
	beq	a5,zero,.L79
	li	a4,1
	beq	a5,a4,.L80
.L81:
	.loc 1 441 3
	.loc 1 441 19 is_stmt 0
	sd	zero,caml_fl_cur_wsz,a5
	.loc 1 442 3 is_stmt 1
	call	caml_fl_init_merge
.LVL101:
	.loc 1 443 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L79:
	.cfi_restore_state
	.loc 1 432 5 is_stmt 1
	.loc 1 432 13 is_stmt 0
	lla	a5,.LANCHOR0+16
	sd	a5,fl_prev,a4
	.loc 1 433 5 is_stmt 1
	j	.L81
.L80:
	.loc 1 435 5
	lla	a0,.LANCHOR0+16
	call	truncate_flp
.LVL102:
	.loc 1 436 5
	j	.L81
	.cfi_endproc
.LFE12:
	.size	caml_fl_reset, .-caml_fl_reset
	.align	1
	.globl	caml_fl_merge_block
	.type	caml_fl_merge_block, @function
caml_fl_merge_block:
.LFB13:
	.loc 1 448 1
	.cfi_startproc
.LVL103:
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
	mv	s0,a0
	.loc 1 449 3
	.loc 1 450 3
	.loc 1 451 3
	.loc 1 451 17 is_stmt 0
	addi	s4,a0,-8
	.loc 1 451 12
	ld	s1,-8(a0)
.LVL104:
	.loc 1 452 3 is_stmt 1
	.loc 1 454 3
	.loc 1 454 22 is_stmt 0
	srli	a5,s1,10
	.loc 1 454 19
	lla	a4,caml_fl_cur_wsz
	ld	a3,0(a4)
	add	a5,a5,a3
	addi	a5,a5,1
	sd	a5,0(a4)
	.loc 1 459 3 is_stmt 1
	.loc 1 459 8 is_stmt 0
	ld	s2,caml_fl_merge
.LVL105:
	.loc 1 460 3 is_stmt 1
	.loc 1 460 7 is_stmt 0
	ld	s3,0(s2)
.LVL106:
	.loc 1 463 3 is_stmt 1
	.loc 1 464 3
	.loc 1 466 3
	.loc 1 466 14 is_stmt 0
	ld	a4,caml_allocation_policy
	.loc 1 466 6
	li	a5,1
	beq	a4,a5,.L92
.LVL107:
.L84:
	.loc 1 469 3 is_stmt 1
	.loc 1 469 21 is_stmt 0
	ld	a5,last_fragment
	.loc 1 469 6
	beq	s4,a5,.L93
.L85:
	.loc 1 481 3 is_stmt 1
	.loc 1 481 23 is_stmt 0
	srli	a5,s1,10
	mv	a3,s0
	slli	a0,a5,3
	add	a0,a0,s0
.LVL108:
	.loc 1 482 3 is_stmt 1
	.loc 1 482 14 is_stmt 0
	addi	a4,s3,-8
	.loc 1 482 6
	beq	a4,a0,.L94
.L86:
	.loc 1 502 3 is_stmt 1
	.loc 1 502 15 is_stmt 0
	ld	a5,-8(s2)
	.loc 1 502 13
	srli	a5,a5,10
.LVL109:
	.loc 1 503 3 is_stmt 1
	.loc 1 503 21 is_stmt 0
	slli	a4,a5,3
	add	a4,a4,s2
	.loc 1 503 48
	addi	a2,a3,-8
	.loc 1 503 6
	beq	a4,a2,.L95
.LVL110:
.L88:
	.loc 1 510 9 is_stmt 1
	.loc 1 510 13 is_stmt 0
	srli	a5,s1,10
	.loc 1 510 12
	beq	a5,zero,.L90
	.loc 1 511 5 is_stmt 1
	.loc 1 511 19 is_stmt 0
	andi	s1,s1,-769
.LVL111:
	ori	s1,s1,512
	.loc 1 511 17
	sd	s1,-8(a3)
.LVL112:
	.loc 1 512 5 is_stmt 1
	.loc 1 512 15 is_stmt 0
	sd	s3,0(s0)
	.loc 1 513 5 is_stmt 1
	.loc 1 513 17 is_stmt 0
	sd	s0,0(s2)
	.loc 1 514 5 is_stmt 1
	.loc 1 514 19 is_stmt 0
	sd	s0,caml_fl_merge,a5
.L83:
	.loc 1 522 1
	ld	ra,40(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
.LVL113:
	ld	s1,24(sp)
	.cfi_restore 9
	ld	s2,16(sp)
	.cfi_restore 18
.LVL114:
	ld	s3,8(sp)
	.cfi_restore 19
.LVL115:
	ld	s4,0(sp)
	.cfi_restore 20
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.LVL116:
.L92:
	.cfi_restore_state
	.loc 1 466 35 is_stmt 1 discriminator 1
	mv	a0,s2
	call	truncate_flp
.LVL117:
	j	.L84
.L93:
.LBB4:
	.loc 1 470 5
	.loc 1 470 24 is_stmt 0
	ld	a4,0(s4)
	srli	a4,a4,10
	.loc 1 470 14
	addi	a4,a4,1
.LVL118:
	.loc 1 471 5 is_stmt 1
	.loc 1 471 8 is_stmt 0
	li	a3,-1
	srli	a3,a3,10
	bgtu	a4,a3,.L85
	.loc 1 472 7 is_stmt 1
	.loc 1 472 10 is_stmt 0
	slli	s1,a4,10
.LVL119:
	.loc 1 473 7 is_stmt 1
	.loc 1 473 10 is_stmt 0
	mv	s0,a5
.LVL120:
	.loc 1 474 7 is_stmt 1
	.loc 1 474 19 is_stmt 0
	sd	s1,-8(a5)
	.loc 1 475 7 is_stmt 1
	.loc 1 475 23 is_stmt 0
	lla	a4,caml_fl_cur_wsz
.LVL121:
	ld	a5,0(a4)
	addi	a5,a5,1
	sd	a5,0(a4)
	j	.L85
.LVL122:
.L94:
.LBE4:
.LBB5:
	.loc 1 483 5 is_stmt 1
	.loc 1 483 11 is_stmt 0
	ld	a2,0(s3)
.LVL123:
	.loc 1 484 5 is_stmt 1
	.loc 1 484 25 is_stmt 0
	ld	a4,-8(s3)
	srli	a4,a4,10
	.loc 1 484 14
	addi	a4,a4,1
.LVL124:
	.loc 1 486 5 is_stmt 1
	.loc 1 486 24 is_stmt 0
	add	a5,a5,a4
	.loc 1 486 8
	li	a4,-1
.LVL125:
	srli	a4,a4,10
	bgtu	a5,a4,.L86
	.loc 1 487 7 is_stmt 1
	.loc 1 487 19 is_stmt 0
	sd	a2,0(s2)
.LVL126:
	.loc 1 488 7 is_stmt 1
	.loc 1 488 18 is_stmt 0
	ld	a4,caml_allocation_policy
	.loc 1 488 10
	bne	a4,zero,.L87
	.loc 1 488 48 discriminator 1
	ld	a4,fl_prev
	.loc 1 488 37 discriminator 1
	beq	a4,s3,.L96
.L87:
	.loc 1 489 7 is_stmt 1
	.loc 1 489 12 is_stmt 0
	slli	a5,a5,10
	.loc 1 489 10
	addi	s1,a5,512
.LVL127:
	.loc 1 490 7 is_stmt 1
	.loc 1 490 19 is_stmt 0
	sd	s1,-8(a3)
	.loc 1 491 7 is_stmt 1
	.loc 1 491 27 is_stmt 0
	srli	a0,s1,10
.LVL128:
	slli	a0,a0,3
	add	a0,a0,a3
.LVL129:
	.loc 1 497 7 is_stmt 1
	.loc 1 497 11 is_stmt 0
	mv	s3,a2
	j	.L86
.LVL130:
.L96:
	.loc 1 488 56 is_stmt 1 discriminator 2
	.loc 1 488 64 is_stmt 0 discriminator 2
	sd	s2,fl_prev,a4
	j	.L87
.LVL131:
.L95:
.LBE5:
	.loc 1 504 22
	srli	a4,s1,10
	.loc 1 504 20
	add	a5,a4,a5
.LVL132:
	addi	a5,a5,1
	.loc 1 504 7
	li	a4,-1025
	srli	a4,a4,10
	bgtu	a5,a4,.L88
	.loc 1 505 5 is_stmt 1
	.loc 1 505 21 is_stmt 0
	slli	a5,a5,10
	addi	a5,a5,512
	.loc 1 505 19
	sd	a5,-8(s2)
.LVL133:
	.loc 1 509 5 is_stmt 1
	j	.L83
.LVL134:
.L90:
	.loc 1 518 5
	.loc 1 518 19 is_stmt 0
	sd	s0,last_fragment,a5
	.loc 1 519 5 is_stmt 1
	.loc 1 519 21 is_stmt 0
	lla	a4,caml_fl_cur_wsz
	ld	a5,0(a4)
	addi	a5,a5,-1
	sd	a5,0(a4)
.LVL135:
	.loc 1 521 3 is_stmt 1
	.loc 1 521 10 is_stmt 0
	j	.L83
	.cfi_endproc
.LFE13:
	.size	caml_fl_merge_block, .-caml_fl_merge_block
	.align	1
	.globl	caml_fl_add_blocks
	.type	caml_fl_add_blocks, @function
caml_fl_add_blocks:
.LFB14:
	.loc 1 536 1 is_stmt 1
	.cfi_startproc
.LVL136:
	.loc 1 537 3
	.loc 1 537 9 is_stmt 0
	mv	a4,a0
.LVL137:
.L98:
	.loc 1 538 3 is_stmt 1 discriminator 1
	.loc 1 539 3 discriminator 1
	.loc 1 540 3 discriminator 1
	.loc 1 541 5 discriminator 1
	.loc 1 541 24 is_stmt 0 discriminator 1
	ld	a5,-8(a4)
	srli	a5,a5,10
	.loc 1 541 21 discriminator 1
	lla	a3,caml_fl_cur_wsz
	ld	a2,0(a3)
	add	a5,a5,a2
	addi	a5,a5,1
	sd	a5,0(a3)
	.loc 1 542 5 is_stmt 1 discriminator 1
	.loc 1 542 9 is_stmt 0 discriminator 1
	ld	a4,0(a4)
.LVL138:
	.loc 1 543 11 is_stmt 1 discriminator 1
	.loc 1 543 3 is_stmt 0 discriminator 1
	bne	a4,zero,.L98
	.loc 1 545 3 is_stmt 1
	.loc 1 545 10 is_stmt 0
	ld	a5,fl_last
	.loc 1 545 6
	bge	a5,a0,.L99
	.loc 1 546 5 is_stmt 1
	.loc 1 546 20 is_stmt 0
	sd	a0,0(a5)
	.loc 1 547 5 is_stmt 1
	.loc 1 547 17 is_stmt 0
	ld	a4,caml_fl_merge
.LVL139:
	.loc 1 547 8
	beq	a5,a4,.L110
.L100:
	.loc 1 550 5 is_stmt 1
	.loc 1 550 16 is_stmt 0
	ld	a3,caml_allocation_policy
	.loc 1 550 8
	li	a4,1
	bne	a3,a4,.L107
	.loc 1 550 48 discriminator 1
	lw	a4,flp_size
	.loc 1 550 36 discriminator 1
	li	a3,999
	bgt	a4,a3,.L107
	.loc 1 551 7 is_stmt 1
	.loc 1 551 20 is_stmt 0
	addiw	a3,a4,1
	sw	a3,flp_size,a2
	.loc 1 551 24
	slli	a4,a4,3
	lla	a3,flp
	add	a4,a3,a4
	sd	a5,0(a4)
	ret
.L110:
	.loc 1 547 49 discriminator 1
	ld	a4,caml_gc_sweep_hp
	.loc 1 547 34 discriminator 1
	bgeu	a0,a4,.L100
	.loc 1 548 7 is_stmt 1
	.loc 1 548 23 is_stmt 0
	ld	a4,8(a0)
	.loc 1 548 21
	sd	a4,caml_fl_merge,a3
	j	.L100
.LVL140:
.L99:
.LBB6:
	.loc 1 554 5 is_stmt 1
	.loc 1 556 5
	.loc 1 556 10 is_stmt 0
	lla	a4,.LANCHOR0+16
.LVL141:
	.loc 1 557 5 is_stmt 1
	.loc 1 557 9 is_stmt 0
	ld	a5,.LANCHOR0+16
.LVL142:
	.loc 1 558 5 is_stmt 1
	.loc 1 558 11 is_stmt 0
	j	.L102
.L104:
	.loc 1 559 7 is_stmt 1
	.loc 1 561 7
.LVL143:
	.loc 1 562 7
	.loc 1 561 12 is_stmt 0
	mv	a4,a5
	.loc 1 562 11
	ld	a5,0(a5)
.LVL144:
.L102:
	.loc 1 558 11 is_stmt 1
	beq	a5,zero,.L103
	.loc 1 558 28 is_stmt 0 discriminator 1
	blt	a5,a0,.L104
.L103:
	.loc 1 564 5 is_stmt 1
	.loc 1 565 5
	.loc 1 566 5
	ld	a3,8(a0)
	.loc 1 566 26 is_stmt 0
	sd	a5,0(a3)
	.loc 1 567 5 is_stmt 1
	.loc 1 567 17 is_stmt 0
	sd	a0,0(a4)
	.loc 1 571 5 is_stmt 1
	.loc 1 571 14 is_stmt 0
	ld	a5,caml_fl_merge
.LVL145:
	.loc 1 571 8
	beq	a5,a4,.L111
.LVL146:
.L105:
	.loc 1 574 5 is_stmt 1
	.loc 1 574 16 is_stmt 0
	ld	a4,caml_allocation_policy
	.loc 1 574 8
	li	a5,1
	beq	a4,a5,.L112
.L107:
	ret
.LVL147:
.L111:
	.loc 1 571 46 discriminator 1
	ld	a5,caml_gc_sweep_hp
	.loc 1 571 31 discriminator 1
	bgeu	a0,a5,.L105
	.loc 1 572 7 is_stmt 1
	.loc 1 572 23 is_stmt 0
	ld	a5,8(a0)
	.loc 1 572 21
	sd	a5,caml_fl_merge,a4
.LVL148:
	j	.L105
.L112:
.LBE6:
	.loc 1 536 1 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
.LBB7:
	.loc 1 574 37 is_stmt 1 discriminator 1
	call	truncate_flp
.LVL149:
.LBE7:
	.loc 1 576 1 is_stmt 0 discriminator 1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	caml_fl_add_blocks, .-caml_fl_add_blocks
	.align	1
	.globl	caml_make_free_blocks
	.type	caml_make_free_blocks, @function
caml_make_free_blocks:
.LFB15:
	.loc 1 589 1 is_stmt 1
	.cfi_startproc
.LVL150:
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
	mv	s1,a1
	mv	s4,a2
	mv	s3,a3
	.loc 1 590 3
	.loc 1 592 3
	.loc 1 592 9 is_stmt 0
	j	.L114
.LVL151:
.L118:
	.loc 1 596 10
	mv	s0,s1
.L115:
.LVL152:
	.loc 1 598 5 is_stmt 1
	.loc 1 599 7 is_stmt 0
	addi	a5,s0,-1
	slli	a5,a5,10
	add	a5,s3,a5
	.loc 1 598 20
	sd	a5,0(s2)
	.loc 1 600 5 is_stmt 1
	.loc 1 600 8 is_stmt 0
	bne	s4,zero,.L120
.L116:
	.loc 1 601 5 is_stmt 1
	.loc 1 601 10 is_stmt 0
	sub	s1,s1,s0
.LVL153:
	.loc 1 602 5 is_stmt 1
	.loc 1 602 7 is_stmt 0
	slli	s0,s0,3
.LVL154:
	add	s2,s2,s0
.LVL155:
.L114:
	.loc 1 592 9 is_stmt 1
	beq	s1,zero,.L121
	.loc 1 593 5
	.loc 1 593 8 is_stmt 0
	li	a5,1
	slli	a5,a5,54
	bleu	s1,a5,.L118
	.loc 1 594 10
	mv	s0,a5
	j	.L115
.LVL156:
.L120:
	.loc 1 600 19 is_stmt 1 discriminator 1
	addi	a0,s2,8
	call	caml_fl_merge_block
.LVL157:
	j	.L116
.LVL158:
.L121:
	.loc 1 604 1 is_stmt 0
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	ld	s1,24(sp)
	.cfi_restore 9
.LVL159:
	ld	s2,16(sp)
	.cfi_restore 18
.LVL160:
	ld	s3,8(sp)
	.cfi_restore 19
	ld	s4,0(sp)
	.cfi_restore 20
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE15:
	.size	caml_make_free_blocks, .-caml_make_free_blocks
	.align	1
	.globl	caml_set_allocation_policy
	.type	caml_set_allocation_policy, @function
caml_set_allocation_policy:
.LFB16:
	.loc 1 607 1 is_stmt 1
	.cfi_startproc
.LVL161:
	.loc 1 608 3
	beq	a0,zero,.L123
	li	a5,1
	beq	a0,a5,.L124
	ret
.L123:
	.loc 1 610 5
	.loc 1 610 13 is_stmt 0
	lla	a5,.LANCHOR0+16
	sd	a5,fl_prev,a4
	.loc 1 611 5 is_stmt 1
	.loc 1 611 12 is_stmt 0
	sd	a0,caml_allocation_policy,a5
	.loc 1 612 5 is_stmt 1
	ret
.L124:
	.loc 1 614 5
	.loc 1 614 14 is_stmt 0
	sw	zero,flp_size,a5
	.loc 1 615 5 is_stmt 1
	.loc 1 615 12 is_stmt 0
	sd	zero,beyond,a5
	.loc 1 616 5 is_stmt 1
	.loc 1 616 12 is_stmt 0
	sd	a0,caml_allocation_policy,a5
	.loc 1 617 5 is_stmt 1
	.loc 1 621 1 is_stmt 0
	ret
	.cfi_endproc
.LFE16:
	.size	caml_set_allocation_policy, .-caml_set_allocation_policy
	.globl	caml_allocation_policy
	.globl	caml_fl_cur_wsz
	.globl	caml_fl_merge
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	sentinel, @object
	.size	sentinel, 32
sentinel:
	.dword	0
	.dword	512
	.dword	0
	.dword	0
	.bss
	.align	3
	.type	flp, @object
	.size	flp, 8000
flp:
	.zero	8000
	.section	.sbss,"aw",@nobits
	.align	3
	.type	last_fragment, @object
	.size	last_fragment, 8
last_fragment:
	.zero	8
	.type	caml_allocation_policy, @object
	.size	caml_allocation_policy, 8
caml_allocation_policy:
	.zero	8
	.type	beyond, @object
	.size	beyond, 8
beyond:
	.zero	8
	.type	flp_size, @object
	.size	flp_size, 4
flp_size:
	.zero	4
	.zero	4
	.type	caml_fl_cur_wsz, @object
	.size	caml_fl_cur_wsz, 8
caml_fl_cur_wsz:
	.zero	8
	.type	fl_last, @object
	.size	fl_last, 8
fl_last:
	.zero	8
	.section	.sdata,"aw"
	.align	3
	.type	caml_fl_merge, @object
	.size	caml_fl_merge, 8
caml_fl_merge:
	.dword	sentinel+16
	.type	fl_prev, @object
	.size	fl_prev, 8
fl_prev:
	.dword	sentinel+16
	.text
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 3 "caml/config.h"
	.file 4 "caml/misc.h"
	.file 5 "caml/mlvalues.h"
	.file 6 "caml/freelist.h"
	.file 7 "caml/gc_ctrl.h"
	.file 8 "caml/major_gc.h"
	.file 9 "caml/address_class.h"
	.file 10 "caml/minor_gc.h"
	.file 11 "caml/memory.h"
	.file 12 "/home/sai/ocaml-freestanding-riscv/nolibc/include/string.h"
	.file 13 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xcc0
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF118
	.byte	0xc
	.4byte	.LASF119
	.4byte	.LASF120
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
	.byte	0x3
	.4byte	.LASF12
	.byte	0x4
	.byte	0x5c
	.byte	0x10
	.4byte	0xae
	.byte	0x5
	.byte	0x8
	.4byte	0xb4
	.byte	0x6
	.byte	0x7
	.4byte	.LASF13
	.byte	0x4
	.byte	0x5d
	.byte	0x19
	.4byte	0xa2
	.byte	0x7
	.4byte	.LASF14
	.byte	0x4
	.byte	0x5d
	.byte	0x36
	.4byte	0xa2
	.byte	0x7
	.4byte	.LASF15
	.byte	0x4
	.byte	0x5e
	.byte	0x19
	.4byte	0xa2
	.byte	0x7
	.4byte	.LASF16
	.byte	0x4
	.byte	0x5e
	.byte	0x33
	.4byte	0xa2
	.byte	0x7
	.4byte	.LASF17
	.byte	0x4
	.byte	0x5f
	.byte	0x19
	.4byte	0xa2
	.byte	0x7
	.4byte	.LASF18
	.byte	0x4
	.byte	0x5f
	.byte	0x33
	.4byte	0xa2
	.byte	0x8
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x169
	.byte	0x10
	.4byte	0x7d
	.byte	0x8
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
	.byte	0x9
	.4byte	0x123
	.4byte	0x152
	.byte	0xa
	.byte	0
	.byte	0x8
	.4byte	.LASF25
	.byte	0x5
	.2byte	0x15c
	.byte	0x15
	.4byte	0x147
	.byte	0x8
	.4byte	.LASF26
	.byte	0x5
	.2byte	0x171
	.byte	0xe
	.4byte	0x117
	.byte	0x7
	.4byte	.LASF27
	.byte	0x6
	.byte	0x1a
	.byte	0x10
	.4byte	0x89
	.byte	0x7
	.4byte	.LASF28
	.byte	0x7
	.byte	0x18
	.byte	0x6
	.4byte	0x184
	.byte	0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF29
	.byte	0x7
	.4byte	.LASF30
	.byte	0x7
	.byte	0x19
	.byte	0x6
	.4byte	0x184
	.byte	0x7
	.4byte	.LASF31
	.byte	0x7
	.byte	0x1a
	.byte	0x6
	.4byte	0x184
	.byte	0x7
	.4byte	.LASF32
	.byte	0x7
	.byte	0x1d
	.byte	0x6
	.4byte	0x71
	.byte	0x7
	.4byte	.LASF33
	.byte	0x7
	.byte	0x1e
	.byte	0x6
	.4byte	0x71
	.byte	0x7
	.4byte	.LASF34
	.byte	0x7
	.byte	0x1f
	.byte	0x6
	.4byte	0x71
	.byte	0x7
	.4byte	.LASF35
	.byte	0x7
	.byte	0x20
	.byte	0x6
	.4byte	0x71
	.byte	0x7
	.4byte	.LASF36
	.byte	0x7
	.byte	0x21
	.byte	0x6
	.4byte	0x71
	.byte	0x7
	.4byte	.LASF37
	.byte	0x7
	.byte	0x22
	.byte	0x6
	.4byte	0x71
	.byte	0x7
	.4byte	.LASF38
	.byte	0x8
	.byte	0x24
	.byte	0xc
	.4byte	0x47
	.byte	0x7
	.4byte	.LASF39
	.byte	0x8
	.byte	0x25
	.byte	0xc
	.4byte	0x47
	.byte	0x7
	.4byte	.LASF40
	.byte	0x8
	.byte	0x26
	.byte	0x10
	.4byte	0x7d
	.byte	0x7
	.4byte	.LASF41
	.byte	0x8
	.byte	0x27
	.byte	0xf
	.4byte	0x184
	.byte	0x7
	.4byte	.LASF42
	.byte	0x8
	.byte	0x28
	.byte	0x10
	.4byte	0x7d
	.byte	0x7
	.4byte	.LASF43
	.byte	0x8
	.byte	0x28
	.byte	0x25
	.4byte	0x7d
	.byte	0x7
	.4byte	.LASF44
	.byte	0x8
	.byte	0x29
	.byte	0x10
	.4byte	0x7d
	.byte	0x7
	.4byte	.LASF45
	.byte	0x8
	.byte	0x3e
	.byte	0x12
	.4byte	0x95
	.byte	0x7
	.4byte	.LASF46
	.byte	0x8
	.byte	0x3f
	.byte	0x10
	.4byte	0x7d
	.byte	0x7
	.4byte	.LASF47
	.byte	0x8
	.byte	0x40
	.byte	0xe
	.4byte	0x95
	.byte	0x7
	.4byte	.LASF48
	.byte	0x8
	.byte	0x42
	.byte	0xc
	.4byte	0x47
	.byte	0x9
	.4byte	0x184
	.4byte	0x27f
	.byte	0xb
	.4byte	0x40
	.byte	0x31
	.byte	0
	.byte	0xc
	.4byte	.LASF49
	.byte	0x8
	.byte	0x43
	.byte	0x8
	.4byte	0x26f
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0xc
	.4byte	.LASF50
	.byte	0x8
	.byte	0x44
	.byte	0x5
	.4byte	0x47
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0xc
	.4byte	.LASF51
	.byte	0x8
	.byte	0x45
	.byte	0x8
	.4byte	0x184
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0x7
	.4byte	.LASF52
	.byte	0x8
	.byte	0x46
	.byte	0xf
	.4byte	0x184
	.byte	0x7
	.4byte	.LASF53
	.byte	0x8
	.byte	0x4a
	.byte	0x13
	.4byte	0xae
	.byte	0x7
	.4byte	.LASF54
	.byte	0x9
	.byte	0x31
	.byte	0xf
	.4byte	0x2e5
	.byte	0x5
	.byte	0x8
	.4byte	0x117
	.byte	0x7
	.4byte	.LASF55
	.byte	0x9
	.byte	0x31
	.byte	0x22
	.4byte	0x2e5
	.byte	0x7
	.4byte	.LASF56
	.byte	0x9
	.byte	0x32
	.byte	0xf
	.4byte	0x95
	.byte	0x7
	.4byte	.LASF57
	.byte	0x9
	.byte	0x32
	.byte	0x27
	.4byte	0x95
	.byte	0x7
	.4byte	.LASF58
	.byte	0xa
	.byte	0x18
	.byte	0x13
	.4byte	0x2e5
	.byte	0x7
	.4byte	.LASF59
	.byte	0xa
	.byte	0x18
	.byte	0x2c
	.4byte	0x2e5
	.byte	0x7
	.4byte	.LASF60
	.byte	0xa
	.byte	0x19
	.byte	0x13
	.4byte	0x2e5
	.byte	0x7
	.4byte	.LASF61
	.byte	0xa
	.byte	0x19
	.byte	0x24
	.4byte	0x2e5
	.byte	0x7
	.4byte	.LASF62
	.byte	0xa
	.byte	0x1a
	.byte	0x13
	.4byte	0x2e5
	.byte	0x7
	.4byte	.LASF63
	.byte	0xa
	.byte	0x1b
	.byte	0x10
	.4byte	0x89
	.byte	0x7
	.4byte	.LASF64
	.byte	0xa
	.byte	0x1c
	.byte	0xc
	.4byte	0x47
	.byte	0x7
	.4byte	.LASF65
	.byte	0xa
	.byte	0x1d
	.byte	0xf
	.4byte	0x184
	.byte	0xd
	.4byte	.LASF71
	.byte	0x38
	.byte	0xa
	.byte	0x29
	.byte	0x8
	.4byte	0x3d8
	.byte	0xe
	.4byte	.LASF66
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x3d8
	.byte	0
	.byte	0xf
	.string	"end"
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x3d8
	.byte	0x8
	.byte	0xe
	.4byte	.LASF67
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x3d8
	.byte	0x10
	.byte	0xf
	.string	"ptr"
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x3d8
	.byte	0x18
	.byte	0xe
	.4byte	.LASF68
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x3d8
	.byte	0x20
	.byte	0xe
	.4byte	.LASF69
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x89
	.byte	0x28
	.byte	0xe
	.4byte	.LASF70
	.byte	0xa
	.byte	0x29
	.byte	0x17
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x2e5
	.byte	0x7
	.4byte	.LASF71
	.byte	0xa
	.byte	0x2a
	.byte	0x22
	.4byte	0x36f
	.byte	0xd
	.4byte	.LASF72
	.byte	0x10
	.byte	0xa
	.byte	0x2c
	.byte	0x8
	.4byte	0x412
	.byte	0xe
	.4byte	.LASF73
	.byte	0xa
	.byte	0x2d
	.byte	0x9
	.4byte	0x117
	.byte	0
	.byte	0xe
	.4byte	.LASF74
	.byte	0xa
	.byte	0x2e
	.byte	0xc
	.4byte	0x12f
	.byte	0x8
	.byte	0
	.byte	0xd
	.4byte	.LASF75
	.byte	0x38
	.byte	0xa
	.byte	0x31
	.byte	0x8
	.4byte	0x47b
	.byte	0xe
	.4byte	.LASF66
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x47b
	.byte	0
	.byte	0xf
	.string	"end"
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x47b
	.byte	0x8
	.byte	0xe
	.4byte	.LASF67
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x47b
	.byte	0x10
	.byte	0xf
	.string	"ptr"
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x47b
	.byte	0x18
	.byte	0xe
	.4byte	.LASF68
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x47b
	.byte	0x20
	.byte	0xe
	.4byte	.LASF69
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x89
	.byte	0x28
	.byte	0xe
	.4byte	.LASF70
	.byte	0xa
	.byte	0x31
	.byte	0x1c
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x3ea
	.byte	0x7
	.4byte	.LASF75
	.byte	0xa
	.byte	0x32
	.byte	0x27
	.4byte	0x412
	.byte	0xd
	.4byte	.LASF76
	.byte	0x18
	.byte	0xa
	.byte	0x34
	.byte	0x8
	.4byte	0x4c2
	.byte	0xe
	.4byte	.LASF77
	.byte	0xa
	.byte	0x35
	.byte	0x9
	.4byte	0x117
	.byte	0
	.byte	0xf
	.string	"mem"
	.byte	0xa
	.byte	0x36
	.byte	0xc
	.4byte	0x12f
	.byte	0x8
	.byte	0xf
	.string	"max"
	.byte	0xa
	.byte	0x37
	.byte	0xc
	.4byte	0x12f
	.byte	0x10
	.byte	0
	.byte	0xd
	.4byte	.LASF78
	.byte	0x38
	.byte	0xa
	.byte	0x3a
	.byte	0x8
	.4byte	0x52b
	.byte	0xe
	.4byte	.LASF66
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x52b
	.byte	0
	.byte	0xf
	.string	"end"
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x52b
	.byte	0x8
	.byte	0xe
	.4byte	.LASF67
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x52b
	.byte	0x10
	.byte	0xf
	.string	"ptr"
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x52b
	.byte	0x18
	.byte	0xe
	.4byte	.LASF68
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x52b
	.byte	0x20
	.byte	0xe
	.4byte	.LASF69
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x89
	.byte	0x28
	.byte	0xe
	.4byte	.LASF70
	.byte	0xa
	.byte	0x3a
	.byte	0x1a
	.4byte	0x89
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x48d
	.byte	0x7
	.4byte	.LASF78
	.byte	0xa
	.byte	0x3b
	.byte	0x25
	.4byte	0x4c2
	.byte	0x7
	.4byte	.LASF79
	.byte	0xb
	.byte	0x3f
	.byte	0x10
	.4byte	0x47
	.byte	0x7
	.4byte	.LASF80
	.byte	0xb
	.byte	0xb7
	.byte	0x10
	.4byte	0x7d
	.byte	0xd
	.4byte	.LASF81
	.byte	0x40
	.byte	0xb
	.byte	0xf3
	.byte	0x8
	.4byte	0x597
	.byte	0xe
	.4byte	.LASF82
	.byte	0xb
	.byte	0xf4
	.byte	0x1d
	.4byte	0x597
	.byte	0
	.byte	0xe
	.4byte	.LASF83
	.byte	0xb
	.byte	0xf5
	.byte	0xa
	.4byte	0x71
	.byte	0x8
	.byte	0xe
	.4byte	.LASF84
	.byte	0xb
	.byte	0xf6
	.byte	0xa
	.4byte	0x71
	.byte	0x10
	.byte	0xe
	.4byte	.LASF85
	.byte	0xb
	.byte	0xf7
	.byte	0xa
	.4byte	0x59d
	.byte	0x18
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x555
	.byte	0x9
	.4byte	0x2e5
	.4byte	0x5ad
	.byte	0xb
	.4byte	0x40
	.byte	0x4
	.byte	0
	.byte	0x7
	.4byte	.LASF86
	.byte	0xb
	.byte	0xfa
	.byte	0x26
	.4byte	0x597
	.byte	0x10
	.byte	0x20
	.byte	0x1
	.byte	0x2d
	.byte	0x8
	.4byte	0x5f5
	.byte	0xe
	.4byte	.LASF87
	.byte	0x1
	.byte	0x2e
	.byte	0x9
	.4byte	0x117
	.byte	0
	.byte	0xf
	.string	"h"
	.byte	0x1
	.byte	0x2f
	.byte	0xc
	.4byte	0x123
	.byte	0x8
	.byte	0xe
	.4byte	.LASF88
	.byte	0x1
	.byte	0x30
	.byte	0x9
	.4byte	0x117
	.byte	0x10
	.byte	0xe
	.4byte	.LASF89
	.byte	0x1
	.byte	0x31
	.byte	0x9
	.4byte	0x117
	.byte	0x18
	.byte	0
	.byte	0x11
	.4byte	.LASF90
	.byte	0x1
	.byte	0x32
	.byte	0x3
	.4byte	0x5b9
	.byte	0x9
	.byte	0x3
	.8byte	sentinel
	.byte	0x11
	.4byte	.LASF91
	.byte	0x1
	.byte	0x35
	.byte	0xe
	.4byte	0x117
	.byte	0x9
	.byte	0x3
	.8byte	fl_prev
	.byte	0x11
	.4byte	.LASF92
	.byte	0x1
	.byte	0x36
	.byte	0xe
	.4byte	0x117
	.byte	0x9
	.byte	0x3
	.8byte	fl_last
	.byte	0xc
	.4byte	.LASF93
	.byte	0x1
	.byte	0x38
	.byte	0x7
	.4byte	0x117
	.byte	0x9
	.byte	0x3
	.8byte	caml_fl_merge
	.byte	0x12
	.4byte	0x16c
	.byte	0x1
	.byte	0x3a
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_fl_cur_wsz
	.byte	0x9
	.4byte	0x117
	.4byte	0x670
	.byte	0x13
	.4byte	0x40
	.2byte	0x3e7
	.byte	0
	.byte	0x14
	.string	"flp"
	.byte	0x1
	.byte	0x3e
	.byte	0xe
	.4byte	0x65f
	.byte	0x9
	.byte	0x3
	.8byte	flp
	.byte	0x11
	.4byte	.LASF94
	.byte	0x1
	.byte	0x3f
	.byte	0xc
	.4byte	0x47
	.byte	0x9
	.byte	0x3
	.8byte	flp_size
	.byte	0x11
	.4byte	.LASF95
	.byte	0x1
	.byte	0x40
	.byte	0xe
	.4byte	0x117
	.byte	0x9
	.byte	0x3
	.8byte	beyond
	.byte	0xc
	.4byte	.LASF96
	.byte	0x1
	.byte	0x46
	.byte	0x9
	.4byte	0x7d
	.byte	0x9
	.byte	0x3
	.8byte	caml_allocation_policy
	.byte	0x15
	.4byte	.LASF97
	.byte	0x1
	.2byte	0x18c
	.byte	0x12
	.4byte	0x6df
	.byte	0x9
	.byte	0x3
	.8byte	last_fragment
	.byte	0x5
	.byte	0x8
	.4byte	0x123
	.byte	0x16
	.4byte	.LASF98
	.byte	0x1
	.2byte	0x25e
	.byte	0x6
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x712
	.byte	0x17
	.string	"p"
	.byte	0x1
	.2byte	0x25e
	.byte	0x2a
	.4byte	0x7d
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x16
	.4byte	.LASF99
	.byte	0x1
	.2byte	0x24c
	.byte	0x6
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x798
	.byte	0x18
	.string	"p"
	.byte	0x1
	.2byte	0x24c
	.byte	0x24
	.4byte	0x2e5
	.4byte	.LLST24
	.byte	0x19
	.4byte	.LASF69
	.byte	0x1
	.2byte	0x24c
	.byte	0x30
	.4byte	0x12f
	.4byte	.LLST25
	.byte	0x19
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x24c
	.byte	0x3a
	.4byte	0x47
	.4byte	.LLST26
	.byte	0x19
	.4byte	.LASF101
	.byte	0x1
	.2byte	0x24c
	.byte	0x48
	.4byte	0x47
	.4byte	.LLST27
	.byte	0x1a
	.string	"sz"
	.byte	0x1
	.2byte	0x24e
	.byte	0xc
	.4byte	0x12f
	.4byte	.LLST28
	.byte	0x1b
	.8byte	.LVL157
	.4byte	0x7fd
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LASF102
	.byte	0x1
	.2byte	0x217
	.byte	0x6
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x7fd
	.byte	0x18
	.string	"bp"
	.byte	0x1
	.2byte	0x217
	.byte	0x20
	.4byte	0x117
	.4byte	.LLST21
	.byte	0x1a
	.string	"cur"
	.byte	0x1
	.2byte	0x219
	.byte	0x9
	.4byte	0x117
	.4byte	.LLST22
	.byte	0x1d
	.4byte	.Ldebug_ranges0+0x30
	.byte	0x1e
	.4byte	.LASF103
	.byte	0x1
	.2byte	0x22a
	.byte	0xb
	.4byte	0x117
	.4byte	.LLST23
	.byte	0x1f
	.8byte	.LVL149
	.4byte	0x940
	.byte	0
	.byte	0
	.byte	0x20
	.4byte	.LASF110
	.byte	0x1
	.2byte	0x1bf
	.byte	0xb
	.4byte	0x6df
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0x8f8
	.byte	0x18
	.string	"bp"
	.byte	0x1
	.2byte	0x1bf
	.byte	0x26
	.4byte	0x117
	.4byte	.LLST12
	.byte	0x1e
	.4byte	.LASF103
	.byte	0x1
	.2byte	0x1c1
	.byte	0x9
	.4byte	0x117
	.4byte	.LLST13
	.byte	0x1a
	.string	"cur"
	.byte	0x1
	.2byte	0x1c1
	.byte	0xf
	.4byte	0x117
	.4byte	.LLST14
	.byte	0x1a
	.string	"adj"
	.byte	0x1
	.2byte	0x1c2
	.byte	0xd
	.4byte	0x6df
	.4byte	.LLST15
	.byte	0x1a
	.string	"hd"
	.byte	0x1
	.2byte	0x1c3
	.byte	0xc
	.4byte	0x123
	.4byte	.LLST16
	.byte	0x1e
	.4byte	.LASF104
	.byte	0x1
	.2byte	0x1c4
	.byte	0xc
	.4byte	0x12f
	.4byte	.LLST17
	.byte	0x21
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0x8ab
	.byte	0x1e
	.4byte	.LASF105
	.byte	0x1
	.2byte	0x1d6
	.byte	0xe
	.4byte	0x12f
	.4byte	.LLST18
	.byte	0
	.byte	0x21
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.4byte	0x8e3
	.byte	0x1e
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x1e3
	.byte	0xb
	.4byte	0x117
	.4byte	.LLST19
	.byte	0x1e
	.4byte	.LASF107
	.byte	0x1
	.2byte	0x1e4
	.byte	0xe
	.4byte	0x12f
	.4byte	.LLST20
	.byte	0
	.byte	0x1b
	.8byte	.LVL117
	.4byte	0x940
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LASF108
	.byte	0x1
	.2byte	0x1ab
	.byte	0x6
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x940
	.byte	0x1f
	.8byte	.LVL101
	.4byte	0x96f
	.byte	0x1b
	.8byte	.LVL102
	.4byte	0x940
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+16
	.byte	0
	.byte	0
	.byte	0x22
	.4byte	.LASF121
	.byte	0x1
	.2byte	0x19e
	.byte	0xd
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x96f
	.byte	0x23
	.4byte	.LASF109
	.byte	0x1
	.2byte	0x19e
	.byte	0x21
	.4byte	0x117
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x24
	.4byte	.LASF122
	.byte	0x1
	.2byte	0x18e
	.byte	0x6
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.byte	0x25
	.4byte	.LASF111
	.byte	0x1
	.byte	0xbc
	.byte	0xb
	.4byte	0x6df
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0xc3f
	.byte	0x26
	.4byte	.LASF112
	.byte	0x1
	.byte	0xbc
	.byte	0x26
	.4byte	0x12f
	.4byte	.LLST3
	.byte	0x27
	.string	"cur"
	.byte	0x1
	.byte	0xbe
	.byte	0x9
	.4byte	0x117
	.4byte	.LLST4
	.byte	0x28
	.4byte	.LASF103
	.byte	0x1
	.byte	0xbe
	.byte	0x19
	.4byte	0x117
	.4byte	.LLST5
	.byte	0x28
	.4byte	.LASF113
	.byte	0x1
	.byte	0xbf
	.byte	0xd
	.4byte	0x6df
	.4byte	.LLST6
	.byte	0x27
	.string	"i"
	.byte	0x1
	.byte	0xc0
	.byte	0x7
	.4byte	0x47
	.4byte	.LLST7
	.byte	0x27
	.string	"sz"
	.byte	0x1
	.byte	0xc1
	.byte	0xc
	.4byte	0x12f
	.4byte	.LLST8
	.byte	0x28
	.4byte	.LASF114
	.byte	0x1
	.byte	0xc1
	.byte	0x10
	.4byte	0x12f
	.4byte	.LLST9
	.byte	0x29
	.4byte	.LASF123
	.byte	0x1
	.2byte	0x13f
	.byte	0x3
	.8byte	.L28
	.byte	0x2a
	.4byte	.Ldebug_ranges0+0
	.4byte	0xb9f
	.byte	0x2b
	.string	"buf"
	.byte	0x1
	.2byte	0x150
	.byte	0xf
	.4byte	0x65f
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x41
	.byte	0x1a
	.string	"j"
	.byte	0x1
	.2byte	0x151
	.byte	0xd
	.4byte	0x47
	.4byte	.LLST10
	.byte	0x1e
	.4byte	.LASF115
	.byte	0x1
	.2byte	0x152
	.byte	0x12
	.4byte	0x12f
	.4byte	.LLST11
	.byte	0x2c
	.8byte	.LVL90
	.4byte	0xcac
	.4byte	0xaa9
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x17
	.byte	0x79
	.byte	0
	.byte	0x83
	.byte	0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x3
	.8byte	flp
	.byte	0x22
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x14
	.byte	0x79
	.byte	0x1
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x3
	.8byte	flp
	.byte	0x22
	.byte	0
	.byte	0x2c
	.8byte	.LVL92
	.4byte	0xcb8
	.4byte	0xada
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0xc
	.byte	0x79
	.byte	0
	.byte	0x3
	.8byte	flp
	.byte	0x22
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x41
	.byte	0x1c
	.byte	0x1
	.byte	0x5c
	.byte	0x4
	.byte	0x83
	.byte	0
	.byte	0x33
	.byte	0x24
	.byte	0
	.byte	0x2c
	.8byte	.LVL96
	.4byte	0xcac
	.4byte	0xb34
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x17
	.byte	0x79
	.byte	0
	.byte	0x83
	.byte	0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x3
	.8byte	flp
	.byte	0x22
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x14
	.byte	0x79
	.byte	0x1
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x3
	.8byte	flp
	.byte	0x22
	.byte	0x1c
	.byte	0x1
	.byte	0x5c
	.byte	0x11
	.byte	0xa
	.2byte	0x3e8
	.byte	0x83
	.byte	0
	.byte	0x1c
	.byte	0x79
	.byte	0
	.byte	0x1c
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0
	.byte	0x2c
	.8byte	.LVL98
	.4byte	0xcb8
	.4byte	0xb65
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0xc
	.byte	0x79
	.byte	0
	.byte	0x3
	.8byte	flp
	.byte	0x22
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x41
	.byte	0x1c
	.byte	0x1
	.byte	0x5c
	.byte	0x4
	.byte	0x83
	.byte	0
	.byte	0x33
	.byte	0x24
	.byte	0
	.byte	0x1b
	.8byte	.LVL100
	.4byte	0xcb8
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0xe
	.byte	0x79
	.byte	0
	.byte	0x33
	.byte	0x24
	.byte	0x3
	.8byte	flp
	.byte	0x22
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x41
	.byte	0x1c
	.byte	0x1
	.byte	0x5c
	.byte	0xe
	.byte	0xa
	.2byte	0x3e8
	.byte	0x79
	.byte	0
	.byte	0x1c
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0
	.byte	0
	.byte	0x2c
	.8byte	.LVL22
	.4byte	0xc3f
	.4byte	0xbbf
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x23
	.byte	0x1
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x2c
	.8byte	.LVL29
	.4byte	0xc3f
	.4byte	0xbdf
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x23
	.byte	0x1
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x2c
	.8byte	.LVL33
	.4byte	0xc3f
	.4byte	0xc00
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x23
	.byte	0x1
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x2c
	.8byte	.LVL52
	.4byte	0xc3f
	.4byte	0xc21
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x23
	.byte	0x1
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x1b
	.8byte	.LVL72
	.4byte	0xc3f
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x23
	.byte	0x1
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0
	.byte	0x2d
	.4byte	.LASF124
	.byte	0x1
	.byte	0x7a
	.byte	0x12
	.4byte	0x6df
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0xcac
	.byte	0x26
	.4byte	.LASF116
	.byte	0x1
	.byte	0x7a
	.byte	0x2b
	.4byte	0x12f
	.4byte	.LLST0
	.byte	0x26
	.4byte	.LASF117
	.byte	0x1
	.byte	0x7a
	.byte	0x36
	.4byte	0x47
	.4byte	.LLST1
	.byte	0x2e
	.4byte	.LASF103
	.byte	0x1
	.byte	0x7a
	.byte	0x42
	.4byte	0x117
	.byte	0x1
	.byte	0x5c
	.byte	0x2f
	.string	"cur"
	.byte	0x1
	.byte	0x7b
	.byte	0x28
	.4byte	0x117
	.byte	0x1
	.byte	0x5d
	.byte	0x27
	.string	"h"
	.byte	0x1
	.byte	0x7d
	.byte	0xc
	.4byte	0x123
	.4byte	.LLST2
	.byte	0
	.byte	0x30
	.4byte	.LASF125
	.4byte	.LASF125
	.byte	0xc
	.byte	0x9
	.byte	0x7
	.byte	0x31
	.4byte	.LASF126
	.4byte	.LASF127
	.byte	0xd
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x12
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
	.byte	0x13
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x18
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
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x20
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
	.byte	0x21
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
	.byte	0x22
	.byte	0x2e
	.byte	0x1
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
	.byte	0x23
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x24
	.byte	0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.byte	0x25
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
	.byte	0x28
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
	.byte	0x29
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
	.byte	0x2a
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2b
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
	.byte	0x2c
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
	.byte	0x2d
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
	.byte	0x2e
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
	.byte	0x2f
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
	.byte	0x30
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
	.byte	0x31
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
.LLST24:
	.8byte	.LVL150-.Ltext0
	.8byte	.LVL151-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL151-.Ltext0
	.8byte	.LVL160-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST25:
	.8byte	.LVL150-.Ltext0
	.8byte	.LVL151-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL151-.Ltext0
	.8byte	.LVL159-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST26:
	.8byte	.LVL150-.Ltext0
	.8byte	.LVL151-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL151-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST27:
	.8byte	.LVL150-.Ltext0
	.8byte	.LVL151-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL151-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5d
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST28:
	.8byte	.LVL152-.Ltext0
	.8byte	.LVL154-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL156-.Ltext0
	.8byte	.LVL158-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST21:
	.8byte	.LVL136-.Ltext0
	.8byte	.LVL149-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL149-1-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST22:
	.8byte	.LVL136-.Ltext0
	.8byte	.LVL137-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL137-.Ltext0
	.8byte	.LVL139-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL140-.Ltext0
	.8byte	.LVL141-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL142-.Ltext0
	.8byte	.LVL143-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL143-.Ltext0
	.8byte	.LVL144-.Ltext0
	.2byte	0x2
	.byte	0x7f
	.byte	0
	.8byte	.LVL144-.Ltext0
	.8byte	.LVL145-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST23:
	.8byte	.LVL141-.Ltext0
	.8byte	.LVL143-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL143-.Ltext0
	.8byte	.LVL144-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL144-.Ltext0
	.8byte	.LVL146-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL147-.Ltext0
	.8byte	.LVL148-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST12:
	.8byte	.LVL103-.Ltext0
	.8byte	.LVL107-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL107-.Ltext0
	.8byte	.LVL113-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL113-.Ltext0
	.8byte	.LVL116-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL116-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST13:
	.8byte	.LVL105-.Ltext0
	.8byte	.LVL114-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL116-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST14:
	.8byte	.LVL106-.Ltext0
	.8byte	.LVL115-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL116-.Ltext0
	.8byte	.LVL129-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL129-.Ltext0
	.8byte	.LVL130-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL130-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST15:
	.8byte	.LVL108-.Ltext0
	.8byte	.LVL116-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL122-.Ltext0
	.8byte	.LVL128-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL129-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST16:
	.8byte	.LVL104-.Ltext0
	.8byte	.LVL111-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL116-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST17:
	.8byte	.LVL109-.Ltext0
	.8byte	.LVL110-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL110-.Ltext0
	.8byte	.LVL112-.Ltext0
	.2byte	0x6
	.byte	0x82
	.byte	0x78
	.byte	0x6
	.byte	0x3a
	.byte	0x25
	.byte	0x9f
	.8byte	.LVL131-.Ltext0
	.8byte	.LVL132-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL132-.Ltext0
	.8byte	.LVL133-.Ltext0
	.2byte	0x6
	.byte	0x82
	.byte	0x78
	.byte	0x6
	.byte	0x3a
	.byte	0x25
	.byte	0x9f
	.8byte	.LVL134-.Ltext0
	.8byte	.LVL135-.Ltext0
	.2byte	0x6
	.byte	0x82
	.byte	0x78
	.byte	0x6
	.byte	0x3a
	.byte	0x25
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST18:
	.8byte	.LVL118-.Ltext0
	.8byte	.LVL121-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST19:
	.8byte	.LVL123-.Ltext0
	.8byte	.LVL131-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST20:
	.8byte	.LVL124-.Ltext0
	.8byte	.LVL125-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL125-.Ltext0
	.8byte	.LVL126-.Ltext0
	.2byte	0x8
	.byte	0x83
	.byte	0x78
	.byte	0x6
	.byte	0x3a
	.byte	0x25
	.byte	0x23
	.byte	0x1
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL22-1-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.byte	0x7f
	.byte	0x9f
	.8byte	.LVL22-1-.Ltext0
	.8byte	.LVL23-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL28-.Ltext0
	.8byte	.LVL29-1-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.byte	0x7f
	.byte	0x9f
	.8byte	.LVL29-1-.Ltext0
	.8byte	.LVL30-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL32-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL32-.Ltext0
	.8byte	.LVL33-1-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.byte	0x7f
	.byte	0x9f
	.8byte	.LVL33-1-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL38-.Ltext0
	.8byte	.LVL51-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL51-.Ltext0
	.8byte	.LVL52-1-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.byte	0x7f
	.byte	0x9f
	.8byte	.LVL52-1-.Ltext0
	.8byte	.LVL54-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL54-.Ltext0
	.8byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL71-.Ltext0
	.8byte	.LVL72-1-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.byte	0x7f
	.byte	0x9f
	.8byte	.LVL72-1-.Ltext0
	.8byte	.LVL73-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL73-.Ltext0
	.8byte	.LVL74-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL74-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL13-.Ltext0
	.8byte	.LVL14-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.byte	0
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL22-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL26-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.byte	0
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL29-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL31-.Ltext0
	.8byte	.LVL34-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL38-.Ltext0
	.8byte	.LVL47-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL47-.Ltext0
	.8byte	.LVL48-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL48-.Ltext0
	.8byte	.LVL49-.Ltext0
	.2byte	0x2
	.byte	0x7c
	.byte	0
	.8byte	.LVL49-.Ltext0
	.8byte	.LVL52-1-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL54-.Ltext0
	.8byte	.LVL60-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL60-.Ltext0
	.8byte	.LVL63-.Ltext0
	.2byte	0x9
	.byte	0x3
	.8byte	beyond
	.8byte	.LVL63-.Ltext0
	.8byte	.LVL65-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL65-.Ltext0
	.8byte	.LVL66-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.byte	0
	.8byte	.LVL66-.Ltext0
	.8byte	.LVL72-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL73-.Ltext0
	.8byte	.LVL74-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL77-.Ltext0
	.8byte	.LVL78-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL79-.Ltext0
	.8byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL22-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL26-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL29-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL37-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL43-.Ltext0
	.8byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL45-.Ltext0
	.8byte	.LVL47-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL47-.Ltext0
	.8byte	.LVL52-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL54-.Ltext0
	.8byte	.LVL61-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL61-.Ltext0
	.8byte	.LVL65-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL65-.Ltext0
	.8byte	.LVL66-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL66-.Ltext0
	.8byte	.LVL68-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL69-.Ltext0
	.8byte	.LVL72-1-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL73-.Ltext0
	.8byte	.LVL74-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL77-.Ltext0
	.8byte	.LVL87-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL34-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL53-.Ltext0
	.8byte	.LVL54-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL74-.Ltext0
	.8byte	.LVL77-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL77-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL31-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL39-.Ltext0
	.8byte	.LVL41-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL47-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL50-.Ltext0
	.8byte	.LVL54-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL74-.Ltext0
	.8byte	.LVL76-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL77-.Ltext0
	.8byte	.LVL88-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL89-.Ltext0
	.8byte	.LVL91-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL93-.Ltext0
	.8byte	.LVL94-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL95-.Ltext0
	.8byte	.LVL97-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL99-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL31-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL40-.Ltext0
	.8byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL49-.Ltext0
	.8byte	.LVL55-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL57-.Ltext0
	.8byte	.LVL59-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL64-.Ltext0
	.8byte	.LVL66-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL67-.Ltext0
	.8byte	.LVL72-1-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL74-.Ltext0
	.8byte	.LVL77-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL77-.Ltext0
	.8byte	.LVL78-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL80-.Ltext0
	.8byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL35-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL43-.Ltext0
	.8byte	.LVL44-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL46-.Ltext0
	.8byte	.LVL49-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL55-.Ltext0
	.8byte	.LVL58-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL59-.Ltext0
	.8byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL62-.Ltext0
	.8byte	.LVL70-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL70-.Ltext0
	.8byte	.LVL72-1-.Ltext0
	.2byte	0x11
	.byte	0x3
	.8byte	flp+7992
	.byte	0x6
	.byte	0x6
	.byte	0x38
	.byte	0x1c
	.byte	0x6
	.byte	0x3a
	.byte	0x25
	.byte	0x9f
	.8byte	.LVL73-.Ltext0
	.8byte	.LVL74-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL75-.Ltext0
	.8byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL84-.Ltext0
	.8byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST10:
	.8byte	.LVL36-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL78-.Ltext0
	.8byte	.LVL81-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL81-.Ltext0
	.8byte	.LVL83-.Ltext0
	.2byte	0x3
	.byte	0x83
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL85-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST11:
	.8byte	.LVL36-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL77-.Ltext0
	.8byte	.LVL86-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL10-.Ltext0
	.8byte	.LFE8-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL8-.Ltext0
	.8byte	.LFE8-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.byte	0x78
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL9-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.byte	0x78
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
	.8byte	.LBB6-.Ltext0
	.8byte	.LBE6-.Ltext0
	.8byte	.LBB7-.Ltext0
	.8byte	.LBE7-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF114:
	.string	"prevsz"
.LASF68:
	.string	"limit"
.LASF107:
	.string	"cur_whsz"
.LASF125:
	.string	"memmove"
.LASF113:
	.string	"result"
.LASF58:
	.string	"caml_young_alloc_start"
.LASF120:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF106:
	.string	"next_cur"
.LASF12:
	.string	"caml_timing_hook"
.LASF121:
	.string	"truncate_flp"
.LASF87:
	.string	"filler1"
.LASF34:
	.string	"caml_stat_heap_wsz"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF76:
	.string	"caml_custom_elt"
.LASF39:
	.string	"caml_gc_subphase"
.LASF33:
	.string	"caml_stat_major_collections"
.LASF127:
	.string	"__builtin_memcpy"
.LASF105:
	.string	"bp_whsz"
.LASF61:
	.string	"caml_young_limit"
.LASF126:
	.string	"memcpy"
.LASF59:
	.string	"caml_young_alloc_end"
.LASF36:
	.string	"caml_stat_compactions"
.LASF91:
	.string	"fl_prev"
.LASF118:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF21:
	.string	"value"
.LASF98:
	.string	"caml_set_allocation_policy"
.LASF71:
	.string	"caml_ref_table"
.LASF47:
	.string	"caml_gc_sweep_hp"
.LASF15:
	.string	"caml_minor_gc_begin_hook"
.LASF64:
	.string	"caml_in_minor_collection"
.LASF86:
	.string	"caml_local_roots"
.LASF62:
	.string	"caml_young_trigger"
.LASF24:
	.string	"tag_t"
.LASF35:
	.string	"caml_stat_top_heap_wsz"
.LASF111:
	.string	"caml_fl_allocate"
.LASF53:
	.string	"caml_major_gc_hook"
.LASF52:
	.string	"caml_gc_clock"
.LASF84:
	.string	"nitems"
.LASF18:
	.string	"caml_finalise_end_hook"
.LASF2:
	.string	"long long int"
.LASF95:
	.string	"beyond"
.LASF49:
	.string	"caml_major_ring"
.LASF67:
	.string	"threshold"
.LASF85:
	.string	"tables"
.LASF8:
	.string	"intnat"
.LASF0:
	.string	"long int"
.LASF124:
	.string	"allocate_block"
.LASF37:
	.string	"caml_stat_heap_chunks"
.LASF70:
	.string	"reserve"
.LASF79:
	.string	"caml_huge_fallback_count"
.LASF77:
	.string	"block"
.LASF27:
	.string	"caml_fl_cur_wsz"
.LASF20:
	.string	"caml_runtime_warnings"
.LASF22:
	.string	"header_t"
.LASF89:
	.string	"filler2"
.LASF119:
	.string	"freelist.c"
.LASF99:
	.string	"caml_make_free_blocks"
.LASF14:
	.string	"caml_major_slice_end_hook"
.LASF25:
	.string	"caml_atom_table"
.LASF3:
	.string	"long double"
.LASF17:
	.string	"caml_finalise_begin_hook"
.LASF65:
	.string	"caml_extra_heap_resources_minor"
.LASF43:
	.string	"caml_dependent_allocated"
.LASF110:
	.string	"caml_fl_merge_block"
.LASF23:
	.string	"mlsize_t"
.LASF81:
	.string	"caml__roots_block"
.LASF9:
	.string	"uintnat"
.LASF55:
	.string	"caml_young_end"
.LASF4:
	.string	"unsigned int"
.LASF101:
	.string	"color"
.LASF115:
	.string	"oldsz"
.LASF73:
	.string	"ephe"
.LASF13:
	.string	"caml_major_slice_begin_hook"
.LASF6:
	.string	"short unsigned int"
.LASF74:
	.string	"offset"
.LASF54:
	.string	"caml_young_start"
.LASF123:
	.string	"update_flp"
.LASF11:
	.string	"char"
.LASF109:
	.string	"changed"
.LASF50:
	.string	"caml_major_ring_index"
.LASF103:
	.string	"prev"
.LASF104:
	.string	"prev_wosz"
.LASF57:
	.string	"caml_code_area_end"
.LASF38:
	.string	"caml_gc_phase"
.LASF63:
	.string	"caml_minor_heap_wsz"
.LASF19:
	.string	"caml_verb_gc"
.LASF16:
	.string	"caml_minor_gc_end_hook"
.LASF112:
	.string	"wo_sz"
.LASF116:
	.string	"wh_sz"
.LASF48:
	.string	"caml_major_window"
.LASF93:
	.string	"caml_fl_merge"
.LASF1:
	.string	"long unsigned int"
.LASF56:
	.string	"caml_code_area_start"
.LASF29:
	.string	"double"
.LASF26:
	.string	"caml_global_data"
.LASF94:
	.string	"flp_size"
.LASF69:
	.string	"size"
.LASF96:
	.string	"caml_allocation_policy"
.LASF117:
	.string	"flpi"
.LASF30:
	.string	"caml_stat_promoted_words"
.LASF100:
	.string	"do_merge"
.LASF44:
	.string	"caml_fl_wsz_at_phase_change"
.LASF78:
	.string	"caml_custom_table"
.LASF28:
	.string	"caml_stat_minor_words"
.LASF92:
	.string	"fl_last"
.LASF102:
	.string	"caml_fl_add_blocks"
.LASF32:
	.string	"caml_stat_minor_collections"
.LASF41:
	.string	"caml_extra_heap_resources"
.LASF40:
	.string	"caml_allocated_words"
.LASF83:
	.string	"ntables"
.LASF88:
	.string	"first_field"
.LASF42:
	.string	"caml_dependent_size"
.LASF45:
	.string	"caml_heap_start"
.LASF108:
	.string	"caml_fl_reset"
.LASF97:
	.string	"last_fragment"
.LASF10:
	.string	"asize_t"
.LASF60:
	.string	"caml_young_ptr"
.LASF46:
	.string	"total_heap_size"
.LASF90:
	.string	"sentinel"
.LASF66:
	.string	"base"
.LASF51:
	.string	"caml_major_work_credit"
.LASF122:
	.string	"caml_fl_init_merge"
.LASF75:
	.string	"caml_ephe_ref_table"
.LASF72:
	.string	"caml_ephe_ref_elt"
.LASF82:
	.string	"next"
.LASF31:
	.string	"caml_stat_major_words"
.LASF80:
	.string	"caml_use_huge_pages"
	.ident	"GCC: (GNU) 9.2.0"
