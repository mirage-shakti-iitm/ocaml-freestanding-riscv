	.file	"freelist.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.nf_allocate_block,"ax",@progbits
	.align	1
	.type	nf_allocate_block, @function
nf_allocate_block:
	ld	a4,-8(a2)
	srli	a5,a4,10
	addi	a4,a0,1
	bgeu	a5,a4,.L2
	lla	a3,caml_fl_cur_wsz
	ld	a4,0(a3)
	sub	a4,a4,a5
	addi	a4,a4,-1
	sd	a4,0(a3)
	ld	a4,0(a2)
	sd	a4,0(a1)
	ld	a4,caml_fl_merge
	beq	a4,a2,.L5
.L3:
	sd	zero,-8(a2)
.L4:
	sd	a1,nf_prev,a4
	sub	a5,a5,a0
	slli	a5,a5,3
	add	a0,a5,a2
	ret
.L5:
	sd	a1,caml_fl_merge,a4
	j	.L3
.L2:
	lla	a3,caml_fl_cur_wsz
	ld	a4,0(a3)
	sub	a4,a4,a0
	sd	a4,0(a3)
	sub	a4,a5,a0
	slli	a4,a4,10
	addi	a4,a4,512
	sd	a4,-8(a2)
	j	.L4
	.size	nf_allocate_block, .-nf_allocate_block
	.section	.text.nf_allocate,"ax",@progbits
	.align	1
	.type	nf_allocate, @function
nf_allocate:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a4,nf_prev
	ld	a2,0(a4)
	mv	a1,a4
.L7:
	beq	a2,zero,.L15
	ld	a5,-8(a2)
	srli	a5,a5,10
	bgeu	a5,a0,.L16
	mv	a1,a2
	ld	a2,0(a2)
	j	.L7
.L16:
	addi	a0,a0,1
	call	nf_allocate_block
.L6:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L15:
	sd	a1,nf_last,a5
	lla	a1,.LANCHOR0+16
	ld	a2,.LANCHOR0+16
.L11:
	beq	a1,a4,.L17
	ld	a5,-8(a2)
	srli	a5,a5,10
	bgeu	a5,a0,.L18
	mv	a1,a2
	ld	a2,0(a2)
	j	.L11
.L18:
	addi	a0,a0,1
	call	nf_allocate_block
	j	.L6
.L17:
	li	a0,0
	j	.L6
	.size	nf_allocate, .-nf_allocate
	.section	.text.nf_init_merge,"ax",@progbits
	.align	1
	.type	nf_init_merge, @function
nf_init_merge:
	sd	zero,nf_last_fragment,a5
	lla	a5,.LANCHOR0+16
	sd	a5,caml_fl_merge,a4
	ret
	.size	nf_init_merge, .-nf_init_merge
	.section	.text.nf_init,"ax",@progbits
	.align	1
	.type	nf_init, @function
nf_init:
	sd	zero,.LANCHOR0+16,a5
	lla	a5,.LANCHOR0+16
	sd	a5,nf_prev,a4
	sd	zero,caml_fl_cur_wsz,a5
	ret
	.size	nf_init, .-nf_init
	.section	.text.nf_reset,"ax",@progbits
	.align	1
	.type	nf_reset, @function
nf_reset:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	nf_init
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	nf_reset, .-nf_reset
	.section	.text.nf_merge_block,"ax",@progbits
	.align	1
	.type	nf_merge_block, @function
nf_merge_block:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s0,a0
	addi	s2,a0,-8
	ld	s1,-8(a0)
	srli	a5,s1,10
	lla	a4,caml_fl_cur_wsz
	ld	a3,0(a4)
	add	a5,a5,a3
	addi	a5,a5,1
	sd	a5,0(a4)
	andi	a4,s1,0xff
	li	a5,255
	beq	a4,a5,.L32
.L24:
	ld	a4,caml_fl_merge
	ld	a2,0(a4)
	ld	a5,nf_last_fragment
	beq	s2,a5,.L33
.L25:
	mv	a6,s0
	addi	a1,s0,-8
	ld	a0,-8(s0)
	srli	a0,a0,10
	slli	a0,a0,3
	add	a0,a0,s0
	addi	a0,a0,8
	beq	a2,a0,.L34
.L26:
	ld	a3,-8(a4)
	srli	a3,a3,10
	slli	a5,a3,3
	add	a5,a5,a4
	addi	a5,a5,8
	beq	s0,a5,.L35
.L28:
	srli	a5,s1,10
	beq	a5,zero,.L30
	andi	s1,s1,-769
	ori	s1,s1,512
	sd	s1,0(a1)
	sd	a2,0(s0)
	sd	s0,0(a4)
	sd	s0,caml_fl_merge,a5
.L29:
	addi	a0,a0,-8
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L32:
	ld	a5,0(a0)
	ld	a5,8(a5)
	beq	a5,zero,.L24
	jalr	a5
	j	.L24
.L33:
	ld	a3,0(s2)
	srli	a3,a3,10
	addi	a3,a3,1
	li	a1,-1
	srli	a1,a1,10
	bgtu	a3,a1,.L25
	slli	s1,a3,10
	mv	s0,a5
	sd	s1,-8(a5)
	lla	a3,caml_fl_cur_wsz
	ld	a5,0(a3)
	addi	a5,a5,1
	sd	a5,0(a3)
	j	.L25
.L34:
	ld	a7,0(a2)
	ld	a5,-8(a2)
	srli	a5,a5,10
	addi	a5,a5,1
	srli	a3,s1,10
	add	a5,a3,a5
	li	a3,-1
	srli	a3,a3,10
	bgtu	a5,a3,.L26
	sd	a7,0(a4)
	ld	a3,nf_prev
	beq	a3,a2,.L36
.L27:
	slli	a5,a5,10
	addi	s1,a5,512
	sd	s1,0(a1)
	srli	a0,s1,10
	slli	a0,a0,3
	add	a0,a0,a6
	addi	a0,a0,8
	mv	a2,a7
	j	.L26
.L36:
	sd	a4,nf_prev,a3
	j	.L27
.L35:
	srli	a5,s1,10
	add	a3,a5,a3
	addi	a3,a3,1
	li	a5,-1025
	srli	a5,a5,10
	bgtu	a3,a5,.L28
	slli	a3,a3,10
	addi	a3,a3,512
	sd	a3,-8(a4)
	j	.L29
.L30:
	sd	s0,nf_last_fragment,a5
	lla	a4,caml_fl_cur_wsz
	ld	a5,0(a4)
	addi	a5,a5,-1
	sd	a5,0(a4)
	j	.L29
	.size	nf_merge_block, .-nf_merge_block
	.section	.text.nf_add_blocks,"ax",@progbits
	.align	1
	.type	nf_add_blocks, @function
nf_add_blocks:
	mv	a4,a0
.L38:
	ld	a5,-8(a4)
	srli	a5,a5,10
	lla	a3,caml_fl_cur_wsz
	ld	a2,0(a3)
	add	a5,a5,a2
	addi	a5,a5,1
	sd	a5,0(a3)
	ld	a4,0(a4)
	bne	a4,zero,.L38
	mv	a4,a0
	ld	a5,nf_last
	bleu	a0,a5,.L39
	sd	a0,0(a5)
	ld	a3,caml_fl_merge
	beq	a5,a3,.L44
.L37:
	ret
.L44:
	ld	a5,caml_gc_sweep_hp
	bgeu	a0,a5,.L37
	ld	a5,8(a0)
	sd	a5,caml_fl_merge,a4
	ret
.L39:
	lla	a3,.LANCHOR0+16
	ld	a5,.LANCHOR0+16
	j	.L41
.L43:
	mv	a3,a5
	ld	a5,0(a5)
.L41:
	beq	a5,zero,.L42
	bgtu	a4,a5,.L43
.L42:
	ld	a2,8(a0)
	sd	a5,0(a2)
	sd	a0,0(a3)
	ld	a5,caml_fl_merge
	bne	a5,a3,.L37
	ld	a5,caml_gc_sweep_hp
	bgeu	a4,a5,.L37
	ld	a5,8(a0)
	sd	a5,caml_fl_merge,a4
	j	.L37
	.size	nf_add_blocks, .-nf_add_blocks
	.section	.text.nf_make_free_blocks,"ax",@progbits
	.align	1
	.type	nf_make_free_blocks, @function
nf_make_free_blocks:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	sd	s4,0(sp)
	mv	s2,a0
	mv	s1,a1
	mv	s4,a2
	mv	s3,a3
	j	.L46
.L50:
	mv	s0,s1
.L47:
	addi	a5,s0,-1
	slli	a5,a5,10
	add	a5,s3,a5
	sd	a5,0(s2)
	bne	s4,zero,.L52
.L48:
	sub	s1,s1,s0
	slli	s0,s0,3
	add	s2,s2,s0
.L46:
	beq	s1,zero,.L53
	li	a5,1
	slli	a5,a5,54
	bleu	s1,a5,.L50
	mv	s0,a5
	j	.L47
.L52:
	li	a1,0
	addi	a0,s2,8
	call	nf_merge_block
	j	.L48
.L53:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	ld	s4,0(sp)
	addi	sp,sp,48
	jr	ra
	.size	nf_make_free_blocks, .-nf_make_free_blocks
	.section	.text.ff_allocate_block,"ax",@progbits
	.align	1
	.type	ff_allocate_block, @function
ff_allocate_block:
	ld	a4,-8(a3)
	srli	a5,a4,10
	addi	a4,a0,1
	bgeu	a5,a4,.L55
	lla	a6,caml_fl_cur_wsz
	ld	a4,0(a6)
	sub	a4,a4,a5
	addi	a4,a4,-1
	sd	a4,0(a6)
	ld	a4,0(a3)
	sd	a4,0(a2)
	ld	a4,caml_fl_merge
	beq	a4,a3,.L61
.L56:
	sd	zero,-8(a3)
	addiw	a6,a1,1
	lw	a4,flp_size
	bge	a6,a4,.L57
	slli	t1,a6,3
	lla	a7,flp
	add	a7,a7,t1
	ld	a7,0(a7)
	beq	a7,a3,.L62
.L57:
	addiw	a4,a4,-1
	sext.w	a6,a4
	bne	a6,a1,.L58
	lla	a1,.LANCHOR0+48
	beq	a1,a2,.L63
.L59:
	sd	a2,beyond,a1
	sw	a4,flp_size,a2
	j	.L58
.L61:
	sd	a2,caml_fl_merge,a4
	j	.L56
.L62:
	lla	a4,flp
	add	a6,a4,t1
	sd	a2,0(a6)
	j	.L58
.L63:
	li	a2,0
	j	.L59
.L55:
	lla	a2,caml_fl_cur_wsz
	ld	a4,0(a2)
	sub	a4,a4,a0
	sd	a4,0(a2)
	sub	a4,a5,a0
	slli	a4,a4,10
	addi	a4,a4,512
	sd	a4,-8(a3)
.L58:
	sub	a5,a5,a0
	slli	a5,a5,3
	add	a0,a5,a3
	ret
	.size	ff_allocate_block, .-ff_allocate_block
	.section	.text.ff_init_merge,"ax",@progbits
	.align	1
	.type	ff_init_merge, @function
ff_init_merge:
	sd	zero,ff_last_fragment,a5
	lla	a5,.LANCHOR0+48
	sd	a5,caml_fl_merge,a4
	ret
	.size	ff_init_merge, .-ff_init_merge
	.section	.text.ff_truncate_flp,"ax",@progbits
	.align	1
	.type	ff_truncate_flp, @function
ff_truncate_flp:
	lla	a5,.LANCHOR0+48
	beq	a5,a0,.L70
.L66:
	lw	a5,flp_size
	ble	a5,zero,.L68
	addiw	a5,a5,-1
	sext.w	a4,a5
	slli	a3,a4,3
	lla	a4,flp
	add	a4,a4,a3
	ld	a4,0(a4)
	ld	a4,0(a4)
	bltu	a4,a0,.L68
	sw	a5,flp_size,a4
	j	.L66
.L70:
	sw	zero,flp_size,a5
	sd	zero,beyond,a5
	ret
.L68:
	ld	a5,beyond
	bltu	a5,a0,.L65
	sd	zero,beyond,a5
.L65:
	ret
	.size	ff_truncate_flp, .-ff_truncate_flp
	.section	.text.ff_init,"ax",@progbits
	.align	1
	.type	ff_init, @function
ff_init:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	zero,.LANCHOR0+48,a5
	lla	a0,.LANCHOR0+48
	call	ff_truncate_flp
	sd	zero,caml_fl_cur_wsz,a5
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	ff_init, .-ff_init
	.section	.text.ff_reset,"ax",@progbits
	.align	1
	.type	ff_reset, @function
ff_reset:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	ff_init
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	ff_reset, .-ff_reset
	.section	.text.ff_merge_block,"ax",@progbits
	.align	1
	.type	ff_merge_block, @function
ff_merge_block:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	sd	s4,0(sp)
	mv	s0,a0
	addi	s4,a0,-8
	ld	s1,-8(a0)
	srli	a5,s1,10
	lla	a4,caml_fl_cur_wsz
	ld	a3,0(a4)
	add	a5,a5,a3
	addi	a5,a5,1
	sd	a5,0(a4)
	andi	a4,s1,0xff
	li	a5,255
	beq	a4,a5,.L83
.L76:
	ld	s2,caml_fl_merge
	ld	s3,0(s2)
	mv	a0,s2
	call	ff_truncate_flp
	ld	a5,ff_last_fragment
	beq	s4,a5,.L84
.L77:
	addi	a3,s0,-8
	ld	a0,-8(s0)
	srli	a0,a0,10
	slli	a0,a0,3
	add	a0,a0,s0
	addi	a0,a0,8
	beq	s3,a0,.L85
.L78:
	ld	a4,-8(s2)
	srli	a4,a4,10
	slli	a5,a4,3
	add	a5,a5,s2
	addi	a5,a5,8
	beq	s0,a5,.L86
.L79:
	srli	a5,s1,10
	beq	a5,zero,.L81
	andi	s1,s1,-769
	ori	s1,s1,512
	sd	s1,0(a3)
	sd	s3,0(s0)
	sd	s0,0(s2)
	sd	s0,caml_fl_merge,a5
.L80:
	addi	a0,a0,-8
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	ld	s4,0(sp)
	addi	sp,sp,48
	jr	ra
.L83:
	ld	a5,0(a0)
	ld	a5,8(a5)
	beq	a5,zero,.L76
	jalr	a5
	j	.L76
.L84:
	ld	a4,0(s4)
	srli	a4,a4,10
	addi	a4,a4,1
	li	a3,-1
	srli	a3,a3,10
	bgtu	a4,a3,.L77
	slli	s1,a4,10
	mv	s0,a5
	sd	s1,-8(a5)
	lla	a4,caml_fl_cur_wsz
	ld	a5,0(a4)
	addi	a5,a5,1
	sd	a5,0(a4)
	j	.L77
.L85:
	ld	a1,0(s3)
	ld	a5,-8(s3)
	srli	a5,a5,10
	addi	a5,a5,1
	srli	a4,s1,10
	add	a5,a4,a5
	li	a4,-1
	srli	a4,a4,10
	bgtu	a5,a4,.L78
	sd	a1,0(s2)
	slli	a5,a5,10
	addi	s1,a5,512
	sd	s1,0(a3)
	srli	a0,s1,10
	slli	a0,a0,3
	add	a0,a0,s0
	addi	a0,a0,8
	mv	s3,a1
	j	.L78
.L86:
	srli	a5,s1,10
	add	a4,a5,a4
	addi	a4,a4,1
	li	a5,-1025
	srli	a5,a5,10
	bgtu	a4,a5,.L79
	slli	a4,a4,10
	addi	a4,a4,512
	sd	a4,-8(s2)
	j	.L80
.L81:
	sd	s0,ff_last_fragment,a5
	lla	a4,caml_fl_cur_wsz
	ld	a5,0(a4)
	addi	a5,a5,-1
	sd	a5,0(a4)
	j	.L80
	.size	ff_merge_block, .-ff_merge_block
	.section	.text.ff_add_blocks,"ax",@progbits
	.align	1
	.type	ff_add_blocks, @function
ff_add_blocks:
	mv	a4,a0
.L88:
	ld	a5,-8(a4)
	srli	a5,a5,10
	lla	a3,caml_fl_cur_wsz
	ld	a2,0(a3)
	add	a5,a5,a2
	addi	a5,a5,1
	sd	a5,0(a3)
	ld	a4,0(a4)
	bne	a4,zero,.L88
	mv	a4,a0
	ld	a5,ff_last
	bleu	a0,a5,.L89
	sd	a0,0(a5)
	ld	a3,caml_fl_merge
	beq	a5,a3,.L99
.L90:
	lw	a4,flp_size
	li	a3,999
	bgt	a4,a3,.L97
	addiw	a3,a4,1
	sw	a3,flp_size,a2
	slli	a4,a4,3
	lla	a3,flp
	add	a4,a3,a4
	sd	a5,0(a4)
	ret
.L99:
	ld	a3,caml_gc_sweep_hp
	bgeu	a0,a3,.L90
	ld	a4,8(a0)
	sd	a4,caml_fl_merge,a3
	j	.L90
.L89:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a3,.LANCHOR0+48
	ld	a5,.LANCHOR0+48
	j	.L92
.L94:
	mv	a3,a5
	ld	a5,0(a5)
.L92:
	beq	a5,zero,.L93
	bgtu	a4,a5,.L94
.L93:
	ld	a2,8(a0)
	sd	a5,0(a2)
	sd	a0,0(a3)
	ld	a5,caml_fl_merge
	beq	a5,a3,.L100
.L95:
	call	ff_truncate_flp
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L100:
	ld	a5,caml_gc_sweep_hp
	bgeu	a4,a5,.L95
	ld	a5,8(a0)
	sd	a5,caml_fl_merge,a4
	j	.L95
.L97:
	ret
	.size	ff_add_blocks, .-ff_add_blocks
	.section	.text.ff_make_free_blocks,"ax",@progbits
	.align	1
	.type	ff_make_free_blocks, @function
ff_make_free_blocks:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	sd	s4,0(sp)
	mv	s2,a0
	mv	s1,a1
	mv	s4,a2
	mv	s3,a3
	j	.L102
.L106:
	mv	s0,s1
.L103:
	addi	a5,s0,-1
	slli	a5,a5,10
	add	a5,s3,a5
	sd	a5,0(s2)
	bne	s4,zero,.L108
.L104:
	sub	s1,s1,s0
	slli	s0,s0,3
	add	s2,s2,s0
.L102:
	beq	s1,zero,.L109
	li	a5,1
	slli	a5,a5,54
	bleu	s1,a5,.L106
	mv	s0,a5
	j	.L103
.L108:
	li	a1,0
	addi	a0,s2,8
	call	ff_merge_block
	j	.L104
.L109:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	ld	s4,0(sp)
	addi	sp,sp,48
	jr	ra
	.size	ff_make_free_blocks, .-ff_make_free_blocks
	.section	.text.bf_search,"ax",@progbits
	.align	1
	.type	bf_search, @function
bf_search:
	mv	a3,a0
	lla	a0,bf_large_tree
	j	.L111
.L113:
	addi	a0,a4,16
.L111:
	ld	a4,0(a0)
	beq	a4,zero,.L110
	ld	a5,-8(a4)
	srli	a5,a5,10
	beq	a3,a5,.L110
	bgeu	a3,a5,.L113
	addi	a0,a4,8
	j	.L111
.L110:
	ret
	.size	bf_search, .-bf_search
	.section	.text.bf_search_best,"ax",@progbits
	.align	1
	.type	bf_search_best, @function
bf_search_best:
	mv	a2,a0
	li	a6,16
	li	a0,0
	lla	a3,bf_large_tree
	j	.L116
.L122:
	sd	a6,0(a1)
	ret
.L123:
	sd	a2,0(a1)
	mv	a0,a3
	ret
.L120:
	addi	a3,a4,16
	mv	a6,a5
.L116:
	ld	a4,0(a3)
	beq	a4,zero,.L122
	ld	a5,-8(a4)
	srli	a5,a5,10
	beq	a2,a5,.L123
	bgeu	a2,a5,.L120
	mv	a0,a3
	addi	a3,a4,8
	j	.L116
	.size	bf_search_best, .-bf_search_best
	.section	.text.bf_splay,"ax",@progbits
	.align	1
	.type	bf_splay, @function
bf_splay:
	addi	sp,sp,-16
	sd	zero,8(sp)
	sd	zero,0(sp)
	ld	a5,bf_large_tree
	beq	a5,zero,.L124
	mv	a2,sp
	addi	a1,sp,8
	j	.L125
.L129:
	sd	a5,0(a2)
	addi	a2,a5,8
	mv	a5,a4
.L125:
	ld	a4,-8(a5)
	srli	a4,a4,10
	beq	a0,a4,.L127
	bgeu	a0,a4,.L128
	ld	a4,8(a5)
	beq	a4,zero,.L127
	ld	a3,-8(a4)
	srli	a3,a3,10
	bgeu	a0,a3,.L129
	ld	a3,16(a4)
	sd	a3,8(a5)
	sd	a5,16(a4)
	ld	a3,8(a4)
	beq	a3,zero,.L133
	mv	a5,a4
	mv	a4,a3
	j	.L129
.L128:
	ld	a4,16(a5)
	beq	a4,zero,.L127
	ld	a3,-8(a4)
	srli	a3,a3,10
	bleu	a0,a3,.L131
	ld	a3,8(a4)
	sd	a3,16(a5)
	sd	a5,8(a4)
	ld	a3,16(a4)
	beq	a3,zero,.L134
	mv	a5,a4
	mv	a4,a3
.L131:
	sd	a5,0(a1)
	addi	a1,a5,16
	mv	a5,a4
	j	.L125
.L133:
	mv	a5,a4
.L127:
	ld	a4,8(a5)
	sd	a4,0(a1)
	ld	a4,16(a5)
	sd	a4,0(a2)
	ld	a4,8(sp)
	sd	a4,8(a5)
	ld	a4,0(sp)
	sd	a4,16(a5)
	sd	a5,bf_large_tree,a4
.L124:
	addi	sp,sp,16
	jr	ra
.L134:
	mv	a5,a4
	j	.L127
	.size	bf_splay, .-bf_splay
	.section	.text.bf_splay_least,"ax",@progbits
	.align	1
	.type	bf_splay_least, @function
bf_splay_least:
	addi	sp,sp,-16
	sd	zero,8(sp)
	ld	a4,0(a0)
	addi	a3,sp,8
.L138:
	ld	a5,8(a4)
	beq	a5,zero,.L137
	ld	a2,16(a5)
	sd	a2,8(a4)
	sd	a4,16(a5)
	ld	a4,8(a5)
	beq	a4,zero,.L139
	sd	a5,0(a3)
	addi	a3,a5,8
	j	.L138
.L139:
	mv	a4,a5
.L137:
	ld	a5,16(a4)
	sd	a5,0(a3)
	ld	a5,8(sp)
	sd	a5,16(a4)
	sd	a4,0(a0)
	addi	sp,sp,16
	jr	ra
	.size	bf_splay_least, .-bf_splay_least
	.section	.text.bf_remove_node,"ax",@progbits
	.align	1
	.type	bf_remove_node, @function
bf_remove_node:
	ld	a5,0(a0)
	beq	a5,zero,.L149
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	mv	s0,a0
	ld	a4,bf_large_least
	beq	a4,a5,.L152
.L144:
	ld	s1,8(a5)
	ld	a5,16(a5)
	sd	a5,8(sp)
	beq	s1,zero,.L153
	beq	a5,zero,.L154
	addi	a0,sp,8
	call	bf_splay_least
	ld	a5,8(sp)
	sd	s1,8(a5)
	sd	a5,0(s0)
.L141:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	addi	sp,sp,48
	jr	ra
.L152:
	sd	zero,bf_large_least,a4
	j	.L144
.L153:
	sd	a5,0(s0)
	j	.L141
.L154:
	sd	s1,0(s0)
	j	.L141
.L149:
	ret
	.size	bf_remove_node, .-bf_remove_node
	.section	.text.bf_insert_block,"ax",@progbits
	.align	1
	.type	bf_insert_block, @function
bf_insert_block:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	ld	s1,-8(a0)
	srli	s1,s1,10
	mv	a0,s1
	call	bf_search
	ld	a5,0(a0)
	ld	a4,bf_large_least
	beq	a4,zero,.L156
	ld	a4,-8(a4)
	srli	a4,a4,10
	bgeu	s1,a4,.L157
	sd	s0,bf_large_least,a4
.L156:
	beq	a5,zero,.L161
	sw	zero,0(s0)
	ld	a4,24(a5)
	sd	a4,24(s0)
	sd	a5,32(s0)
	ld	a4,24(a5)
	sd	s0,32(a4)
	sd	s0,24(a5)
	mv	a0,s1
	call	bf_splay
.L155:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L157:
	bne	s1,a4,.L156
	sd	zero,bf_large_least,a4
	j	.L156
.L161:
	li	a5,1
	sw	a5,0(s0)
	sd	zero,16(s0)
	sd	zero,8(s0)
	sd	s0,32(s0)
	sd	s0,24(s0)
	sd	s0,0(a0)
	j	.L155
	.size	bf_insert_block, .-bf_insert_block
	.section	.text.bf_insert_remnant_small,"ax",@progbits
	.align	1
	.type	bf_insert_remnant_small, @function
bf_insert_remnant_small:
	addi	a4,a0,-8
	ld	a5,-8(a0)
	srli	a5,a5,10
	beq	a5,zero,.L162
	lw	a2,caml_gc_phase
	li	a3,2
	beq	a2,a3,.L166
.L164:
	lla	a3,caml_fl_cur_wsz
	ld	a4,0(a3)
	add	a4,a5,a4
	addi	a4,a4,1
	sd	a4,0(a3)
	slli	a3,a5,4
	lla	a4,.LANCHOR1
	add	a4,a4,a3
	ld	a3,0(a4)
	sd	a3,0(a0)
	sd	a0,0(a4)
	ld	a3,8(a4)
	beq	a3,a4,.L167
.L165:
	addiw	a5,a5,-1
	li	a4,1
	sllw	a5,a4,a5
	lla	a4,bf_small_map
	lw	a3,0(a4)
	or	a5,a5,a3
	sw	a5,0(a4)
.L162:
	ret
.L166:
	ld	a3,caml_gc_sweep_hp
	bgeu	a4,a3,.L162
	j	.L164
.L167:
	slli	a3,a5,4
	lla	a4,.LANCHOR1
	add	a4,a4,a3
	sd	a0,8(a4)
	j	.L165
	.size	bf_insert_remnant_small, .-bf_insert_remnant_small
	.section	.text.bf_insert_remnant,"ax",@progbits
	.align	1
	.type	bf_insert_remnant, @function
bf_insert_remnant:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	ld	s0,-8(a0)
	srli	s0,s0,10
	li	a5,16
	bgtu	s0,a5,.L169
	call	bf_insert_remnant_small
.L168:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L169:
	call	bf_insert_block
	lla	a5,caml_fl_cur_wsz
	ld	a4,0(a5)
	add	s0,s0,a4
	addi	s0,s0,1
	sd	s0,0(a5)
	j	.L168
	.size	bf_insert_remnant, .-bf_insert_remnant
	.section	.text.bf_insert_sweep,"ax",@progbits
	.align	1
	.type	bf_insert_sweep, @function
bf_insert_sweep:
	ld	a3,-8(a0)
	srli	a3,a3,10
	li	a5,16
	bgtu	a3,a5,.L173
.L176:
	slli	a4,a3,4
	lla	a5,.LANCHOR1
	add	a5,a5,a4
	ld	a5,8(a5)
	ld	a5,0(a5)
	beq	a5,zero,.L181
	bgeu	a5,a0,.L175
	slli	a2,a3,4
	lla	a4,.LANCHOR1
	add	a4,a4,a2
	sd	a5,8(a4)
	j	.L176
.L181:
	addiw	a4,a3,-1
	li	a2,1
	sllw	a4,a2,a4
	lla	a2,bf_small_map
	lw	a1,0(a2)
	or	a4,a4,a1
	sw	a4,0(a2)
.L175:
	sd	a5,0(a0)
	slli	a3,a3,4
	lla	a5,.LANCHOR1
	add	a3,a5,a3
	ld	a5,8(a3)
	sd	a0,0(a5)
	sd	a0,8(a3)
	ret
.L173:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	bf_insert_block
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	bf_insert_sweep, .-bf_insert_sweep
	.section	.text.bf_remove,"ax",@progbits
	.align	1
	.type	bf_remove, @function
bf_remove:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	ld	a4,-8(a0)
	srli	a4,a4,10
	li	a5,16
	bleu	a4,a5,.L183
	lw	a5,0(a0)
	bne	a5,zero,.L191
	ld	a4,24(a0)
	ld	a5,32(a0)
	sd	a5,32(a4)
	ld	a4,24(a0)
	sd	a4,24(a5)
.L182:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L183:
	slli	a3,a4,4
	lla	a5,.LANCHOR1
	add	a5,a5,a3
	ld	a5,8(a5)
	ld	a3,0(a5)
	beq	a3,s0,.L192
	slli	a2,a4,4
	lla	a5,.LANCHOR1
	add	a5,a5,a2
	sd	a3,8(a5)
	j	.L183
.L192:
	ld	a3,0(s0)
	sd	a3,0(a5)
	slli	a3,a4,4
	lla	a5,.LANCHOR1
	add	a5,a5,a3
	ld	a5,0(a5)
	bne	a5,zero,.L182
	addiw	a4,a4,-1
	li	a5,1
	sllw	a5,a5,a4
	not	a5,a5
	sext.w	a5,a5
	lla	a4,bf_small_map
	lw	a3,0(a4)
	and	a5,a5,a3
	sw	a5,0(a4)
	j	.L182
.L191:
	ld	a0,-8(a0)
	srli	a0,a0,10
	call	bf_search
	ld	a5,32(s0)
	beq	a5,s0,.L193
	ld	a4,24(s0)
	sd	a4,24(a5)
	ld	a4,24(s0)
	sd	a5,32(a4)
	sd	a5,0(a0)
	li	a4,1
	sw	a4,0(a5)
	ld	a4,8(s0)
	sd	a4,8(a5)
	ld	a4,16(s0)
	sd	a4,16(a5)
	j	.L182
.L193:
	call	bf_remove_node
	j	.L182
	.size	bf_remove, .-bf_remove
	.section	.text.bf_split_small,"ax",@progbits
	.align	1
	.type	bf_split_small, @function
bf_split_small:
	ld	a5,-8(a1)
	srli	a5,a5,10
	addi	a5,a5,1
	sub	a0,a5,a0
	addi	a4,a0,-1
	lla	a2,caml_fl_cur_wsz
	ld	a3,0(a2)
	sub	a5,a3,a5
	sd	a5,0(a2)
	addi	a5,a0,-2
	slli	a5,a5,10
	addi	a5,a5,251
	sd	a5,-8(a1)
	slli	a0,a4,3
	add	a0,a0,a1
	addi	a0,a0,-8
	ret
	.size	bf_split_small, .-bf_split_small
	.section	.text.bf_split,"ax",@progbits
	.align	1
	.type	bf_split, @function
bf_split:
	ld	a5,-8(a1)
	srli	a4,a5,10
	sub	a0,a4,a0
	lla	a3,caml_fl_cur_wsz
	ld	a5,0(a3)
	sub	a5,a5,a4
	addi	a5,a5,-1
	sd	a5,0(a3)
	li	a5,17
	bgtu	a0,a5,.L196
	addi	a5,a0,-1
	slli	a5,a5,10
	addi	a5,a5,251
	sd	a5,-8(a1)
.L197:
	slli	a0,a0,3
	add	a0,a0,a1
	addi	a0,a0,-8
	ret
.L196:
	addi	a5,a0,-1
	slli	a5,a5,10
	addi	a5,a5,512
	sd	a5,-8(a1)
	j	.L197
	.size	bf_split, .-bf_split
	.section	.text.bf_alloc_from_large,"ax",@progbits
	.align	1
	.type	bf_alloc_from_large, @function
bf_alloc_from_large:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	sd	s4,16(sp)
	sd	s5,8(sp)
	mv	s1,a0
	mv	s5,a3
	ld	s0,0(a1)
	ld	s3,-8(s0)
	srli	s3,s3,10
	ld	s2,32(s0)
	beq	s2,s0,.L207
	ld	a5,32(s2)
	sd	a5,32(s0)
	ld	a5,32(s2)
	sd	s0,24(a5)
	bne	s3,a0,.L204
	lla	a5,caml_fl_cur_wsz
	ld	a0,0(a5)
	sub	s1,a0,s1
	addi	s1,s1,-1
	sd	s1,0(a5)
	addi	s4,s2,-8
.L198:
	mv	a0,s4
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	ld	s4,16(sp)
	ld	s5,8(sp)
	addi	sp,sp,64
	jr	ra
.L207:
	add	a2,a0,a2
	addi	a2,a2,1
	bgeu	a2,s3,.L200
	beq	a3,zero,.L201
	sd	s0,bf_large_least,a5
.L201:
	mv	a1,s0
	mv	a0,s1
	call	bf_split
	mv	s4,a0
	sub	s3,s3,s1
	lla	a5,caml_fl_cur_wsz
	ld	s1,0(a5)
	add	s1,s1,s3
	sd	s1,0(a5)
	j	.L198
.L200:
	mv	a0,a1
	call	bf_remove_node
	bne	s3,s1,.L203
	lla	a5,caml_fl_cur_wsz
	ld	a0,0(a5)
	sub	s1,a0,s1
	addi	s1,s1,-1
	sd	s1,0(a5)
	addi	s4,s0,-8
	j	.L198
.L203:
	mv	a1,s0
	mv	a0,s1
	call	bf_split
	mv	s4,a0
	mv	a0,s0
	call	bf_insert_remnant
	j	.L198
.L204:
	mv	a1,s2
	call	bf_split
	mv	s4,a0
	mv	a0,s2
	call	bf_insert_remnant
	beq	s5,zero,.L198
	ld	a5,-8(s2)
	srli	a5,a5,10
	li	a4,16
	bleu	a5,a4,.L198
	sd	s2,bf_large_least,a5
	j	.L198
	.size	bf_alloc_from_large, .-bf_alloc_from_large
	.section	.text.bf_allocate_from_tree,"ax",@progbits
	.align	1
	.type	bf_allocate_from_tree, @function
bf_allocate_from_tree:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	mv	s0,a0
	mv	s1,a1
	addi	a1,sp,8
	call	bf_search_best
	beq	a0,zero,.L208
	mv	a3,s1
	ld	a2,8(sp)
	mv	a1,a0
	mv	a0,s0
	call	bf_alloc_from_large
.L208:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	addi	sp,sp,48
	jr	ra
	.size	bf_allocate_from_tree, .-bf_allocate_from_tree
	.section	.text.bf_allocate,"ax",@progbits
	.align	1
	.type	bf_allocate, @function
bf_allocate:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s0,a0
	li	a5,16
	bgtu	a0,a5,.L212
	slli	a4,a0,4
	lla	a5,.LANCHOR1
	add	a5,a5,a4
	ld	a0,0(a5)
	bne	a0,zero,.L230
	li	a5,-1
	sllw	a5,a5,s0
	lw	a1,bf_small_map
	and	a5,a5,a1
	negw	a4,a5
	and	a5,a5,a4
	snez	a4,a5
	sext.w	a3,a5
	li	a2,-65536
	and	a5,a5,a2
	sext.w	a5,a5
	beq	a5,zero,.L225
	li	a0,16
.L217:
	li	a2,-16711680
	addi	a2,a2,-256
	and	a2,a3,a2
	beq	a2,zero,.L226
	li	a6,8
.L218:
	li	a2,-252645376
	addi	a2,a2,240
	and	a2,a3,a2
	beq	a2,zero,.L227
	li	a7,4
.L219:
	li	a2,-858992640
	addi	a2,a2,-820
	and	a2,a3,a2
	beq	a2,zero,.L228
	li	t1,2
.L220:
	li	a2,-1431654400
	addi	a2,a2,-1366
	and	a3,a3,a2
	sext.w	a5,a3
	snez	a5,a5
	addw	a5,a4,a5
	addw	a5,a5,t1
	addw	a5,a5,a7
	addw	a5,a5,a6
	addw	a5,a5,a0
	sext.w	a4,a5
	bne	a4,zero,.L231
	ld	a1,bf_large_least
	beq	a1,zero,.L224
	ld	s2,-8(a1)
	srli	s2,s2,10
	addi	a5,s0,17
	bltu	a5,s2,.L232
.L224:
	li	a1,1
	mv	a0,s0
	call	bf_allocate_from_tree
	mv	s1,a0
	j	.L211
.L230:
	lla	a5,.LANCHOR1
	add	a5,a5,a4
	ld	a5,8(a5)
	beq	a5,a0,.L233
.L214:
	ld	a4,0(a0)
	slli	a3,s0,4
	lla	a5,.LANCHOR1
	add	a5,a5,a3
	sd	a4,0(a5)
	bne	a4,zero,.L215
	addiw	a4,s0,-1
	li	a5,1
	sllw	a5,a5,a4
	not	a5,a5
	sext.w	a5,a5
	lla	a4,bf_small_map
	lw	a3,0(a4)
	and	a5,a5,a3
	sw	a5,0(a4)
.L215:
	lla	a4,caml_fl_cur_wsz
	ld	a5,0(a4)
	sub	s0,a5,s0
	addi	s0,s0,-1
	sd	s0,0(a4)
	addi	s1,a0,-8
.L211:
	mv	a0,s1
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L233:
	lla	a5,.LANCHOR1
	add	a5,a5,a4
	sd	a5,8(a5)
	j	.L214
.L225:
	li	a0,0
	j	.L217
.L226:
	li	a6,0
	j	.L218
.L227:
	li	a7,0
	j	.L219
.L228:
	li	t1,0
	j	.L220
.L231:
	slli	a2,a4,4
	lla	a3,.LANCHOR1
	add	a3,a3,a2
	ld	s2,0(a3)
	ld	a3,8(a3)
	beq	a3,s2,.L234
.L222:
	ld	a2,0(s2)
	slli	a4,a4,4
	lla	a3,.LANCHOR1
	add	a4,a3,a4
	sd	a2,0(a4)
	bne	a2,zero,.L223
	addiw	a5,a5,-1
	li	a4,1
	sllw	a5,a4,a5
	not	a5,a5
	sext.w	a5,a5
	and	a1,a1,a5
	sw	a1,bf_small_map,a5
.L223:
	mv	a1,s2
	mv	a0,s0
	call	bf_split_small
	mv	s1,a0
	mv	a0,s2
	call	bf_insert_remnant_small
	j	.L211
.L234:
	lla	a3,.LANCHOR1
	add	a3,a3,a2
	sd	a3,8(a3)
	j	.L222
.L232:
	mv	a0,s0
	call	bf_split
	mv	s1,a0
	sub	s0,s2,s0
	lla	a5,caml_fl_cur_wsz
	ld	s2,0(a5)
	add	s0,s2,s0
	sd	s0,0(a5)
	j	.L211
.L212:
	li	a1,0
	call	bf_allocate_from_tree
	mv	s1,a0
	j	.L211
	.size	bf_allocate, .-bf_allocate
	.section	.text.bf_init_merge,"ax",@progbits
	.align	1
	.type	bf_init_merge, @function
bf_init_merge:
	sd	zero,caml_fl_merge,a5
	li	a1,1
	j	.L236
.L242:
	addiw	a4,a1,-1
	li	a5,1
	sllw	a5,a5,a4
	not	a5,a5
	sext.w	a5,a5
	lla	a4,bf_small_map
	lw	a2,0(a4)
	and	a5,a5,a2
	sw	a5,0(a4)
.L238:
	slli	a4,a1,4
	lla	a5,.LANCHOR1
	add	a5,a5,a4
	sd	a3,0(a5)
	sd	a5,8(a5)
	addi	a1,a1,1
.L236:
	li	a5,16
	bgtu	a1,a5,.L241
	slli	a4,a1,4
	lla	a5,.LANCHOR1
	add	a5,a5,a4
	ld	a3,0(a5)
.L239:
	beq	a3,zero,.L242
	ld	a5,-8(a3)
	andi	a2,a5,768
	li	a4,512
	beq	a2,a4,.L238
	srli	a4,a5,10
	lla	a2,caml_fl_cur_wsz
	ld	a5,0(a2)
	sub	a5,a5,a4
	addi	a5,a5,-1
	sd	a5,0(a2)
	ld	a3,0(a3)
	j	.L239
.L241:
	ret
	.size	bf_init_merge, .-bf_init_merge
	.section	.text.bf_init,"ax",@progbits
	.align	1
	.type	bf_init, @function
bf_init:
	li	a4,1
.L244:
	li	a5,16
	bgtu	a4,a5,.L246
	slli	a3,a4,4
	lla	a5,.LANCHOR1
	add	a5,a5,a3
	sd	zero,0(a5)
	sd	a5,8(a5)
	addi	a4,a4,1
	j	.L244
.L246:
	sw	zero,bf_small_map,a5
	sd	zero,bf_large_tree,a5
	sd	zero,bf_large_least,a5
	sd	zero,caml_fl_cur_wsz,a5
	ret
	.size	bf_init, .-bf_init
	.section	.text.bf_reset,"ax",@progbits
	.align	1
	.type	bf_reset, @function
bf_reset:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a1,1
	j	.L248
.L249:
	addi	a1,a1,1
.L248:
	li	a5,16
	bgtu	a1,a5,.L253
	slli	a4,a1,4
	lla	a5,.LANCHOR1
	add	a5,a5,a4
	ld	a4,0(a5)
.L250:
	beq	a4,zero,.L249
	ld	a5,-8(a4)
	andi	a2,a5,768
	li	a3,512
	beq	a2,a3,.L249
	andi	a5,a5,-769
	ori	a5,a5,512
	sd	a5,-8(a4)
	ld	a4,0(a4)
	j	.L250
.L253:
	call	bf_init
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	bf_reset, .-bf_reset
	.section	.text.bf_merge_block,"ax",@progbits
	.align	1
	.type	bf_merge_block, @function
bf_merge_block:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	sd	s4,0(sp)
	mv	s3,a0
	mv	s4,a1
	ld	s0,caml_fl_merge
	beq	s0,zero,.L265
	ld	a4,-8(s0)
	srli	a5,a4,10
	slli	a5,a5,3
	add	a5,a5,s0
	addi	a5,a5,8
	beq	a0,a5,.L269
	mv	s0,a0
	j	.L256
.L269:
	andi	a4,a4,768
	li	a5,512
	beq	a4,a5,.L270
	mv	s0,a0
	j	.L256
.L270:
	mv	a0,s0
	call	bf_remove
	j	.L256
.L265:
	mv	s0,a0
	j	.L256
.L257:
	ld	a5,0(s1)
	srli	a5,a5,10
	lla	a4,caml_fl_cur_wsz
	ld	a3,0(a4)
	add	a5,a5,a3
	addi	a5,a5,1
	sd	a5,0(a4)
.L258:
	ld	a5,-8(s3)
	srli	a5,a5,10
	slli	a5,a5,3
	add	a5,a5,s3
	addi	s3,a5,8
	mv	s1,s3
	mv	s2,a5
	bgeu	a5,s4,.L259
	ld	a5,0(a5)
	andi	a5,a5,768
	li	a4,512
	beq	a5,a4,.L260
	li	a4,768
	beq	a5,a4,.L259
	li	a4,256
	beq	a5,a4,.L259
.L256:
	addi	s1,s3,-8
	lbu	a4,-8(s3)
	li	a5,255
	bne	a4,a5,.L257
	ld	a5,0(s3)
	ld	a5,8(a5)
	beq	a5,zero,.L257
	mv	a0,s3
	jalr	a5
	j	.L257
.L260:
	mv	a0,s3
	call	bf_remove
	j	.L258
.L259:
	sub	s1,s1,s0
	srai	s1,s1,3
	addi	s1,s1,-1
	j	.L261
.L262:
	li	a5,-512
	sd	a5,-8(s0)
	mv	a0,s0
	call	bf_insert_sweep
	ld	a0,-8(s0)
	srli	a0,a0,10
	slli	a0,a0,3
	add	a0,a0,s0
	addi	s0,a0,8
	li	a5,-1
	slli	a5,a5,54
	add	s1,s1,a5
.L261:
	li	a5,-1
	srli	a5,a5,10
	bgtu	s1,a5,.L262
	bne	s1,zero,.L271
	sd	zero,-8(s0)
	lla	a4,caml_fl_cur_wsz
	ld	a5,0(a4)
	addi	a5,a5,-1
	sd	a5,0(a4)
.L254:
	mv	a0,s2
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	ld	s4,0(sp)
	addi	sp,sp,48
	jr	ra
.L271:
	slli	s1,s1,10
	addi	s1,s1,512
	sd	s1,-8(s0)
	mv	a0,s0
	call	bf_insert_sweep
	j	.L254
	.size	bf_merge_block, .-bf_merge_block
	.section	.text.bf_add_blocks,"ax",@progbits
	.align	1
	.type	bf_add_blocks, @function
bf_add_blocks:
	beq	a0,zero,.L280
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	j	.L276
.L274:
	andi	a5,a5,-1024
	addi	a5,a5,251
	sd	a5,-8(a0)
	call	bf_insert_remnant_small
.L275:
	mv	a0,s0
	beq	s0,zero,.L281
.L276:
	ld	s0,0(a0)
	ld	a5,-8(a0)
	srli	a4,a5,10
	li	a3,16
	bleu	a4,a3,.L274
	lla	a5,caml_fl_cur_wsz
	ld	a3,0(a5)
	add	a4,a4,a3
	addi	a4,a4,1
	sd	a4,0(a5)
	call	bf_insert_block
	j	.L275
.L281:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L280:
	ret
	.size	bf_add_blocks, .-bf_add_blocks
	.section	.text.bf_make_free_blocks,"ax",@progbits
	.align	1
	.type	bf_make_free_blocks, @function
bf_make_free_blocks:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	sd	s4,0(sp)
	mv	s2,a0
	mv	s1,a1
	mv	s4,a2
	mv	s3,a3
	j	.L283
.L289:
	mv	s0,s1
	j	.L284
.L290:
	li	s3,512
.L286:
	slli	a5,a5,10
	add	a5,s3,a5
	sd	a5,0(s2)
	addi	a0,s2,8
	call	bf_insert_remnant
.L287:
	sub	s1,s1,s0
	slli	s0,s0,3
	add	s2,s2,s0
.L283:
	beq	s1,zero,.L292
	li	a5,1
	slli	a5,a5,54
	bleu	s1,a5,.L289
	mv	s0,a5
.L284:
	addi	a5,s0,-1
	beq	s4,zero,.L285
	li	a4,16
	bgtu	a5,a4,.L290
	li	s3,0
	j	.L286
.L285:
	slli	a5,a5,10
	add	a5,s3,a5
	sd	a5,0(s2)
	j	.L287
.L292:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	ld	s4,0(sp)
	addi	sp,sp,48
	jr	ra
	.size	bf_make_free_blocks, .-bf_make_free_blocks
	.section	.text.ff_allocate,"ax",@progbits
	.align	1
	.type	ff_allocate, @function
ff_allocate:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	li	t1,-8192
	addi	t1,t1,192
	add	sp,sp,t1
	li	s1,0
.L294:
	lw	a5,flp_size
	ble	a5,s1,.L329
	slli	a4,s1,3
	lla	a5,flp
	add	a5,a5,a4
	ld	a2,0(a5)
	ld	a3,0(a2)
	ld	s0,-8(a3)
	srli	s0,s0,10
	bleu	a0,s0,.L330
	addiw	s1,s1,1
	j	.L294
.L330:
	mv	a1,s1
	addi	a0,a0,1
	call	ff_allocate_block
	mv	s3,a0
.L296:
	lw	a6,flp_size
	ble	a6,s1,.L293
	ble	s1,zero,.L326
	addiw	a5,s1,-1
	slli	a4,a5,3
	lla	a5,flp
	add	a5,a5,a4
	ld	a5,0(a5)
	ld	a5,0(a5)
	ld	a1,-8(a5)
	srli	a1,a1,10
.L311:
	addiw	a5,a6,-1
	sext.w	a4,a5
	beq	a4,s1,.L331
	slli	a4,s1,3
	lla	a5,flp
	add	a5,a5,a4
	ld	a4,0(a5)
	li	s2,0
	j	.L314
.L329:
	bne	a5,zero,.L298
	lla	a2,.LANCHOR0+48
	li	a3,0
.L300:
	li	a5,0
	j	.L299
.L298:
	addiw	a5,a5,-1
	slli	a5,a5,3
	lla	a4,flp
	add	a5,a4,a5
	ld	a5,0(a5)
	ld	a5,0(a5)
	ld	a3,-8(a5)
	srli	a3,a3,10
	ld	a2,beyond
	bne	a2,zero,.L300
	mv	a2,a5
	j	.L300
.L333:
	sd	a2,ff_last,a4
	lla	a4,.LANCHOR0+48
	beq	a4,a2,.L302
	mv	a5,a2
.L302:
	sd	a5,beyond,a4
	li	s3,0
.L293:
	mv	a0,s3
	li	t1,8192
	addi	t1,t1,-192
	add	sp,sp,t1
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	addi	sp,sp,64
	jr	ra
.L334:
	sd	a5,beyond,a4
	mv	a3,a5
	mv	a1,s1
	addi	a0,a0,1
	call	ff_allocate_block
	mv	s3,a0
	j	.L296
.L304:
	mv	a2,a5
.L299:
	lw	s1,flp_size
	li	a4,999
	bgt	s1,a4,.L332
	ld	a5,0(a2)
	beq	a5,zero,.L333
	ld	s0,-8(a5)
	srli	s0,s0,10
	bgeu	a3,s0,.L304
	slli	a3,s1,3
	lla	a4,flp
	add	a4,a4,a3
	sd	a2,0(a4)
	addiw	a4,s1,1
	sw	a4,flp_size,a3
	bleu	a0,s0,.L334
	mv	a3,s0
	j	.L304
.L332:
	sd	a5,beyond,a4
	bne	a5,zero,.L306
	addiw	a5,s1,-1
	slli	a4,a5,3
	lla	a5,flp
	add	a5,a5,a4
	ld	a5,0(a5)
.L306:
	ld	a4,flp+7992
	ld	a4,0(a4)
	ld	a2,-8(a4)
	srli	a2,a2,10
	ld	a3,0(a5)
	j	.L307
.L308:
	bgeu	a4,a0,.L335
.L309:
	mv	a5,a3
	ld	a3,0(a3)
.L307:
	beq	a3,zero,.L336
	ld	a4,-8(a3)
	srli	a4,a4,10
	bleu	a2,a4,.L308
	sd	a3,beyond,a5
	j	.L309
.L335:
	mv	a2,a5
	mv	a1,s1
	addi	a0,a0,1
	call	ff_allocate_block
	mv	s3,a0
	j	.L293
.L336:
	sd	a5,ff_last,a4
	li	s3,0
	j	.L293
.L326:
	li	a1,0
	j	.L311
.L331:
	slli	s1,s1,3
	lla	a4,flp
	add	a4,a4,s1
	ld	a4,0(a4)
	ld	a3,0(a4)
	ld	a4,-8(a3)
	srli	a4,a4,10
	bgtu	a4,a1,.L313
	sd	a3,beyond,a4
	sw	a5,flp_size,a4
	j	.L293
.L313:
	sd	zero,beyond,a5
	j	.L293
.L315:
	mv	a4,a3
.L314:
	addiw	a2,s1,1
	slli	a3,a2,3
	lla	a5,flp
	add	a5,a5,a3
	ld	a5,0(a5)
	beq	a5,a4,.L316
	li	a5,1000
	subw	a5,a5,s1
	ble	a5,s2,.L316
	ld	a3,0(a4)
	ld	a5,-8(a3)
	srli	a5,a5,10
	bgeu	a1,a5,.L315
	addiw	a0,s2,1
	li	a1,-8192
	slli	s2,s2,3
	li	a7,8192
	addi	a7,a7,-192
	addi	t1,sp,16
	add	a7,a7,t1
	add	a1,a7,a1
	sd	a1,8(sp)
	add	s2,a1,s2
	sd	a4,192(s2)
	bleu	s0,a5,.L327
	mv	s2,a0
	mv	a1,a5
	j	.L315
.L327:
	mv	s2,a0
.L316:
	addw	a5,a6,s2
	addiw	s0,a5,-1
	sext.w	a4,s0
	li	a5,1000
	bgt	a4,a5,.L318
	li	a5,1
	bne	s2,a5,.L337
.L319:
	bgt	s2,zero,.L338
.L320:
	sw	s0,flp_size,a5
	j	.L293
.L337:
	addw	a5,s1,s2
	slli	a5,a5,3
	lla	a0,flp
	slli	a1,a2,3
	subw	a2,a6,s1
	addiw	a2,a2,-1
	slli	a2,a2,3
	add	a1,a0,a1
	add	a0,a0,a5
	call	memmove
	j	.L319
.L338:
	slli	s1,s1,3
	slli	a2,s2,3
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
	j	.L320
.L318:
	addw	a4,s1,s2
	sext.w	a5,a4
	li	a3,999
	bgt	a5,a3,.L322
	li	a3,1
	bne	s2,a3,.L339
.L323:
	bgt	s2,zero,.L340
.L324:
	li	a5,999
	sw	a5,flp_size,a4
	ld	a5,flp+7992
	ld	a5,0(a5)
	sd	a5,beyond,a4
	j	.L293
.L339:
	slli	a5,a5,3
	lla	a0,flp
	slli	a1,a2,3
	li	a3,1000
	subw	a4,a3,a4
	slli	a2,a4,3
	add	a1,a0,a1
	add	a0,a0,a5
	call	memmove
	j	.L323
.L340:
	slli	s1,s1,3
	slli	a2,s2,3
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
	j	.L324
.L322:
	li	a5,1000
	beq	s1,a5,.L324
	slli	a5,s1,3
	li	a2,1000
	subw	a2,a2,s1
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
	j	.L324
	.size	ff_allocate, .-ff_allocate
	.section	.text.caml_set_allocation_policy,"ax",@progbits
	.align	1
	.globl	caml_set_allocation_policy
	.type	caml_set_allocation_policy, @function
caml_set_allocation_policy:
	li	a5,1
	beq	a0,a5,.L342
	li	a5,2
	beq	a0,a5,.L343
	sd	zero,caml_allocation_policy,a5
	lla	a5,nf_allocate
	sd	a5,caml_fl_p_allocate,a4
	lla	a5,nf_init_merge
	sd	a5,caml_fl_p_init_merge,a4
	lla	a5,nf_reset
	sd	a5,caml_fl_p_reset,a4
	lla	a5,nf_init
	sd	a5,caml_fl_p_init,a4
	lla	a5,nf_merge_block
	sd	a5,caml_fl_p_merge_block,a4
	lla	a5,nf_add_blocks
	sd	a5,caml_fl_p_add_blocks,a4
	lla	a5,nf_make_free_blocks
	sd	a5,caml_fl_p_make_free_blocks,a4
	ret
.L342:
	li	a5,1
	sd	a5,caml_allocation_policy,a4
	lla	a5,ff_allocate
	sd	a5,caml_fl_p_allocate,a4
	lla	a5,ff_init_merge
	sd	a5,caml_fl_p_init_merge,a4
	lla	a5,ff_reset
	sd	a5,caml_fl_p_reset,a4
	lla	a5,ff_init
	sd	a5,caml_fl_p_init,a4
	lla	a5,ff_merge_block
	sd	a5,caml_fl_p_merge_block,a4
	lla	a5,ff_add_blocks
	sd	a5,caml_fl_p_add_blocks,a4
	lla	a5,ff_make_free_blocks
	sd	a5,caml_fl_p_make_free_blocks,a4
	ret
.L343:
	li	a5,2
	sd	a5,caml_allocation_policy,a4
	lla	a5,bf_allocate
	sd	a5,caml_fl_p_allocate,a4
	lla	a5,bf_init_merge
	sd	a5,caml_fl_p_init_merge,a4
	lla	a5,bf_reset
	sd	a5,caml_fl_p_reset,a4
	lla	a5,bf_init
	sd	a5,caml_fl_p_init,a4
	lla	a5,bf_merge_block
	sd	a5,caml_fl_p_merge_block,a4
	lla	a5,bf_add_blocks
	sd	a5,caml_fl_p_add_blocks,a4
	lla	a5,bf_make_free_blocks
	sd	a5,caml_fl_p_make_free_blocks,a4
	ret
	.size	caml_set_allocation_policy, .-caml_set_allocation_policy
	.section	.text.caml_fl_reset_and_switch_policy,"ax",@progbits
	.align	1
	.globl	caml_fl_reset_and_switch_policy
	.type	caml_fl_reset_and_switch_policy, @function
caml_fl_reset_and_switch_policy:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	ld	a5,caml_fl_p_reset
	jalr	a5
	li	a5,-1
	bne	s0,a5,.L348
.L345:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L348:
	mv	a0,s0
	call	caml_set_allocation_policy
	ld	a5,caml_fl_p_init
	jalr	a5
	j	.L345
	.size	caml_fl_reset_and_switch_policy, .-caml_fl_reset_and_switch_policy
	.globl	caml_fl_p_make_free_blocks
	.globl	caml_fl_p_add_blocks
	.globl	caml_fl_p_merge_block
	.globl	caml_fl_p_init_merge
	.globl	caml_fl_p_allocate
	.globl	caml_allocation_policy
	.globl	caml_fl_merge
	.globl	caml_fl_cur_wsz
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	nf_sentinel, @object
	.size	nf_sentinel, 32
nf_sentinel:
	.dword	0
	.dword	512
	.dword	0
	.dword	0
	.type	ff_sentinel, @object
	.size	ff_sentinel, 32
ff_sentinel:
	.dword	0
	.dword	512
	.dword	0
	.dword	0
	.bss
	.align	3
	.set	.LANCHOR1,. + 0
	.type	bf_small_fl, @object
	.size	bf_small_fl, 272
bf_small_fl:
	.zero	272
	.type	flp, @object
	.size	flp, 8000
flp:
	.zero	8000
	.section	.sbss,"aw",@nobits
	.align	3
	.type	caml_allocation_policy, @object
	.size	caml_allocation_policy, 8
caml_allocation_policy:
	.zero	8
	.type	bf_large_least, @object
	.size	bf_large_least, 8
bf_large_least:
	.zero	8
	.type	bf_large_tree, @object
	.size	bf_large_tree, 8
bf_large_tree:
	.zero	8
	.type	bf_small_map, @object
	.size	bf_small_map, 4
bf_small_map:
	.zero	4
	.zero	4
	.type	ff_last_fragment, @object
	.size	ff_last_fragment, 8
ff_last_fragment:
	.zero	8
	.type	ff_last, @object
	.size	ff_last, 8
ff_last:
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
	.type	nf_last_fragment, @object
	.size	nf_last_fragment, 8
nf_last_fragment:
	.zero	8
	.type	nf_last, @object
	.size	nf_last, 8
nf_last:
	.zero	8
	.type	caml_fl_merge, @object
	.size	caml_fl_merge, 8
caml_fl_merge:
	.zero	8
	.type	caml_fl_cur_wsz, @object
	.size	caml_fl_cur_wsz, 8
caml_fl_cur_wsz:
	.zero	8
	.section	.sdata,"aw"
	.align	3
	.type	caml_fl_p_make_free_blocks, @object
	.size	caml_fl_p_make_free_blocks, 8
caml_fl_p_make_free_blocks:
	.dword	nf_make_free_blocks
	.type	caml_fl_p_add_blocks, @object
	.size	caml_fl_p_add_blocks, 8
caml_fl_p_add_blocks:
	.dword	nf_add_blocks
	.type	caml_fl_p_merge_block, @object
	.size	caml_fl_p_merge_block, 8
caml_fl_p_merge_block:
	.dword	nf_merge_block
	.type	caml_fl_p_reset, @object
	.size	caml_fl_p_reset, 8
caml_fl_p_reset:
	.dword	nf_reset
	.type	caml_fl_p_init, @object
	.size	caml_fl_p_init, 8
caml_fl_p_init:
	.dword	nf_init
	.type	caml_fl_p_init_merge, @object
	.size	caml_fl_p_init_merge, 8
caml_fl_p_init_merge:
	.dword	nf_init_merge
	.type	caml_fl_p_allocate, @object
	.size	caml_fl_p_allocate, 8
caml_fl_p_allocate:
	.dword	nf_allocate
	.type	nf_prev, @object
	.size	nf_prev, 8
nf_prev:
	.dword	nf_sentinel+16
	.ident	"GCC: (GNU) 9.2.0"
