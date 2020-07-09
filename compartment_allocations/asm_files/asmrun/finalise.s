	.file	"finalise.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.type	gen_final_invariant_check, @function
gen_final_invariant_check:
.LFB23:
	.file 1 "finalise.c"
	.loc 1 430 65
	.cfi_startproc
.LVL0:
	.loc 1 431 3
	.loc 1 433 3
	.loc 1 434 3
	.loc 1 434 10 is_stmt 0
	li	a4,0
.LVL1:
.L2:
	.loc 1 434 15 is_stmt 1 discriminator 1
	.loc 1 434 24 is_stmt 0 discriminator 1
	ld	a5,8(a0)
	.loc 1 434 3 discriminator 1
	bleu	a5,a4,.L4
	.loc 1 435 5 is_stmt 1 discriminator 3
	.loc 1 434 31 discriminator 3
	.loc 1 434 32 is_stmt 0 discriminator 3
	addi	a4,a4,1
.LVL2:
	j	.L2
.LVL3:
.L5:
	.loc 1 438 5 is_stmt 1 discriminator 3
	.loc 1 437 42 discriminator 3
	.loc 1 437 43 is_stmt 0 discriminator 3
	addi	a5,a5,1
.LVL4:
.L4:
	.loc 1 437 24 is_stmt 1 discriminator 1
	.loc 1 437 33 is_stmt 0 discriminator 1
	ld	a4,16(a0)
	.loc 1 437 3 discriminator 1
	bgtu	a4,a5,.L5
	.loc 1 440 1
	ret
	.cfi_endproc
.LFE23:
	.size	gen_final_invariant_check, .-gen_final_invariant_check
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"out of memory"
	.text
	.align	1
	.type	alloc_to_do, @function
alloc_to_do:
.LFB8:
	.loc 1 74 1 is_stmt 1
	.cfi_startproc
.LVL5:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	mv	s0,a0
	.loc 1 75 3
	.loc 1 76 54 is_stmt 0
	slli	a5,a0,1
	add	a5,a5,a0
	slli	a5,a5,3
	.loc 1 75 26
	addi	a0,a5,40
.LVL6:
	call	caml_stat_alloc_noexc
.LVL7:
	.loc 1 77 3 is_stmt 1
	.loc 1 77 6 is_stmt 0
	beq	a0,zero,.L11
	.loc 1 78 3 is_stmt 1
	.loc 1 78 16 is_stmt 0
	sd	zero,0(a0)
	.loc 1 79 3 is_stmt 1
	.loc 1 79 16 is_stmt 0
	sw	s0,8(a0)
	.loc 1 80 3 is_stmt 1
	.loc 1 80 16 is_stmt 0
	ld	a5,to_do_tl
	.loc 1 80 6
	beq	a5,zero,.L12
	.loc 1 84 5 is_stmt 1
	.loc 1 85 5
	.loc 1 85 20 is_stmt 0
	sd	a0,0(a5)
	.loc 1 86 5 is_stmt 1
	.loc 1 86 14 is_stmt 0
	sd	a0,to_do_tl,a5
.L6:
	.loc 1 88 1
	ld	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L11:
	.cfi_restore_state
	.loc 1 77 23 is_stmt 1 discriminator 1
	lla	a0,.LC0
.LVL8:
	call	caml_fatal_error
.LVL9:
.L12:
	.loc 1 81 5
	.loc 1 81 14 is_stmt 0
	sd	a0,to_do_hd,a5
	.loc 1 82 5 is_stmt 1
	.loc 1 82 14 is_stmt 0
	sd	a0,to_do_tl,a5
	j	.L6
	.cfi_endproc
.LFE8:
	.size	alloc_to_do, .-alloc_to_do
	.align	1
	.type	generic_final_update, @function
generic_final_update:
.LFB9:
	.loc 1 94 1 is_stmt 1
	.cfi_startproc
.LVL10:
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
	mv	s1,a1
	.loc 1 95 3
	.loc 1 96 3
.LVL11:
	.loc 1 98 3
	.loc 1 99 3
	.loc 1 96 11 is_stmt 0
	li	a0,0
.LVL12:
	.loc 1 99 10
	li	a4,0
	.loc 1 99 3
	j	.L14
.LVL13:
.L15:
	.loc 1 99 31 is_stmt 1 discriminator 2
	.loc 1 99 32 is_stmt 0 discriminator 2
	addi	a4,a4,1
.LVL14:
.L14:
	.loc 1 99 15 is_stmt 1 discriminator 1
	.loc 1 99 24 is_stmt 0 discriminator 1
	ld	a5,8(s0)
	.loc 1 99 3 discriminator 1
	bleu	a5,a4,.L29
	.loc 1 100 5 is_stmt 1
	.loc 1 101 5
	.loc 1 102 5
	.loc 1 102 9 is_stmt 0
	ld	a3,0(s0)
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,3
	add	a5,a3,a5
	ld	a5,8(a5)
	ld	a5,-8(a5)
	andi	a5,a5,768
	.loc 1 102 8
	bne	a5,zero,.L15
	.loc 1 103 7 is_stmt 1
	addi	a0,a0,1
.LVL15:
	j	.L15
.L29:
	.loc 1 116 3
	.loc 1 116 6 is_stmt 0
	bne	a0,zero,.L30
.LVL16:
.L13:
	.loc 1 154 1
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	ld	s1,8(sp)
	.cfi_restore 9
	ld	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL17:
.L30:
	.cfi_restore_state
	.loc 1 117 5 is_stmt 1
	sext.w	a0,a0
.LVL18:
	call	alloc_to_do
.LVL19:
	.loc 1 118 5
	.loc 1 119 5
	.loc 1 118 11 is_stmt 0
	li	s2,0
	.loc 1 118 7
	li	a2,0
	.loc 1 119 12
	li	a4,0
	.loc 1 119 5
	j	.L18
.LVL20:
.L20:
	.loc 1 131 10 is_stmt 1
	.loc 1 132 9
	.loc 1 132 10 is_stmt 0
	addi	s2,s2,1
.LVL21:
.L21:
	.loc 1 119 33 is_stmt 1 discriminator 2
	.loc 1 119 34 is_stmt 0 discriminator 2
	addi	a4,a4,1
.LVL22:
.L18:
	.loc 1 119 17 is_stmt 1 discriminator 1
	.loc 1 119 26 is_stmt 0 discriminator 1
	ld	a5,8(s0)
	.loc 1 119 5 discriminator 1
	bleu	a5,a4,.L31
	.loc 1 120 7 is_stmt 1
	.loc 1 121 7
	.loc 1 122 7
	.loc 1 123 7
	.loc 1 123 10 is_stmt 0
	ld	a3,0(s0)
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,3
	add	a5,a3,a5
	ld	a1,8(a5)
	ld	a1,-8(a1)
	andi	a1,a1,768
	.loc 1 123 9
	bne	a1,zero,.L19
	.loc 1 125 9 is_stmt 1
	.loc 1 125 17 is_stmt 0
	ld	a1,to_do_tl
	.loc 1 125 27
	slli	a3,s2,1
	add	a3,a3,s2
	slli	a3,a3,3
	add	a3,a1,a3
	ld	a0,0(a5)
	sd	a0,16(a3)
	ld	a0,8(a5)
	sd	a0,24(a3)
	ld	a5,16(a5)
	sd	a5,32(a3)
	.loc 1 126 9 is_stmt 1
	.loc 1 126 11 is_stmt 0
	bne	s1,zero,.L20
	.loc 1 129 11 is_stmt 1
	.loc 1 129 33 is_stmt 0
	li	a5,1
	sd	a5,24(a3)
	.loc 1 130 11 is_stmt 1
	.loc 1 130 36 is_stmt 0
	sw	zero,32(a3)
	j	.L20
.L19:
	.loc 1 135 9 is_stmt 1
.LVL23:
	.loc 1 135 21 is_stmt 0
	slli	a1,a2,1
	add	a1,a1,a2
	slli	a1,a1,3
	add	a3,a3,a1
	.loc 1 135 27
	ld	a1,0(a5)
	sd	a1,0(a3)
	ld	a1,8(a5)
	sd	a1,8(a3)
	ld	a5,16(a5)
	sd	a5,16(a3)
	.loc 1 135 23
	addi	a2,a2,1
.LVL24:
	j	.L21
.L31:
	.loc 1 138 5 is_stmt 1
	.loc 1 139 5
	.loc 1 140 5
	.loc 1 140 16 is_stmt 0
	sd	a2,8(s0)
	.loc 1 141 5 is_stmt 1
.L23:
	.loc 1 141 10 discriminator 1
	.loc 1 141 19 is_stmt 0 discriminator 1
	ld	a5,16(s0)
	.loc 1 141 5 discriminator 1
	bleu	a5,a4,.L32
	.loc 1 142 7 is_stmt 1 discriminator 2
	.loc 1 142 32 is_stmt 0 discriminator 2
	ld	a3,0(s0)
	.loc 1 142 39 discriminator 2
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,3
	add	a5,a3,a5
.LVL25:
	.loc 1 142 19 discriminator 2
	slli	a1,a2,1
	add	a1,a1,a2
	slli	a1,a1,3
	add	a3,a3,a1
	.loc 1 142 25 discriminator 2
	ld	a1,0(a5)
	sd	a1,0(a3)
	ld	a1,8(a5)
	sd	a1,8(a3)
	ld	a5,16(a5)
	sd	a5,16(a3)
	.loc 1 141 28 is_stmt 1 discriminator 2
	.loc 1 141 29 is_stmt 0 discriminator 2
	addi	a4,a4,1
.LVL26:
	.loc 1 142 21 discriminator 2
	addi	a2,a2,1
.LVL27:
	j	.L23
.L32:
	.loc 1 144 5 is_stmt 1
	.loc 1 144 18 is_stmt 0
	sd	a2,16(s0)
	.loc 1 145 5 is_stmt 1
	.loc 1 145 13 is_stmt 0
	ld	a5,to_do_tl
	.loc 1 145 20
	sw	s2,8(a5)
	.loc 1 146 5 is_stmt 1
	.loc 1 146 7 is_stmt 0
	beq	s1,zero,.L13
	.loc 1 147 14
	li	s0,0
.LVL28:
	j	.L25
.LVL29:
.L26:
	.loc 1 150 9 is_stmt 1 discriminator 3
	slli	a5,s0,1
	add	a5,a5,s0
	slli	a5,a5,3
	ld	a4,to_do_tl
	add	a5,a4,a5
	li	a1,0
	ld	a0,24(a5)
	call	caml_darken
.LVL30:
	.loc 1 147 26 discriminator 3
	.loc 1 147 27 is_stmt 0 discriminator 3
	addi	s0,s0,1
.LVL31:
.L25:
	.loc 1 147 19 is_stmt 1 discriminator 1
	.loc 1 147 7 is_stmt 0 discriminator 1
	bltu	s0,s2,.L26
	j	.L13
	.cfi_endproc
.LFE9:
	.size	generic_final_update, .-generic_final_update
	.align	1
	.type	generic_final_minor_update, @function
generic_final_minor_update:
.LFB16:
	.loc 1 288 1 is_stmt 1
	.cfi_startproc
.LVL32:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	mv	s0,a0
	.loc 1 289 3
	.loc 1 290 3
.LVL33:
	.loc 1 292 3
	.loc 1 293 3
	.loc 1 293 10 is_stmt 0
	ld	a4,8(a0)
.LVL34:
	.loc 1 290 11
	li	s1,0
	.loc 1 293 3
	j	.L34
.LVL35:
.L35:
	.loc 1 293 42 is_stmt 1 discriminator 2
	.loc 1 293 43 is_stmt 0 discriminator 2
	addi	a4,a4,1
.LVL36:
.L34:
	.loc 1 293 24 is_stmt 1 discriminator 1
	.loc 1 293 33 is_stmt 0 discriminator 1
	ld	a5,16(s0)
	.loc 1 293 3 discriminator 1
	bleu	a5,a4,.L48
	.loc 1 294 5 is_stmt 1
	.loc 1 295 5
	.loc 1 296 5
	.loc 1 296 9 is_stmt 0
	ld	a3,0(s0)
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,3
	add	a5,a3,a5
	ld	a5,8(a5)
	ld	a3,caml_young_end
	bgeu	a5,a3,.L35
	.loc 1 296 9 discriminator 1
	ld	a3,caml_young_start
	bleu	a5,a3,.L35
	.loc 1 296 42
	ld	a5,-8(a5)
	.loc 1 296 39
	beq	a5,zero,.L35
	.loc 1 297 7 is_stmt 1
	addi	s1,s1,1
.LVL37:
	j	.L35
.L48:
	.loc 1 309 3
	.loc 1 309 6 is_stmt 0
	bne	s1,zero,.L49
.LVL38:
.L37:
	.loc 1 336 3 is_stmt 1
	.loc 1 336 10 is_stmt 0
	ld	a4,8(s0)
.LVL39:
	.loc 1 336 3
	j	.L42
.LVL40:
.L49:
	.loc 1 310 5 is_stmt 1
	sext.w	s1,s1
.LVL41:
	mv	a0,s1
	call	alloc_to_do
.LVL42:
	.loc 1 311 5
	.loc 1 312 5
	.loc 1 312 7 is_stmt 0
	ld	a3,8(s0)
.LVL43:
	.loc 1 313 5 is_stmt 1
	.loc 1 312 7 is_stmt 0
	mv	a1,a3
	.loc 1 311 7
	li	a6,0
	.loc 1 313 5
	j	.L38
.LVL44:
.L39:
	.loc 1 326 9 is_stmt 1
	.loc 1 326 41 is_stmt 0
	slli	a2,a3,1
	add	a2,a2,a3
	slli	a2,a2,3
	add	a4,a4,a2
	.loc 1 326 23
	addi	a1,a1,1
.LVL45:
	.loc 1 326 27
	ld	a2,0(a4)
	sd	a2,0(a5)
	ld	a2,8(a4)
	sd	a2,8(a5)
	ld	a4,16(a4)
	sd	a4,16(a5)
.L40:
	.loc 1 313 44 is_stmt 1 discriminator 2
	.loc 1 313 45 is_stmt 0 discriminator 2
	addi	a3,a3,1
.LVL46:
.L38:
	.loc 1 313 26 is_stmt 1 discriminator 1
	.loc 1 313 35 is_stmt 0 discriminator 1
	ld	a5,16(s0)
	.loc 1 313 5 discriminator 1
	bleu	a5,a3,.L50
	.loc 1 314 7 is_stmt 1
	.loc 1 315 7
	.loc 1 316 7
	.loc 1 317 7
	.loc 1 317 10 is_stmt 0
	ld	a4,0(s0)
	slli	a5,a1,1
	add	a5,a5,a1
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a2,8(a5)
	ld	a0,caml_young_end
	bgeu	a2,a0,.L39
	.loc 1 317 10 discriminator 1
	ld	a0,caml_young_start
	bleu	a2,a0,.L39
	.loc 1 317 43
	slli	a2,a3,1
	add	a2,a2,a3
	slli	a2,a2,3
	add	a2,a4,a2
	ld	a0,8(a2)
	ld	a0,-8(a0)
	.loc 1 317 40
	beq	a0,zero,.L39
	.loc 1 319 9 is_stmt 1
	.loc 1 319 27 is_stmt 0
	slli	a5,a6,1
	add	a5,a5,a6
	slli	a4,a5,3
	ld	a5,to_do_tl
	add	a5,a5,a4
	ld	a4,0(a2)
	sd	a4,16(a5)
	ld	a4,8(a2)
	sd	a4,24(a5)
	ld	a4,16(a2)
	sd	a4,32(a5)
	.loc 1 321 9 is_stmt 1
	.loc 1 321 31 is_stmt 0
	li	a4,1
	sd	a4,24(a5)
	.loc 1 322 9 is_stmt 1
	.loc 1 322 34 is_stmt 0
	sw	zero,32(a5)
	.loc 1 323 9 is_stmt 1
	.loc 1 323 10 is_stmt 0
	addi	a6,a6,1
.LVL47:
	j	.L40
.L50:
	.loc 1 329 5 is_stmt 1
	.loc 1 330 5
	.loc 1 331 5
	.loc 1 331 18 is_stmt 0
	sd	a1,16(s0)
	.loc 1 332 5 is_stmt 1
	.loc 1 332 13 is_stmt 0
	ld	a5,to_do_tl
	.loc 1 332 20
	sw	s1,8(a5)
	j	.L37
.LVL48:
.L43:
	.loc 1 336 42 is_stmt 1 discriminator 2
	.loc 1 336 43 is_stmt 0 discriminator 2
	addi	a4,a4,1
.LVL49:
.L42:
	.loc 1 336 24 is_stmt 1 discriminator 1
	.loc 1 336 33 is_stmt 0 discriminator 1
	ld	a5,16(s0)
	.loc 1 336 3 discriminator 1
	bleu	a5,a4,.L51
	.loc 1 337 5 is_stmt 1
	.loc 1 338 5
	.loc 1 339 5
	.loc 1 339 9 is_stmt 0
	ld	a3,0(s0)
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,3
	add	a5,a3,a5
	ld	a3,8(a5)
	ld	a2,caml_young_end
	bgeu	a3,a2,.L43
	.loc 1 339 9 discriminator 1
	ld	a2,caml_young_start
	bleu	a3,a2,.L43
	.loc 1 340 7 is_stmt 1
	.loc 1 341 7
	.loc 1 341 29 is_stmt 0
	ld	a3,0(a3)
	.loc 1 341 27
	sd	a3,8(a5)
	j	.L43
.L51:
	.loc 1 347 10
	li	a4,0
.LVL50:
	j	.L45
.LVL51:
.L46:
	.loc 1 348 5 is_stmt 1 discriminator 3
	.loc 1 347 33 discriminator 3
	.loc 1 347 34 is_stmt 0 discriminator 3
	addi	a4,a4,1
.LVL52:
.L45:
	.loc 1 347 15 is_stmt 1 discriminator 1
	.loc 1 347 3 is_stmt 0 discriminator 1
	bgtu	a5,a4,.L46
	.loc 1 351 1
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
.LVL53:
	ld	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE16:
	.size	generic_final_minor_update, .-generic_final_minor_update
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"Gc.finalise"
	.text
	.align	1
	.type	generic_final_register, @function
generic_final_register:
.LFB19:
	.loc 1 374 1 is_stmt 1
	.cfi_startproc
.LVL54:
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
	.loc 1 375 3
	.loc 1 375 8 is_stmt 0
	andi	a5,a2,1
	.loc 1 375 6
	bne	a5,zero,.L53
	mv	s0,a0
	mv	s2,a1
	mv	s1,a2
	.loc 1 376 11
	mv	a0,a2
.LVL55:
	call	caml_page_table_lookup
.LVL56:
	andi	a0,a0,3
	.loc 1 376 7
	beq	a0,zero,.L53
	.loc 1 377 10
	lbu	a5,-8(s1)
	.loc 1 377 7
	li	a4,246
	beq	a5,a4,.L53
	.loc 1 381 7
	li	a4,250
	beq	a5,a4,.L53
	.loc 1 384 3 is_stmt 1
	.loc 1 386 3
	.loc 1 386 12 is_stmt 0
	ld	a5,16(s0)
	.loc 1 386 28
	ld	a1,24(s0)
	.loc 1 386 6
	bltu	a5,a1,.L55
	.loc 1 387 5 is_stmt 1
	.loc 1 387 14 is_stmt 0
	ld	a0,0(s0)
	.loc 1 387 8
	beq	a0,zero,.L60
.LBB2:
	.loc 1 394 7 is_stmt 1
	.loc 1 394 15 is_stmt 0
	slli	s3,a1,1
.LVL57:
	.loc 1 395 7 is_stmt 1
	.loc 1 395 22 is_stmt 0
	add	a1,s3,a1
	slli	a1,a1,4
	call	caml_stat_resize
.LVL58:
	.loc 1 395 20
	sd	a0,0(s0)
	.loc 1 397 7 is_stmt 1
	.loc 1 397 19 is_stmt 0
	sd	s3,24(s0)
.LVL59:
.L55:
.LBE2:
	.loc 1 400 3 is_stmt 1
	.loc 1 401 3
	.loc 1 401 8 is_stmt 0
	ld	a4,0(s0)
	.loc 1 401 21
	ld	a3,16(s0)
	.loc 1 401 15
	slli	a5,a3,1
	add	a5,a5,a3
	slli	a5,a5,3
	add	a5,a4,a5
	.loc 1 401 34
	sd	s2,0(a5)
	.loc 1 402 3 is_stmt 1
	.loc 1 402 7 is_stmt 0
	lbu	a4,-8(s1)
	.loc 1 402 6
	li	a5,249
	beq	a4,a5,.L61
	.loc 1 406 5 is_stmt 1
	.loc 1 406 10 is_stmt 0
	ld	a4,0(s0)
	.loc 1 406 23
	ld	a3,16(s0)
	.loc 1 406 17
	slli	a5,a3,1
	add	a5,a5,a3
	slli	a5,a5,3
	add	a5,a4,a5
	.loc 1 406 39
	sw	zero,16(a5)
	.loc 1 407 5 is_stmt 1
	.loc 1 407 10 is_stmt 0
	ld	a4,0(s0)
	.loc 1 407 23
	ld	a3,16(s0)
	.loc 1 407 17
	slli	a5,a3,1
	add	a5,a5,a3
	slli	a5,a5,3
	add	a5,a4,a5
	.loc 1 407 36
	sd	s1,8(a5)
.LVL60:
.L58:
	.loc 1 409 3 is_stmt 1
	.loc 1 409 11 is_stmt 0
	ld	a5,16(s0)
	.loc 1 409 3
	addi	a5,a5,1
	sd	a5,16(s0)
	.loc 1 411 1
	ld	ra,40(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
.LVL61:
	ld	s1,24(sp)
	.cfi_restore 9
	ld	s2,16(sp)
	.cfi_restore 18
.LVL62:
	ld	s3,8(sp)
	.cfi_restore 19
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L53:
	.cfi_restore_state
	.loc 1 382 5 is_stmt 1
	lla	a0,.LC1
	call	caml_invalid_argument
.LVL63:
.L60:
.LBB3:
	.loc 1 388 7
	.loc 1 389 7
	.loc 1 389 22 is_stmt 0
	li	a0,720
	call	caml_stat_alloc
.LVL64:
	.loc 1 389 20
	sd	a0,0(s0)
	.loc 1 390 7 is_stmt 1
	.loc 1 391 7
	.loc 1 392 7
	.loc 1 392 19 is_stmt 0
	li	a5,30
	sd	a5,24(s0)
.LBE3:
	j	.L55
.LVL65:
.L61:
	.loc 1 403 5 is_stmt 1
	.loc 1 403 41 is_stmt 0
	ld	a5,-8(s1)
	srli	a5,a5,10
	.loc 1 403 10
	ld	a3,0(s0)
	.loc 1 403 23
	ld	a2,16(s0)
	.loc 1 403 17
	slli	a4,a2,1
	add	a4,a4,a2
	slli	a4,a4,3
	add	a4,a3,a4
	.loc 1 403 39
	slliw	a5,a5,3
	sw	a5,16(a4)
	.loc 1 404 5 is_stmt 1
	.loc 1 404 42 is_stmt 0
	ld	a2,-8(s1)
	srli	a2,a2,10
	slli	a2,a2,3
	.loc 1 404 10
	ld	a4,0(s0)
	.loc 1 404 23
	ld	a3,16(s0)
	.loc 1 404 17
	slli	a5,a3,1
	add	a5,a5,a3
	slli	a5,a5,3
	add	a5,a4,a5
	.loc 1 404 40
	sub	s1,s1,a2
.LVL66:
	.loc 1 404 36
	sd	s1,8(a5)
	j	.L58
	.cfi_endproc
.LFE19:
	.size	generic_final_register, .-generic_final_register
	.align	1
	.globl	caml_final_update_mark_phase
	.type	caml_final_update_mark_phase, @function
caml_final_update_mark_phase:
.LFB10:
	.loc 1 156 37 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 157 3
	li	a1,1
	lla	a0,.LANCHOR0
	call	generic_final_update
.LVL67:
	.loc 1 158 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	caml_final_update_mark_phase, .-caml_final_update_mark_phase
	.align	1
	.globl	caml_final_update_clean_phase
	.type	caml_final_update_clean_phase, @function
caml_final_update_clean_phase:
.LFB11:
	.loc 1 160 38 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 161 3
	li	a1,0
	lla	a0,.LANCHOR0+32
	call	generic_final_update
.LVL68:
	.loc 1 162 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	caml_final_update_clean_phase, .-caml_final_update_clean_phase
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"Calling finalisation functions.\n"
	.align	3
.LC3:
	.string	"Done calling finalisation functions.\n"
	.text
	.align	1
	.globl	caml_final_do_calls
	.type	caml_final_do_calls, @function
caml_final_do_calls:
.LFB12:
	.loc 1 171 1 is_stmt 1
	.cfi_startproc
	.loc 1 172 3
	.loc 1 173 3
	.loc 1 178 3
	.loc 1 178 7 is_stmt 0
	lw	a5,running_finalisation_function
	.loc 1 178 6
	bne	a5,zero,.L77
	.loc 1 179 3 is_stmt 1
	.loc 1 179 16 is_stmt 0
	ld	a5,to_do_hd
	.loc 1 179 6
	beq	a5,zero,.L77
	.loc 1 171 1
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.loc 1 180 5 is_stmt 1
	.loc 1 180 34 is_stmt 0
	ld	a5,caml_finalise_begin_hook
	.loc 1 180 8
	beq	a5,zero,.L70
	.loc 1 180 43 is_stmt 1 discriminator 1
	.loc 1 180 44 is_stmt 0 discriminator 1
	jalr	a5
.LVL69:
.L70:
	.loc 1 181 5 is_stmt 1
	lla	a1,.LC2
	li	a0,128
	call	caml_gc_message
.LVL70:
	j	.L71
.L73:
	.loc 1 189 7
	.loc 1 189 10 is_stmt 0
	beq	a0,zero,.L75
	.loc 1 190 7 is_stmt 1
	.loc 1 191 7
	.loc 1 191 18 is_stmt 0
	lw	a4,8(a0)
	.loc 1 191 7
	addiw	a4,a4,-1
	sext.w	a3,a4
	sw	a4,8(a0)
	.loc 1 192 7 is_stmt 1
	.loc 1 192 9 is_stmt 0
	slli	a5,a3,1
	add	a5,a5,a3
	slli	a5,a5,3
	add	a5,a0,a5
	ld	a0,16(a5)
	sd	a0,8(sp)
	ld	a1,24(a5)
	sd	a1,16(sp)
	ld	a5,32(a5)
	sd	a5,24(sp)
	.loc 1 193 7 is_stmt 1
	.loc 1 193 37 is_stmt 0
	lla	s0,running_finalisation_function
	li	a4,1
	sw	a4,0(s0)
	.loc 1 201 7 is_stmt 1
	.loc 1 201 48 is_stmt 0
	sext.w	a5,a5
	.loc 1 201 13
	add	a1,a1,a5
	call	caml_callback_exn
.LVL71:
	.loc 1 205 7 is_stmt 1
	.loc 1 205 37 is_stmt 0
	sw	zero,0(s0)
	.loc 1 206 7 is_stmt 1
	.loc 1 206 11 is_stmt 0
	andi	a4,a0,3
	.loc 1 206 10
	li	a5,2
	beq	a4,a5,.L80
.LVL72:
.L71:
	.loc 1 183 13 is_stmt 1
	.loc 1 183 23 is_stmt 0
	ld	a0,to_do_hd
	.loc 1 183 13
	beq	a0,zero,.L73
	.loc 1 183 42 discriminator 1
	lw	a5,8(a0)
	.loc 1 183 31 discriminator 1
	bne	a5,zero,.L73
.LBB4:
	.loc 1 184 9 is_stmt 1
	.loc 1 184 23 is_stmt 0
	ld	s0,0(a0)
.LVL73:
	.loc 1 185 9 is_stmt 1
	call	caml_stat_free
.LVL74:
	.loc 1 186 9
	.loc 1 186 18 is_stmt 0
	sd	s0,to_do_hd,a5
	.loc 1 187 9 is_stmt 1
	.loc 1 187 12 is_stmt 0
	bne	s0,zero,.L71
	.loc 1 187 31 is_stmt 1 discriminator 1
	.loc 1 187 40 is_stmt 0 discriminator 1
	sd	zero,to_do_tl,a5
	j	.L71
.LVL75:
.L80:
.LBE4:
	.loc 1 206 38 is_stmt 1 discriminator 1
	andi	a0,a0,-4
.LVL76:
	call	caml_raise
.LVL77:
.L75:
	.loc 1 208 5
	lla	a1,.LC3
	li	a0,128
	call	caml_gc_message
.LVL78:
	.loc 1 209 5
	.loc 1 209 32 is_stmt 0
	ld	a5,caml_finalise_end_hook
	.loc 1 209 8
	beq	a5,zero,.L66
	.loc 1 209 41 is_stmt 1 discriminator 1
	.loc 1 209 42 is_stmt 0 discriminator 1
	jalr	a5
.LVL79:
.L66:
	.loc 1 211 1
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L77:
	ret
	.cfi_endproc
.LFE12:
	.size	caml_final_do_calls, .-caml_final_do_calls
	.align	1
	.globl	caml_final_do_roots
	.type	caml_final_do_roots, @function
caml_final_do_roots:
.LFB13:
	.loc 1 222 1 is_stmt 1
	.cfi_startproc
.LVL80:
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
	mv	s4,a0
	.loc 1 223 3
	.loc 1 224 3
	.loc 1 226 3
	.loc 1 227 3
.LVL81:
	.loc 1 227 10 is_stmt 0
	li	s0,0
.LVL82:
.L82:
	.loc 1 227 15 is_stmt 1 discriminator 1
	.loc 1 227 36 is_stmt 0 discriminator 1
	ld	a5,.LANCHOR0+16
	.loc 1 227 3 discriminator 1
	bleu	a5,s0,.L91
	.loc 1 228 5 is_stmt 1 discriminator 3
	slli	a1,s0,1
	add	a1,a1,s0
	slli	a1,a1,3
	ld	a5,.LANCHOR0
	add	a1,a5,a1
	ld	a0,0(a1)
	jalr	s4
.LVL83:
	.loc 1 227 44 discriminator 3
	.loc 1 227 45 is_stmt 0 discriminator 3
	addi	s0,s0,1
.LVL84:
	j	.L82
.L91:
	.loc 1 232 10
	li	s0,0
.LVL85:
	j	.L84
.LVL86:
.L85:
	.loc 1 233 5 is_stmt 1 discriminator 3
	slli	a1,s0,1
	add	a1,a1,s0
	slli	a1,a1,3
	ld	a5,.LANCHOR0+32
	add	a1,a5,a1
	ld	a0,0(a1)
	jalr	s4
.LVL87:
	.loc 1 232 43 discriminator 3
	.loc 1 232 44 is_stmt 0 discriminator 3
	addi	s0,s0,1
.LVL88:
.L84:
	.loc 1 232 15 is_stmt 1 discriminator 1
	.loc 1 232 35 is_stmt 0 discriminator 1
	ld	a5,.LANCHOR0+48
	.loc 1 232 3 discriminator 1
	bgtu	a5,s0,.L85
	.loc 1 234 4 is_stmt 1
	.loc 1 236 3
	.loc 1 236 13 is_stmt 0
	ld	s3,to_do_hd
.LVL89:
	.loc 1 236 3
	j	.L86
.LVL90:
.L87:
	.loc 1 238 7 is_stmt 1 discriminator 3
	slli	s0,s2,1
	add	s1,s0,s2
	slli	s1,s1,3
	addi	s1,s1,16
	add	s1,s3,s1
	add	s0,s0,s2
	slli	s0,s0,3
	add	s0,s3,s0
	mv	a1,s1
	ld	a0,16(s0)
	jalr	s4
.LVL91:
	.loc 1 239 7 discriminator 3
	addi	a1,s1,8
	ld	a0,24(s0)
	jalr	s4
.LVL92:
	.loc 1 237 33 discriminator 3
	.loc 1 237 34 is_stmt 0 discriminator 3
	addi	s2,s2,1
.LVL93:
.L88:
	.loc 1 237 17 is_stmt 1 discriminator 1
	.loc 1 237 25 is_stmt 0 discriminator 1
	lw	a5,8(s3)
	.loc 1 237 5 discriminator 1
	bgtu	a5,s2,.L87
	.loc 1 236 39 is_stmt 1 discriminator 2
	.loc 1 236 44 is_stmt 0 discriminator 2
	ld	s3,0(s3)
.LVL94:
.L86:
	.loc 1 236 25 is_stmt 1 discriminator 1
	.loc 1 236 3 is_stmt 0 discriminator 1
	beq	s3,zero,.L92
	.loc 1 237 12
	li	s2,0
	j	.L88
.L92:
	.loc 1 242 1
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	ld	s1,24(sp)
	.cfi_restore 9
	ld	s2,16(sp)
	.cfi_restore 18
	ld	s3,8(sp)
	.cfi_restore 19
.LVL95:
	ld	s4,0(sp)
	.cfi_restore 20
.LVL96:
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE13:
	.size	caml_final_do_roots, .-caml_final_do_roots
	.align	1
	.globl	caml_final_invert_finalisable_values
	.type	caml_final_invert_finalisable_values, @function
caml_final_invert_finalisable_values:
.LFB14:
	.loc 1 248 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.loc 1 249 3
	.loc 1 251 3
	.loc 1 252 3
.LVL97:
	.loc 1 252 10 is_stmt 0
	li	s0,0
.LVL98:
.L94:
	.loc 1 252 15 is_stmt 1 discriminator 1
	.loc 1 252 36 is_stmt 0 discriminator 1
	ld	a5,.LANCHOR0+16
	.loc 1 252 3 discriminator 1
	bleu	a5,s0,.L99
	.loc 1 253 5 is_stmt 1 discriminator 3
	.loc 1 253 45 is_stmt 0 discriminator 3
	slli	a4,s0,1
	add	a4,a4,s0
	slli	a3,a4,3
	ld	a5,.LANCHOR0
	add	a5,a5,a3
	.loc 1 253 5 discriminator 3
	addi	a1,a5,8
	ld	a0,8(a5)
	call	caml_invert_root
.LVL99:
	.loc 1 252 44 is_stmt 1 discriminator 3
	.loc 1 252 45 is_stmt 0 discriminator 3
	addi	s0,s0,1
.LVL100:
	j	.L94
.L99:
	.loc 1 258 10
	li	s0,0
.LVL101:
	j	.L96
.LVL102:
.L97:
	.loc 1 259 5 is_stmt 1 discriminator 3
	.loc 1 259 44 is_stmt 0 discriminator 3
	slli	a4,s0,1
	add	a4,a4,s0
	slli	a3,a4,3
	ld	a5,.LANCHOR0+32
	add	a5,a5,a3
	.loc 1 259 5 discriminator 3
	addi	a1,a5,8
	ld	a0,8(a5)
	call	caml_invert_root
.LVL103:
	.loc 1 258 43 is_stmt 1 discriminator 3
	.loc 1 258 44 is_stmt 0 discriminator 3
	addi	s0,s0,1
.LVL104:
.L96:
	.loc 1 258 15 is_stmt 1 discriminator 1
	.loc 1 258 35 is_stmt 0 discriminator 1
	ld	a5,.LANCHOR0+48
	.loc 1 258 3 discriminator 1
	bgtu	a5,s0,.L97
	.loc 1 262 1
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
.LVL105:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	caml_final_invert_finalisable_values, .-caml_final_invert_finalisable_values
	.align	1
	.globl	caml_final_oldify_young_roots
	.type	caml_final_oldify_young_roots, @function
caml_final_oldify_young_roots:
.LFB15:
	.loc 1 268 1 is_stmt 1
	.cfi_startproc
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
	.loc 1 269 3
	.loc 1 271 3
	.loc 1 272 3
	.loc 1 272 10 is_stmt 0
	ld	s0,.LANCHOR0+8
.LVL106:
.L101:
	.loc 1 272 35 is_stmt 1 discriminator 1
	.loc 1 272 56 is_stmt 0 discriminator 1
	ld	a5,.LANCHOR0+16
	.loc 1 272 3 discriminator 1
	bleu	a5,s0,.L106
	.loc 1 273 5 is_stmt 1 discriminator 3
	.loc 1 273 38 is_stmt 0 discriminator 3
	lla	s2,.LANCHOR0
	ld	a1,0(s2)
	.loc 1 273 44 discriminator 3
	slli	a5,s0,1
	add	a5,a5,s0
	slli	s1,a5,3
	add	a1,a1,s1
	.loc 1 273 5 discriminator 3
	ld	a0,0(a1)
	call	caml_oldify_one
.LVL107:
	.loc 1 275 5 is_stmt 1 discriminator 3
	.loc 1 275 38 is_stmt 0 discriminator 3
	ld	a5,0(s2)
	.loc 1 275 44 discriminator 3
	add	a5,a5,s1
	.loc 1 275 5 discriminator 3
	addi	a1,a5,8
	ld	a0,8(a5)
	call	caml_oldify_one
.LVL108:
	.loc 1 272 64 is_stmt 1 discriminator 3
	.loc 1 272 65 is_stmt 0 discriminator 3
	addi	s0,s0,1
.LVL109:
	j	.L101
.L106:
	.loc 1 279 3 is_stmt 1
	.loc 1 280 3
	.loc 1 280 10 is_stmt 0
	ld	s0,.LANCHOR0+40
.LVL110:
	.loc 1 280 3
	j	.L103
.L104:
	.loc 1 281 5 is_stmt 1 discriminator 3
	.loc 1 281 43 is_stmt 0 discriminator 3
	slli	a5,s0,1
	add	a5,a5,s0
	slli	a4,a5,3
	ld	a1,.LANCHOR0+32
	add	a1,a1,a4
	.loc 1 281 5 discriminator 3
	ld	a0,0(a1)
	call	caml_oldify_one
.LVL111:
	.loc 1 280 62 is_stmt 1 discriminator 3
	.loc 1 280 63 is_stmt 0 discriminator 3
	addi	s0,s0,1
.LVL112:
.L103:
	.loc 1 280 34 is_stmt 1 discriminator 1
	.loc 1 280 54 is_stmt 0 discriminator 1
	ld	a5,.LANCHOR0+48
	.loc 1 280 3 discriminator 1
	bgtu	a5,s0,.L104
	.loc 1 285 1
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
.LVL113:
	ld	s1,8(sp)
	.cfi_restore 9
	ld	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE15:
	.size	caml_final_oldify_young_roots, .-caml_final_oldify_young_roots
	.align	1
	.globl	caml_final_update_minor_roots
	.type	caml_final_update_minor_roots, @function
caml_final_update_minor_roots:
.LFB17:
	.loc 1 358 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 359 3
	lla	a0,.LANCHOR0+32
	call	generic_final_minor_update
.LVL114:
	.loc 1 360 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE17:
	.size	caml_final_update_minor_roots, .-caml_final_update_minor_roots
	.align	1
	.globl	caml_final_empty_young
	.type	caml_final_empty_young, @function
caml_final_empty_young:
.LFB18:
	.loc 1 367 1 is_stmt 1
	.cfi_startproc
	.loc 1 368 3
	.loc 1 368 44 is_stmt 0
	lla	a5,.LANCHOR0
	ld	a4,16(a5)
	.loc 1 368 25
	sd	a4,8(a5)
	.loc 1 369 3 is_stmt 1
	.loc 1 369 42 is_stmt 0
	ld	a4,48(a5)
	.loc 1 369 24
	sd	a4,40(a5)
	.loc 1 370 1
	ret
	.cfi_endproc
.LFE18:
	.size	caml_final_empty_young, .-caml_final_empty_young
	.align	1
	.globl	caml_final_register
	.type	caml_final_register, @function
caml_final_register:
.LFB20:
	.loc 1 413 54 is_stmt 1
	.cfi_startproc
.LVL115:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	mv	a2,a1
	.loc 1 414 3
	mv	a1,a0
.LVL116:
	lla	a0,.LANCHOR0
.LVL117:
	call	generic_final_register
.LVL118:
	.loc 1 415 3
	.loc 1 416 1 is_stmt 0
	li	a0,1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE20:
	.size	caml_final_register, .-caml_final_register
	.align	1
	.globl	caml_final_register_called_without_value
	.type	caml_final_register_called_without_value, @function
caml_final_register_called_without_value:
.LFB21:
	.loc 1 418 75 is_stmt 1
	.cfi_startproc
.LVL119:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	mv	a2,a1
	.loc 1 419 3
	mv	a1,a0
.LVL120:
	lla	a0,.LANCHOR0+32
.LVL121:
	call	generic_final_register
.LVL122:
	.loc 1 420 3
	.loc 1 421 1 is_stmt 0
	li	a0,1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	caml_final_register_called_without_value, .-caml_final_register_called_without_value
	.align	1
	.globl	caml_final_release
	.type	caml_final_release, @function
caml_final_release:
.LFB22:
	.loc 1 425 1 is_stmt 1
	.cfi_startproc
.LVL123:
	.loc 1 426 3
	.loc 1 426 33 is_stmt 0
	sw	zero,running_finalisation_function,a5
	.loc 1 427 3 is_stmt 1
	.loc 1 428 1 is_stmt 0
	li	a0,1
.LVL124:
	ret
	.cfi_endproc
.LFE22:
	.size	caml_final_release, .-caml_final_release
	.align	1
	.globl	caml_final_invariant_check
	.type	caml_final_invariant_check, @function
caml_final_invariant_check:
.LFB24:
	.loc 1 442 38 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 443 3
	lla	a0,.LANCHOR0
	call	gen_final_invariant_check
.LVL125:
	.loc 1 444 3
	lla	a0,.LANCHOR0+32
	call	gen_final_invariant_check
.LVL126:
	.loc 1 445 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE24:
	.size	caml_final_invariant_check, .-caml_final_invariant_check
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	finalisable_first, @object
	.size	finalisable_first, 32
finalisable_first:
	.zero	32
	.type	finalisable_last, @object
	.size	finalisable_last, 32
finalisable_last:
	.zero	32
	.section	.sbss,"aw",@nobits
	.align	3
	.type	running_finalisation_function, @object
	.size	running_finalisation_function, 4
running_finalisation_function:
	.zero	4
	.zero	4
	.type	to_do_tl, @object
	.size	to_do_tl, 8
to_do_tl:
	.zero	8
	.type	to_do_hd, @object
	.size	to_do_hd, 8
to_do_hd:
	.zero	8
	.text
.Letext0:
	.file 2 "caml/config.h"
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
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
	.file 14 "caml/roots.h"
	.file 15 "caml/signals.h"
	.file 16 "caml/compact.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xf5a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF143
	.byte	0xc
	.4byte	.LASF144
	.4byte	.LASF145
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	0x2d
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
	.byte	0x5
	.4byte	.LASF5
	.byte	0x2
	.byte	0x5b
	.byte	0xe
	.4byte	0x40
	.byte	0x3
	.4byte	0x5c
	.byte	0x5
	.4byte	.LASF6
	.byte	0x2
	.byte	0x5c
	.byte	0x17
	.4byte	0x47
	.byte	0x5
	.4byte	.LASF7
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.4byte	0x47
	.byte	0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x4
	.byte	0x10
	.byte	0x4
	.4byte	.LASF9
	.byte	0x5
	.4byte	.LASF10
	.byte	0x4
	.byte	0x21
	.byte	0x10
	.4byte	0x79
	.byte	0x5
	.4byte	.LASF11
	.byte	0x4
	.byte	0x28
	.byte	0x10
	.4byte	0xab
	.byte	0x6
	.byte	0x8
	.4byte	0xb1
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.byte	0x5
	.4byte	.LASF13
	.byte	0x4
	.byte	0x5c
	.byte	0x10
	.4byte	0xc4
	.byte	0x6
	.byte	0x8
	.4byte	0xcf
	.byte	0x3
	.4byte	0xc4
	.byte	0x7
	.byte	0x8
	.4byte	.LASF14
	.byte	0x4
	.byte	0x5d
	.byte	0x19
	.4byte	0xb8
	.byte	0x8
	.4byte	.LASF15
	.byte	0x4
	.byte	0x5d
	.byte	0x36
	.4byte	0xb8
	.byte	0x8
	.4byte	.LASF16
	.byte	0x4
	.byte	0x5e
	.byte	0x19
	.4byte	0xb8
	.byte	0x8
	.4byte	.LASF17
	.byte	0x4
	.byte	0x5e
	.byte	0x33
	.4byte	0xb8
	.byte	0x8
	.4byte	.LASF18
	.byte	0x4
	.byte	0x5f
	.byte	0x19
	.4byte	0xb8
	.byte	0x8
	.4byte	.LASF19
	.byte	0x4
	.byte	0x5f
	.byte	0x33
	.4byte	0xb8
	.byte	0x9
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x169
	.byte	0x10
	.4byte	0x6d
	.byte	0x9
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x171
	.byte	0x10
	.4byte	0x6d
	.byte	0x5
	.4byte	.LASF22
	.byte	0x5
	.byte	0x3c
	.byte	0x10
	.4byte	0x5c
	.byte	0x5
	.4byte	.LASF23
	.byte	0x5
	.byte	0x3d
	.byte	0x11
	.4byte	0x6d
	.byte	0x5
	.4byte	.LASF24
	.byte	0x5
	.byte	0x3e
	.byte	0x11
	.4byte	0x6d
	.byte	0x5
	.4byte	.LASF25
	.byte	0x5
	.byte	0x40
	.byte	0x11
	.4byte	0x6d
	.byte	0xa
	.4byte	0x13e
	.4byte	0x16d
	.byte	0xb
	.byte	0
	.byte	0x9
	.4byte	.LASF26
	.byte	0x5
	.2byte	0x15c
	.byte	0x15
	.4byte	0x162
	.byte	0x9
	.4byte	.LASF27
	.byte	0x5
	.2byte	0x171
	.byte	0xe
	.4byte	0x132
	.byte	0x6
	.byte	0x8
	.4byte	0x132
	.byte	0x8
	.4byte	.LASF28
	.byte	0x6
	.byte	0x39
	.byte	0x10
	.4byte	0x2d
	.byte	0x5
	.4byte	.LASF29
	.byte	0x7
	.byte	0x4
	.byte	0xd
	.4byte	0x2d
	.byte	0xc
	.4byte	.LASF62
	.byte	0x4
	.byte	0x8
	.byte	0x2c
	.byte	0x8
	.4byte	0x1c0
	.byte	0xd
	.string	"buf"
	.byte	0x8
	.byte	0x2d
	.byte	0xe
	.4byte	0x199
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	.LASF30
	.byte	0x8
	.byte	0x3e
	.byte	0x24
	.4byte	0x1cc
	.byte	0x6
	.byte	0x8
	.4byte	0x1a5
	.byte	0x8
	.4byte	.LASF31
	.byte	0x8
	.byte	0x3f
	.byte	0xe
	.4byte	0x132
	.byte	0x8
	.4byte	.LASF32
	.byte	0x9
	.byte	0x1a
	.byte	0x10
	.4byte	0x93
	.byte	0x8
	.4byte	.LASF33
	.byte	0xa
	.byte	0x24
	.byte	0xc
	.4byte	0x2d
	.byte	0x8
	.4byte	.LASF34
	.byte	0xa
	.byte	0x25
	.byte	0xc
	.4byte	0x2d
	.byte	0x8
	.4byte	.LASF35
	.byte	0xa
	.byte	0x26
	.byte	0x10
	.4byte	0x6d
	.byte	0x8
	.4byte	.LASF36
	.byte	0xa
	.byte	0x27
	.byte	0xf
	.4byte	0x21a
	.byte	0x4
	.byte	0x8
	.byte	0x4
	.4byte	.LASF37
	.byte	0x8
	.4byte	.LASF38
	.byte	0xa
	.byte	0x28
	.byte	0x10
	.4byte	0x6d
	.byte	0x8
	.4byte	.LASF39
	.byte	0xa
	.byte	0x28
	.byte	0x25
	.4byte	0x6d
	.byte	0x8
	.4byte	.LASF40
	.byte	0xa
	.byte	0x29
	.byte	0x10
	.4byte	0x6d
	.byte	0x8
	.4byte	.LASF41
	.byte	0xa
	.byte	0x3e
	.byte	0x12
	.4byte	0xab
	.byte	0x8
	.4byte	.LASF42
	.byte	0xa
	.byte	0x3f
	.byte	0x10
	.4byte	0x6d
	.byte	0x8
	.4byte	.LASF43
	.byte	0xa
	.byte	0x40
	.byte	0xe
	.4byte	0xab
	.byte	0x8
	.4byte	.LASF44
	.byte	0xa
	.byte	0x42
	.byte	0xc
	.4byte	0x2d
	.byte	0xa
	.4byte	0x21a
	.4byte	0x285
	.byte	0xe
	.4byte	0x47
	.byte	0x31
	.byte	0
	.byte	0xf
	.4byte	.LASF45
	.byte	0xa
	.byte	0x43
	.byte	0x8
	.4byte	0x275
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0xf
	.4byte	.LASF46
	.byte	0xa
	.byte	0x44
	.byte	0x5
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0xf
	.4byte	.LASF47
	.byte	0xa
	.byte	0x45
	.byte	0x8
	.4byte	0x21a
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0x8
	.4byte	.LASF48
	.byte	0xa
	.byte	0x46
	.byte	0xf
	.4byte	0x21a
	.byte	0x8
	.4byte	.LASF49
	.byte	0xa
	.byte	0x4a
	.byte	0x13
	.4byte	0xc4
	.byte	0x8
	.4byte	.LASF50
	.byte	0xb
	.byte	0x31
	.byte	0xf
	.4byte	0x187
	.byte	0x8
	.4byte	.LASF51
	.byte	0xb
	.byte	0x31
	.byte	0x22
	.4byte	0x187
	.byte	0x8
	.4byte	.LASF52
	.byte	0xb
	.byte	0x32
	.byte	0xf
	.4byte	0xab
	.byte	0x8
	.4byte	.LASF53
	.byte	0xb
	.byte	0x32
	.byte	0x27
	.4byte	0xab
	.byte	0x8
	.4byte	.LASF54
	.byte	0xc
	.byte	0x18
	.byte	0x13
	.4byte	0x187
	.byte	0x8
	.4byte	.LASF55
	.byte	0xc
	.byte	0x18
	.byte	0x2c
	.4byte	0x187
	.byte	0x8
	.4byte	.LASF56
	.byte	0xc
	.byte	0x19
	.byte	0x13
	.4byte	0x187
	.byte	0x8
	.4byte	.LASF57
	.byte	0xc
	.byte	0x19
	.byte	0x24
	.4byte	0x187
	.byte	0x8
	.4byte	.LASF58
	.byte	0xc
	.byte	0x1a
	.byte	0x13
	.4byte	0x187
	.byte	0x8
	.4byte	.LASF59
	.byte	0xc
	.byte	0x1b
	.byte	0x10
	.4byte	0x93
	.byte	0x8
	.4byte	.LASF60
	.byte	0xc
	.byte	0x1c
	.byte	0xc
	.4byte	0x2d
	.byte	0x8
	.4byte	.LASF61
	.byte	0xc
	.byte	0x1d
	.byte	0xf
	.4byte	0x21a
	.byte	0xc
	.4byte	.LASF63
	.byte	0x38
	.byte	0xc
	.byte	0x29
	.byte	0x8
	.4byte	0x3d8
	.byte	0x10
	.4byte	.LASF64
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x3d8
	.byte	0
	.byte	0xd
	.string	"end"
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x3d8
	.byte	0x8
	.byte	0x10
	.4byte	.LASF65
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x3d8
	.byte	0x10
	.byte	0xd
	.string	"ptr"
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x3d8
	.byte	0x18
	.byte	0x10
	.4byte	.LASF66
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x3d8
	.byte	0x20
	.byte	0x10
	.4byte	.LASF67
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x93
	.byte	0x28
	.byte	0x10
	.4byte	.LASF68
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x93
	.byte	0x30
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x187
	.byte	0x8
	.4byte	.LASF63
	.byte	0xc
	.byte	0x2a
	.byte	0x22
	.4byte	0x36f
	.byte	0xc
	.4byte	.LASF69
	.byte	0x10
	.byte	0xc
	.byte	0x2c
	.byte	0x8
	.4byte	0x412
	.byte	0x10
	.4byte	.LASF70
	.byte	0xc
	.byte	0x2d
	.byte	0x9
	.4byte	0x132
	.byte	0
	.byte	0x10
	.4byte	.LASF71
	.byte	0xc
	.byte	0x2e
	.byte	0xc
	.4byte	0x14a
	.byte	0x8
	.byte	0
	.byte	0xc
	.4byte	.LASF72
	.byte	0x38
	.byte	0xc
	.byte	0x31
	.byte	0x8
	.4byte	0x47b
	.byte	0x10
	.4byte	.LASF64
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x47b
	.byte	0
	.byte	0xd
	.string	"end"
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x47b
	.byte	0x8
	.byte	0x10
	.4byte	.LASF65
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x47b
	.byte	0x10
	.byte	0xd
	.string	"ptr"
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x47b
	.byte	0x18
	.byte	0x10
	.4byte	.LASF66
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x47b
	.byte	0x20
	.byte	0x10
	.4byte	.LASF67
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x93
	.byte	0x28
	.byte	0x10
	.4byte	.LASF68
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x93
	.byte	0x30
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x3ea
	.byte	0x8
	.4byte	.LASF72
	.byte	0xc
	.byte	0x32
	.byte	0x27
	.4byte	0x412
	.byte	0xc
	.4byte	.LASF73
	.byte	0x18
	.byte	0xc
	.byte	0x34
	.byte	0x8
	.4byte	0x4c2
	.byte	0x10
	.4byte	.LASF74
	.byte	0xc
	.byte	0x35
	.byte	0x9
	.4byte	0x132
	.byte	0
	.byte	0xd
	.string	"mem"
	.byte	0xc
	.byte	0x36
	.byte	0xc
	.4byte	0x14a
	.byte	0x8
	.byte	0xd
	.string	"max"
	.byte	0xc
	.byte	0x37
	.byte	0xc
	.4byte	0x14a
	.byte	0x10
	.byte	0
	.byte	0xc
	.4byte	.LASF75
	.byte	0x38
	.byte	0xc
	.byte	0x3a
	.byte	0x8
	.4byte	0x52b
	.byte	0x10
	.4byte	.LASF64
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x52b
	.byte	0
	.byte	0xd
	.string	"end"
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x52b
	.byte	0x8
	.byte	0x10
	.4byte	.LASF65
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x52b
	.byte	0x10
	.byte	0xd
	.string	"ptr"
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x52b
	.byte	0x18
	.byte	0x10
	.4byte	.LASF66
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x52b
	.byte	0x20
	.byte	0x10
	.4byte	.LASF67
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x93
	.byte	0x28
	.byte	0x10
	.4byte	.LASF68
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x93
	.byte	0x30
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x48d
	.byte	0x8
	.4byte	.LASF75
	.byte	0xc
	.byte	0x3b
	.byte	0x25
	.4byte	0x4c2
	.byte	0x8
	.4byte	.LASF76
	.byte	0xd
	.byte	0x3f
	.byte	0x10
	.4byte	0x2d
	.byte	0x8
	.4byte	.LASF77
	.byte	0xd
	.byte	0xb7
	.byte	0x10
	.4byte	0x6d
	.byte	0xc
	.4byte	.LASF78
	.byte	0x40
	.byte	0xd
	.byte	0xf3
	.byte	0x8
	.4byte	0x597
	.byte	0x10
	.4byte	.LASF79
	.byte	0xd
	.byte	0xf4
	.byte	0x1d
	.4byte	0x597
	.byte	0
	.byte	0x10
	.4byte	.LASF80
	.byte	0xd
	.byte	0xf5
	.byte	0xa
	.4byte	0x5c
	.byte	0x8
	.byte	0x10
	.4byte	.LASF81
	.byte	0xd
	.byte	0xf6
	.byte	0xa
	.4byte	0x5c
	.byte	0x10
	.byte	0x10
	.4byte	.LASF82
	.byte	0xd
	.byte	0xf7
	.byte	0xa
	.4byte	0x59d
	.byte	0x18
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x555
	.byte	0xa
	.4byte	0x187
	.4byte	0x5ad
	.byte	0xe
	.4byte	0x47
	.byte	0x4
	.byte	0
	.byte	0x8
	.4byte	.LASF83
	.byte	0xd
	.byte	0xfa
	.byte	0x26
	.4byte	0x597
	.byte	0x5
	.4byte	.LASF84
	.byte	0xe
	.byte	0x18
	.byte	0x10
	.4byte	0x5c5
	.byte	0x6
	.byte	0x8
	.4byte	0x5cb
	.byte	0x11
	.4byte	0x5db
	.byte	0x12
	.4byte	0x132
	.byte	0x12
	.4byte	0x187
	.byte	0
	.byte	0x8
	.4byte	.LASF85
	.byte	0xe
	.byte	0x1e
	.byte	0x10
	.4byte	0x6d
	.byte	0x11
	.4byte	0x5f2
	.byte	0x12
	.4byte	0x5b9
	.byte	0
	.byte	0x8
	.4byte	.LASF86
	.byte	0xe
	.byte	0x28
	.byte	0x13
	.4byte	0x5fe
	.byte	0x6
	.byte	0x8
	.4byte	0x5e7
	.byte	0x8
	.4byte	.LASF87
	.byte	0xf
	.byte	0x1e
	.byte	0x1c
	.4byte	0x68
	.byte	0xa
	.4byte	0x68
	.4byte	0x61b
	.byte	0xb
	.byte	0
	.byte	0x3
	.4byte	0x610
	.byte	0x8
	.4byte	.LASF88
	.byte	0xf
	.byte	0x1f
	.byte	0x1c
	.4byte	0x61b
	.byte	0x8
	.4byte	.LASF89
	.byte	0xf
	.byte	0x20
	.byte	0x19
	.4byte	0x34
	.byte	0x8
	.4byte	.LASF90
	.byte	0xf
	.byte	0x21
	.byte	0x15
	.4byte	0x34
	.byte	0x8
	.4byte	.LASF91
	.byte	0xf
	.byte	0x22
	.byte	0x15
	.4byte	0x34
	.byte	0x8
	.4byte	.LASF92
	.byte	0xf
	.byte	0x2e
	.byte	0x13
	.4byte	0xc4
	.byte	0x8
	.4byte	.LASF93
	.byte	0xf
	.byte	0x2f
	.byte	0x13
	.4byte	0xc4
	.byte	0x13
	.4byte	0x2d
	.byte	0x8
	.4byte	.LASF94
	.byte	0xf
	.byte	0x30
	.byte	0x12
	.4byte	0x679
	.byte	0x6
	.byte	0x8
	.4byte	0x668
	.byte	0x8
	.4byte	.LASF95
	.byte	0xf
	.byte	0x31
	.byte	0x1d
	.4byte	0xca
	.byte	0xc
	.4byte	.LASF96
	.byte	0x18
	.byte	0x1
	.byte	0x20
	.byte	0x8
	.4byte	0x6c0
	.byte	0xd
	.string	"fun"
	.byte	0x1
	.byte	0x21
	.byte	0x9
	.4byte	0x132
	.byte	0
	.byte	0xd
	.string	"val"
	.byte	0x1
	.byte	0x22
	.byte	0x9
	.4byte	0x132
	.byte	0x8
	.byte	0x10
	.4byte	.LASF71
	.byte	0x1
	.byte	0x23
	.byte	0x7
	.4byte	0x2d
	.byte	0x10
	.byte	0
	.byte	0xc
	.4byte	.LASF97
	.byte	0x20
	.byte	0x1
	.byte	0x26
	.byte	0x8
	.4byte	0x702
	.byte	0x10
	.4byte	.LASF98
	.byte	0x1
	.byte	0x27
	.byte	0x11
	.4byte	0x702
	.byte	0
	.byte	0xd
	.string	"old"
	.byte	0x1
	.byte	0x28
	.byte	0xb
	.4byte	0x6d
	.byte	0x8
	.byte	0x10
	.4byte	.LASF99
	.byte	0x1
	.byte	0x29
	.byte	0xb
	.4byte	0x6d
	.byte	0x10
	.byte	0x10
	.4byte	.LASF67
	.byte	0x1
	.byte	0x2a
	.byte	0xb
	.4byte	0x6d
	.byte	0x18
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x68b
	.byte	0x14
	.4byte	.LASF100
	.byte	0x1
	.byte	0x35
	.byte	0x1b
	.4byte	0x6c0
	.byte	0x9
	.byte	0x3
	.8byte	finalisable_first
	.byte	0x14
	.4byte	.LASF101
	.byte	0x1
	.byte	0x36
	.byte	0x1b
	.4byte	0x6c0
	.byte	0x9
	.byte	0x3
	.8byte	finalisable_last
	.byte	0xc
	.4byte	.LASF102
	.byte	0x28
	.byte	0x1
	.byte	0x38
	.byte	0x8
	.4byte	0x769
	.byte	0x10
	.4byte	.LASF79
	.byte	0x1
	.byte	0x39
	.byte	0x11
	.4byte	0x769
	.byte	0
	.byte	0x10
	.4byte	.LASF67
	.byte	0x1
	.byte	0x3a
	.byte	0x7
	.4byte	0x2d
	.byte	0x8
	.byte	0x10
	.4byte	.LASF103
	.byte	0x1
	.byte	0x3b
	.byte	0x10
	.4byte	0x76f
	.byte	0x10
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x734
	.byte	0xa
	.4byte	0x68b
	.4byte	0x77f
	.byte	0xe
	.4byte	0x47
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LASF104
	.byte	0x1
	.byte	0x3e
	.byte	0x16
	.4byte	0x769
	.byte	0x9
	.byte	0x3
	.8byte	to_do_hd
	.byte	0x14
	.4byte	.LASF105
	.byte	0x1
	.byte	0x3f
	.byte	0x16
	.4byte	0x769
	.byte	0x9
	.byte	0x3
	.8byte	to_do_tl
	.byte	0x14
	.4byte	.LASF106
	.byte	0x1
	.byte	0xa5
	.byte	0xc
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	running_finalisation_function
	.byte	0x15
	.4byte	.LASF114
	.byte	0x1
	.2byte	0x1ba
	.byte	0x6
	.8byte	.LFB24
	.8byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.4byte	0x81b
	.byte	0x16
	.8byte	.LVL125
	.4byte	0x81b
	.4byte	0x7ff
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0
	.byte	0
	.byte	0x18
	.8byte	.LVL126
	.4byte	0x81b
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+32
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LASF111
	.byte	0x1
	.2byte	0x1ae
	.byte	0xd
	.8byte	.LFB23
	.8byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x859
	.byte	0x1a
	.4byte	.LASF96
	.byte	0x1
	.2byte	0x1ae
	.byte	0x3b
	.4byte	0x859
	.byte	0x1
	.byte	0x5a
	.byte	0x1b
	.string	"i"
	.byte	0x1
	.2byte	0x1af
	.byte	0xb
	.4byte	0x6d
	.4byte	.LLST0
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x6c0
	.byte	0x1c
	.4byte	.LASF108
	.byte	0x1
	.2byte	0x1a8
	.byte	0x10
	.4byte	0x132
	.8byte	.LFB22
	.8byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0x894
	.byte	0x1d
	.4byte	.LASF107
	.byte	0x1
	.2byte	0x1a8
	.byte	0x2a
	.4byte	0x132
	.4byte	.LLST30
	.byte	0
	.byte	0x1c
	.4byte	.LASF109
	.byte	0x1
	.2byte	0x1a2
	.byte	0x10
	.4byte	0x132
	.8byte	.LFB21
	.8byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x8ff
	.byte	0x1e
	.string	"f"
	.byte	0x1
	.2byte	0x1a2
	.byte	0x40
	.4byte	0x132
	.4byte	.LLST28
	.byte	0x1e
	.string	"v"
	.byte	0x1
	.2byte	0x1a2
	.byte	0x49
	.4byte	0x132
	.4byte	.LLST29
	.byte	0x18
	.8byte	.LVL122
	.4byte	0x96a
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+32
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x17
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0
	.byte	0x1c
	.4byte	.LASF110
	.byte	0x1
	.2byte	0x19d
	.byte	0x10
	.4byte	0x132
	.8byte	.LFB20
	.8byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x96a
	.byte	0x1e
	.string	"f"
	.byte	0x1
	.2byte	0x19d
	.byte	0x2b
	.4byte	0x132
	.4byte	.LLST26
	.byte	0x1e
	.string	"v"
	.byte	0x1
	.2byte	0x19d
	.byte	0x34
	.4byte	0x132
	.4byte	.LLST27
	.byte	0x18
	.8byte	.LVL118
	.4byte	0x96a
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
	.byte	0x17
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LASF112
	.byte	0x1
	.2byte	0x175
	.byte	0xd
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0xa5c
	.byte	0x1d
	.4byte	.LASF96
	.byte	0x1
	.2byte	0x175
	.byte	0x39
	.4byte	0x859
	.4byte	.LLST14
	.byte	0x1e
	.string	"f"
	.byte	0x1
	.2byte	0x175
	.byte	0x46
	.4byte	0x132
	.4byte	.LLST15
	.byte	0x1e
	.string	"v"
	.byte	0x1
	.2byte	0x175
	.byte	0x4f
	.4byte	0x132
	.4byte	.LLST16
	.byte	0x1f
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x9f4
	.byte	0x20
	.4byte	.LASF113
	.byte	0x1
	.2byte	0x184
	.byte	0xf
	.4byte	0x6d
	.4byte	.LLST18
	.byte	0x18
	.8byte	.LVL64
	.4byte	0xec0
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xa
	.2byte	0x2d0
	.byte	0
	.byte	0
	.byte	0x1f
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0xa28
	.byte	0x20
	.4byte	.LASF113
	.byte	0x1
	.2byte	0x18a
	.byte	0xf
	.4byte	0x6d
	.4byte	.LLST17
	.byte	0x21
	.8byte	.LVL58
	.4byte	0xecc
	.byte	0
	.byte	0x16
	.8byte	.LVL56
	.4byte	0xed8
	.4byte	0xa40
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x18
	.8byte	.LVL63
	.4byte	0xee4
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0
	.byte	0
	.byte	0x22
	.4byte	.LASF146
	.byte	0x1
	.2byte	0x16e
	.byte	0x6
	.8byte	.LFB18
	.8byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.byte	0x15
	.4byte	.LASF115
	.byte	0x1
	.2byte	0x165
	.byte	0x6
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0xab2
	.byte	0x18
	.8byte	.LVL114
	.4byte	0xab2
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+32
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LASF116
	.byte	0x1
	.2byte	0x11f
	.byte	0xd
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0xb35
	.byte	0x1d
	.4byte	.LASF96
	.byte	0x1
	.2byte	0x11f
	.byte	0x3e
	.4byte	0x859
	.4byte	.LLST9
	.byte	0x1b
	.string	"i"
	.byte	0x1
	.2byte	0x121
	.byte	0xb
	.4byte	0x6d
	.4byte	.LLST10
	.byte	0x1b
	.string	"j"
	.byte	0x1
	.2byte	0x121
	.byte	0xe
	.4byte	0x6d
	.4byte	.LLST11
	.byte	0x1b
	.string	"k"
	.byte	0x1
	.2byte	0x121
	.byte	0x11
	.4byte	0x6d
	.4byte	.LLST12
	.byte	0x20
	.4byte	.LASF117
	.byte	0x1
	.2byte	0x122
	.byte	0xb
	.4byte	0x6d
	.4byte	.LLST13
	.byte	0x18
	.8byte	.LVL42
	.4byte	0xe45
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0
	.byte	0x23
	.4byte	.LASF118
	.byte	0x1
	.2byte	0x10b
	.byte	0x6
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0xb8b
	.byte	0x1b
	.string	"i"
	.byte	0x1
	.2byte	0x10d
	.byte	0xb
	.4byte	0x6d
	.4byte	.LLST25
	.byte	0x21
	.8byte	.LVL107
	.4byte	0xef0
	.byte	0x21
	.8byte	.LVL108
	.4byte	0xef0
	.byte	0x21
	.8byte	.LVL111
	.4byte	0xef0
	.byte	0
	.byte	0x24
	.4byte	.LASF119
	.byte	0x1
	.byte	0xf7
	.byte	0x6
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0xbd2
	.byte	0x25
	.string	"i"
	.byte	0x1
	.byte	0xf9
	.byte	0xb
	.4byte	0x6d
	.4byte	.LLST24
	.byte	0x21
	.8byte	.LVL99
	.4byte	0xefc
	.byte	0x21
	.8byte	.LVL103
	.4byte	0xefc
	.byte	0
	.byte	0x26
	.4byte	.LASF120
	.byte	0x1
	.byte	0xdd
	.byte	0x6
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0xc41
	.byte	0x27
	.string	"f"
	.byte	0x1
	.byte	0xdd
	.byte	0x2b
	.4byte	0x5b9
	.4byte	.LLST21
	.byte	0x25
	.string	"i"
	.byte	0x1
	.byte	0xdf
	.byte	0xb
	.4byte	0x6d
	.4byte	.LLST22
	.byte	0x28
	.4byte	.LASF121
	.byte	0x1
	.byte	0xe0
	.byte	0x11
	.4byte	0x769
	.4byte	.LLST23
	.byte	0x29
	.8byte	.LVL91
	.4byte	0xc30
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x2a
	.8byte	.LVL92
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x26
	.4byte	.LASF122
	.byte	0x1
	.byte	0xaa
	.byte	0x6
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0xd2e
	.byte	0x2b
	.string	"f"
	.byte	0x1
	.byte	0xac
	.byte	0x10
	.4byte	0x68b
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x25
	.string	"res"
	.byte	0x1
	.byte	0xad
	.byte	0x9
	.4byte	0x132
	.4byte	.LLST19
	.byte	0x1f
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0xcaf
	.byte	0x28
	.4byte	.LASF123
	.byte	0x1
	.byte	0xb8
	.byte	0x17
	.4byte	0x769
	.4byte	.LLST20
	.byte	0x21
	.8byte	.LVL74
	.4byte	0xf08
	.byte	0
	.byte	0x16
	.8byte	.LVL70
	.4byte	0xf14
	.4byte	0xcd4
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x80
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC2
	.byte	0
	.byte	0x16
	.8byte	.LVL71
	.4byte	0xf21
	.4byte	0xcff
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0x91
	.byte	0x58
	.byte	0x6
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0xe
	.byte	0x91
	.byte	0x68
	.byte	0x94
	.byte	0x4
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x91
	.byte	0x60
	.byte	0x6
	.byte	0x22
	.byte	0
	.byte	0x21
	.8byte	.LVL77
	.4byte	0xf2d
	.byte	0x18
	.8byte	.LVL78
	.4byte	0xf14
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x80
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0
	.byte	0
	.byte	0x2c
	.4byte	.LASF124
	.byte	0x1
	.byte	0xa0
	.byte	0x6
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0xd6d
	.byte	0x18
	.8byte	.LVL68
	.4byte	0xdac
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0+32
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0x2c
	.4byte	.LASF125
	.byte	0x1
	.byte	0x9c
	.byte	0x6
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0xdac
	.byte	0x18
	.8byte	.LVL67
	.4byte	0xdac
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LANCHOR0
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.byte	0x2d
	.4byte	.LASF126
	.byte	0x1
	.byte	0x5d
	.byte	0xd
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0xe45
	.byte	0x2e
	.4byte	.LASF96
	.byte	0x1
	.byte	0x5d
	.byte	0x38
	.4byte	0x859
	.4byte	.LLST3
	.byte	0x2e
	.4byte	.LASF127
	.byte	0x1
	.byte	0x5d
	.byte	0x43
	.4byte	0x2d
	.4byte	.LLST4
	.byte	0x25
	.string	"i"
	.byte	0x1
	.byte	0x5f
	.byte	0xb
	.4byte	0x6d
	.4byte	.LLST5
	.byte	0x25
	.string	"j"
	.byte	0x1
	.byte	0x5f
	.byte	0xe
	.4byte	0x6d
	.4byte	.LLST6
	.byte	0x25
	.string	"k"
	.byte	0x1
	.byte	0x5f
	.byte	0x11
	.4byte	0x6d
	.4byte	.LLST7
	.byte	0x28
	.4byte	.LASF117
	.byte	0x1
	.byte	0x60
	.byte	0xb
	.4byte	0x6d
	.4byte	.LLST8
	.byte	0x21
	.8byte	.LVL19
	.4byte	0xe45
	.byte	0x18
	.8byte	.LVL30
	.4byte	0xf39
	.byte	0x17
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0x2d
	.4byte	.LASF128
	.byte	0x1
	.byte	0x49
	.byte	0xd
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0xec0
	.byte	0x2e
	.4byte	.LASF67
	.byte	0x1
	.byte	0x49
	.byte	0x1e
	.4byte	0x2d
	.4byte	.LLST1
	.byte	0x28
	.4byte	.LASF129
	.byte	0x1
	.byte	0x4b
	.byte	0x11
	.4byte	0x769
	.4byte	.LLST2
	.byte	0x16
	.8byte	.LVL7
	.4byte	0xf45
	.4byte	0xea4
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0xb
	.byte	0x78
	.byte	0
	.byte	0x31
	.byte	0x24
	.byte	0x78
	.byte	0
	.byte	0x22
	.byte	0x33
	.byte	0x24
	.byte	0x23
	.byte	0x28
	.byte	0
	.byte	0x18
	.8byte	.LVL9
	.4byte	0xf51
	.byte	0x17
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC0
	.byte	0
	.byte	0
	.byte	0x2f
	.4byte	.LASF130
	.4byte	.LASF130
	.byte	0xd
	.byte	0x67
	.byte	0x1c
	.byte	0x2f
	.4byte	.LASF131
	.4byte	.LASF131
	.byte	0xd
	.byte	0x8f
	.byte	0x1c
	.byte	0x2f
	.4byte	.LASF132
	.4byte	.LASF132
	.byte	0xb
	.byte	0x3d
	.byte	0x5
	.byte	0x2f
	.4byte	.LASF133
	.4byte	.LASF133
	.byte	0x8
	.byte	0x65
	.byte	0x11
	.byte	0x2f
	.4byte	.LASF134
	.4byte	.LASF134
	.byte	0xc
	.byte	0x49
	.byte	0xd
	.byte	0x2f
	.4byte	.LASF135
	.4byte	.LASF135
	.byte	0x10
	.byte	0x1b
	.byte	0x6
	.byte	0x2f
	.4byte	.LASF136
	.4byte	.LASF136
	.byte	0xd
	.byte	0x85
	.byte	0x11
	.byte	0x30
	.4byte	.LASF137
	.4byte	.LASF137
	.byte	0x4
	.2byte	0x16a
	.byte	0x6
	.byte	0x2f
	.4byte	.LASF138
	.4byte	.LASF138
	.byte	0x6
	.byte	0x24
	.byte	0x12
	.byte	0x2f
	.4byte	.LASF139
	.4byte	.LASF139
	.byte	0x8
	.byte	0x49
	.byte	0x11
	.byte	0x2f
	.4byte	.LASF140
	.4byte	.LASF140
	.byte	0xa
	.byte	0x4e
	.byte	0x6
	.byte	0x2f
	.4byte	.LASF141
	.4byte	.LASF141
	.byte	0xd
	.byte	0x6c
	.byte	0x1c
	.byte	0x2f
	.4byte	.LASF142
	.4byte	.LASF142
	.byte	0x4
	.byte	0x6e
	.byte	0x11
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
	.byte	0x35
	.byte	0
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
	.byte	0x6
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
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
	.byte	0xd
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
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.byte	0x1a
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
	.byte	0x1d
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
	.byte	0x1e
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
	.byte	0x1f
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
	.byte	0x20
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
	.byte	0x23
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
	.byte	0xb
	.byte	0x39
	.byte	0xb
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
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x26
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
	.byte	0x27
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
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2a
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
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
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x2c
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2f
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
	.byte	0x5
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
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL3-.Ltext0
	.8byte	.LFE23-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST30:
	.8byte	.LVL123-.Ltext0
	.8byte	.LVL124-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL124-.Ltext0
	.8byte	.LFE22-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST28:
	.8byte	.LVL119-.Ltext0
	.8byte	.LVL121-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL121-.Ltext0
	.8byte	.LVL122-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL122-1-.Ltext0
	.8byte	.LFE21-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST29:
	.8byte	.LVL119-.Ltext0
	.8byte	.LVL120-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL120-.Ltext0
	.8byte	.LVL122-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL122-1-.Ltext0
	.8byte	.LFE21-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST26:
	.8byte	.LVL115-.Ltext0
	.8byte	.LVL117-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL117-.Ltext0
	.8byte	.LVL118-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL118-1-.Ltext0
	.8byte	.LFE20-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST27:
	.8byte	.LVL115-.Ltext0
	.8byte	.LVL116-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL116-.Ltext0
	.8byte	.LVL118-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL118-1-.Ltext0
	.8byte	.LFE20-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST14:
	.8byte	.LVL54-.Ltext0
	.8byte	.LVL55-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL55-.Ltext0
	.8byte	.LVL61-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL61-.Ltext0
	.8byte	.LVL63-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL63-.Ltext0
	.8byte	.LFE19-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST15:
	.8byte	.LVL54-.Ltext0
	.8byte	.LVL56-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL56-1-.Ltext0
	.8byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL62-.Ltext0
	.8byte	.LVL63-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL63-.Ltext0
	.8byte	.LFE19-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST16:
	.8byte	.LVL54-.Ltext0
	.8byte	.LVL56-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL56-1-.Ltext0
	.8byte	.LVL60-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL60-.Ltext0
	.8byte	.LVL63-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	.LVL63-.Ltext0
	.8byte	.LVL66-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL66-.Ltext0
	.8byte	.LFE19-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST18:
	.8byte	.LVL63-.Ltext0
	.8byte	.LVL65-.Ltext0
	.2byte	0x2
	.byte	0x4e
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST17:
	.8byte	.LVL57-.Ltext0
	.8byte	.LVL59-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL32-.Ltext0
	.8byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL35-.Ltext0
	.8byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL53-.Ltext0
	.8byte	.LFE16-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST10:
	.8byte	.LVL34-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL39-.Ltext0
	.8byte	.LVL42-1-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL43-.Ltext0
	.8byte	.LVL48-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL48-.Ltext0
	.8byte	.LVL50-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL51-.Ltext0
	.8byte	.LFE16-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST11:
	.8byte	.LVL43-.Ltext0
	.8byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL44-.Ltext0
	.8byte	.LVL48-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	0
	.8byte	0
.LLST12:
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL44-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL44-.Ltext0
	.8byte	.LVL48-.Ltext0
	.2byte	0x1
	.byte	0x60
	.8byte	0
	.8byte	0
.LLST13:
	.8byte	.LVL33-.Ltext0
	.8byte	.LVL35-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL35-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL40-.Ltext0
	.8byte	.LVL41-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST25:
	.8byte	.LVL106-.Ltext0
	.8byte	.LVL113-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST24:
	.8byte	.LVL97-.Ltext0
	.8byte	.LVL98-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL98-.Ltext0
	.8byte	.LVL101-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL102-.Ltext0
	.8byte	.LVL105-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST21:
	.8byte	.LVL80-.Ltext0
	.8byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL82-.Ltext0
	.8byte	.LVL96-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	.LVL96-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST22:
	.8byte	.LVL81-.Ltext0
	.8byte	.LVL82-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL82-.Ltext0
	.8byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL86-.Ltext0
	.8byte	.LVL90-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL90-.Ltext0
	.8byte	.LVL94-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST23:
	.8byte	.LVL89-.Ltext0
	.8byte	.LVL95-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST19:
	.8byte	.LVL71-.Ltext0
	.8byte	.LVL72-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL75-.Ltext0
	.8byte	.LVL76-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST20:
	.8byte	.LVL73-.Ltext0
	.8byte	.LVL75-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL10-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL28-.Ltext0
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
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL19-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL19-1-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL13-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL19-1-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL29-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL29-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL24-.Ltext0
	.2byte	0x3
	.byte	0x7c
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL24-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x3
	.byte	0x7c
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL29-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL20-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL13-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL6-.Ltext0
	.8byte	.LFE8-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL9-.Ltext0
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
.LASF92:
	.string	"caml_enter_blocking_section_hook"
.LASF66:
	.string	"limit"
.LASF93:
	.string	"caml_leave_blocking_section_hook"
.LASF129:
	.string	"result"
.LASF54:
	.string	"caml_young_alloc_start"
.LASF145:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF29:
	.string	"sigjmp_buf"
.LASF13:
	.string	"caml_timing_hook"
.LASF123:
	.string	"next_hd"
.LASF89:
	.string	"caml_something_to_do"
.LASF115:
	.string	"caml_final_update_minor_roots"
.LASF58:
	.string	"caml_young_trigger"
.LASF109:
	.string	"caml_final_register_called_without_value"
.LASF3:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF73:
	.string	"caml_custom_elt"
.LASF34:
	.string	"caml_gc_subphase"
.LASF141:
	.string	"caml_stat_alloc_noexc"
.LASF116:
	.string	"generic_final_minor_update"
.LASF110:
	.string	"caml_final_register"
.LASF44:
	.string	"caml_major_window"
.LASF57:
	.string	"caml_young_limit"
.LASF132:
	.string	"caml_page_table_lookup"
.LASF87:
	.string	"caml_signals_are_pending"
.LASF112:
	.string	"generic_final_register"
.LASF55:
	.string	"caml_young_alloc_end"
.LASF143:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF22:
	.string	"value"
.LASF94:
	.string	"caml_try_leave_blocking_section_hook"
.LASF63:
	.string	"caml_ref_table"
.LASF62:
	.string	"longjmp_buffer"
.LASF16:
	.string	"caml_minor_gc_begin_hook"
.LASF120:
	.string	"caml_final_do_roots"
.LASF25:
	.string	"color_t"
.LASF83:
	.string	"caml_local_roots"
.LASF98:
	.string	"table"
.LASF119:
	.string	"caml_final_invert_finalisable_values"
.LASF136:
	.string	"caml_stat_free"
.LASF137:
	.string	"caml_gc_message"
.LASF88:
	.string	"caml_pending_signals"
.LASF28:
	.string	"caml_callback_depth"
.LASF84:
	.string	"scanning_action"
.LASF49:
	.string	"caml_major_gc_hook"
.LASF48:
	.string	"caml_gc_clock"
.LASF81:
	.string	"nitems"
.LASF19:
	.string	"caml_finalise_end_hook"
.LASF128:
	.string	"alloc_to_do"
.LASF8:
	.string	"long long int"
.LASF85:
	.string	"caml_incremental_roots_count"
.LASF43:
	.string	"caml_gc_sweep_hp"
.LASF45:
	.string	"caml_major_ring"
.LASF65:
	.string	"threshold"
.LASF82:
	.string	"tables"
.LASF5:
	.string	"intnat"
.LASF1:
	.string	"long int"
.LASF108:
	.string	"caml_final_release"
.LASF11:
	.string	"addr"
.LASF68:
	.string	"reserve"
.LASF76:
	.string	"caml_huge_fallback_count"
.LASF74:
	.string	"block"
.LASF32:
	.string	"caml_fl_cur_wsz"
.LASF21:
	.string	"caml_runtime_warnings"
.LASF118:
	.string	"caml_final_oldify_young_roots"
.LASF23:
	.string	"header_t"
.LASF90:
	.string	"caml_requested_major_slice"
.LASF15:
	.string	"caml_major_slice_end_hook"
.LASF26:
	.string	"caml_atom_table"
.LASF9:
	.string	"long double"
.LASF18:
	.string	"caml_finalise_begin_hook"
.LASF61:
	.string	"caml_extra_heap_resources_minor"
.LASF146:
	.string	"caml_final_empty_young"
.LASF97:
	.string	"finalisable"
.LASF39:
	.string	"caml_dependent_allocated"
.LASF142:
	.string	"caml_fatal_error"
.LASF24:
	.string	"mlsize_t"
.LASF127:
	.string	"darken_value"
.LASF78:
	.string	"caml__roots_block"
.LASF6:
	.string	"uintnat"
.LASF51:
	.string	"caml_young_end"
.LASF140:
	.string	"caml_darken"
.LASF0:
	.string	"unsigned int"
.LASF122:
	.string	"caml_final_do_calls"
.LASF102:
	.string	"to_do"
.LASF134:
	.string	"caml_oldify_one"
.LASF107:
	.string	"unit"
.LASF114:
	.string	"caml_final_invariant_check"
.LASF131:
	.string	"caml_stat_resize"
.LASF135:
	.string	"caml_invert_root"
.LASF70:
	.string	"ephe"
.LASF14:
	.string	"caml_major_slice_begin_hook"
.LASF4:
	.string	"short unsigned int"
.LASF71:
	.string	"offset"
.LASF96:
	.string	"final"
.LASF121:
	.string	"todo"
.LASF50:
	.string	"caml_young_start"
.LASF133:
	.string	"caml_invalid_argument"
.LASF12:
	.string	"char"
.LASF111:
	.string	"gen_final_invariant_check"
.LASF139:
	.string	"caml_raise"
.LASF86:
	.string	"caml_scan_roots_hook"
.LASF46:
	.string	"caml_major_ring_index"
.LASF91:
	.string	"caml_requested_minor_gc"
.LASF33:
	.string	"caml_gc_phase"
.LASF59:
	.string	"caml_minor_heap_wsz"
.LASF20:
	.string	"caml_verb_gc"
.LASF17:
	.string	"caml_minor_gc_end_hook"
.LASF30:
	.string	"caml_external_raise"
.LASF100:
	.string	"finalisable_first"
.LASF2:
	.string	"long unsigned int"
.LASF52:
	.string	"caml_code_area_start"
.LASF95:
	.string	"caml_async_action_hook"
.LASF37:
	.string	"double"
.LASF144:
	.string	"finalise.c"
.LASF31:
	.string	"caml_exn_bucket"
.LASF27:
	.string	"caml_global_data"
.LASF67:
	.string	"size"
.LASF60:
	.string	"caml_in_minor_collection"
.LASF138:
	.string	"caml_callback_exn"
.LASF126:
	.string	"generic_final_update"
.LASF40:
	.string	"caml_fl_wsz_at_phase_change"
.LASF75:
	.string	"caml_custom_table"
.LASF105:
	.string	"to_do_tl"
.LASF103:
	.string	"item"
.LASF53:
	.string	"caml_code_area_end"
.LASF36:
	.string	"caml_extra_heap_resources"
.LASF35:
	.string	"caml_allocated_words"
.LASF125:
	.string	"caml_final_update_mark_phase"
.LASF80:
	.string	"ntables"
.LASF38:
	.string	"caml_dependent_size"
.LASF41:
	.string	"caml_heap_start"
.LASF113:
	.string	"new_size"
.LASF124:
	.string	"caml_final_update_clean_phase"
.LASF10:
	.string	"asize_t"
.LASF56:
	.string	"caml_young_ptr"
.LASF42:
	.string	"total_heap_size"
.LASF106:
	.string	"running_finalisation_function"
.LASF64:
	.string	"base"
.LASF47:
	.string	"caml_major_work_credit"
.LASF117:
	.string	"todo_count"
.LASF104:
	.string	"to_do_hd"
.LASF72:
	.string	"caml_ephe_ref_table"
.LASF69:
	.string	"caml_ephe_ref_elt"
.LASF101:
	.string	"finalisable_last"
.LASF79:
	.string	"next"
.LASF99:
	.string	"young"
.LASF77:
	.string	"caml_use_huge_pages"
.LASF130:
	.string	"caml_stat_alloc"
	.ident	"GCC: (GNU) 9.2.0"
