	.file	"major_gc.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Growing gray_vals to %luk bytes\n"
	.align	3
.LC1:
	.string	"No room for growing gray_vals\n"
	.text
	.align	1
	.type	realloc_gray_vals, @function
realloc_gray_vals:
.LFB9:
	.file 1 "major_gc.c"
	.loc 1 123 1
	.cfi_startproc
	.loc 1 124 3
	.loc 1 126 3
	.loc 1 127 3
	.loc 1 127 43 is_stmt 0
	ld	a4,caml_stat_heap_wsz
	srai	a5,a4,63
	andi	a5,a5,31
	add	a5,a5,a4
	srai	a5,a5,5
	.loc 1 127 22
	ld	a2,gray_vals_size
	.loc 1 127 6
	bgtu	a5,a2,.L9
	.loc 1 145 5 is_stmt 1
	.loc 1 145 48 is_stmt 0
	srli	a2,a2,1
	.loc 1 145 31
	slli	a2,a2,3
	ld	a5,gray_vals
	add	a2,a5,a2
	.loc 1 145 19
	sd	a2,gray_vals_cur,a5
	.loc 1 146 5 is_stmt 1
	.loc 1 146 18 is_stmt 0
	sw	zero,heap_is_pure,a5
	ret
.L9:
	.loc 1 123 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 128 5 is_stmt 1
	.loc 1 130 46 is_stmt 0
	slli	a2,a2,3
	.loc 1 128 5
	srli	a2,a2,9
	lla	a1,.LC0
	li	a0,8
	call	caml_gc_message
.LVL0:
	.loc 1 131 5 is_stmt 1
	.loc 1 131 21 is_stmt 0
	ld	a1,gray_vals_size
	slli	a1,a1,4
	ld	a0,gray_vals
	call	caml_stat_resize_noexc
.LVL1:
	.loc 1 134 5 is_stmt 1
	.loc 1 134 8 is_stmt 0
	beq	a0,zero,.L10
	.loc 1 139 7 is_stmt 1
	.loc 1 139 17 is_stmt 0
	sd	a0,gray_vals,a5
	.loc 1 140 7 is_stmt 1
	.loc 1 140 33 is_stmt 0
	lla	a3,gray_vals_size
	ld	a5,0(a3)
	slli	a4,a5,3
	add	a4,a0,a4
	.loc 1 140 21
	sd	a4,gray_vals_cur,a2
	.loc 1 141 7 is_stmt 1
	.loc 1 141 22 is_stmt 0
	slli	a4,a5,1
	sd	a4,0(a3)
	.loc 1 142 7 is_stmt 1
	.loc 1 142 33 is_stmt 0
	slli	a5,a5,4
	add	a0,a0,a5
.LVL2:
	.loc 1 142 21
	sd	a0,gray_vals_end,a5
.LVL3:
.L1:
	.loc 1 148 1
	ld	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL4:
.L10:
	.cfi_restore_state
	.loc 1 135 7 is_stmt 1
	lla	a1,.LC1
	li	a0,8
.LVL5:
	call	caml_gc_message
.LVL6:
	.loc 1 136 7
	.loc 1 136 21 is_stmt 0
	ld	a5,gray_vals
	sd	a5,gray_vals_cur,a4
	.loc 1 137 7 is_stmt 1
	.loc 1 137 20 is_stmt 0
	sw	zero,heap_is_pure,a5
	j	.L1
	.cfi_endproc
.LFE9:
	.size	realloc_gray_vals, .-realloc_gray_vals
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"Starting new major GC cycle\n"
	.text
	.align	1
	.type	start_cycle, @function
start_cycle:
.LFB11:
	.loc 1 188 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 189 3
	.loc 1 190 3
	.loc 1 191 3
	lla	a1,.LC2
	li	a0,1
	call	caml_gc_message
.LVL7:
	.loc 1 192 3
	call	caml_darken_all_roots_start
.LVL8:
	.loc 1 193 3
	.loc 1 193 17 is_stmt 0
	sw	zero,caml_gc_phase,a5
	.loc 1 194 3 is_stmt 1
	.loc 1 194 20 is_stmt 0
	li	a5,10
	sw	a5,caml_gc_subphase,a4
	.loc 1 195 3 is_stmt 1
	.loc 1 195 10 is_stmt 0
	sd	zero,markhp,a5
	.loc 1 196 3 is_stmt 1
	.loc 1 196 18 is_stmt 0
	li	a5,1
	sw	a5,ephe_list_pure,a4
	.loc 1 197 3 is_stmt 1
	.loc 1 197 25 is_stmt 0
	lla	a5,caml_ephe_list_head
	sd	a5,ephes_checked_if_pure,a4
	.loc 1 198 3 is_stmt 1
	.loc 1 198 18 is_stmt 0
	sd	a5,ephes_to_check,a4
	.loc 1 203 1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	start_cycle, .-start_cycle
	.align	1
	.type	init_sweep_phase, @function
init_sweep_phase:
.LFB12:
	.loc 1 220 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.loc 1 223 3
	.loc 1 223 20 is_stmt 0
	lla	s0,caml_gc_sweep_hp
	lla	s1,caml_heap_start
	ld	a5,0(s1)
	sd	a5,0(s0)
	.loc 1 224 3 is_stmt 1
	call	caml_fl_init_merge
.LVL9:
	.loc 1 225 3
	.loc 1 225 17 is_stmt 0
	li	a5,2
	sw	a5,caml_gc_phase,a4
	.loc 1 226 3 is_stmt 1
	.loc 1 226 9 is_stmt 0
	ld	a5,0(s1)
	sd	a5,chunk,a4
	.loc 1 227 3 is_stmt 1
	.loc 1 227 20 is_stmt 0
	sd	a5,0(s0)
	.loc 1 228 3 is_stmt 1
	.loc 1 228 19 is_stmt 0
	ld	a4,-16(a5)
	.loc 1 228 17
	add	a5,a5,a4
	.loc 1 228 9
	sd	a5,limit,a4
	.loc 1 229 3 is_stmt 1
	.loc 1 229 31 is_stmt 0
	ld	a5,caml_fl_cur_wsz
	sd	a5,caml_fl_wsz_at_phase_change,a4
	.loc 1 230 3 is_stmt 1
	.loc 1 230 7 is_stmt 0
	ld	a5,caml_major_gc_hook
	.loc 1 230 6
	beq	a5,zero,.L13
	.loc 1 230 27 is_stmt 1 discriminator 1
	.loc 1 230 28 is_stmt 0 discriminator 1
	jalr	a5
.LVL10:
.L13:
	.loc 1 231 1
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	ld	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	init_sweep_phase, .-init_sweep_phase
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"Cleaning %ld words\n"
	.text
	.align	1
	.type	clean_slice, @function
clean_slice:
.LFB16:
	.loc 1 522 1 is_stmt 1
	.cfi_startproc
.LVL11:
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
	mv	s4,a0
	.loc 1 523 3
	.loc 1 525 3
	mv	a2,a0
	lla	a1,.LC3
	li	a0,64
.LVL12:
	call	caml_gc_message
.LVL13:
	.loc 1 527 3
	.loc 1 527 9 is_stmt 0
	j	.L17
.LVL14:
.L19:
	.loc 1 535 9 is_stmt 1
.LBB15:
.LBB16:
	.file 2 "caml/weak.h"
	.loc 2 45 3
	.loc 2 46 3
	.loc 2 47 3
	.loc 2 48 3
	.loc 2 49 3
	.loc 2 51 3
	.loc 2 51 8 is_stmt 0
	mv	s6,s1
	.loc 2 51 6
	ld	s5,-8(s1)
.LVL15:
	.loc 2 52 3 is_stmt 1
	.loc 2 52 8 is_stmt 0
	srli	s5,s5,10
.LVL16:
	.loc 2 53 3 is_stmt 1
	.loc 2 53 10 is_stmt 0
	li	s3,2
	.loc 2 46 7
	li	s7,0
	.loc 2 53 3
	j	.L21
.LVL17:
.L33:
.LBB17:
.LBB18:
.LBB19:
	.file 3 "caml/minor_gc.h"
	.loc 3 97 5 is_stmt 1
	.loc 3 98 5
	lla	a0,caml_ephe_ref_table
	call	caml_realloc_ephe_ref_table
.LVL18:
.L26:
	.loc 3 100 3
	.loc 3 100 17 is_stmt 0
	lla	a4,caml_ephe_ref_table
	ld	a5,24(a4)
	.loc 3 100 22
	addi	a3,a5,16
	sd	a3,24(a4)
.LVL19:
	.loc 3 101 3 is_stmt 1
	.loc 3 101 18 is_stmt 0
	sd	s1,0(a5)
	.loc 3 102 3 is_stmt 1
	.loc 3 102 20 is_stmt 0
	sd	s3,8(a5)
	.loc 3 103 3 is_stmt 1
.LVL20:
.LBE19:
.LBE18:
	.loc 2 68 13
.L22:
.LBE17:
	.loc 2 56 5
	.loc 2 56 15 is_stmt 0
	ld	a5,caml_ephe_none
	.loc 2 56 8
	beq	a5,s0,.L23
	.loc 2 57 12
	andi	a5,s0,1
	.loc 2 57 9
	bne	a5,zero,.L23
	.loc 2 57 32
	mv	s8,s0
	mv	a0,s0
	call	caml_page_table_lookup
.LVL21:
	andi	a0,a0,3
	.loc 2 57 29
	beq	a0,zero,.L23
	.loc 2 58 7 is_stmt 1
	.loc 2 58 11 is_stmt 0
	addi	s10,s0,-8
	lbu	a4,-8(s0)
	.loc 2 58 10
	li	a5,250
	bne	a4,a5,.L24
.LBB22:
	.loc 2 59 9 is_stmt 1
	.loc 2 59 15 is_stmt 0
	ld	s0,0(s0)
.LVL22:
	.loc 2 60 9 is_stmt 1
	.loc 2 60 13 is_stmt 0
	andi	a5,s0,1
	.loc 2 60 12
	bne	a5,zero,.L24
	.loc 2 61 11 is_stmt 1
	.loc 2 61 16 is_stmt 0
	mv	a0,s0
	call	caml_page_table_lookup
.LVL23:
	andi	a0,a0,7
	.loc 2 61 14
	beq	a0,zero,.L24
	.loc 2 61 39
	lbu	a5,-8(s0)
	.loc 2 61 36
	li	a4,250
	beq	a5,a4,.L24
	.loc 2 62 15
	li	a4,246
	beq	a5,a4,.L24
	.loc 2 62 42
	li	a4,253
	beq	a5,a4,.L24
	.loc 2 65 13 is_stmt 1
.LVL24:
	.loc 2 65 26 is_stmt 0
	sd	s0,0(s2)
	.loc 2 66 13 is_stmt 1
	.loc 2 66 33 is_stmt 0
	ld	a5,caml_young_end
	bgeu	s0,a5,.L22
	ld	a5,caml_young_start
	bleu	s0,a5,.L22
	.loc 2 67 15 is_stmt 1
.LVL25:
.LBB21:
.LBB20:
	.loc 3 95 3
	.loc 3 96 3
	.loc 3 96 10 is_stmt 0
	lla	a5,caml_ephe_ref_table
	ld	a4,24(a5)
	.loc 3 96 22
	ld	a5,32(a5)
	.loc 3 96 6
	bltu	a4,a5,.L26
	j	.L33
.LVL26:
.L24:
.LBE20:
.LBE21:
.LBE22:
	.loc 2 72 7 is_stmt 1
	.loc 2 72 11 is_stmt 0
	ld	a5,0(s10)
	andi	a5,a5,768
	.loc 2 72 10
	bne	a5,zero,.L23
	.loc 2 72 36
	ld	a5,caml_young_end
	bgeu	s8,a5,.L27
	ld	a5,caml_young_start
	bgtu	s8,a5,.L23
.L27:
	.loc 2 73 9 is_stmt 1
.LVL27:
	.loc 2 74 9
	.loc 2 74 22 is_stmt 0
	ld	a5,caml_ephe_none
	sd	a5,0(s2)
	.loc 2 73 22
	li	s7,1
.LVL28:
.L23:
	.loc 2 53 25 is_stmt 1
	.loc 2 53 26 is_stmt 0
	addi	s3,s3,1
.LVL29:
.L21:
	.loc 2 53 15 is_stmt 1
	.loc 2 53 3 is_stmt 0
	bleu	s5,s3,.L34
	.loc 2 54 5 is_stmt 1
	.loc 2 54 13 is_stmt 0
	slli	s2,s3,3
	add	s2,s2,s6
	.loc 2 54 11
	ld	s0,0(s2)
.LVL30:
	j	.L22
.LVL31:
.L34:
	.loc 2 79 3 is_stmt 1
	.loc 2 79 9 is_stmt 0
	ld	a4,8(s1)
.LVL32:
	.loc 2 80 3 is_stmt 1
	.loc 2 80 12 is_stmt 0
	ld	a5,caml_ephe_none
	.loc 2 80 5
	beq	a4,a5,.L29
	.loc 2 81 7 is_stmt 1
	.loc 2 81 10 is_stmt 0
	beq	s7,zero,.L29
	.loc 2 82 9 is_stmt 1
	.loc 2 82 22 is_stmt 0
	sd	a5,8(s1)
.L29:
	.loc 2 85 9 is_stmt 1
.LVL33:
.LBE16:
.LBE15:
	.loc 1 536 9
	.loc 1 536 24 is_stmt 0
	sd	s1,ephes_to_check,a5
	.loc 1 537 9 is_stmt 1
	.loc 1 537 17 is_stmt 0
	ld	a0,-8(s1)
	srli	a0,a0,10
	.loc 1 537 14
	sub	s4,s4,a0
.LVL34:
	addi	s4,s4,-1
.LVL35:
.L17:
	.loc 1 527 9 is_stmt 1
	ble	s4,zero,.L16
	.loc 1 528 5
	.loc 1 528 9 is_stmt 0
	ld	a4,ephes_to_check
	.loc 1 528 7
	ld	s1,0(a4)
.LVL36:
	.loc 1 529 5 is_stmt 1
	.loc 1 529 8 is_stmt 0
	beq	s1,zero,.L18
	.loc 1 530 7 is_stmt 1
	.loc 1 530 11 is_stmt 0
	ld	a5,-8(s1)
	andi	a5,a5,768
	.loc 1 530 10
	bne	a5,zero,.L19
	.loc 1 532 9 is_stmt 1
	.loc 1 532 27 is_stmt 0
	ld	a5,0(s1)
	.loc 1 532 25
	sd	a5,0(a4)
	.loc 1 533 9 is_stmt 1
	.loc 1 533 14 is_stmt 0
	addi	s4,s4,-1
.LVL37:
	j	.L17
.L18:
	.loc 1 542 7 is_stmt 1
	call	init_sweep_phase
.LVL38:
	.loc 1 543 7
	.loc 1 527 9
.L16:
	.loc 1 546 1 is_stmt 0
	ld	ra,88(sp)
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
	ld	s8,16(sp)
	.cfi_restore 24
	ld	s9,8(sp)
	.cfi_restore 25
	ld	s10,0(sp)
	.cfi_restore 26
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE16:
	.size	clean_slice, .-clean_slice
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Sweeping %ld words\n"
	.text
	.align	1
	.type	sweep_slice, @function
sweep_slice:
.LFB17:
	.loc 1 549 1 is_stmt 1
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
	.loc 1 550 3
	.loc 1 551 3
	.loc 1 553 3
	mv	a2,a0
	lla	a1,.LC4
	li	a0,64
.LVL40:
	call	caml_gc_message
.LVL41:
	.loc 1 555 3
	.loc 1 555 9 is_stmt 0
	j	.L36
.LVL42:
.L38:
	.loc 1 563 9 is_stmt 1
	.loc 1 563 13 is_stmt 0
	andi	a4,a4,0xff
.LVL43:
	.loc 1 563 12
	li	a5,255
	beq	a4,a5,.L48
.L41:
	.loc 1 567 9 is_stmt 1
	.loc 1 567 37 is_stmt 0
	addi	a0,s0,8
	call	caml_fl_merge_block
.LVL44:
	.loc 1 567 26
	sd	a0,caml_gc_sweep_hp,a5
	.loc 1 568 9 is_stmt 1
	j	.L36
.L48:
.LBB23:
	.loc 1 564 11
	.loc 1 564 38 is_stmt 0
	ld	a5,8(s0)
	.loc 1 564 18
	ld	a5,8(a5)
.LVL45:
	.loc 1 565 11 is_stmt 1
	.loc 1 565 14 is_stmt 0
	beq	a5,zero,.L41
	.loc 1 565 34 is_stmt 1 discriminator 1
	addi	a0,s0,8
	jalr	a5
.LVL46:
	j	.L41
.LVL47:
.L39:
.LBE23:
	.loc 1 571 9
	.loc 1 571 25 is_stmt 0
	addi	s0,s0,8
.LVL48:
	.loc 1 571 23
	sd	s0,caml_fl_merge,a5
	.loc 1 572 9 is_stmt 1
	j	.L36
.LVL49:
.L37:
	.loc 1 580 7
	.loc 1 580 15 is_stmt 0
	lla	a4,chunk
	ld	a5,0(a4)
	ld	a5,-8(a5)
	.loc 1 580 13
	sd	a5,0(a4)
	.loc 1 581 7 is_stmt 1
	.loc 1 581 10 is_stmt 0
	beq	a5,zero,.L49
	.loc 1 588 9 is_stmt 1
	.loc 1 588 26 is_stmt 0
	sd	a5,caml_gc_sweep_hp,a4
	.loc 1 589 9 is_stmt 1
	.loc 1 589 25 is_stmt 0
	ld	a4,-16(a5)
	.loc 1 589 23
	add	a5,a5,a4
	.loc 1 589 15
	sd	a5,limit,a4
.L36:
	.loc 1 555 9 is_stmt 1
	ble	s1,zero,.L35
	.loc 1 556 5
	.loc 1 556 26 is_stmt 0
	ld	s0,caml_gc_sweep_hp
	ld	a5,limit
	.loc 1 556 8
	bgeu	s0,a5,.L37
	.loc 1 557 7 is_stmt 1
.LVL50:
	.loc 1 558 7
	.loc 1 558 10 is_stmt 0
	ld	a4,0(s0)
.LVL51:
	.loc 1 559 7 is_stmt 1
	.loc 1 559 15 is_stmt 0
	srli	a5,a4,10
	.loc 1 559 12
	sub	s1,s1,a5
.LVL52:
	addi	s1,s1,-1
.LVL53:
	.loc 1 560 7 is_stmt 1
	.loc 1 560 27 is_stmt 0
	addi	a5,a5,1
	slli	a5,a5,3
	.loc 1 560 24
	add	a5,s0,a5
	sd	a5,caml_gc_sweep_hp,a3
	.loc 1 561 7 is_stmt 1
	.loc 1 561 15 is_stmt 0
	andi	a5,a4,768
	.loc 1 561 7
	beq	a5,zero,.L38
	li	a3,512
	beq	a5,a3,.L39
	.loc 1 574 9 is_stmt 1
	.loc 1 575 9
	.loc 1 575 22 is_stmt 0
	andi	a4,a4,-769
.LVL54:
	.loc 1 575 20
	sd	a4,0(s0)
	.loc 1 576 9 is_stmt 1
	j	.L36
.LVL55:
.L49:
	.loc 1 583 9
	lla	a4,caml_stat_major_collections
	ld	a5,0(a4)
	addi	a5,a5,1
	sd	a5,0(a4)
	.loc 1 584 9
.LVL56:
	.loc 1 585 9
	.loc 1 585 23 is_stmt 0
	li	a5,3
	sw	a5,caml_gc_phase,a4
	.loc 1 586 9 is_stmt 1
	call	caml_request_minor_gc
.LVL57:
	.loc 1 555 9
.L35:
	.loc 1 593 1 is_stmt 0
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	ld	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE17:
	.size	sweep_slice, .-sweep_slice
	.align	1
	.type	mark_ephe_aux, @function
mark_ephe_aux:
.LFB14:
	.loc 1 304 1 is_stmt 1
	.cfi_startproc
.LVL58:
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
	mv	s2,a0
	mv	s3,a1
	.loc 1 305 3
	.loc 1 306 3
	.loc 1 307 3
	.loc 1 309 3
	.loc 1 309 7 is_stmt 0
	ld	a5,ephes_to_check
	.loc 1 309 5
	ld	s1,0(a5)
.LVL59:
	.loc 1 310 3 is_stmt 1
	.loc 1 310 6 is_stmt 0
	ld	s6,-8(s1)
.LVL60:
	.loc 1 311 3 is_stmt 1
	.loc 1 312 3
	.loc 1 312 8 is_stmt 0
	ld	s0,8(s1)
.LVL61:
	.loc 1 313 3 is_stmt 1
	.loc 1 313 13 is_stmt 0
	ld	a5,caml_ephe_none
	.loc 1 313 6
	beq	a5,s0,.L51
	mv	s7,s1
	.loc 1 314 8 discriminator 1
	andi	a5,s0,1
	.loc 1 313 31 discriminator 1
	beq	a5,zero,.L73
.LVL62:
.L51:
	.loc 1 361 5 is_stmt 1
	.loc 1 361 11 is_stmt 0
	ld	a5,0(s3)
	addi	a5,a5,-1
	sd	a5,0(s3)
	mv	a0,s2
.LVL63:
.L66:
	.loc 1 366 3 is_stmt 1
	.loc 1 366 30 is_stmt 0
	ld	a5,ephes_checked_if_pure
	ld	a4,ephes_to_check
	.loc 1 366 6
	beq	a5,a4,.L74
	.loc 1 372 5 is_stmt 1
	.loc 1 372 23 is_stmt 0
	ld	a3,0(s1)
	.loc 1 372 21
	sd	a3,0(a4)
	.loc 1 374 5 is_stmt 1
	.loc 1 374 38 is_stmt 0
	ld	a4,0(a5)
	.loc 1 374 36
	sd	a4,0(s1)
	.loc 1 375 5 is_stmt 1
	.loc 1 375 28 is_stmt 0
	sd	s1,0(a5)
	.loc 1 376 5 is_stmt 1
	.loc 1 376 27 is_stmt 0
	sd	s1,ephes_checked_if_pure,a5
.L50:
	.loc 1 379 1
	ld	ra,88(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,80(sp)
	.cfi_restore 8
	ld	s1,72(sp)
	.cfi_restore 9
.LVL64:
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
	ld	s8,16(sp)
	.cfi_restore 24
	ld	s9,8(sp)
	.cfi_restore 25
	ld	s10,0(sp)
	.cfi_restore 26
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
.LVL65:
.L73:
	.cfi_restore_state
	.loc 1 314 27
	mv	a0,s0
.LVL66:
	call	caml_page_table_lookup
.LVL67:
	andi	a0,a0,1
	.loc 1 314 24
	beq	a0,zero,.L51
	.loc 1 314 48 discriminator 1
	ld	a5,-8(s0)
	andi	a5,a5,768
	.loc 1 314 45 discriminator 1
	bne	a5,zero,.L51
.LBB33:
	.loc 1 316 5 is_stmt 1
.LVL68:
	.loc 1 319 5
	.loc 1 319 9 is_stmt 0
	andi	a5,s6,768
	.loc 1 319 8
	beq	a5,zero,.L69
	.loc 1 316 9
	li	s8,1
.L52:
.LVL69:
	.loc 1 322 5 is_stmt 1
	.loc 1 322 10 is_stmt 0
	srli	s6,s6,10
.LVL70:
	.loc 1 323 5 is_stmt 1
	.loc 1 323 12 is_stmt 0
	li	s5,2
	.loc 1 323 5
	j	.L53
.LVL71:
.L69:
	.loc 1 319 38
	li	s8,0
	j	.L52
.LVL72:
.L75:
.LBB34:
	.loc 1 340 13 is_stmt 1
	.loc 1 340 26 is_stmt 0
	sd	s0,0(s4)
	.loc 1 341 13 is_stmt 1
.LVL73:
.L54:
.LBE34:
	.loc 1 326 7
	.loc 1 326 15 is_stmt 0
	ld	a5,caml_ephe_none
	.loc 1 326 10
	beq	a5,s0,.L55
	.loc 1 327 11 discriminator 1
	andi	a5,s0,1
	.loc 1 326 33 discriminator 1
	bne	a5,zero,.L55
	.loc 1 327 29
	mv	a0,s0
	call	caml_page_table_lookup
.LVL74:
	andi	a5,a0,1
	.loc 1 327 26
	beq	a5,zero,.L55
	.loc 1 328 9 is_stmt 1
	.loc 1 328 13 is_stmt 0
	addi	s10,s0,-8
	lbu	a4,-8(s0)
	.loc 1 328 12
	li	a5,250
	bne	a4,a5,.L56
.LBB35:
	.loc 1 329 11 is_stmt 1
	.loc 1 329 17 is_stmt 0
	ld	s0,0(s0)
.LVL75:
	.loc 1 330 11 is_stmt 1
	.loc 1 330 15 is_stmt 0
	andi	a5,s0,1
	.loc 1 330 14
	bne	a5,zero,.L56
	.loc 1 332 18
	mv	a0,s0
	call	caml_page_table_lookup
.LVL76:
	andi	a5,a0,7
	.loc 1 331 29
	beq	a5,zero,.L56
	.loc 1 332 41
	lbu	a5,-8(s0)
	.loc 1 332 38
	li	a4,250
	beq	a5,a4,.L56
	.loc 1 333 17
	li	a4,246
	bne	a5,a4,.L75
.LVL77:
.L56:
.LBE35:
	.loc 1 344 9 is_stmt 1
	.loc 1 344 13 is_stmt 0
	ld	a5,0(s10)
	andi	a5,a5,768
	.loc 1 344 12
	bne	a5,zero,.L55
	.loc 1 345 22
	li	s8,0
.LVL78:
.L55:
	.loc 1 323 59 is_stmt 1 discriminator 2
	.loc 1 323 60 is_stmt 0 discriminator 2
	addi	s5,s5,1
.LVL79:
.L53:
	.loc 1 323 35 is_stmt 1 discriminator 1
	.loc 1 323 5 is_stmt 0 discriminator 1
	beq	s8,zero,.L57
	.loc 1 323 46 discriminator 3
	bgeu	s5,s6,.L57
	.loc 1 324 7 is_stmt 1
	.loc 1 324 13 is_stmt 0
	slli	s4,s5,3
	add	s4,s4,s7
	.loc 1 324 11
	ld	s0,0(s4)
.LVL80:
	j	.L54
.LVL81:
.L57:
	.loc 1 349 5 is_stmt 1
	.loc 1 349 11 is_stmt 0
	ld	a5,0(s3)
	sub	s5,a5,s5
.LVL82:
	addi	s5,s5,-1
	sd	s5,0(s3)
	.loc 1 351 5 is_stmt 1
	.loc 1 351 8 is_stmt 0
	bne	s8,zero,.L76
	.loc 1 357 7 is_stmt 1
	.loc 1 357 22 is_stmt 0
	sd	s1,ephes_to_check,a5
	.loc 1 358 7 is_stmt 1
	.loc 1 358 14 is_stmt 0
	mv	a0,s2
	j	.L50
.L76:
	.loc 1 352 7 is_stmt 1
.LVL83:
.LBB36:
.LBB37:
	.loc 1 237 3
	.loc 1 238 3
	.loc 1 240 3
	.loc 1 240 9 is_stmt 0
	ld	s0,8(s1)
.LVL84:
	.loc 1 252 3 is_stmt 1
	.loc 1 252 7 is_stmt 0
	andi	a5,s0,1
	.loc 1 252 6
	beq	a5,zero,.L77
.LVL85:
.L60:
	.loc 1 299 3 is_stmt 1
.LBE37:
.LBE36:
	.loc 1 352 23 is_stmt 0
	mv	a0,s2
.LBE33:
	.loc 1 314 68
	j	.L66
.LVL86:
.L77:
.LBB45:
.LBB44:
.LBB43:
	.loc 1 252 27
	mv	s5,s0
	mv	a0,s0
	call	caml_page_table_lookup
.LVL87:
	andi	a5,a0,1
	.loc 1 252 24
	beq	a5,zero,.L60
	.loc 1 255 5 is_stmt 1
	.loc 1 255 9 is_stmt 0
	ld	s3,-8(s0)
.LVL88:
	.loc 1 256 5 is_stmt 1
	.loc 1 256 9 is_stmt 0
	andi	a5,s3,0xff
	.loc 1 256 8
	li	a3,250
	beq	a5,a3,.L78
	.loc 1 279 10 is_stmt 1
	.loc 1 279 13 is_stmt 0
	li	a3,249
	beq	a5,a3,.L79
.LVL89:
.L62:
	.loc 1 287 5 is_stmt 1
	.loc 1 287 9 is_stmt 0
	andi	a5,s3,768
	.loc 1 287 8
	bne	a5,zero,.L60
	.loc 1 288 7 is_stmt 1
	.loc 1 288 22 is_stmt 0
	sw	zero,ephe_list_pure,a5
	.loc 1 289 7 is_stmt 1
	.loc 1 289 24 is_stmt 0
	andi	a5,s3,-769
	ori	a5,a5,256
	.loc 1 289 22
	sd	a5,-8(s0)
	.loc 1 290 7 is_stmt 1
	.loc 1 290 21 is_stmt 0
	addi	a5,s2,8
.LVL90:
	.loc 1 290 24
	sd	s0,0(s2)
	.loc 1 291 7 is_stmt 1
	.loc 1 291 25 is_stmt 0
	ld	a4,gray_vals_end
	.loc 1 291 10
	bgeu	a5,a4,.L80
	.loc 1 290 21
	mv	s2,a5
.LVL91:
	j	.L60
.LVL92:
.L78:
.LBB38:
	.loc 1 257 7 is_stmt 1
	.loc 1 257 13 is_stmt 0
	ld	s4,0(s0)
.LVL93:
	.loc 1 258 7 is_stmt 1
	.loc 1 258 28 is_stmt 0
	andi	a5,s4,1
	.loc 1 258 25
	bne	a5,zero,.L62
	.loc 1 259 12
	mv	s6,a5
.LVL94:
	.loc 1 258 40
	beq	a5,zero,.L81
.L63:
	.loc 1 269 9 is_stmt 1
	.loc 1 269 22 is_stmt 0
	sd	s4,8(s1)
	.loc 1 270 9 is_stmt 1
	.loc 1 270 12 is_stmt 0
	bne	s6,zero,.L62
	.loc 1 270 29
	ld	a4,caml_young_end
	bgeu	s4,a4,.L62
	ld	a5,caml_young_start
	bleu	s4,a5,.L62
	.loc 1 270 46
	bgeu	s5,a4,.L64
	bgtu	s5,a5,.L62
.L64:
	.loc 1 271 11 is_stmt 1
	.loc 1 272 13
.LVL95:
.LBB39:
.LBB40:
	.loc 3 95 3
	.loc 3 96 3
	.loc 3 96 10 is_stmt 0
	lla	a5,caml_ephe_ref_table
	ld	a4,24(a5)
	.loc 3 96 22
	ld	a5,32(a5)
	.loc 3 96 6
	bgeu	a4,a5,.L82
.L65:
	.loc 3 100 3 is_stmt 1
	.loc 3 100 17 is_stmt 0
	lla	a4,caml_ephe_ref_table
	ld	a5,24(a4)
	.loc 3 100 22
	addi	a3,a5,16
	sd	a3,24(a4)
.LVL96:
	.loc 3 101 3 is_stmt 1
	.loc 3 101 18 is_stmt 0
	sd	s1,0(a5)
	.loc 3 102 3 is_stmt 1
	.loc 3 102 20 is_stmt 0
	li	a4,1
	sd	a4,8(a5)
	.loc 3 103 3 is_stmt 1
	.loc 3 104 1 is_stmt 0
	j	.L62
.LVL97:
.L81:
.LBE40:
.LBE39:
	.loc 1 260 17
	mv	a0,s4
	call	caml_page_table_lookup
.LVL98:
	andi	a5,a0,7
	.loc 1 260 12
	beq	a5,zero,.L62
	.loc 1 260 40
	lbu	a5,-8(s4)
	.loc 1 260 37
	li	a4,250
	beq	a5,a4,.L62
	.loc 1 261 16
	li	a4,246
	bne	a5,a4,.L63
	j	.L62
.LVL99:
.L82:
.LBB42:
.LBB41:
	.loc 3 97 5 is_stmt 1
	.loc 3 98 5
	lla	a0,caml_ephe_ref_table
	call	caml_realloc_ephe_ref_table
.LVL100:
	j	.L65
.LVL101:
.L79:
.LBE41:
.LBE42:
.LBE38:
	.loc 1 280 7
	.loc 1 280 16 is_stmt 0
	srli	s0,s3,10
.LVL102:
	slli	s0,s0,3
	.loc 1 280 13
	sub	s0,s5,s0
.LVL103:
	.loc 1 281 7 is_stmt 1
	.loc 1 281 11 is_stmt 0
	ld	s3,-8(s0)
.LVL104:
	j	.L62
.LVL105:
.L80:
	.loc 1 292 9 is_stmt 1
	.loc 1 292 23 is_stmt 0
	lla	s0,gray_vals_cur
.LVL106:
	sd	a5,0(s0)
	.loc 1 293 9 is_stmt 1
	call	realloc_gray_vals
.LVL107:
	.loc 1 294 9
	.loc 1 294 23 is_stmt 0
	ld	s2,0(s0)
.LVL108:
	j	.L60
.LVL109:
.L74:
.LBE43:
.LBE44:
.LBE45:
	.loc 1 368 5 is_stmt 1
	.loc 1 368 27 is_stmt 0
	sd	s1,ephes_checked_if_pure,a5
	.loc 1 369 5 is_stmt 1
	.loc 1 369 20 is_stmt 0
	sd	s1,ephes_to_check,a5
	j	.L50
	.cfi_endproc
.LFE14:
	.size	mark_ephe_aux, .-mark_ephe_aux
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	"Marking %ld words\n"
	.align	3
.LC6:
	.string	"Subphase = %d\n"
	.text
	.align	1
	.type	mark_slice, @function
mark_slice:
.LFB15:
	.loc 1 384 1 is_stmt 1
	.cfi_startproc
.LVL110:
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
	sd	s10,64(sp)
	sd	s11,56(sp)
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
	.cfi_offset 27, -104
	sd	a0,24(sp)
	.loc 1 385 3
	.loc 1 386 3
	.loc 1 387 3
	.loc 1 388 3
	.loc 1 392 3
	.loc 1 392 7 is_stmt 0
	sw	zero,44(sp)
	.loc 1 394 3 is_stmt 1
	mv	a2,a0
	lla	a1,.LC5
	li	a0,64
.LVL111:
	call	caml_gc_message
.LVL112:
	.loc 1 395 3
	lw	a2,caml_gc_subphase
	lla	a1,.LC6
	li	a0,64
	call	caml_gc_message
.LVL113:
	.loc 1 396 3
	.loc 1 396 17 is_stmt 0
	ld	s6,gray_vals_cur
.LVL114:
	.loc 1 397 3 is_stmt 1
	.loc 1 397 5 is_stmt 0
	ld	s1,current_value
.LVL115:
	.loc 1 398 3 is_stmt 1
	.loc 1 398 9 is_stmt 0
	ld	s5,current_index
.LVL116:
	.loc 1 399 3 is_stmt 1
	.loc 1 399 9 is_stmt 0
	j	.L84
.L85:
	.loc 1 403 7 is_stmt 1
	.loc 1 405 5
	.loc 1 405 8 is_stmt 0
	beq	s1,zero,.L86
	.loc 1 406 7 is_stmt 1
	.loc 1 406 12 is_stmt 0
	addi	s10,s1,-8
	.loc 1 406 10
	ld	s4,-8(s1)
.LVL117:
	.loc 1 407 7 is_stmt 1
	.loc 1 408 7
	.loc 1 408 12 is_stmt 0
	srli	s7,s4,10
.LVL118:
	.loc 1 409 7 is_stmt 1
	.loc 1 409 11 is_stmt 0
	add	a0,a0,s5
.LVL119:
	.loc 1 410 7 is_stmt 1
	.loc 1 410 11 is_stmt 0
	andi	a4,s4,0xff
	.loc 1 410 10
	li	a5,250
	bleu	a4,a5,.L116
	.loc 1 436 9 is_stmt 1
	.loc 1 437 9
	.loc 1 437 22 is_stmt 0
	ori	s4,s4,768
.LVL120:
	.loc 1 437 20
	sd	s4,-8(s1)
.LVL121:
	.loc 1 438 9 is_stmt 1
	.loc 1 438 14 is_stmt 0
	ld	a5,24(sp)
	sub	s7,a5,s7
.LVL122:
	addi	s7,s7,-1
	sd	s7,24(sp)
	.loc 1 439 9 is_stmt 1
.LVL123:
	.loc 1 439 11 is_stmt 0
	li	s1,0
.LVL124:
.L84:
	.loc 1 509 16 is_stmt 1
	.loc 1 399 9
	.loc 1 399 15 is_stmt 0
	ld	a0,24(sp)
	.loc 1 399 9
	ble	a0,zero,.L117
	.loc 1 400 5 is_stmt 1
	.loc 1 400 8 is_stmt 0
	bne	s1,zero,.L85
	.loc 1 400 33 discriminator 1
	ld	a5,gray_vals
	.loc 1 400 16 discriminator 1
	bgeu	a5,s6,.L85
	.loc 1 401 7 is_stmt 1
	.loc 1 402 7
.LVL125:
	.loc 1 402 9 is_stmt 0
	ld	s1,-8(s6)
.LVL126:
	addi	s6,s6,-8
.LVL127:
	j	.L85
.LVL128:
.L116:
	.loc 1 411 9 is_stmt 1
	.loc 1 411 15 is_stmt 0
	mv	s9,s5
	bleu	s5,s7,.L88
	mv	s9,s7
.L88:
.LVL129:
	.loc 1 412 9 is_stmt 1
	.loc 1 412 13 is_stmt 0
	mv	s5,s7
	bleu	s7,a0,.L89
.LVL130:
	mv	s5,a0
.LVL131:
.L89:
	.loc 1 413 9 is_stmt 1
	.loc 1 417 9
	.loc 1 417 16 is_stmt 0
	mv	s2,s9
	.loc 1 417 9
	j	.L90
.LVL132:
.L121:
.LBB53:
.LBB54:
.LBB55:
	.loc 1 257 7 is_stmt 1
	.loc 1 257 13 is_stmt 0
	ld	a5,8(sp)
	ld	s11,0(a5)
.LVL133:
	.loc 1 258 7 is_stmt 1
	.loc 1 259 12 is_stmt 0
	andi	a5,s11,1
	sd	a5,16(sp)
	.loc 1 258 40
	beq	a5,zero,.L118
.LVL134:
.L93:
	.loc 1 269 9 is_stmt 1
	.loc 1 269 22 is_stmt 0
	sd	s11,0(s0)
	.loc 1 270 9 is_stmt 1
	.loc 1 270 12 is_stmt 0
	ld	a5,16(sp)
	bne	a5,zero,.L94
	.loc 1 270 29
	ld	a5,caml_young_end
	bgeu	s11,a5,.L94
	ld	a4,caml_young_start
	bleu	s11,a4,.L94
	.loc 1 270 46
	ld	a3,8(sp)
	bgeu	a3,a5,.L95
	bgtu	a3,a4,.L94
.L95:
	.loc 1 271 11 is_stmt 1
	.loc 1 274 13
.LVL135:
.LBB56:
.LBB57:
	.loc 3 85 3
	.loc 3 85 10 is_stmt 0
	lla	a5,caml_ref_table
	ld	a4,24(a5)
	.loc 3 85 22
	ld	a5,32(a5)
	.loc 3 85 6
	bgeu	a4,a5,.L119
.L96:
	.loc 3 89 3 is_stmt 1
	.loc 3 89 7 is_stmt 0
	lla	a4,caml_ref_table
	ld	a5,24(a4)
	.loc 3 89 12
	addi	a3,a5,8
	sd	a3,24(a4)
	.loc 3 89 15
	sd	s0,0(a5)
	.loc 3 90 1
	j	.L94
.LVL136:
.L118:
.LBE57:
.LBE56:
	.loc 1 260 17
	mv	a0,s11
	call	caml_page_table_lookup
.LVL137:
	andi	a0,a0,7
	.loc 1 260 12
	beq	a0,zero,.L94
	.loc 1 260 40
	lbu	a5,-8(s11)
	.loc 1 260 37
	li	a4,250
	beq	a5,a4,.L94
	.loc 1 261 16
	li	a4,246
	bne	a5,a4,.L93
	j	.L94
.LVL138:
.L119:
.LBB59:
.LBB58:
	.loc 3 86 5 is_stmt 1
	.loc 3 87 5
	lla	a0,caml_ref_table
	call	caml_realloc_ref_table
.LVL139:
	j	.L96
.LVL140:
.L122:
.LBE58:
.LBE59:
.LBE55:
	.loc 1 280 7
	.loc 1 280 16 is_stmt 0
	srli	s3,s8,10
	slli	s3,s3,3
	.loc 1 280 13
	sub	s3,a3,s3
.LVL141:
	.loc 1 281 7 is_stmt 1
	.loc 1 281 11 is_stmt 0
	ld	s8,-8(s3)
.LVL142:
	j	.L94
.LVL143:
.L123:
	.loc 1 292 9 is_stmt 1
	.loc 1 292 23 is_stmt 0
	lla	s0,gray_vals_cur
	sd	a5,0(s0)
	.loc 1 293 9 is_stmt 1
	call	realloc_gray_vals
.LVL144:
	.loc 1 294 9
	.loc 1 294 23 is_stmt 0
	ld	s6,0(s0)
.LVL145:
.L91:
	.loc 1 299 3 is_stmt 1
.LBE54:
.LBE53:
	.loc 1 417 34
	.loc 1 417 35 is_stmt 0
	addi	s2,s2,1
.LVL146:
.L90:
	.loc 1 417 25 is_stmt 1 discriminator 1
	.loc 1 417 9 is_stmt 0 discriminator 1
	bgeu	s2,s5,.L120
	.loc 1 418 11 is_stmt 1 discriminator 3
	.loc 1 418 27 is_stmt 0 discriminator 3
	sext.w	s0,s2
.LVL147:
.LBB61:
.LBB60:
	.loc 1 237 3 is_stmt 1 discriminator 3
	.loc 1 238 3 discriminator 3
	.loc 1 240 3 discriminator 3
	.loc 1 240 11 is_stmt 0 discriminator 3
	slli	s0,s0,3
.LVL148:
	add	s0,s0,s1
	.loc 1 240 9 discriminator 3
	ld	s3,0(s0)
.LVL149:
	.loc 1 252 3 is_stmt 1 discriminator 3
	.loc 1 252 7 is_stmt 0 discriminator 3
	andi	a5,s3,1
	.loc 1 252 6 discriminator 3
	bne	a5,zero,.L91
	.loc 1 252 27
	sd	s3,8(sp)
	mv	a0,s3
	call	caml_page_table_lookup
.LVL150:
	andi	a0,a0,1
	.loc 1 252 24
	beq	a0,zero,.L91
	.loc 1 255 5 is_stmt 1
	.loc 1 255 11 is_stmt 0
	mv	a3,s3
	.loc 1 255 9
	ld	s8,-8(s3)
.LVL151:
	.loc 1 256 5 is_stmt 1
	.loc 1 256 9 is_stmt 0
	andi	a5,s8,0xff
	.loc 1 256 8
	li	a4,250
	beq	a5,a4,.L121
	.loc 1 279 10 is_stmt 1
	.loc 1 279 13 is_stmt 0
	li	a4,249
	beq	a5,a4,.L122
.L94:
	.loc 1 287 5 is_stmt 1
	.loc 1 287 9 is_stmt 0
	andi	a5,s8,768
	.loc 1 287 8
	bne	a5,zero,.L91
	.loc 1 288 7 is_stmt 1
	.loc 1 288 22 is_stmt 0
	sw	zero,ephe_list_pure,a5
	.loc 1 289 7 is_stmt 1
	.loc 1 289 24 is_stmt 0
	andi	s8,s8,-769
.LVL152:
	ori	s8,s8,256
	.loc 1 289 22
	sd	s8,-8(s3)
	.loc 1 290 7 is_stmt 1
	.loc 1 290 21 is_stmt 0
	addi	a5,s6,8
.LVL153:
	.loc 1 290 24
	sd	s3,0(s6)
	.loc 1 291 7 is_stmt 1
	.loc 1 291 25 is_stmt 0
	ld	a4,gray_vals_end
	.loc 1 291 10
	bgeu	a5,a4,.L123
	.loc 1 290 21
	mv	s6,a5
.LVL154:
	j	.L91
.LVL155:
.L120:
.LBE60:
.LBE61:
	.loc 1 422 9 is_stmt 1
	.loc 1 422 12 is_stmt 0
	bleu	s7,s5,.L98
	.loc 1 423 11 is_stmt 1
	.loc 1 423 16 is_stmt 0
	sd	zero,24(sp)
	.loc 1 424 11 is_stmt 1
.LVL156:
	.loc 1 426 11
	j	.L84
.LVL157:
.L98:
	.loc 1 428 11
	.loc 1 429 11
	.loc 1 429 24 is_stmt 0
	ori	s4,s4,768
.LVL158:
	.loc 1 429 22
	sd	s4,0(s10)
	.loc 1 430 11 is_stmt 1
	.loc 1 430 19 is_stmt 0
	sub	a5,s9,s5
	.loc 1 430 16
	ld	s5,24(sp)
.LVL159:
	add	a5,a5,s5
	addi	a5,a5,-1
	sd	a5,24(sp)
	.loc 1 431 11 is_stmt 1
.LVL160:
	.loc 1 432 11
	.loc 1 431 17 is_stmt 0
	li	s5,0
	.loc 1 432 13
	li	s1,0
	j	.L84
.LVL161:
.L86:
	.loc 1 441 11 is_stmt 1
	.loc 1 441 22 is_stmt 0
	ld	a5,markhp
	.loc 1 441 14
	beq	a5,zero,.L100
	.loc 1 442 7 is_stmt 1
	.loc 1 442 18 is_stmt 0
	ld	a4,limit
	.loc 1 442 10
	beq	a5,a4,.L124
	.loc 1 451 9 is_stmt 1
	.loc 1 451 13 is_stmt 0
	ld	a4,0(a5)
	andi	a2,a4,768
	.loc 1 451 12
	li	a3,256
	beq	a2,a3,.L125
.L103:
	.loc 1 456 9 is_stmt 1
	.loc 1 456 19 is_stmt 0
	srli	a4,a4,10
	addi	a4,a4,1
	slli	a4,a4,3
	.loc 1 456 16
	add	a5,a5,a4
	sd	a5,markhp,a4
	j	.L84
.L124:
	.loc 1 443 9 is_stmt 1
	.loc 1 443 17 is_stmt 0
	lla	a4,chunk
	ld	a5,0(a4)
	ld	a5,-8(a5)
	.loc 1 443 15
	sd	a5,0(a4)
	.loc 1 444 9 is_stmt 1
	.loc 1 444 12 is_stmt 0
	beq	a5,zero,.L126
	.loc 1 447 11 is_stmt 1
	.loc 1 447 18 is_stmt 0
	sd	a5,markhp,a4
	.loc 1 448 11 is_stmt 1
	.loc 1 448 27 is_stmt 0
	ld	a4,-16(a5)
	.loc 1 448 25
	add	a5,a5,a4
	.loc 1 448 17
	sd	a5,limit,a4
	j	.L84
.L126:
	.loc 1 445 11 is_stmt 1
	.loc 1 445 18 is_stmt 0
	sd	zero,markhp,a5
	j	.L84
.L125:
	.loc 1 452 11 is_stmt 1
	.loc 1 453 11
	.loc 1 454 11
	.loc 1 454 15 is_stmt 0
	addi	s1,a5,8
.LVL162:
	j	.L103
.L100:
	.loc 1 458 11 is_stmt 1
	.loc 1 458 15 is_stmt 0
	lw	a5,heap_is_pure
	.loc 1 458 14
	bne	a5,zero,.L104
	.loc 1 459 7 is_stmt 1
	.loc 1 459 20 is_stmt 0
	li	a5,1
	sw	a5,heap_is_pure,a4
	.loc 1 460 7 is_stmt 1
	.loc 1 460 13 is_stmt 0
	ld	a5,caml_heap_start
	sd	a5,chunk,a4
	.loc 1 461 7 is_stmt 1
	.loc 1 461 14 is_stmt 0
	sd	a5,markhp,a4
	.loc 1 462 7 is_stmt 1
	.loc 1 462 23 is_stmt 0
	ld	a4,-16(a5)
	.loc 1 462 21
	add	a5,a5,a4
	.loc 1 462 13
	sd	a5,limit,a4
	j	.L84
.L104:
	.loc 1 463 12 is_stmt 1
	.loc 1 463 33 is_stmt 0
	lw	a5,caml_gc_subphase
	.loc 1 463 15
	li	a4,10
	beq	a5,a4,.L127
	.loc 1 470 12 is_stmt 1
	.loc 1 470 16 is_stmt 0
	ld	a4,ephes_to_check
	ld	a4,0(a4)
	.loc 1 470 15
	bne	a4,zero,.L128
	.loc 1 473 12 is_stmt 1
	.loc 1 473 16 is_stmt 0
	lw	a4,ephe_list_pure
	.loc 1 473 15
	bne	a4,zero,.L107
	.loc 1 475 7 is_stmt 1
	.loc 1 475 22 is_stmt 0
	li	a5,1
	sw	a5,ephe_list_pure,a4
	.loc 1 476 7 is_stmt 1
	.loc 1 476 22 is_stmt 0
	ld	a5,ephes_checked_if_pure
	sd	a5,ephes_to_check,a4
	j	.L84
.L127:
	.loc 1 464 7 is_stmt 1
	.loc 1 464 21 is_stmt 0
	lla	s0,gray_vals_cur
	sd	s6,0(s0)
	.loc 1 465 7 is_stmt 1
	.loc 1 465 14 is_stmt 0
	call	caml_darken_all_roots_slice
.LVL163:
	.loc 1 465 12
	sd	a0,24(sp)
	.loc 1 466 7 is_stmt 1
	.loc 1 466 21 is_stmt 0
	ld	s6,0(s0)
.LVL164:
	.loc 1 467 7 is_stmt 1
	.loc 1 467 10 is_stmt 0
	ble	a0,zero,.L84
	.loc 1 468 9 is_stmt 1
	.loc 1 468 26 is_stmt 0
	li	a5,11
	sw	a5,caml_gc_subphase,a4
	j	.L84
.L128:
	.loc 1 472 7 is_stmt 1
	.loc 1 472 23 is_stmt 0
	addi	a2,sp,44
	addi	a1,sp,24
	mv	a0,s6
	call	mark_ephe_aux
.LVL165:
	mv	s6,a0
.LVL166:
	j	.L84
.LVL167:
.L107:
	.loc 1 478 7 is_stmt 1
	li	a4,11
	beq	a5,a4,.L108
	li	a4,12
	bne	a5,a4,.L84
	.loc 1 497 9
	.loc 1 497 23 is_stmt 0
	li	a5,1
	sw	a5,caml_gc_phase,a4
	.loc 1 498 9 is_stmt 1
	call	caml_final_update_clean_phase
.LVL168:
	.loc 1 499 9
	.loc 1 499 33 is_stmt 0
	ld	a5,caml_ephe_list_head
	.loc 1 499 12
	beq	a5,zero,.L111
	.loc 1 501 11 is_stmt 1
	.loc 1 501 26 is_stmt 0
	lla	a5,caml_ephe_list_head
	sd	a5,ephes_to_check,a4
.L112:
	.loc 1 506 11 is_stmt 1
	.loc 1 506 16 is_stmt 0
	sd	zero,24(sp)
	.loc 1 508 9 is_stmt 1
	j	.L84
.L108:
	.loc 1 482 11
	.loc 1 482 25 is_stmt 0
	lla	s0,gray_vals_cur
	sd	s6,0(s0)
	.loc 1 483 11 is_stmt 1
	call	caml_final_update_mark_phase
.LVL169:
	.loc 1 484 11
	.loc 1 484 25 is_stmt 0
	ld	s6,0(s0)
.LVL170:
	.loc 1 485 11 is_stmt 1
	.loc 1 485 29 is_stmt 0
	ld	a5,gray_vals
	.loc 1 485 14
	bgeu	a5,s6,.L110
	.loc 1 486 13 is_stmt 1
.LVL171:
	.loc 1 486 15 is_stmt 0
	ld	s1,-8(s6)
.LVL172:
	addi	s6,s6,-8
.LVL173:
.L110:
	.loc 1 487 13 is_stmt 1
	.loc 1 490 11
	.loc 1 490 26 is_stmt 0
	ld	a5,ephes_checked_if_pure
	sd	a5,ephes_to_check,a4
	.loc 1 491 11 is_stmt 1
	.loc 1 491 28 is_stmt 0
	li	a5,12
	sw	a5,caml_gc_subphase,a4
	.loc 1 493 9 is_stmt 1
	j	.L84
.L111:
	.loc 1 504 11
	call	init_sweep_phase
.LVL174:
	j	.L112
.L117:
	.loc 1 513 3
	.loc 1 513 17 is_stmt 0
	sd	s6,gray_vals_cur,a5
	.loc 1 514 3 is_stmt 1
	.loc 1 514 17 is_stmt 0
	sd	s1,current_value,a5
	.loc 1 515 3 is_stmt 1
	.loc 1 515 17 is_stmt 0
	sd	s5,current_index,a5
	.loc 1 518 1
	ld	ra,152(sp)
	.cfi_restore 1
	ld	s0,144(sp)
	.cfi_restore 8
	ld	s1,136(sp)
	.cfi_restore 9
.LVL175:
	ld	s2,128(sp)
	.cfi_restore 18
	ld	s3,120(sp)
	.cfi_restore 19
	ld	s4,112(sp)
	.cfi_restore 20
	ld	s5,104(sp)
	.cfi_restore 21
.LVL176:
	ld	s6,96(sp)
	.cfi_restore 22
.LVL177:
	ld	s7,88(sp)
	.cfi_restore 23
	ld	s8,80(sp)
	.cfi_restore 24
	ld	s9,72(sp)
	.cfi_restore 25
	ld	s10,64(sp)
	.cfi_restore 26
	ld	s11,56(sp)
	.cfi_restore 27
	addi	sp,sp,160
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE15:
	.size	mark_slice, .-mark_slice
	.align	1
	.globl	caml_darken
	.type	caml_darken, @function
caml_darken:
.LFB10:
	.loc 1 151 1 is_stmt 1
	.cfi_startproc
.LVL178:
	.loc 1 155 3
	.loc 1 155 7 is_stmt 0
	andi	a5,a0,1
	.loc 1 155 6
	beq	a5,zero,.L137
	ret
.L137:
	.loc 1 151 1 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	mv	s0,a0
	.loc 1 155 23 discriminator 1
	call	caml_page_table_lookup
.LVL179:
	andi	a0,a0,1
	.loc 1 155 20 discriminator 1
	beq	a0,zero,.L129
.LBB62:
	.loc 1 157 5 is_stmt 1
	.loc 1 157 14 is_stmt 0
	ld	a5,-8(s0)
.LVL180:
	.loc 1 158 5 is_stmt 1
	.loc 1 158 11 is_stmt 0
	andi	a4,a5,0xff
.LVL181:
	.loc 1 159 5 is_stmt 1
	.loc 1 159 8 is_stmt 0
	li	a3,249
	beq	a4,a3,.L138
.L131:
	.loc 1 173 5 is_stmt 1
	.loc 1 174 5
	.loc 1 174 9 is_stmt 0
	andi	a3,a5,768
	.loc 1 174 8
	bne	a3,zero,.L129
	.loc 1 175 7 is_stmt 1
	.loc 1 175 22 is_stmt 0
	sw	zero,ephe_list_pure,a3
	.loc 1 176 7 is_stmt 1
	.loc 1 176 10 is_stmt 0
	li	a3,250
	bgtu	a4,a3,.L132
	.loc 1 177 9 is_stmt 1
	.loc 1 177 22 is_stmt 0
	andi	a5,a5,-769
.LVL182:
	ori	a5,a5,256
	.loc 1 177 20
	sd	a5,-8(s0)
	.loc 1 178 9 is_stmt 1
	.loc 1 178 23 is_stmt 0
	lla	a3,gray_vals_cur
	ld	a4,0(a3)
.LVL183:
	addi	a5,a4,8
	sd	a5,0(a3)
	.loc 1 178 26
	sd	s0,0(a4)
	.loc 1 179 9 is_stmt 1
	.loc 1 179 27 is_stmt 0
	ld	a4,gray_vals_end
	.loc 1 179 12
	bltu	a5,a4,.L129
	.loc 1 179 45 is_stmt 1 discriminator 1
	call	realloc_gray_vals
.LVL184:
	j	.L129
.LVL185:
.L138:
	.loc 1 160 7
	.loc 1 160 12 is_stmt 0
	srli	a5,a5,10
.LVL186:
	slli	a5,a5,3
	.loc 1 160 9
	sub	s0,s0,a5
.LVL187:
	.loc 1 161 7 is_stmt 1
	.loc 1 161 9 is_stmt 0
	ld	a5,-8(s0)
.LVL188:
	.loc 1 162 7 is_stmt 1
	.loc 1 162 9 is_stmt 0
	andi	a4,a5,0xff
.LVL189:
	j	.L131
.L132:
	.loc 1 181 9 is_stmt 1
	.loc 1 181 22 is_stmt 0
	ori	a5,a5,768
.LVL190:
	.loc 1 181 20
	sd	a5,-8(s0)
.LVL191:
.L129:
.LBE62:
	.loc 1 185 1
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
.LVL192:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	caml_darken, .-caml_darken
	.section	.rodata.str1.8
	.align	3
.LC10:
	.string	"ordered work = %ld words\n"
	.align	3
.LC11:
	.string	"allocated_words = %lu\n"
	.align	3
.LC13:
	.string	"extra_heap_resources = %luu\n"
	.align	3
.LC14:
	.string	"raw work-to-do = %ldu\n"
	.align	3
.LC16:
	.string	"filtered work-to-do = %ldu\n"
	.align	3
.LC19:
	.string	"computed work = %ld words\n"
	.align	3
.LC20:
	.string	"!"
	.align	3
.LC21:
	.string	"%%"
	.align	3
.LC22:
	.string	"$"
	.align	3
.LC23:
	.string	"work-done = %ldu\n"
	.text
	.align	1
	.globl	caml_major_collection_slice
	.type	caml_major_collection_slice, @function
caml_major_collection_slice:
.LFB18:
	.loc 1 622 1 is_stmt 1
	.cfi_startproc
.LVL193:
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	fsd	fs0,8(sp)
	fsd	fs1,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 40, -40
	.cfi_offset 41, -48
	mv	s0,a0
	.loc 1 623 3
	.loc 1 624 3
	.loc 1 625 3
	.loc 1 683 3
	.loc 1 683 35 is_stmt 0
	ld	a5,caml_major_slice_begin_hook
	.loc 1 683 6
	beq	a5,zero,.L140
	.loc 1 683 44 is_stmt 1 discriminator 1
	.loc 1 683 45 is_stmt 0 discriminator 1
	jalr	a5
.LVL194:
.L140:
	.loc 1 684 34 is_stmt 1
	.loc 1 686 3
	.loc 1 686 7 is_stmt 0
	ld	a5,caml_allocated_words
	fcvt.d.lu	fa5,a5
	.loc 1 686 37
	fld	fa4,.LC8,a5
	fmul.d	fa5,fa5,fa4
	.loc 1 686 50
	ld	a4,caml_percent_free
	addi	a5,a4,100
	.loc 1 686 43
	fcvt.d.lu	fa3,a5
	fmul.d	fa5,fa5,fa3
	.loc 1 687 7
	ld	a5,caml_stat_heap_wsz
	fcvt.d.l	fa4,a5
	fdiv.d	fa5,fa5,fa4
	.loc 1 687 28
	fcvt.d.lu	fa2,a4
	fdiv.d	fa5,fa5,fa2
	.loc 1 686 5
	fld	fa4,.LC9,a5
	fmul.d	fa5,fa5,fa4
.LVL195:
	.loc 1 688 3 is_stmt 1
	.loc 1 688 27 is_stmt 0
	ld	a5,caml_dependent_size
	.loc 1 688 6
	beq	a5,zero,.L167
	.loc 1 689 5 is_stmt 1
	.loc 1 689 10 is_stmt 0
	ld	a4,caml_dependent_allocated
	fcvt.d.lu	fa4,a4
	.loc 1 689 44
	fmul.d	fa4,fa3,fa4
	.loc 1 690 10
	fcvt.d.lu	fa3,a5
	fdiv.d	fa4,fa4,fa3
	.loc 1 689 8
	fdiv.d	fa4,fa4,fa2
.LVL196:
.L141:
	.loc 1 694 3 is_stmt 1
	.loc 1 694 6 is_stmt 0
	fgt.d	a5,fa4,fa5
	bne	a5,zero,.L142
	.loc 1 686 5
	fmv.d	fa4,fa5
.LVL197:
.L142:
	.loc 1 695 3 is_stmt 1
	.loc 1 695 9 is_stmt 0
	fld	fs0,caml_extra_heap_resources,a5
	.loc 1 695 6
	fgt.d	a5,fs0,fa4
	bne	a5,zero,.L143
	fmv.d	fs0,fa4
.L143:
.LVL198:
	.loc 1 696 3 is_stmt 1
	.loc 1 696 6 is_stmt 0
	fld	fa5,.LC7,a5
	fgt.d	a5,fs0,fa5
	beq	a5,zero,.L144
	.loc 1 696 18
	fmv.d	fs0,fa5
.LVL199:
.L144:
	.loc 1 698 67 is_stmt 1
	.loc 1 700 3
	mv	a2,s0
	lla	a1,.LC10
	li	a0,64
	call	caml_gc_message
.LVL200:
	.loc 1 702 3
	ld	a2,caml_allocated_words
	lla	a1,.LC11
	li	a0,64
	call	caml_gc_message
.LVL201:
	.loc 1 705 3
	.loc 1 707 57 is_stmt 0
	fld	fa5,caml_extra_heap_resources,a5
	fld	fs1,.LC12,a5
	fmul.d	fa5,fa5,fs1
	.loc 1 705 3
	fcvt.lu.d a2,fa5,rtz
	lla	a1,.LC13
	li	a0,64
	call	caml_gc_message
.LVL202:
	.loc 1 708 3 is_stmt 1
	.loc 1 710 32 is_stmt 0
	fmul.d	fs1,fs0,fs1
	.loc 1 708 3
	fcvt.l.d a2,fs1,rtz
	lla	a1,.LC14
	li	a0,64
	call	caml_gc_message
.LVL203:
	.loc 1 712 3 is_stmt 1
	.loc 1 712 10 is_stmt 0
	li	a3,0
.LVL204:
.L145:
	.loc 1 712 15 is_stmt 1 discriminator 1
	.loc 1 712 17 is_stmt 0 discriminator 1
	lw	a5,caml_major_window
	.loc 1 712 3 discriminator 1
	ble	a5,a3,.L175
	.loc 1 713 5 is_stmt 1 discriminator 3
	.loc 1 713 29 is_stmt 0 discriminator 3
	fcvt.d.w	fa5,a5
	fdiv.d	fa5,fs0,fa5
	.loc 1 713 24 discriminator 3
	slli	a5,a3,3
	lla	a4,.LANCHOR0
	add	a4,a4,a5
	fld	fa4,0(a4)
	fadd.d	fa5,fa4,fa5
	fsd	fa5,0(a4)
	.loc 1 712 38 is_stmt 1 discriminator 3
	.loc 1 712 39 is_stmt 0 discriminator 3
	addiw	a3,a3,1
.LVL205:
	j	.L145
.LVL206:
.L167:
	.loc 1 692 8
	fmv.d.x	fa4,zero
	j	.L141
.LVL207:
.L175:
	.loc 1 716 3 is_stmt 1
	.loc 1 716 21 is_stmt 0
	fld	fa4,caml_gc_clock,a4
	.loc 1 716 6
	fld	fa5,.LC15,a4
	fge.d	a4,fa4,fa5
	beq	a4,zero,.L147
	.loc 1 717 5 is_stmt 1
	.loc 1 717 19 is_stmt 0
	fsub.d	fa4,fa4,fa5
	fsd	fa4,caml_gc_clock,a4
	.loc 1 718 5 is_stmt 1
	lla	a3,caml_major_ring_index
.LVL208:
	lw	a4,0(a3)
	addiw	a4,a4,1
	sext.w	a2,a4
	sw	a4,0(a3)
	.loc 1 719 5
	.loc 1 719 8 is_stmt 0
	bgt	a5,a2,.L147
	.loc 1 720 7 is_stmt 1
	.loc 1 720 29 is_stmt 0
	sw	zero,caml_major_ring_index,a4
.L147:
	.loc 1 723 3 is_stmt 1
	.loc 1 723 6 is_stmt 0
	li	a4,-1
	beq	s0,a4,.L176
	.loc 1 736 5 is_stmt 1
	.loc 1 736 8 is_stmt 0
	bne	s0,zero,.L151
.LBB63:
	.loc 1 739 7 is_stmt 1
	.loc 1 739 37 is_stmt 0
	lw	a4,caml_major_ring_index
	.loc 1 739 11
	addiw	a4,a4,1
.LVL209:
	.loc 1 740 7 is_stmt 1
	.loc 1 740 10 is_stmt 0
	bgt	a5,a4,.L152
	.loc 1 740 37
	li	a4,0
.L152:
.LVL210:
	.loc 1 741 7 is_stmt 1
	.loc 1 741 14 is_stmt 0
	slli	a4,a4,3
.LVL211:
	lla	a5,.LANCHOR0
	add	a4,a5,a4
	fld	fs0,0(a4)
.LVL212:
.L153:
.LBE63:
	.loc 1 747 5 is_stmt 1
	.loc 1 747 28 is_stmt 0
	lla	a5,caml_major_work_credit
	fld	fa5,0(a5)
	fadd.d	fa5,fa5,fs0
	fsd	fa5,0(a5)
.LVL213:
.L150:
	.loc 1 750 3 is_stmt 1
	.loc 1 752 3
	.loc 1 754 32 is_stmt 0
	fld	fa5,.LC12,a5
	fmul.d	fa5,fs0,fa5
	.loc 1 752 3
	fcvt.l.d a2,fa5,rtz
	lla	a1,.LC16
	li	a0,64
	call	caml_gc_message
.LVL214:
	.loc 1 756 3 is_stmt 1
	.loc 1 756 21 is_stmt 0
	lw	a5,caml_gc_phase
	.loc 1 756 6
	li	a4,3
	beq	a5,a4,.L177
	.loc 1 767 3 is_stmt 1
	.loc 1 767 6 is_stmt 0
	fmv.d.x	fa5,zero
	flt.d	a4,fs0,fa5
	bne	a4,zero,.L170
	.loc 1 772 3 is_stmt 1
	.loc 1 772 35 is_stmt 0
	sext.w	a5,a5
	.loc 1 772 6
	li	a4,1
	bleu	a5,a4,.L178
	.loc 1 777 5 is_stmt 1
	.loc 1 777 33 is_stmt 0
	ld	a5,caml_stat_heap_wsz
	fcvt.d.l	fa5,a5
	fmul.d	fa5,fa5,fs0
	.loc 1 777 54
	fld	fa4,.LC18,a5
	fmul.d	fa5,fa5,fa4
	.loc 1 777 58
	fld	fa4,.LC8,a5
	fdiv.d	fa5,fa5,fa4
	.loc 1 777 19
	fcvt.l.d s0,fa5,rtz
.LVL215:
.L158:
	.loc 1 779 3 is_stmt 1
	mv	a2,s0
	lla	a1,.LC19
	li	a0,64
	call	caml_gc_message
.LVL216:
	.loc 1 781 3
	.loc 1 781 21 is_stmt 0
	lw	a5,caml_gc_phase
	.loc 1 781 6
	beq	a5,zero,.L179
	.loc 1 786 9 is_stmt 1
	.loc 1 786 12 is_stmt 0
	li	a4,1
	beq	a5,a4,.L180
	.loc 1 790 5 is_stmt 1
	.loc 1 791 56
	.loc 1 792 5
	mv	a0,s0
	call	sweep_slice
.LVL217:
	.loc 1 793 41
	.loc 1 794 5
	lla	a1,.LC22
	li	a0,2
	call	caml_gc_message
.LVL218:
.L160:
	.loc 1 797 3
	.loc 1 797 21 is_stmt 0
	lw	a4,caml_gc_phase
	.loc 1 797 6
	li	a5,3
	beq	a4,a5,.L181
	.loc 1 750 5
	fmv.d	fs1,fs0
.LVL219:
.L156:
	.loc 1 799 53 is_stmt 1
	.loc 1 803 3
	.loc 1 805 32 is_stmt 0
	fld	fa5,.LC12,a5
	fmul.d	fa5,fs1,fa5
	.loc 1 803 3
	fcvt.l.d a2,fa5,rtz
	lla	a1,.LC23
	li	a0,64
	call	caml_gc_message
.LVL220:
	.loc 1 809 3 is_stmt 1
	.loc 1 809 5 is_stmt 0
	fsub.d	fs0,fs0,fs1
.LVL221:
	.loc 1 810 3 is_stmt 1
	.loc 1 810 11 is_stmt 0
	lla	s0,caml_major_work_credit
	fld	fs1,0(s0)
	fmv.d	fa1,fs1
	fmv.d	fa0,fs0
	call	fmin
.LVL222:
	.loc 1 811 3 is_stmt 1
	.loc 1 811 26 is_stmt 0
	fsub.d	fs1,fs1,fa0
	fsd	fs1,0(s0)
	.loc 1 812 3 is_stmt 1
	.loc 1 812 6 is_stmt 0
	fgt.d	a5,fs0,fa0
	beq	a5,zero,.L162
	.loc 1 813 5 is_stmt 1
	.loc 1 813 7 is_stmt 0
	fsub.d	fs0,fs0,fa0
.LVL223:
	.loc 1 814 5 is_stmt 1
	.loc 1 814 7 is_stmt 0
	lw	a2,caml_major_window
	fcvt.d.w	fa4,a2
	fdiv.d	fa4,fs0,fa4
.LVL224:
	.loc 1 815 5 is_stmt 1
	.loc 1 815 12 is_stmt 0
	li	a4,0
.LVL225:
.L164:
	.loc 1 815 17 is_stmt 1 discriminator 1
	.loc 1 815 5 is_stmt 0 discriminator 1
	ble	a2,a4,.L162
	.loc 1 815 45 is_stmt 1 discriminator 3
	.loc 1 815 64 is_stmt 0 discriminator 3
	slli	a3,a4,3
	lla	a5,.LANCHOR0
	add	a5,a5,a3
	fld	fa5,0(a5)
	fadd.d	fa5,fa5,fa4
	fsd	fa5,0(a5)
	.loc 1 815 40 is_stmt 1 discriminator 3
	.loc 1 815 41 is_stmt 0 discriminator 3
	addiw	a4,a4,1
.LVL226:
	j	.L164
.LVL227:
.L176:
	.loc 1 729 5 is_stmt 1
	.loc 1 729 13 is_stmt 0
	lla	s1,caml_major_work_credit
	fld	fs1,0(s1)
	lw	s0,caml_major_ring_index
.LVL228:
	slli	a5,s0,3
	lla	s0,.LANCHOR0
	add	s0,s0,a5
	fld	fs0,0(s0)
.LVL229:
	fmv.d	fa1,fs0
	fmv.d	fa0,fs1
	call	fmin
.LVL230:
	.loc 1 731 5 is_stmt 1
	.loc 1 731 28 is_stmt 0
	fsub.d	fs1,fs1,fa0
	fsd	fs1,0(s1)
	.loc 1 732 5 is_stmt 1
	.loc 1 732 12 is_stmt 0
	fsub.d	fs0,fs0,fa0
.LVL231:
	.loc 1 733 5 is_stmt 1
	.loc 1 733 44 is_stmt 0
	sd	zero,0(s0)
	j	.L150
.LVL232:
.L151:
	.loc 1 744 7 is_stmt 1
	.loc 1 744 16 is_stmt 0
	fcvt.d.l	fa5,s0
	.loc 1 744 33
	fld	fa4,.LC8,a5
	fmul.d	fa5,fa5,fa4
	.loc 1 744 46
	ld	a4,caml_percent_free
	addi	a5,a4,100
	.loc 1 744 39
	fcvt.d.lu	fs0,a5
.LVL233:
	fmul.d	fs0,fs0,fa5
	.loc 1 745 16
	ld	a5,caml_stat_heap_wsz
	fcvt.d.l	fa5,a5
	fdiv.d	fs0,fs0,fa5
	.loc 1 745 37
	fcvt.d.lu	fa5,a4
	fdiv.d	fs0,fs0,fa5
	.loc 1 744 14
	fld	fa5,.LC9,a5
	fmul.d	fs0,fs0,fa5
.LVL234:
	j	.L153
.LVL235:
.L177:
	.loc 1 757 5 is_stmt 1
	.loc 1 757 24 is_stmt 0
	ld	a4,caml_young_ptr
	ld	a5,caml_young_alloc_end
	.loc 1 757 8
	beq	a4,a5,.L182
.L155:
	.loc 1 761 43 is_stmt 1
	.loc 1 763 5
.LVL236:
	.loc 1 764 5
	.loc 1 763 7 is_stmt 0
	fmv.d.x	fs1,zero
	.loc 1 764 5
	j	.L156
.LVL237:
.L182:
	.loc 1 760 7 is_stmt 1
	call	start_cycle
.LVL238:
	j	.L155
.L178:
	.loc 1 773 5
	.loc 1 773 36 is_stmt 0
	ld	a5,caml_stat_heap_wsz
	fcvt.d.l	fa5,a5
	.loc 1 773 64
	fld	fa4,.LC17,a5
	fmul.d	fa5,fa5,fa4
	.loc 1 774 43
	ld	a5,caml_percent_free
	addi	a5,a5,100
	.loc 1 774 36
	fcvt.d.lu	fa4,a5
	fdiv.d	fa4,fa5,fa4
	.loc 1 775 36
	ld	a5,caml_incremental_roots_count
	fcvt.d.lu	fa5,a5
	fadd.d	fa5,fa5,fa4
	.loc 1 773 33
	fmul.d	fa5,fa5,fs0
	.loc 1 773 19
	fcvt.l.d s0,fa5,rtz
.LVL239:
	j	.L158
.L179:
	.loc 1 782 55 is_stmt 1
	.loc 1 783 5
	mv	a0,s0
	call	mark_slice
.LVL240:
	.loc 1 784 61
	.loc 1 785 5
	lla	a1,.LC20
	li	a0,2
	call	caml_gc_message
.LVL241:
	j	.L160
.L180:
	.loc 1 787 5
	mv	a0,s0
	call	clean_slice
.LVL242:
	.loc 1 788 5
	lla	a1,.LC21
	li	a0,2
	call	caml_gc_message
.LVL243:
	j	.L160
.L181:
	.loc 1 798 5
	call	caml_compact_heap_maybe
.LVL244:
	.loc 1 750 5 is_stmt 0
	fmv.d	fs1,fs0
	j	.L156
.LVL245:
.L170:
	.loc 1 768 7
	fmv.d.x	fs1,zero
	j	.L156
.LVL246:
.L162:
	.loc 1 818 3 is_stmt 1
	.loc 1 818 25 is_stmt 0
	lla	a3,caml_stat_major_words
	lla	a4,caml_allocated_words
	ld	a5,0(a4)
	fcvt.d.lu	fa5,a5
	fld	fa4,0(a3)
	fadd.d	fa5,fa5,fa4
	fsd	fa5,0(a3)
	.loc 1 819 3 is_stmt 1
	.loc 1 819 24 is_stmt 0
	sd	zero,0(a4)
	.loc 1 820 3 is_stmt 1
	.loc 1 820 28 is_stmt 0
	sd	zero,caml_dependent_allocated,a5
	.loc 1 821 3 is_stmt 1
	.loc 1 821 29 is_stmt 0
	lla	a5,caml_extra_heap_resources
	sd	zero,0(a5)
	.loc 1 822 3 is_stmt 1
	.loc 1 822 33 is_stmt 0
	ld	a5,caml_major_slice_end_hook
	.loc 1 822 6
	beq	a5,zero,.L139
	.loc 1 822 42 is_stmt 1 discriminator 1
	.loc 1 822 43 is_stmt 0 discriminator 1
	jalr	a5
.LVL247:
.L139:
	.loc 1 823 1
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	ld	s1,24(sp)
	.cfi_restore 9
	fld	fs0,8(sp)
	.cfi_restore 40
	fld	fs1,0(sp)
	.cfi_restore 41
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE18:
	.size	caml_major_collection_slice, .-caml_major_collection_slice
	.align	1
	.globl	caml_finish_major_cycle
	.type	caml_finish_major_cycle, @function
caml_finish_major_cycle:
.LFB19:
	.loc 1 830 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 831 3
	.loc 1 831 21 is_stmt 0
	lw	a4,caml_gc_phase
	.loc 1 831 6
	li	a5,3
	beq	a4,a5,.L192
.L185:
	.loc 1 832 9 is_stmt 1 discriminator 1
	.loc 1 832 24 is_stmt 0 discriminator 1
	lw	a5,caml_gc_phase
	.loc 1 832 9 discriminator 1
	bne	a5,zero,.L187
	.loc 1 832 39 is_stmt 1 discriminator 2
	li	a0,-1
	srli	a0,a0,1
	call	mark_slice
.LVL248:
	j	.L185
.L192:
	.loc 1 831 36 discriminator 1
	call	start_cycle
.LVL249:
	j	.L185
.L187:
	.loc 1 833 9 discriminator 1
	.loc 1 833 24 is_stmt 0 discriminator 1
	lw	a4,caml_gc_phase
	.loc 1 833 9 discriminator 1
	li	a5,1
	bne	a4,a5,.L189
	.loc 1 833 40 is_stmt 1 discriminator 2
	li	a0,-1
	srli	a0,a0,1
	call	clean_slice
.LVL250:
	j	.L187
.L190:
	.loc 1 835 40 discriminator 2
	li	a0,-1
	srli	a0,a0,1
	call	sweep_slice
.LVL251:
.L189:
	.loc 1 835 9 discriminator 1
	.loc 1 835 24 is_stmt 0 discriminator 1
	lw	a4,caml_gc_phase
	.loc 1 835 9 discriminator 1
	li	a5,2
	beq	a4,a5,.L190
	.loc 1 836 3 is_stmt 1
	.loc 1 837 3
	.loc 1 837 25 is_stmt 0
	lla	a3,caml_stat_major_words
	lla	a4,caml_allocated_words
	ld	a5,0(a4)
	fcvt.d.lu	fa5,a5
	fld	fa4,0(a3)
	fadd.d	fa5,fa5,fa4
	fsd	fa5,0(a3)
	.loc 1 838 3 is_stmt 1
	.loc 1 838 24 is_stmt 0
	sd	zero,0(a4)
	.loc 1 839 1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE19:
	.size	caml_finish_major_cycle, .-caml_finish_major_cycle
	.align	1
	.globl	caml_clip_heap_chunk_wsz
	.type	caml_clip_heap_chunk_wsz, @function
caml_clip_heap_chunk_wsz:
.LFB20:
	.loc 1 845 1 is_stmt 1
	.cfi_startproc
.LVL252:
	mv	a5,a0
	.loc 1 846 3
.LVL253:
	.loc 1 847 3
	.loc 1 850 3
	.loc 1 850 33 is_stmt 0
	ld	a0,caml_major_heap_increment
.LVL254:
	.loc 1 850 6
	li	a4,1000
	bgtu	a0,a4,.L194
	.loc 1 853 5 is_stmt 1
	.loc 1 853 31 is_stmt 0
	ld	a4,caml_stat_heap_wsz
	li	a3,100
	div	a4,a4,a3
	.loc 1 853 10
	mul	a0,a0,a4
.LVL255:
.L194:
	.loc 1 856 3 is_stmt 1
	.loc 1 856 6 is_stmt 0
	bgtu	a0,a5,.L195
	.loc 1 846 11
	mv	a0,a5
.LVL256:
.L195:
	.loc 1 859 3 is_stmt 1
	.loc 1 859 6 is_stmt 0
	li	a5,61440
.LVL257:
	bltu	a0,a5,.L198
.LVL258:
.L193:
	.loc 1 863 1
	ret
.LVL259:
.L198:
	.loc 1 860 12
	li	a0,61440
.LVL260:
	.loc 1 862 3 is_stmt 1
	.loc 1 862 10 is_stmt 0
	j	.L193
	.cfi_endproc
.LFE20:
	.size	caml_clip_heap_chunk_wsz, .-caml_clip_heap_chunk_wsz
	.section	.rodata.str1.8
	.align	3
.LC24:
	.string	"Fatal error: cannot allocate initial major heap.\n"
	.align	3
.LC25:
	.string	"Fatal error: cannot allocate initial page table.\n"
	.align	3
.LC26:
	.string	"Fatal error: not enough memory for the gray cache.\n"
	.text
	.align	1
	.globl	caml_init_major_heap
	.type	caml_init_major_heap, @function
caml_init_major_heap:
.LFB21:
	.loc 1 867 1 is_stmt 1
	.cfi_startproc
.LVL261:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.loc 1 868 3
	.loc 1 870 3
	.loc 1 870 24 is_stmt 0
	srli	a0,a0,3
.LVL262:
	call	caml_clip_heap_chunk_wsz
.LVL263:
	.loc 1 870 22
	sd	a0,caml_stat_heap_wsz,a5
	.loc 1 871 3 is_stmt 1
	.loc 1 871 26 is_stmt 0
	sd	a0,caml_stat_top_heap_wsz,a5
	.loc 1 872 3 is_stmt 1
	.loc 1 873 3
	.loc 1 874 5 is_stmt 0
	slli	a0,a0,3
	call	caml_alloc_for_heap
.LVL264:
	.loc 1 873 19
	sd	a0,caml_heap_start,a5
	.loc 1 875 3 is_stmt 1
	.loc 1 875 6 is_stmt 0
	beq	a0,zero,.L206
	.loc 1 877 3 is_stmt 1
	.loc 1 877 32 is_stmt 0
	sd	zero,-8(a0)
	.loc 1 878 3 is_stmt 1
	.loc 1 878 24 is_stmt 0
	ld	a1,caml_heap_start
	ld	a2,-16(a1)
	srli	a2,a2,3
	.loc 1 878 22
	sd	a2,caml_stat_heap_wsz,a5
	.loc 1 879 3 is_stmt 1
	.loc 1 879 25 is_stmt 0
	li	a5,1
	sd	a5,caml_stat_heap_chunks,a4
	.loc 1 880 3 is_stmt 1
	.loc 1 880 26 is_stmt 0
	sd	a2,caml_stat_top_heap_wsz,a5
	.loc 1 882 3 is_stmt 1
	.loc 1 883 45 is_stmt 0
	slli	a2,a2,3
	.loc 1 882 7
	add	a2,a1,a2
	li	a0,1
	call	caml_page_table_add
.LVL265:
	mv	s0,a0
	.loc 1 882 6
	bne	a0,zero,.L207
	.loc 1 889 3 is_stmt 1
	call	caml_fl_init_merge
.LVL266:
	.loc 1 890 3
	li	a3,0
	li	a2,1
	ld	a1,caml_stat_heap_wsz
	ld	a0,caml_heap_start
	call	caml_make_free_blocks
.LVL267:
	.loc 1 892 3
	.loc 1 892 17 is_stmt 0
	li	a5,3
	sw	a5,caml_gc_phase,a4
	.loc 1 893 3 is_stmt 1
	.loc 1 893 18 is_stmt 0
	li	a5,4096
	addi	a5,a5,-2048
	sd	a5,gray_vals_size,a4
	.loc 1 894 3 is_stmt 1
	.loc 1 894 25 is_stmt 0
	li	a0,16384
	call	caml_stat_alloc_noexc
.LVL268:
	.loc 1 894 13
	sd	a0,gray_vals,a5
	.loc 1 895 3 is_stmt 1
	.loc 1 895 6 is_stmt 0
	beq	a0,zero,.L208
	.loc 1 897 3 is_stmt 1
	.loc 1 897 17 is_stmt 0
	sd	a0,gray_vals_cur,a5
	.loc 1 898 3 is_stmt 1
	.loc 1 898 29 is_stmt 0
	ld	a5,gray_vals_size
	slli	a5,a5,3
	add	a0,a0,a5
	.loc 1 898 17
	sd	a0,gray_vals_end,a5
	.loc 1 899 3 is_stmt 1
	.loc 1 899 16 is_stmt 0
	li	a5,1
	sw	a5,heap_is_pure,a4
	.loc 1 900 3 is_stmt 1
	.loc 1 900 24 is_stmt 0
	sd	zero,caml_allocated_words,a5
	.loc 1 901 3 is_stmt 1
	.loc 1 901 29 is_stmt 0
	lla	a5,caml_extra_heap_resources
	sd	zero,0(a5)
	.loc 1 902 3 is_stmt 1
.LVL269:
.L203:
	.loc 1 902 15 discriminator 1
	.loc 1 902 3 is_stmt 0 discriminator 1
	li	a5,49
	bgt	s0,a5,.L209
	.loc 1 902 42 is_stmt 1 discriminator 3
	.loc 1 902 61 is_stmt 0 discriminator 3
	slli	a4,s0,3
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	sd	zero,0(a5)
	.loc 1 902 37 is_stmt 1 discriminator 3
	.loc 1 902 38 is_stmt 0 discriminator 3
	addiw	s0,s0,1
.LVL270:
	j	.L203
.L206:
	.loc 1 876 5 is_stmt 1
	lla	a0,.LC24
	call	caml_fatal_error
.LVL271:
.L207:
	.loc 1 885 5
	lla	a0,.LC25
	call	caml_fatal_error
.LVL272:
.L208:
	.loc 1 896 5
	lla	a0,.LC26
	call	caml_fatal_error
.LVL273:
.L209:
	.loc 1 903 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
.LVL274:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	caml_init_major_heap, .-caml_init_major_heap
	.align	1
	.globl	caml_set_major_window
	.type	caml_set_major_window, @function
caml_set_major_window:
.LFB22:
	.loc 1 905 35 is_stmt 1
	.cfi_startproc
.LVL275:
	.loc 1 906 3
	.loc 1 907 3
	.loc 1 908 3
	.loc 1 908 9 is_stmt 0
	lw	a1,caml_major_window
	.loc 1 908 6
	beq	a1,a0,.L210
	.loc 1 911 10
	li	a4,0
	.loc 1 906 11
	li	a5,0
.LVL276:
.L212:
	.loc 1 911 15 is_stmt 1 discriminator 1
	.loc 1 911 3 is_stmt 0 discriminator 1
	ble	a1,a4,.L216
	.loc 1 912 5 is_stmt 1 discriminator 3
	.loc 1 912 29 is_stmt 0 discriminator 3
	slli	a2,a4,3
	lla	a3,.LANCHOR0
	add	a3,a3,a2
	fld	fa4,0(a3)
	.loc 1 912 11 discriminator 3
	fcvt.d.lu	fa5,a5
	fadd.d	fa5,fa5,fa4
	fcvt.lu.d a5,fa5,rtz
.LVL277:
	.loc 1 911 38 is_stmt 1 discriminator 3
	.loc 1 911 39 is_stmt 0 discriminator 3
	addiw	a4,a4,1
.LVL278:
	j	.L212
.LVL279:
.L216:
	.loc 1 915 10
	li	a3,0
	j	.L214
.LVL280:
.L215:
	.loc 1 916 5 is_stmt 1 discriminator 3
	.loc 1 916 32 is_stmt 0 discriminator 3
	divu	a4,a5,a0
	.loc 1 916 24 discriminator 3
	slli	a1,a3,3
	lla	a2,.LANCHOR0
	add	a2,a2,a1
	fcvt.d.lu	fa5,a4
	fsd	fa5,0(a2)
	.loc 1 915 22 is_stmt 1 discriminator 3
	.loc 1 915 23 is_stmt 0 discriminator 3
	addiw	a3,a3,1
.LVL281:
.L214:
	.loc 1 915 15 is_stmt 1 discriminator 1
	.loc 1 915 3 is_stmt 0 discriminator 1
	blt	a3,a0,.L215
	.loc 1 918 3 is_stmt 1
	.loc 1 918 21 is_stmt 0
	sw	a0,caml_major_window,a5
.LVL282:
.L210:
	.loc 1 919 1
	ret
	.cfi_endproc
.LFE22:
	.size	caml_set_major_window, .-caml_set_major_window
	.align	1
	.globl	caml_finalise_heap
	.type	caml_finalise_heap, @function
caml_finalise_heap:
.LFB23:
	.loc 1 922 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 924 3
	call	caml_empty_minor_heap
.LVL283:
	.loc 1 925 3
	call	caml_finish_major_cycle
.LVL284:
	.loc 1 926 3
	.loc 1 929 3
	call	caml_fl_init_merge
.LVL285:
	.loc 1 930 3
	.loc 1 930 17 is_stmt 0
	li	a5,2
	sw	a5,caml_gc_phase,a4
	.loc 1 931 3 is_stmt 1
	.loc 1 931 9 is_stmt 0
	ld	a5,caml_heap_start
	sd	a5,chunk,a4
	.loc 1 932 3 is_stmt 1
	.loc 1 932 20 is_stmt 0
	sd	a5,caml_gc_sweep_hp,a4
	.loc 1 933 3 is_stmt 1
	.loc 1 933 19 is_stmt 0
	ld	a4,-16(a5)
	.loc 1 933 17
	add	a5,a5,a4
	.loc 1 933 9
	sd	a5,limit,a4
	.loc 1 934 3 is_stmt 1
.L218:
	.loc 1 934 9
	.loc 1 934 24 is_stmt 0
	lw	a4,caml_gc_phase
	.loc 1 934 9
	li	a5,2
	bne	a4,a5,.L221
	.loc 1 935 5 is_stmt 1
	li	a0,-1
	srli	a0,a0,1
	call	sweep_slice
.LVL286:
	j	.L218
.L221:
	.loc 1 936 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE23:
	.size	caml_finalise_heap, .-caml_finalise_heap
	.globl	caml_major_gc_hook
	.globl	caml_gc_clock
	.globl	caml_major_window
	.comm	caml_gc_subphase,4,4
	.globl	caml_fl_wsz_at_phase_change
	.comm	caml_extra_heap_resources,8,8
	.comm	caml_dependent_allocated,8,8
	.comm	caml_dependent_size,8,8
	.comm	caml_allocated_words,8,8
	.comm	caml_gc_phase,4,4
	.comm	caml_gc_sweep_hp,8,8
	.comm	caml_heap_start,8,8
	.comm	caml_major_heap_increment,8,8
	.comm	caml_percent_free,8,8
	.globl	caml_major_work_credit
	.globl	caml_major_ring_index
	.globl	caml_major_ring
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC7:
	.word	858993459
	.word	1070805811
	.align	3
.LC8:
	.word	0
	.word	1074266112
	.align	3
.LC9:
	.word	0
	.word	1071644672
	.align	3
.LC12:
	.word	0
	.word	1093567616
	.align	3
.LC15:
	.word	0
	.word	1072693248
	.align	3
.LC17:
	.word	0
	.word	1081032704
	.align	3
.LC18:
	.word	0
	.word	1075052544
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	caml_major_ring, @object
	.size	caml_major_ring, 400
caml_major_ring:
	.zero	400
	.section	.sbss,"aw",@nobits
	.align	3
	.type	current_index, @object
	.size	current_index, 8
current_index:
	.zero	8
	.type	current_value, @object
	.size	current_value, 8
current_value:
	.zero	8
	.type	caml_major_gc_hook, @object
	.size	caml_major_gc_hook, 8
caml_major_gc_hook:
	.zero	8
	.type	caml_gc_clock, @object
	.size	caml_gc_clock, 8
caml_gc_clock:
	.zero	8
	.type	ephes_to_check, @object
	.size	ephes_to_check, 8
ephes_to_check:
	.zero	8
	.type	ephes_checked_if_pure, @object
	.size	ephes_checked_if_pure, 8
ephes_checked_if_pure:
	.zero	8
	.type	ephe_list_pure, @object
	.size	ephe_list_pure, 4
ephe_list_pure:
	.zero	4
	.zero	4
	.type	limit, @object
	.size	limit, 8
limit:
	.zero	8
	.type	chunk, @object
	.size	chunk, 8
chunk:
	.zero	8
	.type	markhp, @object
	.size	markhp, 8
markhp:
	.zero	8
	.type	caml_fl_wsz_at_phase_change, @object
	.size	caml_fl_wsz_at_phase_change, 8
caml_fl_wsz_at_phase_change:
	.zero	8
	.type	heap_is_pure, @object
	.size	heap_is_pure, 4
heap_is_pure:
	.zero	4
	.zero	4
	.type	gray_vals_size, @object
	.size	gray_vals_size, 8
gray_vals_size:
	.zero	8
	.type	gray_vals_end, @object
	.size	gray_vals_end, 8
gray_vals_end:
	.zero	8
	.type	gray_vals_cur, @object
	.size	gray_vals_cur, 8
gray_vals_cur:
	.zero	8
	.type	gray_vals, @object
	.size	gray_vals, 8
gray_vals:
	.zero	8
	.type	caml_major_work_credit, @object
	.size	caml_major_work_credit, 8
caml_major_work_credit:
	.zero	8
	.type	caml_major_ring_index, @object
	.size	caml_major_ring_index, 4
caml_major_ring_index:
	.zero	4
	.section	.sdata,"aw"
	.align	2
	.type	caml_major_window, @object
	.size	caml_major_window, 4
caml_major_window:
	.word	1
	.text
.Letext0:
	.file 4 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 5 "/home/sai/Shakti-TEE-Build/riscv/riscv64-unknown-elf/include/sys/_types.h"
	.file 6 "/home/sai/Shakti-TEE-Build/riscv/riscv64-unknown-elf/include/sys/reent.h"
	.file 7 "/home/sai/Shakti-TEE-Build/riscv/riscv64-unknown-elf/include/sys/lock.h"
	.file 8 "/home/sai/Shakti-TEE-Build/riscv/riscv64-unknown-elf/include/math.h"
	.file 9 "caml/config.h"
	.file 10 "caml/misc.h"
	.file 11 "caml/mlvalues.h"
	.file 12 "caml/custom.h"
	.file 13 "/home/sai/ocaml-freestanding-riscv/nolibc/include/signal.h"
	.file 14 "caml/fail.h"
	.file 15 "caml/freelist.h"
	.file 16 "caml/major_gc.h"
	.file 17 "caml/address_class.h"
	.file 18 "caml/memory.h"
	.file 19 "caml/roots.h"
	.file 20 "caml/gc_ctrl.h"
	.file 21 "caml/signals.h"
	.file 22 "caml/compact.h"
	.file 23 "caml/finalise.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x23a7
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF305
	.byte	0xc
	.4byte	.LASF306
	.4byte	.LASF307
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF0
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1
	.byte	0x3
	.4byte	.LASF5
	.byte	0x4
	.byte	0xd1
	.byte	0x17
	.4byte	0x47
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF2
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x5
	.4byte	0x4e
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF3
	.byte	0x2
	.byte	0x10
	.byte	0x4
	.4byte	.LASF4
	.byte	0x6
	.4byte	.LASF6
	.byte	0x4
	.2byte	0x15e
	.byte	0x17
	.4byte	0x75
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF8
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF10
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF11
	.byte	0x3
	.4byte	.LASF12
	.byte	0x5
	.byte	0x2e
	.byte	0xe
	.4byte	0x34
	.byte	0x3
	.4byte	.LASF13
	.byte	0x5
	.byte	0x74
	.byte	0xe
	.4byte	0x34
	.byte	0x3
	.4byte	.LASF14
	.byte	0x5
	.byte	0x93
	.byte	0x17
	.4byte	0x34
	.byte	0x7
	.byte	0x4
	.byte	0x5
	.byte	0xa5
	.byte	0x3
	.4byte	0xde
	.byte	0x8
	.4byte	.LASF15
	.byte	0x5
	.byte	0xa7
	.byte	0xc
	.4byte	0x68
	.byte	0x8
	.4byte	.LASF16
	.byte	0x5
	.byte	0xa8
	.byte	0x13
	.4byte	0xde
	.byte	0
	.byte	0x9
	.4byte	0x83
	.4byte	0xee
	.byte	0xa
	.4byte	0x47
	.byte	0x3
	.byte	0
	.byte	0xb
	.byte	0x8
	.byte	0x5
	.byte	0xa2
	.byte	0x9
	.4byte	0x112
	.byte	0xc
	.4byte	.LASF17
	.byte	0x5
	.byte	0xa4
	.byte	0x7
	.4byte	0x4e
	.byte	0
	.byte	0xc
	.4byte	.LASF18
	.byte	0x5
	.byte	0xa9
	.byte	0x5
	.4byte	0xbc
	.byte	0x4
	.byte	0
	.byte	0x3
	.4byte	.LASF19
	.byte	0x5
	.byte	0xaa
	.byte	0x3
	.4byte	0xee
	.byte	0xd
	.byte	0x8
	.byte	0x3
	.4byte	.LASF20
	.byte	0x6
	.byte	0x19
	.byte	0x19
	.4byte	0x75
	.byte	0x3
	.4byte	.LASF21
	.byte	0x7
	.byte	0xc
	.byte	0xd
	.4byte	0x4e
	.byte	0x3
	.4byte	.LASF22
	.byte	0x6
	.byte	0x23
	.byte	0x1b
	.4byte	0x12c
	.byte	0xe
	.4byte	.LASF27
	.byte	0x20
	.byte	0x6
	.byte	0x34
	.byte	0x8
	.4byte	0x19e
	.byte	0xc
	.4byte	.LASF23
	.byte	0x6
	.byte	0x36
	.byte	0x13
	.4byte	0x19e
	.byte	0
	.byte	0xf
	.string	"_k"
	.byte	0x6
	.byte	0x37
	.byte	0x7
	.4byte	0x4e
	.byte	0x8
	.byte	0xc
	.4byte	.LASF24
	.byte	0x6
	.byte	0x37
	.byte	0xb
	.4byte	0x4e
	.byte	0xc
	.byte	0xc
	.4byte	.LASF25
	.byte	0x6
	.byte	0x37
	.byte	0x14
	.4byte	0x4e
	.byte	0x10
	.byte	0xc
	.4byte	.LASF26
	.byte	0x6
	.byte	0x37
	.byte	0x1b
	.4byte	0x4e
	.byte	0x14
	.byte	0xf
	.string	"_x"
	.byte	0x6
	.byte	0x38
	.byte	0xb
	.4byte	0x1a4
	.byte	0x18
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0x144
	.byte	0x9
	.4byte	0x120
	.4byte	0x1b4
	.byte	0xa
	.4byte	0x47
	.byte	0
	.byte	0
	.byte	0xe
	.4byte	.LASF28
	.byte	0x24
	.byte	0x6
	.byte	0x3c
	.byte	0x8
	.4byte	0x237
	.byte	0xc
	.4byte	.LASF29
	.byte	0x6
	.byte	0x3e
	.byte	0x9
	.4byte	0x4e
	.byte	0
	.byte	0xc
	.4byte	.LASF30
	.byte	0x6
	.byte	0x3f
	.byte	0x9
	.4byte	0x4e
	.byte	0x4
	.byte	0xc
	.4byte	.LASF31
	.byte	0x6
	.byte	0x40
	.byte	0x9
	.4byte	0x4e
	.byte	0x8
	.byte	0xc
	.4byte	.LASF32
	.byte	0x6
	.byte	0x41
	.byte	0x9
	.4byte	0x4e
	.byte	0xc
	.byte	0xc
	.4byte	.LASF33
	.byte	0x6
	.byte	0x42
	.byte	0x9
	.4byte	0x4e
	.byte	0x10
	.byte	0xc
	.4byte	.LASF34
	.byte	0x6
	.byte	0x43
	.byte	0x9
	.4byte	0x4e
	.byte	0x14
	.byte	0xc
	.4byte	.LASF35
	.byte	0x6
	.byte	0x44
	.byte	0x9
	.4byte	0x4e
	.byte	0x18
	.byte	0xc
	.4byte	.LASF36
	.byte	0x6
	.byte	0x45
	.byte	0x9
	.4byte	0x4e
	.byte	0x1c
	.byte	0xc
	.4byte	.LASF37
	.byte	0x6
	.byte	0x46
	.byte	0x9
	.4byte	0x4e
	.byte	0x20
	.byte	0
	.byte	0x11
	.4byte	.LASF38
	.2byte	0x208
	.byte	0x6
	.byte	0x4f
	.byte	0x8
	.4byte	0x27d
	.byte	0xc
	.4byte	.LASF39
	.byte	0x6
	.byte	0x50
	.byte	0xa
	.4byte	0x27d
	.byte	0
	.byte	0x12
	.4byte	.LASF40
	.byte	0x6
	.byte	0x51
	.byte	0x9
	.4byte	0x27d
	.2byte	0x100
	.byte	0x12
	.4byte	.LASF41
	.byte	0x6
	.byte	0x53
	.byte	0xa
	.4byte	0x120
	.2byte	0x200
	.byte	0x12
	.4byte	.LASF42
	.byte	0x6
	.byte	0x56
	.byte	0xa
	.4byte	0x120
	.2byte	0x204
	.byte	0
	.byte	0x9
	.4byte	0x11e
	.4byte	0x28d
	.byte	0xa
	.4byte	0x47
	.byte	0x1f
	.byte	0
	.byte	0x11
	.4byte	.LASF43
	.2byte	0x318
	.byte	0x6
	.byte	0x62
	.byte	0x8
	.4byte	0x2d1
	.byte	0xc
	.4byte	.LASF23
	.byte	0x6
	.byte	0x63
	.byte	0x12
	.4byte	0x2d1
	.byte	0
	.byte	0xc
	.4byte	.LASF44
	.byte	0x6
	.byte	0x64
	.byte	0x6
	.4byte	0x4e
	.byte	0x8
	.byte	0xc
	.4byte	.LASF45
	.byte	0x6
	.byte	0x66
	.byte	0x9
	.4byte	0x2d7
	.byte	0x10
	.byte	0x12
	.4byte	.LASF38
	.byte	0x6
	.byte	0x67
	.byte	0x1e
	.4byte	0x237
	.2byte	0x110
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0x28d
	.byte	0x9
	.4byte	0x2e7
	.4byte	0x2e7
	.byte	0xa
	.4byte	0x47
	.byte	0x1f
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0x2f2
	.byte	0x5
	.4byte	0x2e7
	.byte	0x13
	.byte	0xe
	.4byte	.LASF46
	.byte	0x10
	.byte	0x6
	.byte	0x7a
	.byte	0x8
	.4byte	0x31b
	.byte	0xc
	.4byte	.LASF47
	.byte	0x6
	.byte	0x7b
	.byte	0x11
	.4byte	0x31b
	.byte	0
	.byte	0xc
	.4byte	.LASF48
	.byte	0x6
	.byte	0x7c
	.byte	0x6
	.4byte	0x4e
	.byte	0x8
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0x83
	.byte	0xe
	.4byte	.LASF49
	.byte	0xb0
	.byte	0x6
	.byte	0xba
	.byte	0x8
	.4byte	0x464
	.byte	0xf
	.string	"_p"
	.byte	0x6
	.byte	0xbb
	.byte	0x12
	.4byte	0x31b
	.byte	0
	.byte	0xf
	.string	"_r"
	.byte	0x6
	.byte	0xbc
	.byte	0x7
	.4byte	0x4e
	.byte	0x8
	.byte	0xf
	.string	"_w"
	.byte	0x6
	.byte	0xbd
	.byte	0x7
	.4byte	0x4e
	.byte	0xc
	.byte	0xc
	.4byte	.LASF50
	.byte	0x6
	.byte	0xbe
	.byte	0x9
	.4byte	0x8a
	.byte	0x10
	.byte	0xc
	.4byte	.LASF51
	.byte	0x6
	.byte	0xbf
	.byte	0x9
	.4byte	0x8a
	.byte	0x12
	.byte	0xf
	.string	"_bf"
	.byte	0x6
	.byte	0xc0
	.byte	0x11
	.4byte	0x2f3
	.byte	0x18
	.byte	0xc
	.4byte	.LASF52
	.byte	0x6
	.byte	0xc1
	.byte	0x7
	.4byte	0x4e
	.byte	0x28
	.byte	0xc
	.4byte	.LASF53
	.byte	0x6
	.byte	0xc8
	.byte	0xa
	.4byte	0x11e
	.byte	0x30
	.byte	0xc
	.4byte	.LASF54
	.byte	0x6
	.byte	0xca
	.byte	0x1d
	.4byte	0x5e8
	.byte	0x38
	.byte	0xc
	.4byte	.LASF55
	.byte	0x6
	.byte	0xcc
	.byte	0x1d
	.4byte	0x612
	.byte	0x40
	.byte	0xc
	.4byte	.LASF56
	.byte	0x6
	.byte	0xcf
	.byte	0xd
	.4byte	0x636
	.byte	0x48
	.byte	0xc
	.4byte	.LASF57
	.byte	0x6
	.byte	0xd0
	.byte	0x9
	.4byte	0x650
	.byte	0x50
	.byte	0xf
	.string	"_ub"
	.byte	0x6
	.byte	0xd3
	.byte	0x11
	.4byte	0x2f3
	.byte	0x58
	.byte	0xf
	.string	"_up"
	.byte	0x6
	.byte	0xd4
	.byte	0x12
	.4byte	0x31b
	.byte	0x68
	.byte	0xf
	.string	"_ur"
	.byte	0x6
	.byte	0xd5
	.byte	0x7
	.4byte	0x4e
	.byte	0x70
	.byte	0xc
	.4byte	.LASF58
	.byte	0x6
	.byte	0xd8
	.byte	0x11
	.4byte	0x656
	.byte	0x74
	.byte	0xc
	.4byte	.LASF59
	.byte	0x6
	.byte	0xd9
	.byte	0x11
	.4byte	0x666
	.byte	0x77
	.byte	0xf
	.string	"_lb"
	.byte	0x6
	.byte	0xdc
	.byte	0x11
	.4byte	0x2f3
	.byte	0x78
	.byte	0xc
	.4byte	.LASF60
	.byte	0x6
	.byte	0xdf
	.byte	0x7
	.4byte	0x4e
	.byte	0x88
	.byte	0xc
	.4byte	.LASF61
	.byte	0x6
	.byte	0xe0
	.byte	0xa
	.4byte	0x98
	.byte	0x90
	.byte	0xc
	.4byte	.LASF62
	.byte	0x6
	.byte	0xe3
	.byte	0x12
	.4byte	0x482
	.byte	0x98
	.byte	0xc
	.4byte	.LASF63
	.byte	0x6
	.byte	0xe7
	.byte	0xc
	.4byte	0x138
	.byte	0xa0
	.byte	0xc
	.4byte	.LASF64
	.byte	0x6
	.byte	0xe9
	.byte	0xe
	.4byte	0x112
	.byte	0xa4
	.byte	0xc
	.4byte	.LASF65
	.byte	0x6
	.byte	0xea
	.byte	0x9
	.4byte	0x4e
	.byte	0xac
	.byte	0
	.byte	0x14
	.4byte	0xb0
	.4byte	0x482
	.byte	0x15
	.4byte	0x482
	.byte	0x15
	.4byte	0x11e
	.byte	0x15
	.4byte	0x5d6
	.byte	0x15
	.4byte	0x4e
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0x48d
	.byte	0x16
	.4byte	0x482
	.byte	0x17
	.4byte	.LASF66
	.2byte	0x748
	.byte	0x6
	.2byte	0x265
	.byte	0x8
	.4byte	0x5d6
	.byte	0x18
	.4byte	.LASF67
	.byte	0x6
	.2byte	0x267
	.byte	0x7
	.4byte	0x4e
	.byte	0
	.byte	0x18
	.4byte	.LASF68
	.byte	0x6
	.2byte	0x26c
	.byte	0xb
	.4byte	0x6c2
	.byte	0x8
	.byte	0x18
	.4byte	.LASF69
	.byte	0x6
	.2byte	0x26c
	.byte	0x14
	.4byte	0x6c2
	.byte	0x10
	.byte	0x18
	.4byte	.LASF70
	.byte	0x6
	.2byte	0x26c
	.byte	0x1e
	.4byte	0x6c2
	.byte	0x18
	.byte	0x18
	.4byte	.LASF71
	.byte	0x6
	.2byte	0x26e
	.byte	0x8
	.4byte	0x4e
	.byte	0x20
	.byte	0x18
	.4byte	.LASF72
	.byte	0x6
	.2byte	0x26f
	.byte	0x8
	.4byte	0x8cb
	.byte	0x24
	.byte	0x18
	.4byte	.LASF73
	.byte	0x6
	.2byte	0x272
	.byte	0x7
	.4byte	0x4e
	.byte	0x40
	.byte	0x18
	.4byte	.LASF74
	.byte	0x6
	.2byte	0x273
	.byte	0x16
	.4byte	0x8e0
	.byte	0x48
	.byte	0x18
	.4byte	.LASF75
	.byte	0x6
	.2byte	0x275
	.byte	0x7
	.4byte	0x4e
	.byte	0x50
	.byte	0x18
	.4byte	.LASF76
	.byte	0x6
	.2byte	0x277
	.byte	0xa
	.4byte	0x8f1
	.byte	0x58
	.byte	0x18
	.4byte	.LASF77
	.byte	0x6
	.2byte	0x27a
	.byte	0x13
	.4byte	0x19e
	.byte	0x60
	.byte	0x18
	.4byte	.LASF78
	.byte	0x6
	.2byte	0x27b
	.byte	0x7
	.4byte	0x4e
	.byte	0x68
	.byte	0x18
	.4byte	.LASF79
	.byte	0x6
	.2byte	0x27c
	.byte	0x13
	.4byte	0x19e
	.byte	0x70
	.byte	0x18
	.4byte	.LASF80
	.byte	0x6
	.2byte	0x27d
	.byte	0x14
	.4byte	0x8f7
	.byte	0x78
	.byte	0x18
	.4byte	.LASF81
	.byte	0x6
	.2byte	0x280
	.byte	0x7
	.4byte	0x4e
	.byte	0x80
	.byte	0x18
	.4byte	.LASF82
	.byte	0x6
	.2byte	0x281
	.byte	0x9
	.4byte	0x5d6
	.byte	0x88
	.byte	0x18
	.4byte	.LASF83
	.byte	0x6
	.2byte	0x2a4
	.byte	0x7
	.4byte	0x8a5
	.byte	0x90
	.byte	0x19
	.4byte	.LASF43
	.byte	0x6
	.2byte	0x2a8
	.byte	0x13
	.4byte	0x2d1
	.2byte	0x1f8
	.byte	0x19
	.4byte	.LASF84
	.byte	0x6
	.2byte	0x2a9
	.byte	0x12
	.4byte	0x28d
	.2byte	0x200
	.byte	0x19
	.4byte	.LASF85
	.byte	0x6
	.2byte	0x2ad
	.byte	0xc
	.4byte	0x908
	.2byte	0x518
	.byte	0x19
	.4byte	.LASF86
	.byte	0x6
	.2byte	0x2b2
	.byte	0x10
	.4byte	0x683
	.2byte	0x520
	.byte	0x19
	.4byte	.LASF87
	.byte	0x6
	.2byte	0x2b4
	.byte	0xa
	.4byte	0x914
	.2byte	0x538
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0x5dc
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF88
	.byte	0x16
	.4byte	0x5dc
	.byte	0x10
	.byte	0x8
	.4byte	0x464
	.byte	0x14
	.4byte	0xb0
	.4byte	0x60c
	.byte	0x15
	.4byte	0x482
	.byte	0x15
	.4byte	0x11e
	.byte	0x15
	.4byte	0x60c
	.byte	0x15
	.4byte	0x4e
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0x5e3
	.byte	0x10
	.byte	0x8
	.4byte	0x5ee
	.byte	0x14
	.4byte	0xa4
	.4byte	0x636
	.byte	0x15
	.4byte	0x482
	.byte	0x15
	.4byte	0x11e
	.byte	0x15
	.4byte	0xa4
	.byte	0x15
	.4byte	0x4e
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0x618
	.byte	0x14
	.4byte	0x4e
	.4byte	0x650
	.byte	0x15
	.4byte	0x482
	.byte	0x15
	.4byte	0x11e
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0x63c
	.byte	0x9
	.4byte	0x83
	.4byte	0x666
	.byte	0xa
	.4byte	0x47
	.byte	0x2
	.byte	0
	.byte	0x9
	.4byte	0x83
	.4byte	0x676
	.byte	0xa
	.4byte	0x47
	.byte	0
	.byte	0
	.byte	0x6
	.4byte	.LASF89
	.byte	0x6
	.2byte	0x124
	.byte	0x1a
	.4byte	0x321
	.byte	0x1a
	.4byte	.LASF90
	.byte	0x18
	.byte	0x6
	.2byte	0x128
	.byte	0x8
	.4byte	0x6bc
	.byte	0x18
	.4byte	.LASF23
	.byte	0x6
	.2byte	0x12a
	.byte	0x11
	.4byte	0x6bc
	.byte	0
	.byte	0x18
	.4byte	.LASF91
	.byte	0x6
	.2byte	0x12b
	.byte	0x7
	.4byte	0x4e
	.byte	0x8
	.byte	0x18
	.4byte	.LASF92
	.byte	0x6
	.2byte	0x12c
	.byte	0xb
	.4byte	0x6c2
	.byte	0x10
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0x683
	.byte	0x10
	.byte	0x8
	.4byte	0x676
	.byte	0x1a
	.4byte	.LASF93
	.byte	0xe
	.byte	0x6
	.2byte	0x144
	.byte	0x8
	.4byte	0x701
	.byte	0x18
	.4byte	.LASF94
	.byte	0x6
	.2byte	0x145
	.byte	0x12
	.4byte	0x701
	.byte	0
	.byte	0x18
	.4byte	.LASF95
	.byte	0x6
	.2byte	0x146
	.byte	0x12
	.4byte	0x701
	.byte	0x6
	.byte	0x18
	.4byte	.LASF96
	.byte	0x6
	.2byte	0x147
	.byte	0x12
	.4byte	0x91
	.byte	0xc
	.byte	0
	.byte	0x9
	.4byte	0x91
	.4byte	0x711
	.byte	0xa
	.4byte	0x47
	.byte	0x2
	.byte	0
	.byte	0x1b
	.byte	0xd8
	.byte	0x6
	.2byte	0x285
	.byte	0x7
	.4byte	0x826
	.byte	0x18
	.4byte	.LASF97
	.byte	0x6
	.2byte	0x287
	.byte	0x18
	.4byte	0x75
	.byte	0
	.byte	0x18
	.4byte	.LASF98
	.byte	0x6
	.2byte	0x288
	.byte	0x12
	.4byte	0x5d6
	.byte	0x8
	.byte	0x18
	.4byte	.LASF99
	.byte	0x6
	.2byte	0x289
	.byte	0x10
	.4byte	0x826
	.byte	0x10
	.byte	0x18
	.4byte	.LASF100
	.byte	0x6
	.2byte	0x28a
	.byte	0x17
	.4byte	0x1b4
	.byte	0x2c
	.byte	0x18
	.4byte	.LASF101
	.byte	0x6
	.2byte	0x28b
	.byte	0xf
	.4byte	0x4e
	.byte	0x50
	.byte	0x18
	.4byte	.LASF102
	.byte	0x6
	.2byte	0x28c
	.byte	0x2c
	.4byte	0x836
	.byte	0x58
	.byte	0x18
	.4byte	.LASF103
	.byte	0x6
	.2byte	0x28d
	.byte	0x1a
	.4byte	0x6c8
	.byte	0x60
	.byte	0x18
	.4byte	.LASF104
	.byte	0x6
	.2byte	0x28e
	.byte	0x16
	.4byte	0x112
	.byte	0x70
	.byte	0x18
	.4byte	.LASF105
	.byte	0x6
	.2byte	0x28f
	.byte	0x16
	.4byte	0x112
	.byte	0x78
	.byte	0x18
	.4byte	.LASF106
	.byte	0x6
	.2byte	0x290
	.byte	0x16
	.4byte	0x112
	.byte	0x80
	.byte	0x18
	.4byte	.LASF107
	.byte	0x6
	.2byte	0x291
	.byte	0x10
	.4byte	0x83d
	.byte	0x88
	.byte	0x18
	.4byte	.LASF108
	.byte	0x6
	.2byte	0x292
	.byte	0x10
	.4byte	0x84d
	.byte	0x90
	.byte	0x18
	.4byte	.LASF109
	.byte	0x6
	.2byte	0x293
	.byte	0xf
	.4byte	0x4e
	.byte	0xa8
	.byte	0x18
	.4byte	.LASF110
	.byte	0x6
	.2byte	0x294
	.byte	0x16
	.4byte	0x112
	.byte	0xac
	.byte	0x18
	.4byte	.LASF111
	.byte	0x6
	.2byte	0x295
	.byte	0x16
	.4byte	0x112
	.byte	0xb4
	.byte	0x18
	.4byte	.LASF112
	.byte	0x6
	.2byte	0x296
	.byte	0x16
	.4byte	0x112
	.byte	0xbc
	.byte	0x18
	.4byte	.LASF113
	.byte	0x6
	.2byte	0x297
	.byte	0x16
	.4byte	0x112
	.byte	0xc4
	.byte	0x18
	.4byte	.LASF114
	.byte	0x6
	.2byte	0x298
	.byte	0x16
	.4byte	0x112
	.byte	0xcc
	.byte	0x18
	.4byte	.LASF115
	.byte	0x6
	.2byte	0x299
	.byte	0x8
	.4byte	0x4e
	.byte	0xd4
	.byte	0
	.byte	0x9
	.4byte	0x5dc
	.4byte	0x836
	.byte	0xa
	.4byte	0x47
	.byte	0x19
	.byte	0
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF116
	.byte	0x9
	.4byte	0x5dc
	.4byte	0x84d
	.byte	0xa
	.4byte	0x47
	.byte	0x7
	.byte	0
	.byte	0x9
	.4byte	0x5dc
	.4byte	0x85d
	.byte	0xa
	.4byte	0x47
	.byte	0x17
	.byte	0
	.byte	0x1c
	.2byte	0x168
	.byte	0x6
	.2byte	0x29e
	.byte	0x7
	.4byte	0x885
	.byte	0x18
	.4byte	.LASF117
	.byte	0x6
	.2byte	0x2a1
	.byte	0x1b
	.4byte	0x885
	.byte	0
	.byte	0x18
	.4byte	.LASF118
	.byte	0x6
	.2byte	0x2a2
	.byte	0x18
	.4byte	0x895
	.byte	0xf0
	.byte	0
	.byte	0x9
	.4byte	0x31b
	.4byte	0x895
	.byte	0xa
	.4byte	0x47
	.byte	0x1d
	.byte	0
	.byte	0x9
	.4byte	0x75
	.4byte	0x8a5
	.byte	0xa
	.4byte	0x47
	.byte	0x1d
	.byte	0
	.byte	0x1d
	.2byte	0x168
	.byte	0x6
	.2byte	0x283
	.byte	0x3
	.4byte	0x8cb
	.byte	0x1e
	.4byte	.LASF66
	.byte	0x6
	.2byte	0x29a
	.byte	0xb
	.4byte	0x711
	.byte	0x1e
	.4byte	.LASF119
	.byte	0x6
	.2byte	0x2a3
	.byte	0xb
	.4byte	0x85d
	.byte	0
	.byte	0x9
	.4byte	0x5dc
	.4byte	0x8db
	.byte	0xa
	.4byte	0x47
	.byte	0x18
	.byte	0
	.byte	0x1f
	.4byte	.LASF308
	.byte	0x10
	.byte	0x8
	.4byte	0x8db
	.byte	0x20
	.4byte	0x8f1
	.byte	0x15
	.4byte	0x482
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0x8e6
	.byte	0x10
	.byte	0x8
	.4byte	0x19e
	.byte	0x20
	.4byte	0x908
	.byte	0x15
	.4byte	0x4e
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0x90e
	.byte	0x10
	.byte	0x8
	.4byte	0x8fd
	.byte	0x9
	.4byte	0x676
	.4byte	0x924
	.byte	0xa
	.4byte	0x47
	.byte	0x2
	.byte	0
	.byte	0x21
	.4byte	.LASF120
	.byte	0x6
	.2byte	0x333
	.byte	0x17
	.4byte	0x482
	.byte	0x21
	.4byte	.LASF121
	.byte	0x6
	.2byte	0x334
	.byte	0x1d
	.4byte	0x488
	.byte	0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF122
	.byte	0x22
	.4byte	.LASF309
	.byte	0x5
	.byte	0x4
	.4byte	0x4e
	.byte	0x8
	.2byte	0x25f
	.byte	0x6
	.4byte	0x965
	.byte	0x23
	.4byte	.LASF123
	.byte	0x7f
	.byte	0x24
	.4byte	.LASF124
	.byte	0
	.byte	0
	.byte	0x21
	.4byte	.LASF125
	.byte	0x8
	.2byte	0x268
	.byte	0x23
	.4byte	0x945
	.byte	0x3
	.4byte	.LASF126
	.byte	0x9
	.byte	0x5b
	.byte	0xe
	.4byte	0x34
	.byte	0x5
	.4byte	0x972
	.byte	0x3
	.4byte	.LASF127
	.byte	0x9
	.byte	0x5c
	.byte	0x17
	.4byte	0x47
	.byte	0x3
	.4byte	.LASF128
	.byte	0xa
	.byte	0x21
	.byte	0x10
	.4byte	0x3b
	.byte	0x3
	.4byte	.LASF129
	.byte	0xa
	.byte	0x28
	.byte	0x10
	.4byte	0x5d6
	.byte	0x3
	.4byte	.LASF130
	.byte	0xa
	.byte	0x5c
	.byte	0x10
	.4byte	0x2e7
	.byte	0x25
	.4byte	.LASF131
	.byte	0xa
	.byte	0x5d
	.byte	0x19
	.4byte	0x9a7
	.byte	0x25
	.4byte	.LASF132
	.byte	0xa
	.byte	0x5d
	.byte	0x36
	.4byte	0x9a7
	.byte	0x25
	.4byte	.LASF133
	.byte	0xa
	.byte	0x5e
	.byte	0x19
	.4byte	0x9a7
	.byte	0x25
	.4byte	.LASF134
	.byte	0xa
	.byte	0x5e
	.byte	0x33
	.4byte	0x9a7
	.byte	0x25
	.4byte	.LASF135
	.byte	0xa
	.byte	0x5f
	.byte	0x19
	.4byte	0x9a7
	.byte	0x25
	.4byte	.LASF136
	.byte	0xa
	.byte	0x5f
	.byte	0x33
	.4byte	0x9a7
	.byte	0x21
	.4byte	.LASF137
	.byte	0xa
	.2byte	0x169
	.byte	0x10
	.4byte	0x983
	.byte	0x21
	.4byte	.LASF138
	.byte	0xa
	.2byte	0x171
	.byte	0x10
	.4byte	0x983
	.byte	0x3
	.4byte	.LASF139
	.byte	0xb
	.byte	0x3c
	.byte	0x10
	.4byte	0x972
	.byte	0x3
	.4byte	.LASF140
	.byte	0xb
	.byte	0x3d
	.byte	0x11
	.4byte	0x983
	.byte	0x3
	.4byte	.LASF141
	.byte	0xb
	.byte	0x3e
	.byte	0x11
	.4byte	0x983
	.byte	0x3
	.4byte	.LASF142
	.byte	0xb
	.byte	0x3f
	.byte	0x16
	.4byte	0x75
	.byte	0x3
	.4byte	.LASF143
	.byte	0xb
	.byte	0x40
	.byte	0x11
	.4byte	0x983
	.byte	0x9
	.4byte	0xa21
	.4byte	0xa5c
	.byte	0x26
	.byte	0
	.byte	0x21
	.4byte	.LASF144
	.byte	0xb
	.2byte	0x15c
	.byte	0x15
	.4byte	0xa51
	.byte	0x21
	.4byte	.LASF145
	.byte	0xb
	.2byte	0x171
	.byte	0xe
	.4byte	0xa15
	.byte	0xe
	.4byte	.LASF146
	.byte	0x38
	.byte	0xc
	.byte	0x19
	.byte	0x8
	.4byte	0xadf
	.byte	0xc
	.4byte	.LASF147
	.byte	0xc
	.byte	0x1a
	.byte	0x9
	.4byte	0x5d6
	.byte	0
	.byte	0xc
	.4byte	.LASF148
	.byte	0xc
	.byte	0x1b
	.byte	0xa
	.4byte	0xaea
	.byte	0x8
	.byte	0xc
	.4byte	.LASF149
	.byte	0xc
	.byte	0x1c
	.byte	0x9
	.4byte	0xb04
	.byte	0x10
	.byte	0xc
	.4byte	.LASF150
	.byte	0xc
	.byte	0x1d
	.byte	0xc
	.4byte	0xb19
	.byte	0x18
	.byte	0xc
	.4byte	.LASF151
	.byte	0xc
	.byte	0x1e
	.byte	0xa
	.4byte	0xb3a
	.byte	0x20
	.byte	0xc
	.4byte	.LASF152
	.byte	0xc
	.byte	0x21
	.byte	0xd
	.4byte	0xb4f
	.byte	0x28
	.byte	0xc
	.4byte	.LASF153
	.byte	0xc
	.byte	0x22
	.byte	0x9
	.4byte	0xb04
	.byte	0x30
	.byte	0
	.byte	0x20
	.4byte	0xaea
	.byte	0x15
	.4byte	0xa15
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0xadf
	.byte	0x14
	.4byte	0x4e
	.4byte	0xb04
	.byte	0x15
	.4byte	0xa15
	.byte	0x15
	.4byte	0xa15
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0xaf0
	.byte	0x14
	.4byte	0x972
	.4byte	0xb19
	.byte	0x15
	.4byte	0xa15
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0xb0a
	.byte	0x20
	.4byte	0xb34
	.byte	0x15
	.4byte	0xa15
	.byte	0x15
	.4byte	0xb34
	.byte	0x15
	.4byte	0xb34
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0x983
	.byte	0x10
	.byte	0x8
	.4byte	0xb1f
	.byte	0x14
	.4byte	0x983
	.4byte	0xb4f
	.byte	0x15
	.4byte	0x11e
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0xb40
	.byte	0x25
	.4byte	.LASF154
	.byte	0xc
	.byte	0x3a
	.byte	0x10
	.4byte	0x4e
	.byte	0x3
	.4byte	.LASF155
	.byte	0xd
	.byte	0x4
	.byte	0xd
	.4byte	0x4e
	.byte	0xe
	.4byte	.LASF156
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.byte	0x8
	.4byte	0xb88
	.byte	0xf
	.string	"buf"
	.byte	0xe
	.byte	0x2d
	.byte	0xe
	.4byte	0xb61
	.byte	0
	.byte	0
	.byte	0x25
	.4byte	.LASF157
	.byte	0xe
	.byte	0x3e
	.byte	0x24
	.4byte	0xb94
	.byte	0x10
	.byte	0x8
	.4byte	0xb6d
	.byte	0x25
	.4byte	.LASF158
	.byte	0xe
	.byte	0x3f
	.byte	0xe
	.4byte	0xa15
	.byte	0x25
	.4byte	.LASF159
	.byte	0xf
	.byte	0x1a
	.byte	0x10
	.4byte	0x98f
	.byte	0xb
	.byte	0x20
	.byte	0x10
	.byte	0x18
	.byte	0x9
	.4byte	0xbf0
	.byte	0xc
	.4byte	.LASF160
	.byte	0x10
	.byte	0x19
	.byte	0x9
	.4byte	0x11e
	.byte	0
	.byte	0xc
	.4byte	.LASF161
	.byte	0x10
	.byte	0x1a
	.byte	0xb
	.4byte	0x98f
	.byte	0x8
	.byte	0xc
	.4byte	.LASF162
	.byte	0x10
	.byte	0x1b
	.byte	0xb
	.4byte	0x98f
	.byte	0x10
	.byte	0xc
	.4byte	.LASF163
	.byte	0x10
	.byte	0x1c
	.byte	0x9
	.4byte	0x5d6
	.byte	0x18
	.byte	0
	.byte	0x3
	.4byte	.LASF164
	.byte	0x10
	.byte	0x1d
	.byte	0x3
	.4byte	0xbb2
	.byte	0x25
	.4byte	.LASF165
	.byte	0x10
	.byte	0x24
	.byte	0xc
	.4byte	0x4e
	.byte	0x25
	.4byte	.LASF166
	.byte	0x10
	.byte	0x25
	.byte	0xc
	.4byte	0x4e
	.byte	0x25
	.4byte	.LASF167
	.byte	0x10
	.byte	0x26
	.byte	0x10
	.4byte	0x983
	.byte	0x25
	.4byte	.LASF168
	.byte	0x10
	.byte	0x27
	.byte	0xf
	.4byte	0x2d
	.byte	0x25
	.4byte	.LASF169
	.byte	0x10
	.byte	0x28
	.byte	0x10
	.4byte	0x983
	.byte	0x25
	.4byte	.LASF170
	.byte	0x10
	.byte	0x28
	.byte	0x25
	.4byte	0x983
	.byte	0x25
	.4byte	.LASF171
	.byte	0x10
	.byte	0x29
	.byte	0x10
	.4byte	0x983
	.byte	0x25
	.4byte	.LASF172
	.byte	0x10
	.byte	0x3e
	.byte	0x12
	.4byte	0x5d6
	.byte	0x25
	.4byte	.LASF173
	.byte	0x10
	.byte	0x3f
	.byte	0x10
	.4byte	0x983
	.byte	0x25
	.4byte	.LASF174
	.byte	0x10
	.byte	0x40
	.byte	0xe
	.4byte	0x5d6
	.byte	0x25
	.4byte	.LASF175
	.byte	0x10
	.byte	0x42
	.byte	0xc
	.4byte	0x4e
	.byte	0x9
	.4byte	0x2d
	.4byte	0xc90
	.byte	0xa
	.4byte	0x47
	.byte	0x31
	.byte	0
	.byte	0x27
	.4byte	.LASF176
	.byte	0x10
	.byte	0x43
	.byte	0x8
	.4byte	0xc80
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0x27
	.4byte	.LASF177
	.byte	0x10
	.byte	0x44
	.byte	0x5
	.4byte	0x4e
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0x27
	.4byte	.LASF178
	.byte	0x10
	.byte	0x45
	.byte	0x8
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0x25
	.4byte	.LASF179
	.byte	0x10
	.byte	0x46
	.byte	0xf
	.4byte	0x2d
	.byte	0x25
	.4byte	.LASF180
	.byte	0x10
	.byte	0x4a
	.byte	0x13
	.4byte	0x2e7
	.byte	0x25
	.4byte	.LASF181
	.byte	0x11
	.byte	0x31
	.byte	0xf
	.4byte	0xcf6
	.byte	0x10
	.byte	0x8
	.4byte	0xa15
	.byte	0x25
	.4byte	.LASF182
	.byte	0x11
	.byte	0x31
	.byte	0x22
	.4byte	0xcf6
	.byte	0x25
	.4byte	.LASF183
	.byte	0x11
	.byte	0x32
	.byte	0xf
	.4byte	0x5d6
	.byte	0x25
	.4byte	.LASF184
	.byte	0x11
	.byte	0x32
	.byte	0x27
	.4byte	0x5d6
	.byte	0x25
	.4byte	.LASF185
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0xcf6
	.byte	0x25
	.4byte	.LASF186
	.byte	0x3
	.byte	0x18
	.byte	0x2c
	.4byte	0xcf6
	.byte	0x25
	.4byte	.LASF187
	.byte	0x3
	.byte	0x19
	.byte	0x13
	.4byte	0xcf6
	.byte	0x25
	.4byte	.LASF188
	.byte	0x3
	.byte	0x19
	.byte	0x24
	.4byte	0xcf6
	.byte	0x25
	.4byte	.LASF189
	.byte	0x3
	.byte	0x1a
	.byte	0x13
	.4byte	0xcf6
	.byte	0x25
	.4byte	.LASF190
	.byte	0x3
	.byte	0x1b
	.byte	0x10
	.4byte	0x98f
	.byte	0x25
	.4byte	.LASF191
	.byte	0x3
	.byte	0x1c
	.byte	0xc
	.4byte	0x4e
	.byte	0x25
	.4byte	.LASF192
	.byte	0x3
	.byte	0x1d
	.byte	0xf
	.4byte	0x2d
	.byte	0xe
	.4byte	.LASF193
	.byte	0x38
	.byte	0x3
	.byte	0x29
	.byte	0x8
	.4byte	0xde9
	.byte	0xc
	.4byte	.LASF194
	.byte	0x3
	.byte	0x29
	.byte	0x17
	.4byte	0xde9
	.byte	0
	.byte	0xf
	.string	"end"
	.byte	0x3
	.byte	0x29
	.byte	0x17
	.4byte	0xde9
	.byte	0x8
	.byte	0xc
	.4byte	.LASF195
	.byte	0x3
	.byte	0x29
	.byte	0x17
	.4byte	0xde9
	.byte	0x10
	.byte	0xf
	.string	"ptr"
	.byte	0x3
	.byte	0x29
	.byte	0x17
	.4byte	0xde9
	.byte	0x18
	.byte	0xc
	.4byte	.LASF196
	.byte	0x3
	.byte	0x29
	.byte	0x17
	.4byte	0xde9
	.byte	0x20
	.byte	0xc
	.4byte	.LASF162
	.byte	0x3
	.byte	0x29
	.byte	0x17
	.4byte	0x98f
	.byte	0x28
	.byte	0xc
	.4byte	.LASF197
	.byte	0x3
	.byte	0x29
	.byte	0x17
	.4byte	0x98f
	.byte	0x30
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0xcf6
	.byte	0x25
	.4byte	.LASF193
	.byte	0x3
	.byte	0x2a
	.byte	0x22
	.4byte	0xd80
	.byte	0xe
	.4byte	.LASF198
	.byte	0x10
	.byte	0x3
	.byte	0x2c
	.byte	0x8
	.4byte	0xe23
	.byte	0xc
	.4byte	.LASF199
	.byte	0x3
	.byte	0x2d
	.byte	0x9
	.4byte	0xa15
	.byte	0
	.byte	0xc
	.4byte	.LASF200
	.byte	0x3
	.byte	0x2e
	.byte	0xc
	.4byte	0xa2d
	.byte	0x8
	.byte	0
	.byte	0xe
	.4byte	.LASF201
	.byte	0x38
	.byte	0x3
	.byte	0x31
	.byte	0x8
	.4byte	0xe8c
	.byte	0xc
	.4byte	.LASF194
	.byte	0x3
	.byte	0x31
	.byte	0x1c
	.4byte	0xe8c
	.byte	0
	.byte	0xf
	.string	"end"
	.byte	0x3
	.byte	0x31
	.byte	0x1c
	.4byte	0xe8c
	.byte	0x8
	.byte	0xc
	.4byte	.LASF195
	.byte	0x3
	.byte	0x31
	.byte	0x1c
	.4byte	0xe8c
	.byte	0x10
	.byte	0xf
	.string	"ptr"
	.byte	0x3
	.byte	0x31
	.byte	0x1c
	.4byte	0xe8c
	.byte	0x18
	.byte	0xc
	.4byte	.LASF196
	.byte	0x3
	.byte	0x31
	.byte	0x1c
	.4byte	0xe8c
	.byte	0x20
	.byte	0xc
	.4byte	.LASF162
	.byte	0x3
	.byte	0x31
	.byte	0x1c
	.4byte	0x98f
	.byte	0x28
	.byte	0xc
	.4byte	.LASF197
	.byte	0x3
	.byte	0x31
	.byte	0x1c
	.4byte	0x98f
	.byte	0x30
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0xdfb
	.byte	0x25
	.4byte	.LASF201
	.byte	0x3
	.byte	0x32
	.byte	0x27
	.4byte	0xe23
	.byte	0xe
	.4byte	.LASF202
	.byte	0x18
	.byte	0x3
	.byte	0x34
	.byte	0x8
	.4byte	0xed3
	.byte	0xc
	.4byte	.LASF160
	.byte	0x3
	.byte	0x35
	.byte	0x9
	.4byte	0xa15
	.byte	0
	.byte	0xf
	.string	"mem"
	.byte	0x3
	.byte	0x36
	.byte	0xc
	.4byte	0xa2d
	.byte	0x8
	.byte	0xf
	.string	"max"
	.byte	0x3
	.byte	0x37
	.byte	0xc
	.4byte	0xa2d
	.byte	0x10
	.byte	0
	.byte	0xe
	.4byte	.LASF203
	.byte	0x38
	.byte	0x3
	.byte	0x3a
	.byte	0x8
	.4byte	0xf3c
	.byte	0xc
	.4byte	.LASF194
	.byte	0x3
	.byte	0x3a
	.byte	0x1a
	.4byte	0xf3c
	.byte	0
	.byte	0xf
	.string	"end"
	.byte	0x3
	.byte	0x3a
	.byte	0x1a
	.4byte	0xf3c
	.byte	0x8
	.byte	0xc
	.4byte	.LASF195
	.byte	0x3
	.byte	0x3a
	.byte	0x1a
	.4byte	0xf3c
	.byte	0x10
	.byte	0xf
	.string	"ptr"
	.byte	0x3
	.byte	0x3a
	.byte	0x1a
	.4byte	0xf3c
	.byte	0x18
	.byte	0xc
	.4byte	.LASF196
	.byte	0x3
	.byte	0x3a
	.byte	0x1a
	.4byte	0xf3c
	.byte	0x20
	.byte	0xc
	.4byte	.LASF162
	.byte	0x3
	.byte	0x3a
	.byte	0x1a
	.4byte	0x98f
	.byte	0x28
	.byte	0xc
	.4byte	.LASF197
	.byte	0x3
	.byte	0x3a
	.byte	0x1a
	.4byte	0x98f
	.byte	0x30
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0xe9e
	.byte	0x25
	.4byte	.LASF203
	.byte	0x3
	.byte	0x3b
	.byte	0x25
	.4byte	0xed3
	.byte	0x25
	.4byte	.LASF204
	.byte	0x12
	.byte	0x3f
	.byte	0x10
	.4byte	0x4e
	.byte	0x25
	.4byte	.LASF205
	.byte	0x12
	.byte	0xb7
	.byte	0x10
	.4byte	0x983
	.byte	0xe
	.4byte	.LASF206
	.byte	0x40
	.byte	0x12
	.byte	0xf3
	.byte	0x8
	.4byte	0xfa8
	.byte	0xc
	.4byte	.LASF163
	.byte	0x12
	.byte	0xf4
	.byte	0x1d
	.4byte	0xfa8
	.byte	0
	.byte	0xc
	.4byte	.LASF207
	.byte	0x12
	.byte	0xf5
	.byte	0xa
	.4byte	0x972
	.byte	0x8
	.byte	0xc
	.4byte	.LASF208
	.byte	0x12
	.byte	0xf6
	.byte	0xa
	.4byte	0x972
	.byte	0x10
	.byte	0xc
	.4byte	.LASF209
	.byte	0x12
	.byte	0xf7
	.byte	0xa
	.4byte	0xfae
	.byte	0x18
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0xf66
	.byte	0x9
	.4byte	0xcf6
	.4byte	0xfbe
	.byte	0xa
	.4byte	0x47
	.byte	0x4
	.byte	0
	.byte	0x25
	.4byte	.LASF210
	.byte	0x12
	.byte	0xfa
	.byte	0x26
	.4byte	0xfa8
	.byte	0x3
	.4byte	.LASF211
	.byte	0x13
	.byte	0x18
	.byte	0x10
	.4byte	0xfd6
	.byte	0x10
	.byte	0x8
	.4byte	0xfdc
	.byte	0x20
	.4byte	0xfec
	.byte	0x15
	.4byte	0xa15
	.byte	0x15
	.4byte	0xcf6
	.byte	0
	.byte	0x25
	.4byte	.LASF212
	.byte	0x13
	.byte	0x1e
	.byte	0x10
	.4byte	0x983
	.byte	0x20
	.4byte	0x1003
	.byte	0x15
	.4byte	0xfca
	.byte	0
	.byte	0x25
	.4byte	.LASF213
	.byte	0x13
	.byte	0x28
	.byte	0x13
	.4byte	0x100f
	.byte	0x10
	.byte	0x8
	.4byte	0xff8
	.byte	0x25
	.4byte	.LASF214
	.byte	0x14
	.byte	0x18
	.byte	0x6
	.4byte	0x2d
	.byte	0x25
	.4byte	.LASF215
	.byte	0x14
	.byte	0x19
	.byte	0x6
	.4byte	0x2d
	.byte	0x25
	.4byte	.LASF216
	.byte	0x14
	.byte	0x1a
	.byte	0x6
	.4byte	0x2d
	.byte	0x25
	.4byte	.LASF217
	.byte	0x14
	.byte	0x1d
	.byte	0x6
	.4byte	0x972
	.byte	0x25
	.4byte	.LASF218
	.byte	0x14
	.byte	0x1e
	.byte	0x6
	.4byte	0x972
	.byte	0x25
	.4byte	.LASF219
	.byte	0x14
	.byte	0x1f
	.byte	0x6
	.4byte	0x972
	.byte	0x25
	.4byte	.LASF220
	.byte	0x14
	.byte	0x20
	.byte	0x6
	.4byte	0x972
	.byte	0x25
	.4byte	.LASF221
	.byte	0x14
	.byte	0x21
	.byte	0x6
	.4byte	0x972
	.byte	0x25
	.4byte	.LASF222
	.byte	0x14
	.byte	0x22
	.byte	0x6
	.4byte	0x972
	.byte	0x25
	.4byte	.LASF223
	.byte	0x15
	.byte	0x1e
	.byte	0x1c
	.4byte	0x97e
	.byte	0x9
	.4byte	0x97e
	.4byte	0x1098
	.byte	0x26
	.byte	0
	.byte	0x5
	.4byte	0x108d
	.byte	0x25
	.4byte	.LASF224
	.byte	0x15
	.byte	0x1f
	.byte	0x1c
	.4byte	0x1098
	.byte	0x25
	.4byte	.LASF225
	.byte	0x15
	.byte	0x20
	.byte	0x19
	.4byte	0x55
	.byte	0x25
	.4byte	.LASF226
	.byte	0x15
	.byte	0x21
	.byte	0x15
	.4byte	0x55
	.byte	0x25
	.4byte	.LASF227
	.byte	0x15
	.byte	0x22
	.byte	0x15
	.4byte	0x55
	.byte	0x25
	.4byte	.LASF228
	.byte	0x15
	.byte	0x2e
	.byte	0x13
	.4byte	0x2e7
	.byte	0x25
	.4byte	.LASF229
	.byte	0x15
	.byte	0x2f
	.byte	0x13
	.4byte	0x2e7
	.byte	0x28
	.4byte	0x4e
	.byte	0x25
	.4byte	.LASF230
	.byte	0x15
	.byte	0x30
	.byte	0x12
	.4byte	0x10f6
	.byte	0x10
	.byte	0x8
	.4byte	0x10e5
	.byte	0x25
	.4byte	.LASF231
	.byte	0x15
	.byte	0x31
	.byte	0x1d
	.4byte	0x2ed
	.byte	0x25
	.4byte	.LASF232
	.byte	0x2
	.byte	0x19
	.byte	0xe
	.4byte	0xa15
	.byte	0x25
	.4byte	.LASF233
	.byte	0x2
	.byte	0x1a
	.byte	0xe
	.4byte	0xa15
	.byte	0x27
	.4byte	.LASF234
	.byte	0x1
	.byte	0x30
	.byte	0x9
	.4byte	0x983
	.byte	0x9
	.byte	0x3
	.8byte	caml_percent_free
	.byte	0x27
	.4byte	.LASF235
	.byte	0x1
	.byte	0x31
	.byte	0x9
	.4byte	0x983
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_heap_increment
	.byte	0x29
	.4byte	0xc50
	.byte	0x1
	.byte	0x32
	.byte	0x9
	.byte	0x3
	.8byte	caml_heap_start
	.byte	0x2a
	.4byte	0xc68
	.byte	0x1
	.byte	0x33
	.byte	0x7
	.byte	0x9
	.byte	0x3
	.8byte	caml_gc_sweep_hp
	.byte	0x2a
	.4byte	0xbfc
	.byte	0x1
	.byte	0x34
	.byte	0x5
	.byte	0x9
	.byte	0x3
	.8byte	caml_gc_phase
	.byte	0x2b
	.4byte	.LASF236
	.byte	0x1
	.byte	0x36
	.byte	0xf
	.4byte	0xcf6
	.byte	0x9
	.byte	0x3
	.8byte	gray_vals
	.byte	0x2b
	.4byte	.LASF237
	.byte	0x1
	.byte	0x37
	.byte	0xf
	.4byte	0xcf6
	.byte	0x9
	.byte	0x3
	.8byte	gray_vals_cur
	.byte	0x2b
	.4byte	.LASF238
	.byte	0x1
	.byte	0x37
	.byte	0x1f
	.4byte	0xcf6
	.byte	0x9
	.byte	0x3
	.8byte	gray_vals_end
	.byte	0x2b
	.4byte	.LASF239
	.byte	0x1
	.byte	0x38
	.byte	0x10
	.4byte	0x98f
	.byte	0x9
	.byte	0x3
	.8byte	gray_vals_size
	.byte	0x2b
	.4byte	.LASF240
	.byte	0x1
	.byte	0x39
	.byte	0xc
	.4byte	0x4e
	.byte	0x9
	.byte	0x3
	.8byte	heap_is_pure
	.byte	0x2a
	.4byte	0xc14
	.byte	0x1
	.byte	0x3b
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_allocated_words
	.byte	0x2a
	.4byte	0xc2c
	.byte	0x1
	.byte	0x3c
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_dependent_size
	.byte	0x2a
	.4byte	0xc38
	.byte	0x1
	.byte	0x3c
	.byte	0x1e
	.byte	0x9
	.byte	0x3
	.8byte	caml_dependent_allocated
	.byte	0x2a
	.4byte	0xc20
	.byte	0x1
	.byte	0x3d
	.byte	0x8
	.byte	0x9
	.byte	0x3
	.8byte	caml_extra_heap_resources
	.byte	0x2a
	.4byte	0xc44
	.byte	0x1
	.byte	0x3e
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_fl_wsz_at_phase_change
	.byte	0x25
	.4byte	.LASF241
	.byte	0x1
	.byte	0x40
	.byte	0xe
	.4byte	0x5d6
	.byte	0x2b
	.4byte	.LASF242
	.byte	0x1
	.byte	0x42
	.byte	0xe
	.4byte	0x5d6
	.byte	0x9
	.byte	0x3
	.8byte	markhp
	.byte	0x2b
	.4byte	.LASF243
	.byte	0x1
	.byte	0x42
	.byte	0x17
	.4byte	0x5d6
	.byte	0x9
	.byte	0x3
	.8byte	chunk
	.byte	0x2b
	.4byte	.LASF196
	.byte	0x1
	.byte	0x42
	.byte	0x1f
	.4byte	0x5d6
	.byte	0x9
	.byte	0x3
	.8byte	limit
	.byte	0x2a
	.4byte	0xc08
	.byte	0x1
	.byte	0x44
	.byte	0x5
	.byte	0x9
	.byte	0x3
	.8byte	caml_gc_subphase
	.byte	0x2b
	.4byte	.LASF244
	.byte	0x1
	.byte	0x68
	.byte	0xc
	.4byte	0x4e
	.byte	0x9
	.byte	0x3
	.8byte	ephe_list_pure
	.byte	0x2b
	.4byte	.LASF245
	.byte	0x1
	.byte	0x6b
	.byte	0xf
	.4byte	0xcf6
	.byte	0x9
	.byte	0x3
	.8byte	ephes_checked_if_pure
	.byte	0x2b
	.4byte	.LASF246
	.byte	0x1
	.byte	0x6c
	.byte	0xf
	.4byte	0xcf6
	.byte	0x9
	.byte	0x3
	.8byte	ephes_to_check
	.byte	0x2a
	.4byte	0xc74
	.byte	0x1
	.byte	0x6e
	.byte	0x5
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_window
	.byte	0x2a
	.4byte	0xcd2
	.byte	0x1
	.byte	0x72
	.byte	0x8
	.byte	0x9
	.byte	0x3
	.8byte	caml_gc_clock
	.byte	0x2a
	.4byte	0xcde
	.byte	0x1
	.byte	0x78
	.byte	0x8
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_gc_hook
	.byte	0x2b
	.4byte	.LASF247
	.byte	0x1
	.byte	0xd1
	.byte	0xe
	.4byte	0xa15
	.byte	0x9
	.byte	0x3
	.8byte	current_value
	.byte	0x2b
	.4byte	.LASF248
	.byte	0x1
	.byte	0xd2
	.byte	0x11
	.4byte	0xa2d
	.byte	0x9
	.byte	0x3
	.8byte	current_index
	.byte	0x2c
	.4byte	.LASF249
	.byte	0x1
	.2byte	0x399
	.byte	0x6
	.8byte	.LFB23
	.8byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x13b0
	.byte	0x2d
	.8byte	.LVL283
	.4byte	0x22b8
	.byte	0x2d
	.8byte	.LVL284
	.4byte	0x156e
	.byte	0x2d
	.8byte	.LVL285
	.4byte	0x22c4
	.byte	0x2e
	.8byte	.LVL286
	.4byte	0x1919
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0xa
	.byte	0x10
	.byte	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0x7f
	.byte	0
	.byte	0
	.byte	0x2c
	.4byte	.LASF250
	.byte	0x1
	.2byte	0x389
	.byte	0x6
	.8byte	.LFB22
	.8byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0x13fd
	.byte	0x30
	.string	"w"
	.byte	0x1
	.2byte	0x389
	.byte	0x21
	.4byte	0x4e
	.byte	0x1
	.byte	0x5a
	.byte	0x31
	.4byte	.LASF251
	.byte	0x1
	.2byte	0x38a
	.byte	0xb
	.4byte	0x983
	.4byte	.LLST73
	.byte	0x32
	.string	"i"
	.byte	0x1
	.2byte	0x38b
	.byte	0x7
	.4byte	0x4e
	.4byte	.LLST74
	.byte	0
	.byte	0x2c
	.4byte	.LASF252
	.byte	0x1
	.2byte	0x362
	.byte	0x6
	.8byte	.LFB21
	.8byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x1517
	.byte	0x33
	.4byte	.LASF253
	.byte	0x1
	.2byte	0x362
	.byte	0x24
	.4byte	0x98f
	.4byte	.LLST71
	.byte	0x32
	.string	"i"
	.byte	0x1
	.2byte	0x364
	.byte	0x7
	.4byte	0x4e
	.4byte	.LLST72
	.byte	0x34
	.8byte	.LVL263
	.4byte	0x1517
	.4byte	0x1457
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x33
	.byte	0x25
	.byte	0
	.byte	0x2d
	.8byte	.LVL264
	.4byte	0x22d0
	.byte	0x34
	.8byte	.LVL265
	.4byte	0x22dc
	.4byte	0x147b
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x2d
	.8byte	.LVL266
	.4byte	0x22c4
	.byte	0x34
	.8byte	.LVL267
	.4byte	0x22e8
	.4byte	0x14a4
	.byte	0x2f
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x31
	.byte	0x2f
	.byte	0x1
	.byte	0x5d
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x34
	.8byte	.LVL268
	.4byte	0x22f4
	.4byte	0x14bd
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xa
	.2byte	0x4000
	.byte	0
	.byte	0x34
	.8byte	.LVL271
	.4byte	0x2300
	.4byte	0x14dc
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC24
	.byte	0
	.byte	0x34
	.8byte	.LVL272
	.4byte	0x2300
	.4byte	0x14fb
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC25
	.byte	0
	.byte	0x2e
	.8byte	.LVL273
	.4byte	0x2300
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC26
	.byte	0
	.byte	0
	.byte	0x35
	.4byte	.LASF310
	.byte	0x1
	.2byte	0x34c
	.byte	0x9
	.4byte	0x98f
	.8byte	.LFB20
	.8byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x156e
	.byte	0x36
	.string	"wsz"
	.byte	0x1
	.2byte	0x34c
	.byte	0x2b
	.4byte	0x98f
	.4byte	.LLST68
	.byte	0x31
	.4byte	.LASF254
	.byte	0x1
	.2byte	0x34e
	.byte	0xb
	.4byte	0x98f
	.4byte	.LLST69
	.byte	0x31
	.4byte	.LASF255
	.byte	0x1
	.2byte	0x34f
	.byte	0xb
	.4byte	0x983
	.4byte	.LLST70
	.byte	0
	.byte	0x2c
	.4byte	.LASF256
	.byte	0x1
	.2byte	0x33d
	.byte	0x6
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x15f7
	.byte	0x34
	.8byte	.LVL248
	.4byte	0x1b55
	.4byte	0x15ad
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0xa
	.byte	0x10
	.byte	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0x7f
	.byte	0
	.byte	0x2d
	.8byte	.LVL249
	.4byte	0x2088
	.byte	0x34
	.8byte	.LVL250
	.4byte	0x19f1
	.4byte	0x15da
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0xa
	.byte	0x10
	.byte	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0x7f
	.byte	0
	.byte	0x2e
	.8byte	.LVL251
	.4byte	0x1919
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0xa
	.byte	0x10
	.byte	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0x7f
	.byte	0
	.byte	0
	.byte	0x37
	.4byte	.LASF257
	.byte	0x1
	.2byte	0x26d
	.byte	0x6
	.8byte	.LFB18
	.8byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x1919
	.byte	0x33
	.4byte	.LASF258
	.byte	0x1
	.2byte	0x26d
	.byte	0x2a
	.4byte	0x972
	.4byte	.LLST60
	.byte	0x32
	.string	"p"
	.byte	0x1
	.2byte	0x26f
	.byte	0xa
	.4byte	0x2d
	.4byte	.LLST61
	.byte	0x32
	.string	"dp"
	.byte	0x1
	.2byte	0x26f
	.byte	0xd
	.4byte	0x2d
	.4byte	.LLST62
	.byte	0x31
	.4byte	.LASF259
	.byte	0x1
	.2byte	0x26f
	.byte	0x11
	.4byte	0x2d
	.4byte	.LLST63
	.byte	0x31
	.4byte	.LASF260
	.byte	0x1
	.2byte	0x26f
	.byte	0x19
	.4byte	0x2d
	.4byte	.LLST64
	.byte	0x31
	.4byte	.LASF261
	.byte	0x1
	.2byte	0x270
	.byte	0xa
	.4byte	0x972
	.4byte	.LLST65
	.byte	0x32
	.string	"i"
	.byte	0x1
	.2byte	0x271
	.byte	0x7
	.4byte	0x4e
	.4byte	.LLST66
	.byte	0x38
	.4byte	.LASF271
	.byte	0x1
	.2byte	0x322
	.byte	0x2
	.8byte	.L156
	.byte	0x39
	.8byte	.LBB63
	.8byte	.LBE63-.LBB63
	.4byte	0x16be
	.byte	0x32
	.string	"i"
	.byte	0x1
	.2byte	0x2e3
	.byte	0xb
	.4byte	0x4e
	.4byte	.LLST67
	.byte	0
	.byte	0x34
	.8byte	.LVL200
	.4byte	0x230c
	.4byte	0x16e9
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x40
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC10
	.byte	0x2f
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x34
	.8byte	.LVL201
	.4byte	0x230c
	.4byte	0x170e
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x40
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC11
	.byte	0
	.byte	0x34
	.8byte	.LVL202
	.4byte	0x230c
	.4byte	0x1733
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x40
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC13
	.byte	0
	.byte	0x34
	.8byte	.LVL203
	.4byte	0x230c
	.4byte	0x1763
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x40
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC14
	.byte	0x2f
	.byte	0x1
	.byte	0x5c
	.byte	0x7
	.byte	0xf5
	.byte	0x29
	.byte	0x2d
	.byte	0xf7
	.byte	0x34
	.byte	0xf7
	.byte	0
	.byte	0
	.byte	0x34
	.8byte	.LVL214
	.4byte	0x230c
	.4byte	0x179f
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x40
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC16
	.byte	0x2f
	.byte	0x1
	.byte	0x5c
	.byte	0x13
	.byte	0xf5
	.byte	0x28
	.byte	0x2d
	.byte	0xf4
	.byte	0x2d
	.byte	0x8
	.4byte	0
	.4byte	0x412e8480
	.byte	0x1e
	.byte	0xf7
	.byte	0x34
	.byte	0xf7
	.byte	0
	.byte	0
	.byte	0x34
	.8byte	.LVL216
	.4byte	0x230c
	.4byte	0x17ca
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x40
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC19
	.byte	0x2f
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x34
	.8byte	.LVL217
	.4byte	0x1919
	.4byte	0x17e2
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x34
	.8byte	.LVL218
	.4byte	0x230c
	.4byte	0x1806
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x32
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC22
	.byte	0
	.byte	0x34
	.8byte	.LVL220
	.4byte	0x230c
	.4byte	0x1842
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x40
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC23
	.byte	0x2f
	.byte	0x1
	.byte	0x5c
	.byte	0x13
	.byte	0xf5
	.byte	0x29
	.byte	0x2d
	.byte	0xf4
	.byte	0x2d
	.byte	0x8
	.4byte	0
	.4byte	0x412e8480
	.byte	0x1e
	.byte	0xf7
	.byte	0x34
	.byte	0xf7
	.byte	0
	.byte	0
	.byte	0x34
	.8byte	.LVL222
	.4byte	0x2319
	.4byte	0x1864
	.byte	0x2f
	.byte	0x2
	.byte	0x90
	.byte	0x2a
	.byte	0x3
	.byte	0xf5
	.byte	0x28
	.byte	0x2d
	.byte	0x2f
	.byte	0x2
	.byte	0x90
	.byte	0x2b
	.byte	0x3
	.byte	0xf5
	.byte	0x29
	.byte	0x2d
	.byte	0
	.byte	0x34
	.8byte	.LVL230
	.4byte	0x2319
	.4byte	0x1886
	.byte	0x2f
	.byte	0x2
	.byte	0x90
	.byte	0x2a
	.byte	0x3
	.byte	0xf5
	.byte	0x29
	.byte	0x2d
	.byte	0x2f
	.byte	0x2
	.byte	0x90
	.byte	0x2b
	.byte	0x3
	.byte	0xf5
	.byte	0x28
	.byte	0x2d
	.byte	0
	.byte	0x2d
	.8byte	.LVL238
	.4byte	0x2088
	.byte	0x34
	.8byte	.LVL240
	.4byte	0x1b55
	.4byte	0x18ab
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x34
	.8byte	.LVL241
	.4byte	0x230c
	.4byte	0x18cf
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x32
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC20
	.byte	0
	.byte	0x34
	.8byte	.LVL242
	.4byte	0x19f1
	.4byte	0x18e7
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x34
	.8byte	.LVL243
	.4byte	0x230c
	.4byte	0x190b
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x32
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC21
	.byte	0
	.byte	0x2d
	.8byte	.LVL244
	.4byte	0x2326
	.byte	0
	.byte	0x3a
	.4byte	.LASF264
	.byte	0x1
	.2byte	0x224
	.byte	0xd
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0x19f1
	.byte	0x33
	.4byte	.LASF262
	.byte	0x1
	.2byte	0x224
	.byte	0x21
	.4byte	0x972
	.4byte	.LLST13
	.byte	0x32
	.string	"hp"
	.byte	0x1
	.2byte	0x226
	.byte	0x9
	.4byte	0x5d6
	.4byte	.LLST14
	.byte	0x32
	.string	"hd"
	.byte	0x1
	.2byte	0x227
	.byte	0xc
	.4byte	0xa21
	.4byte	.LLST15
	.byte	0x39
	.8byte	.LBB23
	.8byte	.LBE23-.LBB23
	.4byte	0x19a0
	.byte	0x31
	.4byte	.LASF263
	.byte	0x1
	.2byte	0x234
	.byte	0x12
	.4byte	0xaea
	.4byte	.LLST16
	.byte	0x3b
	.8byte	.LVL46
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x34
	.8byte	.LVL41
	.4byte	0x230c
	.4byte	0x19cb
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x40
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC4
	.byte	0x2f
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x34
	.8byte	.LVL44
	.4byte	0x2332
	.4byte	0x19e3
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0x8
	.byte	0
	.byte	0x2d
	.8byte	.LVL57
	.4byte	0x233e
	.byte	0
	.byte	0x3a
	.4byte	.LASF265
	.byte	0x1
	.2byte	0x209
	.byte	0xd
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x1b55
	.byte	0x33
	.4byte	.LASF262
	.byte	0x1
	.2byte	0x209
	.byte	0x21
	.4byte	0x972
	.4byte	.LLST1
	.byte	0x32
	.string	"v"
	.byte	0x1
	.2byte	0x20b
	.byte	0x9
	.4byte	0xa15
	.4byte	.LLST2
	.byte	0x3c
	.4byte	0x21e6
	.8byte	.LBB15
	.8byte	.LBE15-.LBB15
	.byte	0x1
	.2byte	0x217
	.byte	0x9
	.4byte	0x1b1c
	.byte	0x3d
	.4byte	0x21f3
	.4byte	.LLST3
	.byte	0x3e
	.4byte	0x21fd
	.4byte	.LLST4
	.byte	0x3e
	.4byte	0x2209
	.4byte	.LLST5
	.byte	0x3e
	.4byte	0x2215
	.4byte	.LLST6
	.byte	0x3e
	.4byte	0x2221
	.4byte	.LLST7
	.byte	0x3e
	.4byte	0x222b
	.4byte	.LLST8
	.byte	0x3f
	.4byte	0x2236
	.8byte	.L22
	.byte	0x40
	.4byte	0x223e
	.4byte	.Ldebug_ranges0+0
	.4byte	0x1b07
	.byte	0x3e
	.4byte	0x223f
	.4byte	.LLST9
	.byte	0x41
	.4byte	0x224b
	.8byte	.LBB18
	.4byte	.Ldebug_ranges0+0x30
	.byte	0x2
	.byte	0x43
	.byte	0xf
	.4byte	0x1af2
	.byte	0x3d
	.4byte	0x226f
	.4byte	.LLST10
	.byte	0x3d
	.4byte	0x2264
	.4byte	.LLST11
	.byte	0x42
	.4byte	0x2258
	.byte	0x43
	.4byte	.Ldebug_ranges0+0x30
	.byte	0x3e
	.4byte	0x227b
	.4byte	.LLST12
	.byte	0x2d
	.8byte	.LVL18
	.4byte	0x234a
	.byte	0
	.byte	0
	.byte	0x2e
	.8byte	.LVL23
	.4byte	0x2356
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x2e
	.8byte	.LVL21
	.4byte	0x2356
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x34
	.8byte	.LVL13
	.4byte	0x230c
	.4byte	0x1b47
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x40
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0x2f
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x84
	.byte	0
	.byte	0
	.byte	0x2d
	.8byte	.LVL38
	.4byte	0x205c
	.byte	0
	.byte	0x3a
	.4byte	.LASF266
	.byte	0x1
	.2byte	0x17f
	.byte	0xd
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x1da0
	.byte	0x33
	.4byte	.LASF262
	.byte	0x1
	.2byte	0x17f
	.byte	0x20
	.4byte	0x972
	.4byte	.LLST39
	.byte	0x31
	.4byte	.LASF267
	.byte	0x1
	.2byte	0x181
	.byte	0xa
	.4byte	0xcf6
	.4byte	.LLST40
	.byte	0x32
	.string	"v"
	.byte	0x1
	.2byte	0x182
	.byte	0x9
	.4byte	0xa15
	.4byte	.LLST41
	.byte	0x32
	.string	"hd"
	.byte	0x1
	.2byte	0x183
	.byte	0xc
	.4byte	0xa21
	.4byte	.LLST42
	.byte	0x31
	.4byte	.LASF162
	.byte	0x1
	.2byte	0x184
	.byte	0xc
	.4byte	0xa2d
	.4byte	.LLST43
	.byte	0x32
	.string	"i"
	.byte	0x1
	.2byte	0x184
	.byte	0x12
	.4byte	0xa2d
	.4byte	.LLST44
	.byte	0x31
	.4byte	.LASF268
	.byte	0x1
	.2byte	0x184
	.byte	0x15
	.4byte	0xa2d
	.4byte	.LLST45
	.byte	0x32
	.string	"end"
	.byte	0x1
	.2byte	0x184
	.byte	0x1c
	.4byte	0xa2d
	.4byte	.LLST46
	.byte	0x44
	.4byte	.LASF269
	.byte	0x1
	.2byte	0x188
	.byte	0x7
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0x8c,0x7f
	.byte	0x45
	.4byte	0x1fed
	.8byte	.LBB53
	.4byte	.Ldebug_ranges0+0x120
	.byte	0x1
	.2byte	0x1a2
	.byte	0x1b
	.4byte	0x1cf4
	.byte	0x3d
	.4byte	0x202a
	.4byte	.LLST47
	.byte	0x3d
	.4byte	0x201e
	.4byte	.LLST48
	.byte	0x3d
	.4byte	0x2014
	.4byte	.LLST49
	.byte	0x3d
	.4byte	0x200a
	.4byte	.LLST50
	.byte	0x3d
	.4byte	0x1ffe
	.4byte	.LLST51
	.byte	0x43
	.4byte	.Ldebug_ranges0+0x120
	.byte	0x3e
	.4byte	0x2036
	.4byte	.LLST52
	.byte	0x3e
	.4byte	0x2042
	.4byte	.LLST53
	.byte	0x46
	.4byte	0x204e
	.8byte	.LBB55
	.8byte	.LBE55-.LBB55
	.4byte	0x1cd1
	.byte	0x3e
	.4byte	0x204f
	.4byte	.LLST54
	.byte	0x45
	.4byte	0x228e
	.8byte	.LBB56
	.4byte	.Ldebug_ranges0+0x150
	.byte	0x1
	.2byte	0x112
	.byte	0xd
	.4byte	0x1cbc
	.byte	0x3d
	.4byte	0x22a7
	.4byte	.LLST55
	.byte	0x42
	.4byte	0x229b
	.byte	0x2d
	.8byte	.LVL139
	.4byte	0x2362
	.byte	0
	.byte	0x2e
	.8byte	.LVL137
	.4byte	0x2356
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8b
	.byte	0
	.byte	0
	.byte	0
	.byte	0x2d
	.8byte	.LVL144
	.4byte	0x2166
	.byte	0x2e
	.8byte	.LVL150
	.4byte	0x2356
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x34
	.8byte	.LVL112
	.4byte	0x230c
	.4byte	0x1d20
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x40
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC5
	.byte	0x2f
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x34
	.8byte	.LVL113
	.4byte	0x230c
	.4byte	0x1d45
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x40
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC6
	.byte	0
	.byte	0x2d
	.8byte	.LVL163
	.4byte	0x236e
	.byte	0x34
	.8byte	.LVL165
	.4byte	0x1da0
	.4byte	0x1d78
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x86
	.byte	0
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0xf8,0x7e
	.byte	0x2f
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0x91
	.byte	0x8c,0x7f
	.byte	0
	.byte	0x2d
	.8byte	.LVL168
	.4byte	0x237a
	.byte	0x2d
	.8byte	.LVL169
	.4byte	0x2386
	.byte	0x2d
	.8byte	.LVL174
	.4byte	0x205c
	.byte	0
	.byte	0x47
	.4byte	.LASF311
	.byte	0x1
	.2byte	0x12e
	.byte	0xf
	.4byte	0xcf6
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x1fe1
	.byte	0x33
	.4byte	.LASF267
	.byte	0x1
	.2byte	0x12e
	.byte	0x25
	.4byte	0xcf6
	.4byte	.LLST17
	.byte	0x33
	.4byte	.LASF262
	.byte	0x1
	.2byte	0x12e
	.byte	0x3c
	.4byte	0x1fe1
	.4byte	.LLST18
	.byte	0x33
	.4byte	.LASF269
	.byte	0x1
	.2byte	0x12f
	.byte	0x23
	.4byte	0x1fe7
	.4byte	.LLST19
	.byte	0x32
	.string	"v"
	.byte	0x1
	.2byte	0x131
	.byte	0x9
	.4byte	0xa15
	.4byte	.LLST20
	.byte	0x31
	.4byte	.LASF270
	.byte	0x1
	.2byte	0x131
	.byte	0xc
	.4byte	0xa15
	.4byte	.LLST21
	.byte	0x32
	.string	"key"
	.byte	0x1
	.2byte	0x131
	.byte	0x12
	.4byte	0xa15
	.4byte	.LLST22
	.byte	0x32
	.string	"hd"
	.byte	0x1
	.2byte	0x132
	.byte	0xc
	.4byte	0xa21
	.4byte	.LLST23
	.byte	0x31
	.4byte	.LASF162
	.byte	0x1
	.2byte	0x133
	.byte	0xc
	.4byte	0xa2d
	.4byte	.LLST24
	.byte	0x32
	.string	"i"
	.byte	0x1
	.2byte	0x133
	.byte	0x12
	.4byte	0xa2d
	.4byte	.LLST25
	.byte	0x38
	.4byte	.LASF272
	.byte	0x1
	.2byte	0x145
	.byte	0x5
	.8byte	.L54
	.byte	0x48
	.4byte	.Ldebug_ranges0+0x60
	.4byte	0x1fcc
	.byte	0x31
	.4byte	.LASF273
	.byte	0x1
	.2byte	0x13c
	.byte	0x9
	.4byte	0x4e
	.4byte	.LLST26
	.byte	0x48
	.4byte	.Ldebug_ranges0+0x90
	.4byte	0x1eaf
	.byte	0x32
	.string	"f"
	.byte	0x1
	.2byte	0x149
	.byte	0x11
	.4byte	0xa15
	.4byte	.LLST27
	.byte	0x2e
	.8byte	.LVL76
	.4byte	0x2356
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x45
	.4byte	0x1fed
	.8byte	.LBB36
	.4byte	.Ldebug_ranges0+0xc0
	.byte	0x1
	.2byte	0x160
	.byte	0x17
	.4byte	0x1fb7
	.byte	0x3d
	.4byte	0x202a
	.4byte	.LLST28
	.byte	0x3d
	.4byte	0x201e
	.4byte	.LLST29
	.byte	0x3d
	.4byte	0x2014
	.4byte	.LLST29
	.byte	0x3d
	.4byte	0x200a
	.4byte	.LLST31
	.byte	0x3d
	.4byte	0x1ffe
	.4byte	.LLST32
	.byte	0x43
	.4byte	.Ldebug_ranges0+0xc0
	.byte	0x3e
	.4byte	0x2036
	.4byte	.LLST33
	.byte	0x3e
	.4byte	0x2042
	.4byte	.LLST34
	.byte	0x46
	.4byte	0x204e
	.8byte	.LBB38
	.8byte	.LBE38-.LBB38
	.4byte	0x1f90
	.byte	0x3e
	.4byte	0x204f
	.4byte	.LLST35
	.byte	0x45
	.4byte	0x224b
	.8byte	.LBB39
	.4byte	.Ldebug_ranges0+0xf0
	.byte	0x1
	.2byte	0x110
	.byte	0xd
	.4byte	0x1f7b
	.byte	0x3d
	.4byte	0x226f
	.4byte	.LLST36
	.byte	0x3d
	.4byte	0x2264
	.4byte	.LLST37
	.byte	0x42
	.4byte	0x2258
	.byte	0x43
	.4byte	.Ldebug_ranges0+0xf0
	.byte	0x3e
	.4byte	0x227b
	.4byte	.LLST38
	.byte	0x2d
	.8byte	.LVL100
	.4byte	0x234a
	.byte	0
	.byte	0
	.byte	0x2e
	.8byte	.LVL98
	.4byte	0x2356
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x84
	.byte	0
	.byte	0
	.byte	0
	.byte	0x34
	.8byte	.LVL87
	.4byte	0x2356
	.4byte	0x1fa8
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x85
	.byte	0
	.byte	0
	.byte	0x2d
	.8byte	.LVL107
	.4byte	0x2166
	.byte	0
	.byte	0
	.byte	0x2e
	.8byte	.LVL74
	.4byte	0x2356
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x2e
	.8byte	.LVL67
	.4byte	0x2356
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0x972
	.byte	0x10
	.byte	0x8
	.4byte	0x4e
	.byte	0x49
	.4byte	.LASF312
	.byte	0x1
	.byte	0xea
	.byte	0x16
	.4byte	0xcf6
	.byte	0x3
	.4byte	0x205c
	.byte	0x4a
	.4byte	.LASF267
	.byte	0x1
	.byte	0xea
	.byte	0x2f
	.4byte	0xcf6
	.byte	0x4b
	.string	"v"
	.byte	0x1
	.byte	0xea
	.byte	0x44
	.4byte	0xa15
	.byte	0x4b
	.string	"i"
	.byte	0x1
	.byte	0xea
	.byte	0x4b
	.4byte	0x4e
	.byte	0x4a
	.4byte	.LASF274
	.byte	0x1
	.byte	0xeb
	.byte	0x2c
	.4byte	0x4e
	.byte	0x4a
	.4byte	.LASF269
	.byte	0x1
	.byte	0xeb
	.byte	0x3f
	.4byte	0x1fe7
	.byte	0x4c
	.4byte	.LASF275
	.byte	0x1
	.byte	0xed
	.byte	0x9
	.4byte	0xa15
	.byte	0x4d
	.string	"chd"
	.byte	0x1
	.byte	0xee
	.byte	0xc
	.4byte	0xa21
	.byte	0x4e
	.byte	0x4f
	.string	"f"
	.byte	0x1
	.2byte	0x101
	.byte	0xd
	.4byte	0xa15
	.byte	0
	.byte	0
	.byte	0x50
	.4byte	.LASF276
	.byte	0x1
	.byte	0xdb
	.byte	0xd
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x2088
	.byte	0x2d
	.8byte	.LVL9
	.4byte	0x22c4
	.byte	0
	.byte	0x51
	.4byte	.LASF277
	.byte	0x1
	.byte	0xbb
	.byte	0xd
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x20d8
	.byte	0x34
	.8byte	.LVL7
	.4byte	0x230c
	.4byte	0x20ca
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC2
	.byte	0
	.byte	0x2d
	.8byte	.LVL8
	.4byte	0x2392
	.byte	0
	.byte	0x52
	.4byte	.LASF278
	.byte	0x1
	.byte	0x96
	.byte	0x6
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0x2166
	.byte	0x53
	.string	"v"
	.byte	0x1
	.byte	0x96
	.byte	0x19
	.4byte	0xa15
	.4byte	.LLST56
	.byte	0x53
	.string	"p"
	.byte	0x1
	.byte	0x96
	.byte	0x23
	.4byte	0xcf6
	.4byte	.LLST57
	.byte	0x39
	.8byte	.LBB62
	.8byte	.LBE62-.LBB62
	.4byte	0x2151
	.byte	0x54
	.string	"h"
	.byte	0x1
	.byte	0x9d
	.byte	0xe
	.4byte	0xa21
	.4byte	.LLST58
	.byte	0x54
	.string	"t"
	.byte	0x1
	.byte	0x9e
	.byte	0xb
	.4byte	0xa39
	.4byte	.LLST59
	.byte	0x2d
	.8byte	.LVL184
	.4byte	0x2166
	.byte	0
	.byte	0x2e
	.8byte	.LVL179
	.4byte	0x2356
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x51
	.4byte	.LASF279
	.byte	0x1
	.byte	0x7a
	.byte	0xd
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0x21e6
	.byte	0x54
	.string	"new"
	.byte	0x1
	.byte	0x7c
	.byte	0xa
	.4byte	0xcf6
	.4byte	.LLST0
	.byte	0x34
	.8byte	.LVL0
	.4byte	0x230c
	.4byte	0x21b8
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x38
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC0
	.byte	0
	.byte	0x2d
	.8byte	.LVL1
	.4byte	0x239e
	.byte	0x2e
	.8byte	.LVL6
	.4byte	0x230c
	.byte	0x2f
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x38
	.byte	0x2f
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0
	.byte	0
	.byte	0x55
	.4byte	.LASF281
	.byte	0x2
	.byte	0x2c
	.byte	0x14
	.byte	0x3
	.4byte	0x224b
	.byte	0x4b
	.string	"v"
	.byte	0x2
	.byte	0x2c
	.byte	0x2b
	.4byte	0xa15
	.byte	0x4c
	.4byte	.LASF275
	.byte	0x2
	.byte	0x2d
	.byte	0x9
	.4byte	0xa15
	.byte	0x4c
	.4byte	.LASF280
	.byte	0x2
	.byte	0x2e
	.byte	0x7
	.4byte	0x4e
	.byte	0x4c
	.4byte	.LASF162
	.byte	0x2
	.byte	0x2f
	.byte	0xc
	.4byte	0xa2d
	.byte	0x4d
	.string	"i"
	.byte	0x2
	.byte	0x2f
	.byte	0x12
	.4byte	0xa2d
	.byte	0x4d
	.string	"hd"
	.byte	0x2
	.byte	0x30
	.byte	0xc
	.4byte	0xa21
	.byte	0x56
	.4byte	.LASF272
	.byte	0x2
	.byte	0x37
	.byte	0x3
	.byte	0x4e
	.byte	0x4d
	.string	"f"
	.byte	0x2
	.byte	0x3b
	.byte	0xf
	.4byte	0xa15
	.byte	0
	.byte	0
	.byte	0x55
	.4byte	.LASF282
	.byte	0x3
	.byte	0x5c
	.byte	0x14
	.byte	0x3
	.4byte	0x2288
	.byte	0x4b
	.string	"tbl"
	.byte	0x3
	.byte	0x5c
	.byte	0x47
	.4byte	0x2288
	.byte	0x4b
	.string	"ar"
	.byte	0x3
	.byte	0x5d
	.byte	0x31
	.4byte	0xa15
	.byte	0x4a
	.4byte	.LASF200
	.byte	0x3
	.byte	0x5d
	.byte	0x3e
	.4byte	0xa2d
	.byte	0x4c
	.4byte	.LASF283
	.byte	0x3
	.byte	0x5f
	.byte	0x1d
	.4byte	0xe8c
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0xe23
	.byte	0x55
	.4byte	.LASF284
	.byte	0x3
	.byte	0x53
	.byte	0x14
	.byte	0x3
	.4byte	0x22b2
	.byte	0x4b
	.string	"tbl"
	.byte	0x3
	.byte	0x53
	.byte	0x3d
	.4byte	0x22b2
	.byte	0x4b
	.string	"p"
	.byte	0x3
	.byte	0x53
	.byte	0x49
	.4byte	0xcf6
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0xd80
	.byte	0x57
	.4byte	.LASF285
	.4byte	.LASF285
	.byte	0x3
	.byte	0x3e
	.byte	0xd
	.byte	0x57
	.4byte	.LASF286
	.4byte	.LASF286
	.byte	0xf
	.byte	0x1d
	.byte	0x6
	.byte	0x57
	.4byte	.LASF287
	.4byte	.LASF287
	.byte	0x12
	.byte	0x39
	.byte	0x12
	.byte	0x57
	.4byte	.LASF288
	.4byte	.LASF288
	.byte	0x12
	.byte	0xc1
	.byte	0x5
	.byte	0x57
	.4byte	.LASF289
	.4byte	.LASF289
	.byte	0xf
	.byte	0x21
	.byte	0x6
	.byte	0x57
	.4byte	.LASF290
	.4byte	.LASF290
	.byte	0x12
	.byte	0x6c
	.byte	0x1c
	.byte	0x57
	.4byte	.LASF291
	.4byte	.LASF291
	.byte	0xa
	.byte	0x6e
	.byte	0x11
	.byte	0x58
	.4byte	.LASF292
	.4byte	.LASF292
	.byte	0xa
	.2byte	0x16a
	.byte	0x6
	.byte	0x58
	.4byte	.LASF293
	.4byte	.LASF293
	.byte	0x8
	.2byte	0x13b
	.byte	0xf
	.byte	0x57
	.4byte	.LASF294
	.4byte	.LASF294
	.byte	0x16
	.byte	0x1a
	.byte	0x6
	.byte	0x57
	.4byte	.LASF295
	.4byte	.LASF295
	.byte	0xf
	.byte	0x1f
	.byte	0xb
	.byte	0x57
	.4byte	.LASF296
	.4byte	.LASF296
	.byte	0x15
	.byte	0x25
	.byte	0x6
	.byte	0x57
	.4byte	.LASF297
	.4byte	.LASF297
	.byte	0x3
	.byte	0x43
	.byte	0xd
	.byte	0x57
	.4byte	.LASF298
	.4byte	.LASF298
	.byte	0x11
	.byte	0x3d
	.byte	0x5
	.byte	0x57
	.4byte	.LASF299
	.4byte	.LASF299
	.byte	0x3
	.byte	0x41
	.byte	0xd
	.byte	0x57
	.4byte	.LASF300
	.4byte	.LASF300
	.byte	0x13
	.byte	0x1c
	.byte	0x8
	.byte	0x57
	.4byte	.LASF301
	.4byte	.LASF301
	.byte	0x17
	.byte	0x18
	.byte	0x6
	.byte	0x57
	.4byte	.LASF302
	.4byte	.LASF302
	.byte	0x17
	.byte	0x17
	.byte	0x6
	.byte	0x57
	.4byte	.LASF303
	.4byte	.LASF303
	.byte	0x13
	.byte	0x1b
	.byte	0x6
	.byte	0x57
	.4byte	.LASF304
	.4byte	.LASF304
	.byte	0x12
	.byte	0x94
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
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x16
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
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x17
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
	.byte	0x8
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
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0xc
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
	.byte	0xd
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
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
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x15
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0xd
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
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0xd
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
	.byte	0x38
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x13
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x13
	.byte	0x1
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x17
	.byte	0x1
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0xd
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
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x13
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
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
	.byte	0x22
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3e
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x23
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xd
	.byte	0
	.byte	0
	.byte	0x24
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
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
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x26
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x27
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
	.byte	0x28
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x29
	.byte	0x34
	.byte	0
	.byte	0x47
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x2a
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
	.byte	0x2b
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
	.byte	0x2d
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2e
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2f
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
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
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x31
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
	.byte	0x32
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
	.byte	0x33
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
	.byte	0x34
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
	.byte	0x35
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
	.byte	0x36
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
	.byte	0x37
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
	.byte	0x38
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
	.byte	0x39
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
	.byte	0x3a
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
	.byte	0x3b
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x3c
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0x5
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3d
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x3e
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x3f
	.byte	0xa
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x40
	.byte	0xb
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x41
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x42
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x43
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x44
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
	.byte	0x45
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0x5
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x46
	.byte	0xb
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x47
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
	.byte	0x48
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x49
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
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4a
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
	.byte	0
	.byte	0
	.byte	0x4b
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
	.byte	0
	.byte	0
	.byte	0x4c
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
	.byte	0x4d
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
	.byte	0x4e
	.byte	0xb
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x4f
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
	.byte	0
	.byte	0
	.byte	0x50
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
	.byte	0x51
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
	.byte	0x52
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
	.byte	0x53
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
	.byte	0x54
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
	.byte	0x55
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
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x56
	.byte	0xa
	.byte	0
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
	.byte	0x57
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
	.byte	0x58
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
.LLST73:
	.8byte	.LVL275-.Ltext0
	.8byte	.LVL276-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL276-.Ltext0
	.8byte	.LVL282-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST74:
	.8byte	.LVL276-.Ltext0
	.8byte	.LVL278-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL279-.Ltext0
	.8byte	.LVL280-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL280-.Ltext0
	.8byte	.LVL282-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	0
	.8byte	0
.LLST71:
	.8byte	.LVL261-.Ltext0
	.8byte	.LVL262-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL262-.Ltext0
	.8byte	.LFE21-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST72:
	.8byte	.LVL269-.Ltext0
	.8byte	.LVL270-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL273-.Ltext0
	.8byte	.LVL274-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST68:
	.8byte	.LVL252-.Ltext0
	.8byte	.LVL254-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL254-.Ltext0
	.8byte	.LVL257-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL257-.Ltext0
	.8byte	.LFE20-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST69:
	.8byte	.LVL253-.Ltext0
	.8byte	.LVL254-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL254-.Ltext0
	.8byte	.LVL256-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL256-.Ltext0
	.8byte	.LVL258-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL259-.Ltext0
	.8byte	.LVL260-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL260-.Ltext0
	.8byte	.LFE20-.Ltext0
	.2byte	0x4
	.byte	0xa
	.2byte	0xf000
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST70:
	.8byte	.LVL255-.Ltext0
	.8byte	.LVL256-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST60:
	.8byte	.LVL193-.Ltext0
	.8byte	.LVL194-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL194-1-.Ltext0
	.8byte	.LVL213-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL213-.Ltext0
	.8byte	.LVL227-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL227-.Ltext0
	.8byte	.LVL228-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL228-.Ltext0
	.8byte	.LVL232-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL232-.Ltext0
	.8byte	.LVL235-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL235-.Ltext0
	.8byte	.LFE18-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST61:
	.8byte	.LVL195-.Ltext0
	.8byte	.LVL197-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x2f
	.8byte	.LVL197-.Ltext0
	.8byte	.LVL198-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x2e
	.8byte	.LVL198-.Ltext0
	.8byte	.LVL206-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x28
	.8byte	.LVL206-.Ltext0
	.8byte	.LVL207-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x2f
	.8byte	.LVL207-.Ltext0
	.8byte	.LVL212-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x28
	.8byte	.LVL213-.Ltext0
	.8byte	.LVL219-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x28
	.8byte	.LVL219-.Ltext0
	.8byte	.LVL221-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x29
	.8byte	.LVL221-.Ltext0
	.8byte	.LVL224-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x28
	.8byte	.LVL224-.Ltext0
	.8byte	.LVL227-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x2e
	.8byte	.LVL227-.Ltext0
	.8byte	.LVL229-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x28
	.8byte	.LVL232-.Ltext0
	.8byte	.LVL233-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x28
	.8byte	.LVL235-.Ltext0
	.8byte	.LVL236-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x28
	.8byte	.LVL236-.Ltext0
	.8byte	.LVL237-.Ltext0
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.4byte	0
	.4byte	0
	.8byte	.LVL237-.Ltext0
	.8byte	.LVL246-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x28
	.8byte	0
	.8byte	0
.LLST62:
	.8byte	.LVL196-.Ltext0
	.8byte	.LVL197-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x2e
	.8byte	0
	.8byte	0
.LLST63:
	.8byte	.LVL212-.Ltext0
	.8byte	.LVL221-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x28
	.8byte	.LVL231-.Ltext0
	.8byte	.LVL232-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x28
	.8byte	.LVL234-.Ltext0
	.8byte	.LVL246-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x28
	.8byte	0
	.8byte	0
.LLST64:
	.8byte	.LVL222-.Ltext0
	.8byte	.LVL227-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x2a
	.8byte	.LVL230-.Ltext0
	.8byte	.LVL232-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x2a
	.8byte	.LVL246-.Ltext0
	.8byte	.LVL247-1-.Ltext0
	.2byte	0x2
	.byte	0x90
	.byte	0x2a
	.8byte	0
	.8byte	0
.LLST65:
	.8byte	.LVL215-.Ltext0
	.8byte	.LVL219-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL239-.Ltext0
	.8byte	.LVL245-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST66:
	.8byte	.LVL203-.Ltext0
	.8byte	.LVL204-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL204-.Ltext0
	.8byte	.LVL205-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL207-.Ltext0
	.8byte	.LVL208-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL224-.Ltext0
	.8byte	.LVL225-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL225-.Ltext0
	.8byte	.LVL226-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST67:
	.8byte	.LVL209-.Ltext0
	.8byte	.LVL210-.Ltext0
	.2byte	0xe
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0x94
	.byte	0x4
	.byte	0x23
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL210-.Ltext0
	.8byte	.LVL211-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST13:
	.8byte	.LVL39-.Ltext0
	.8byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL40-.Ltext0
	.8byte	.LVL52-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL53-.Ltext0
	.8byte	.LVL56-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL56-.Ltext0
	.8byte	.LVL57-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST14:
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL48-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL48-.Ltext0
	.8byte	.LVL49-.Ltext0
	.2byte	0x3
	.byte	0x78
	.byte	0x78
	.byte	0x9f
	.8byte	.LVL50-.Ltext0
	.8byte	.LVL55-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST15:
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL43-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL47-.Ltext0
	.8byte	.LVL49-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL51-.Ltext0
	.8byte	.LVL54-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST16:
	.8byte	.LVL45-.Ltext0
	.8byte	.LVL46-1-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL13-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL13-1-.Ltext0
	.8byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	.LVL35-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL36-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL22-.Ltext0
	.8byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x68
	.8byte	.LVL24-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL26-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x68
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL32-.Ltext0
	.8byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x67
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	.LVL28-.Ltext0
	.8byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x67
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x2
	.byte	0x32
	.byte	0x9f
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x2
	.byte	0x79
	.byte	0x78
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL22-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST10:
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST11:
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST12:
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST39:
	.8byte	.LVL110-.Ltext0
	.8byte	.LVL111-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL111-.Ltext0
	.8byte	.LVL112-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST40:
	.8byte	.LVL114-.Ltext0
	.8byte	.LVL125-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL125-.Ltext0
	.8byte	.LVL127-.Ltext0
	.2byte	0x3
	.byte	0x86
	.byte	0x78
	.byte	0x9f
	.8byte	.LVL127-.Ltext0
	.8byte	.LVL154-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL154-.Ltext0
	.8byte	.LVL155-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x78
	.byte	0x9f
	.8byte	.LVL155-.Ltext0
	.8byte	.LVL166-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL166-.Ltext0
	.8byte	.LVL167-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL167-.Ltext0
	.8byte	.LVL171-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL171-.Ltext0
	.8byte	.LVL173-.Ltext0
	.2byte	0x3
	.byte	0x86
	.byte	0x78
	.byte	0x9f
	.8byte	.LVL173-.Ltext0
	.8byte	.LVL177-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL177-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x9
	.byte	0x3
	.8byte	gray_vals_cur
	.8byte	0
	.8byte	0
.LLST41:
	.8byte	.LVL115-.Ltext0
	.8byte	.LVL123-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL123-.Ltext0
	.8byte	.LVL124-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL124-.Ltext0
	.8byte	.LVL160-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL160-.Ltext0
	.8byte	.LVL161-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL161-.Ltext0
	.8byte	.LVL175-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL175-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x9
	.byte	0x3
	.8byte	current_value
	.8byte	0
	.8byte	0
.LLST42:
	.8byte	.LVL117-.Ltext0
	.8byte	.LVL120-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	.LVL120-.Ltext0
	.8byte	.LVL121-.Ltext0
	.2byte	0x2
	.byte	0x8a
	.byte	0
	.8byte	.LVL128-.Ltext0
	.8byte	.LVL158-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	0
	.8byte	0
.LLST43:
	.8byte	.LVL118-.Ltext0
	.8byte	.LVL122-.Ltext0
	.2byte	0x1
	.byte	0x67
	.8byte	.LVL128-.Ltext0
	.8byte	.LVL130-.Ltext0
	.2byte	0x1
	.byte	0x67
	.8byte	.LVL130-.Ltext0
	.8byte	.LVL131-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	.LVL131-.Ltext0
	.8byte	.LVL161-.Ltext0
	.2byte	0x1
	.byte	0x67
	.8byte	0
	.8byte	0
.LLST44:
	.8byte	.LVL131-.Ltext0
	.8byte	.LVL132-.Ltext0
	.2byte	0x1
	.byte	0x69
	.8byte	.LVL132-.Ltext0
	.8byte	.LVL161-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST45:
	.8byte	.LVL116-.Ltext0
	.8byte	.LVL129-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	.LVL129-.Ltext0
	.8byte	.LVL156-.Ltext0
	.2byte	0x1
	.byte	0x69
	.8byte	.LVL156-.Ltext0
	.8byte	.LVL157-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	.LVL157-.Ltext0
	.8byte	.LVL160-.Ltext0
	.2byte	0x1
	.byte	0x69
	.8byte	.LVL160-.Ltext0
	.8byte	.LVL161-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL161-.Ltext0
	.8byte	.LVL176-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	.LVL176-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x9
	.byte	0x3
	.8byte	current_index
	.8byte	0
	.8byte	0
.LLST46:
	.8byte	.LVL119-.Ltext0
	.8byte	.LVL124-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL128-.Ltext0
	.8byte	.LVL131-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL131-.Ltext0
	.8byte	.LVL159-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	0
	.8byte	0
.LLST47:
	.8byte	.LVL132-.Ltext0
	.8byte	.LVL145-.Ltext0
	.2byte	0x4
	.byte	0x91
	.byte	0x8c,0x7f
	.byte	0x9f
	.8byte	.LVL147-.Ltext0
	.8byte	.LVL155-.Ltext0
	.2byte	0x4
	.byte	0x91
	.byte	0x8c,0x7f
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST48:
	.8byte	.LVL132-.Ltext0
	.8byte	.LVL145-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL147-.Ltext0
	.8byte	.LVL155-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST49:
	.8byte	.LVL132-.Ltext0
	.8byte	.LVL145-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL147-.Ltext0
	.8byte	.LVL148-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL148-.Ltext0
	.8byte	.LVL155-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST50:
	.8byte	.LVL132-.Ltext0
	.8byte	.LVL145-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL147-.Ltext0
	.8byte	.LVL155-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST51:
	.8byte	.LVL132-.Ltext0
	.8byte	.LVL143-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL143-.Ltext0
	.8byte	.LVL144-1-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL144-1-.Ltext0
	.8byte	.LVL145-.Ltext0
	.2byte	0x3
	.byte	0x86
	.byte	0x8
	.byte	0x9f
	.8byte	.LVL147-.Ltext0
	.8byte	.LVL153-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL153-.Ltext0
	.8byte	.LVL155-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST52:
	.8byte	.LVL132-.Ltext0
	.8byte	.LVL134-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL134-.Ltext0
	.8byte	.LVL136-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL136-.Ltext0
	.8byte	.LVL137-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL137-1-.Ltext0
	.8byte	.LVL140-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL140-.Ltext0
	.8byte	.LVL141-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL141-.Ltext0
	.8byte	.LVL145-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL149-.Ltext0
	.8byte	.LVL155-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST53:
	.8byte	.LVL132-.Ltext0
	.8byte	.LVL143-.Ltext0
	.2byte	0x1
	.byte	0x68
	.8byte	.LVL151-.Ltext0
	.8byte	.LVL152-.Ltext0
	.2byte	0x1
	.byte	0x68
	.8byte	0
	.8byte	0
.LLST54:
	.8byte	.LVL133-.Ltext0
	.8byte	.LVL140-.Ltext0
	.2byte	0x1
	.byte	0x6b
	.8byte	0
	.8byte	0
.LLST55:
	.8byte	.LVL135-.Ltext0
	.8byte	.LVL136-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL138-.Ltext0
	.8byte	.LVL140-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST17:
	.8byte	.LVL58-.Ltext0
	.8byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL62-.Ltext0
	.8byte	.LVL63-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL63-.Ltext0
	.8byte	.LVL66-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL66-.Ltext0
	.8byte	.LVL91-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL91-.Ltext0
	.8byte	.LVL92-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x78
	.byte	0x9f
	.8byte	.LVL92-.Ltext0
	.8byte	.LVL108-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL108-.Ltext0
	.8byte	.LVL109-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL109-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST18:
	.8byte	.LVL58-.Ltext0
	.8byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL62-.Ltext0
	.8byte	.LVL63-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL63-.Ltext0
	.8byte	.LVL65-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL65-.Ltext0
	.8byte	.LVL67-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL67-1-.Ltext0
	.8byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL85-.Ltext0
	.8byte	.LVL86-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL86-.Ltext0
	.8byte	.LVL88-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL88-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST19:
	.8byte	.LVL58-.Ltext0
	.8byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL62-.Ltext0
	.8byte	.LVL65-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	.LVL65-.Ltext0
	.8byte	.LVL67-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL67-1-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST20:
	.8byte	.LVL59-.Ltext0
	.8byte	.LVL64-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL65-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST21:
	.8byte	.LVL61-.Ltext0
	.8byte	.LVL63-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL65-.Ltext0
	.8byte	.LVL72-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST22:
	.8byte	.LVL72-.Ltext0
	.8byte	.LVL75-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL75-.Ltext0
	.8byte	.LVL78-.Ltext0
	.2byte	0x3
	.byte	0x8a
	.byte	0x8
	.byte	0x9f
	.8byte	.LVL80-.Ltext0
	.8byte	.LVL81-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST23:
	.8byte	.LVL60-.Ltext0
	.8byte	.LVL63-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL65-.Ltext0
	.8byte	.LVL70-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL71-.Ltext0
	.8byte	.LVL72-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	0
	.8byte	0
.LLST24:
	.8byte	.LVL70-.Ltext0
	.8byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL72-.Ltext0
	.8byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL86-.Ltext0
	.8byte	.LVL89-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL92-.Ltext0
	.8byte	.LVL94-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	.LVL101-.Ltext0
	.8byte	.LVL105-.Ltext0
	.2byte	0x1
	.byte	0x66
	.8byte	0
	.8byte	0
.LLST25:
	.8byte	.LVL70-.Ltext0
	.8byte	.LVL71-.Ltext0
	.2byte	0x2
	.byte	0x32
	.byte	0x9f
	.8byte	.LVL72-.Ltext0
	.8byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	0
	.8byte	0
.LLST26:
	.8byte	.LVL68-.Ltext0
	.8byte	.LVL69-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	.LVL69-.Ltext0
	.8byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x68
	.8byte	.LVL71-.Ltext0
	.8byte	.LVL72-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	.LVL72-.Ltext0
	.8byte	.LVL109-.Ltext0
	.2byte	0x1
	.byte	0x68
	.8byte	0
	.8byte	0
.LLST27:
	.8byte	.LVL72-.Ltext0
	.8byte	.LVL73-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL75-.Ltext0
	.8byte	.LVL77-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST28:
	.8byte	.LVL83-.Ltext0
	.8byte	.LVL85-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	.LVL86-.Ltext0
	.8byte	.LVL109-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST29:
	.8byte	.LVL83-.Ltext0
	.8byte	.LVL85-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	.LVL86-.Ltext0
	.8byte	.LVL109-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST31:
	.8byte	.LVL83-.Ltext0
	.8byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL86-.Ltext0
	.8byte	.LVL109-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST32:
	.8byte	.LVL83-.Ltext0
	.8byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL86-.Ltext0
	.8byte	.LVL90-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL90-.Ltext0
	.8byte	.LVL92-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL92-.Ltext0
	.8byte	.LVL105-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL105-.Ltext0
	.8byte	.LVL107-1-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL107-1-.Ltext0
	.8byte	.LVL108-.Ltext0
	.2byte	0x3
	.byte	0x82
	.byte	0x8
	.byte	0x9f
	.8byte	.LVL108-.Ltext0
	.8byte	.LVL109-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST33:
	.8byte	.LVL84-.Ltext0
	.8byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL86-.Ltext0
	.8byte	.LVL102-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL102-.Ltext0
	.8byte	.LVL103-.Ltext0
	.2byte	0x1
	.byte	0x65
	.8byte	.LVL103-.Ltext0
	.8byte	.LVL106-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL106-.Ltext0
	.8byte	.LVL107-1-.Ltext0
	.2byte	0x2
	.byte	0x82
	.byte	0
	.8byte	0
	.8byte	0
.LLST34:
	.8byte	.LVL88-.Ltext0
	.8byte	.LVL109-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST35:
	.8byte	.LVL93-.Ltext0
	.8byte	.LVL101-.Ltext0
	.2byte	0x1
	.byte	0x64
	.8byte	0
	.8byte	0
.LLST36:
	.8byte	.LVL95-.Ltext0
	.8byte	.LVL97-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	.LVL99-.Ltext0
	.8byte	.LVL101-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST37:
	.8byte	.LVL95-.Ltext0
	.8byte	.LVL97-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL99-.Ltext0
	.8byte	.LVL101-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST38:
	.8byte	.LVL96-.Ltext0
	.8byte	.LVL97-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST56:
	.8byte	.LVL178-.Ltext0
	.8byte	.LVL179-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL179-1-.Ltext0
	.8byte	.LVL192-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST57:
	.8byte	.LVL178-.Ltext0
	.8byte	.LVL179-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL179-1-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST58:
	.8byte	.LVL180-.Ltext0
	.8byte	.LVL182-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL185-.Ltext0
	.8byte	.LVL186-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL186-.Ltext0
	.8byte	.LVL187-.Ltext0
	.2byte	0x2
	.byte	0x78
	.byte	0x78
	.8byte	.LVL187-.Ltext0
	.8byte	.LVL188-.Ltext0
	.2byte	0x5
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x38
	.byte	0x1c
	.8byte	.LVL188-.Ltext0
	.8byte	.LVL190-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST59:
	.8byte	.LVL181-.Ltext0
	.8byte	.LVL183-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL185-.Ltext0
	.8byte	.LVL191-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x9
	.byte	0x3
	.8byte	gray_vals
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL5-.Ltext0
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
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.8byte	.LBB17-.Ltext0
	.8byte	.LBE17-.Ltext0
	.8byte	.LBB22-.Ltext0
	.8byte	.LBE22-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB18-.Ltext0
	.8byte	.LBE18-.Ltext0
	.8byte	.LBB21-.Ltext0
	.8byte	.LBE21-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB33-.Ltext0
	.8byte	.LBE33-.Ltext0
	.8byte	.LBB45-.Ltext0
	.8byte	.LBE45-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB34-.Ltext0
	.8byte	.LBE34-.Ltext0
	.8byte	.LBB35-.Ltext0
	.8byte	.LBE35-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB36-.Ltext0
	.8byte	.LBE36-.Ltext0
	.8byte	.LBB44-.Ltext0
	.8byte	.LBE44-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB39-.Ltext0
	.8byte	.LBE39-.Ltext0
	.8byte	.LBB42-.Ltext0
	.8byte	.LBE42-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB53-.Ltext0
	.8byte	.LBE53-.Ltext0
	.8byte	.LBB61-.Ltext0
	.8byte	.LBE61-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB56-.Ltext0
	.8byte	.LBE56-.Ltext0
	.8byte	.LBB59-.Ltext0
	.8byte	.LBE59-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF248:
	.string	"current_index"
.LASF127:
	.string	"uintnat"
.LASF237:
	.string	"gray_vals_cur"
.LASF245:
	.string	"ephes_checked_if_pure"
.LASF278:
	.string	"caml_darken"
.LASF211:
	.string	"scanning_action"
.LASF135:
	.string	"caml_finalise_begin_hook"
.LASF205:
	.string	"caml_use_huge_pages"
.LASF153:
	.string	"compare_ext"
.LASF306:
	.string	"major_gc.c"
.LASF38:
	.string	"_on_exit_args"
.LASF106:
	.string	"_wctomb_state"
.LASF151:
	.string	"serialize"
.LASF311:
	.string	"mark_ephe_aux"
.LASF103:
	.string	"_r48"
.LASF233:
	.string	"caml_ephe_none"
.LASF108:
	.string	"_signal_buf"
.LASF7:
	.string	"unsigned int"
.LASF145:
	.string	"caml_global_data"
.LASF163:
	.string	"next"
.LASF223:
	.string	"caml_signals_are_pending"
.LASF225:
	.string	"caml_something_to_do"
.LASF229:
	.string	"caml_leave_blocking_section_hook"
.LASF52:
	.string	"_lbfsize"
.LASF50:
	.string	"_flags"
.LASF67:
	.string	"_errno"
.LASF141:
	.string	"mlsize_t"
.LASF204:
	.string	"caml_huge_fallback_count"
.LASF283:
	.string	"ephe_ref"
.LASF258:
	.string	"howmuch"
.LASF224:
	.string	"caml_pending_signals"
.LASF273:
	.string	"alive_data"
.LASF196:
	.string	"limit"
.LASF239:
	.string	"gray_vals_size"
.LASF21:
	.string	"_LOCK_RECURSIVE_T"
.LASF54:
	.string	"_read"
.LASF110:
	.string	"_mbrlen_state"
.LASF164:
	.string	"heap_chunk_head"
.LASF168:
	.string	"caml_extra_heap_resources"
.LASF69:
	.string	"_stdout"
.LASF13:
	.string	"_fpos_t"
.LASF45:
	.string	"_fns"
.LASF53:
	.string	"_cookie"
.LASF247:
	.string	"current_value"
.LASF27:
	.string	"_Bigint"
.LASF243:
	.string	"chunk"
.LASF35:
	.string	"__tm_wday"
.LASF199:
	.string	"ephe"
.LASF144:
	.string	"caml_atom_table"
.LASF77:
	.string	"_result"
.LASF274:
	.string	"in_ephemeron"
.LASF31:
	.string	"__tm_hour"
.LASF231:
	.string	"caml_async_action_hook"
.LASF183:
	.string	"caml_code_area_start"
.LASF202:
	.string	"caml_custom_elt"
.LASF140:
	.string	"header_t"
.LASF169:
	.string	"caml_dependent_size"
.LASF17:
	.string	"__count"
.LASF122:
	.string	"float"
.LASF222:
	.string	"caml_stat_heap_chunks"
.LASF30:
	.string	"__tm_min"
.LASF120:
	.string	"_impure_ptr"
.LASF146:
	.string	"custom_operations"
.LASF194:
	.string	"base"
.LASF117:
	.string	"_nextf"
.LASF232:
	.string	"caml_ephe_list_head"
.LASF93:
	.string	"_rand48"
.LASF254:
	.string	"result"
.LASF78:
	.string	"_result_k"
.LASF116:
	.string	"long long unsigned int"
.LASF235:
	.string	"caml_major_heap_increment"
.LASF99:
	.string	"_asctime_buf"
.LASF49:
	.string	"__sFILE"
.LASF26:
	.string	"_wds"
.LASF310:
	.string	"caml_clip_heap_chunk_wsz"
.LASF301:
	.string	"caml_final_update_clean_phase"
.LASF170:
	.string	"caml_dependent_allocated"
.LASF262:
	.string	"work"
.LASF89:
	.string	"__FILE"
.LASF214:
	.string	"caml_stat_minor_words"
.LASF124:
	.string	"__fdlibm_posix"
.LASF61:
	.string	"_offset"
.LASF275:
	.string	"child"
.LASF138:
	.string	"caml_runtime_warnings"
.LASF139:
	.string	"value"
.LASF72:
	.string	"_emergency"
.LASF208:
	.string	"nitems"
.LASF192:
	.string	"caml_extra_heap_resources_minor"
.LASF253:
	.string	"heap_size"
.LASF259:
	.string	"filt_p"
.LASF276:
	.string	"init_sweep_phase"
.LASF5:
	.string	"size_t"
.LASF200:
	.string	"offset"
.LASF29:
	.string	"__tm_sec"
.LASF271:
	.string	"finished"
.LASF36:
	.string	"__tm_yday"
.LASF71:
	.string	"_inc"
.LASF44:
	.string	"_ind"
.LASF190:
	.string	"caml_minor_heap_wsz"
.LASF279:
	.string	"realloc_gray_vals"
.LASF264:
	.string	"sweep_slice"
.LASF302:
	.string	"caml_final_update_mark_phase"
.LASF181:
	.string	"caml_young_start"
.LASF23:
	.string	"_next"
.LASF227:
	.string	"caml_requested_minor_gc"
.LASF176:
	.string	"caml_major_ring"
.LASF112:
	.string	"_mbsrtowcs_state"
.LASF159:
	.string	"caml_fl_cur_wsz"
.LASF289:
	.string	"caml_make_free_blocks"
.LASF299:
	.string	"caml_realloc_ref_table"
.LASF207:
	.string	"ntables"
.LASF189:
	.string	"caml_young_trigger"
.LASF180:
	.string	"caml_major_gc_hook"
.LASF255:
	.string	"incr"
.LASF18:
	.string	"__value"
.LASF79:
	.string	"_p5s"
.LASF241:
	.string	"caml_fl_merge"
.LASF128:
	.string	"asize_t"
.LASF234:
	.string	"caml_percent_free"
.LASF114:
	.string	"_wcsrtombs_state"
.LASF104:
	.string	"_mblen_state"
.LASF297:
	.string	"caml_realloc_ephe_ref_table"
.LASF88:
	.string	"char"
.LASF32:
	.string	"__tm_mday"
.LASF85:
	.string	"_sig_func"
.LASF111:
	.string	"_mbrtowc_state"
.LASF84:
	.string	"_atexit0"
.LASF290:
	.string	"caml_stat_alloc_noexc"
.LASF294:
	.string	"caml_compact_heap_maybe"
.LASF22:
	.string	"_flock_t"
.LASF203:
	.string	"caml_custom_table"
.LASF172:
	.string	"caml_heap_start"
.LASF15:
	.string	"__wch"
.LASF92:
	.string	"_iobs"
.LASF250:
	.string	"caml_set_major_window"
.LASF305:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF221:
	.string	"caml_stat_compactions"
.LASF75:
	.string	"__sdidinit"
.LASF152:
	.string	"deserialize"
.LASF240:
	.string	"heap_is_pure"
.LASF300:
	.string	"caml_darken_all_roots_slice"
.LASF215:
	.string	"caml_stat_promoted_words"
.LASF68:
	.string	"_stdin"
.LASF101:
	.string	"_gamma_signgam"
.LASF3:
	.string	"long long int"
.LASF282:
	.string	"add_to_ephe_ref_table"
.LASF47:
	.string	"_base"
.LASF80:
	.string	"_freelist"
.LASF95:
	.string	"_mult"
.LASF292:
	.string	"caml_gc_message"
.LASF20:
	.string	"__ULong"
.LASF113:
	.string	"_wcrtomb_state"
.LASF51:
	.string	"_file"
.LASF165:
	.string	"caml_gc_phase"
.LASF291:
	.string	"caml_fatal_error"
.LASF76:
	.string	"__cleanup"
.LASF125:
	.string	"__fdlib_version"
.LASF19:
	.string	"_mbstate_t"
.LASF177:
	.string	"caml_major_ring_index"
.LASF206:
	.string	"caml__roots_block"
.LASF187:
	.string	"caml_young_ptr"
.LASF39:
	.string	"_fnargs"
.LASF162:
	.string	"size"
.LASF216:
	.string	"caml_stat_major_words"
.LASF149:
	.string	"compare"
.LASF226:
	.string	"caml_requested_major_slice"
.LASF37:
	.string	"__tm_isdst"
.LASF280:
	.string	"release_data"
.LASF285:
	.string	"caml_empty_minor_heap"
.LASF142:
	.string	"tag_t"
.LASF268:
	.string	"start"
.LASF212:
	.string	"caml_incremental_roots_count"
.LASF267:
	.string	"gray_vals_ptr"
.LASF115:
	.string	"_h_errno"
.LASF155:
	.string	"sigjmp_buf"
.LASF219:
	.string	"caml_stat_heap_wsz"
.LASF244:
	.string	"ephe_list_pure"
.LASF303:
	.string	"caml_darken_all_roots_start"
.LASF134:
	.string	"caml_minor_gc_end_hook"
.LASF257:
	.string	"caml_major_collection_slice"
.LASF185:
	.string	"caml_young_alloc_start"
.LASF161:
	.string	"caml_alloc"
.LASF270:
	.string	"data"
.LASF33:
	.string	"__tm_mon"
.LASF188:
	.string	"caml_young_limit"
.LASF277:
	.string	"start_cycle"
.LASF4:
	.string	"long double"
.LASF261:
	.string	"computed_work"
.LASF55:
	.string	"_write"
.LASF295:
	.string	"caml_fl_merge_block"
.LASF210:
	.string	"caml_local_roots"
.LASF293:
	.string	"fmin"
.LASF249:
	.string	"caml_finalise_heap"
.LASF286:
	.string	"caml_fl_init_merge"
.LASF43:
	.string	"_atexit"
.LASF64:
	.string	"_mbstate"
.LASF156:
	.string	"longjmp_buffer"
.LASF220:
	.string	"caml_stat_top_heap_wsz"
.LASF281:
	.string	"caml_ephe_clean"
.LASF133:
	.string	"caml_minor_gc_begin_hook"
.LASF10:
	.string	"short int"
.LASF171:
	.string	"caml_fl_wsz_at_phase_change"
.LASF1:
	.string	"long int"
.LASF287:
	.string	"caml_alloc_for_heap"
.LASF150:
	.string	"hash"
.LASF198:
	.string	"caml_ephe_ref_elt"
.LASF284:
	.string	"add_to_ref_table"
.LASF230:
	.string	"caml_try_leave_blocking_section_hook"
.LASF167:
	.string	"caml_allocated_words"
.LASF87:
	.string	"__sf"
.LASF25:
	.string	"_sign"
.LASF154:
	.string	"caml_compare_unordered"
.LASF62:
	.string	"_data"
.LASF201:
	.string	"caml_ephe_ref_table"
.LASF16:
	.string	"__wchb"
.LASF121:
	.string	"_global_impure_ptr"
.LASF186:
	.string	"caml_young_alloc_end"
.LASF34:
	.string	"__tm_year"
.LASF288:
	.string	"caml_page_table_add"
.LASF160:
	.string	"block"
.LASF246:
	.string	"ephes_to_check"
.LASF123:
	.string	"__fdlibm_ieee"
.LASF191:
	.string	"caml_in_minor_collection"
.LASF312:
	.string	"mark_slice_darken"
.LASF304:
	.string	"caml_stat_resize_noexc"
.LASF100:
	.string	"_localtime_buf"
.LASF173:
	.string	"total_heap_size"
.LASF137:
	.string	"caml_verb_gc"
.LASF119:
	.string	"_unused"
.LASF126:
	.string	"intnat"
.LASF83:
	.string	"_new"
.LASF184:
	.string	"caml_code_area_end"
.LASF81:
	.string	"_cvtlen"
.LASF24:
	.string	"_maxwds"
.LASF107:
	.string	"_l64a_buf"
.LASF260:
	.string	"spend"
.LASF147:
	.string	"identifier"
.LASF197:
	.string	"reserve"
.LASF228:
	.string	"caml_enter_blocking_section_hook"
.LASF60:
	.string	"_blksize"
.LASF28:
	.string	"__tm"
.LASF307:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF63:
	.string	"_lock"
.LASF296:
	.string	"caml_request_minor_gc"
.LASF182:
	.string	"caml_young_end"
.LASF2:
	.string	"long unsigned int"
.LASF132:
	.string	"caml_major_slice_end_hook"
.LASF91:
	.string	"_niobs"
.LASF6:
	.string	"wint_t"
.LASF265:
	.string	"clean_slice"
.LASF40:
	.string	"_dso_handle"
.LASF174:
	.string	"caml_gc_sweep_hp"
.LASF238:
	.string	"gray_vals_end"
.LASF158:
	.string	"caml_exn_bucket"
.LASF131:
	.string	"caml_major_slice_begin_hook"
.LASF209:
	.string	"tables"
.LASF82:
	.string	"_cvtbuf"
.LASF57:
	.string	"_close"
.LASF9:
	.string	"unsigned char"
.LASF242:
	.string	"markhp"
.LASF143:
	.string	"color_t"
.LASF109:
	.string	"_getdate_err"
.LASF96:
	.string	"_add"
.LASF148:
	.string	"finalize"
.LASF218:
	.string	"caml_stat_major_collections"
.LASF272:
	.string	"ephemeron_again"
.LASF129:
	.string	"addr"
.LASF46:
	.string	"__sbuf"
.LASF298:
	.string	"caml_page_table_lookup"
.LASF130:
	.string	"caml_timing_hook"
.LASF179:
	.string	"caml_gc_clock"
.LASF90:
	.string	"_glue"
.LASF213:
	.string	"caml_scan_roots_hook"
.LASF309:
	.string	"__fdlibm_version"
.LASF195:
	.string	"threshold"
.LASF86:
	.string	"__sglue"
.LASF98:
	.string	"_strtok_last"
.LASF105:
	.string	"_mbtowc_state"
.LASF178:
	.string	"caml_major_work_credit"
.LASF74:
	.string	"_locale"
.LASF14:
	.string	"_ssize_t"
.LASF8:
	.string	"signed char"
.LASF217:
	.string	"caml_stat_minor_collections"
.LASF66:
	.string	"_reent"
.LASF11:
	.string	"short unsigned int"
.LASF175:
	.string	"caml_major_window"
.LASF166:
	.string	"caml_gc_subphase"
.LASF263:
	.string	"final_fun"
.LASF251:
	.string	"total"
.LASF41:
	.string	"_fntypes"
.LASF269:
	.string	"slice_pointers"
.LASF48:
	.string	"_size"
.LASF0:
	.string	"double"
.LASF256:
	.string	"caml_finish_major_cycle"
.LASF266:
	.string	"mark_slice"
.LASF12:
	.string	"_off_t"
.LASF59:
	.string	"_nbuf"
.LASF97:
	.string	"_unused_rand"
.LASF73:
	.string	"_unspecified_locale_info"
.LASF65:
	.string	"_flags2"
.LASF42:
	.string	"_is_cxa"
.LASF236:
	.string	"gray_vals"
.LASF252:
	.string	"caml_init_major_heap"
.LASF94:
	.string	"_seed"
.LASF102:
	.string	"_rand_next"
.LASF308:
	.string	"__locale_t"
.LASF56:
	.string	"_seek"
.LASF70:
	.string	"_stderr"
.LASF118:
	.string	"_nmalloc"
.LASF58:
	.string	"_ubuf"
.LASF193:
	.string	"caml_ref_table"
.LASF136:
	.string	"caml_finalise_end_hook"
.LASF157:
	.string	"caml_external_raise"
	.ident	"GCC: (GNU) 9.2.0"
