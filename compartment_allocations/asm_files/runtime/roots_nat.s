	.file	"roots_nat.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.count_descriptors,"ax",@progbits
	.align	1
	.type	count_descriptors, @function
count_descriptors:
	mv	a5,a0
	li	a0,0
.L2:
	beq	a5,zero,.L4
	ld	a4,0(a5)
	ld	a4,0(a4)
	add	a0,a0,a4
	ld	a5,8(a5)
	j	.L2
.L4:
	ret
	.size	count_descriptors, .-count_descriptors
	.section	.text.frametables_list_tail,"ax",@progbits
	.align	1
	.type	frametables_list_tail, @function
frametables_list_tail:
	mv	a5,a0
	li	a0,0
.L6:
	beq	a5,zero,.L8
	mv	a0,a5
	ld	a5,8(a5)
	j	.L6
.L8:
	ret
	.size	frametables_list_tail, .-frametables_list_tail
	.section	.text.next_frame_descr,"ax",@progbits
	.align	1
	.type	next_frame_descr, @function
next_frame_descr:
	lhu	a4,10(a0)
	slli	a4,a4,1
	add	a4,a0,a4
	addi	a5,a4,12
	lhu	a3,8(a0)
	andi	a2,a3,2
	beq	a2,zero,.L13
	lbu	a0,12(a4)
	addi	a4,a0,1
	add	a5,a5,a4
.L10:
	andi	a3,a3,1
	beq	a3,zero,.L11
	addi	a5,a5,3
	andi	a5,a5,-4
	beq	a2,zero,.L14
	slli	a0,a0,2
	j	.L12
.L13:
	li	a0,0
	j	.L10
.L14:
	li	a0,4
.L12:
	add	a5,a5,a0
.L11:
	addi	a0,a5,7
	andi	a0,a0,-8
	ret
	.size	next_frame_descr, .-next_frame_descr
	.section	.text.fill_hashtable,"ax",@progbits
	.align	1
	.type	fill_hashtable, @function
fill_hashtable:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s2,a0
	j	.L16
.L19:
	addi	a5,a5,1
	and	a5,a2,a5
.L18:
	slli	a4,a5,3
	ld	a3,caml_frame_descriptors
	add	a4,a3,a4
	ld	a3,0(a4)
	bne	a3,zero,.L19
	sd	a0,0(a4)
	call	next_frame_descr
	addi	s0,s0,1
.L17:
	bge	s0,s1,.L23
	ld	a5,0(a0)
	srli	a5,a5,3
	ld	a2,caml_frame_descriptors_mask
	and	a5,a5,a2
	j	.L18
.L23:
	ld	s2,8(s2)
.L16:
	beq	s2,zero,.L24
	ld	a0,0(s2)
	ld	s1,0(a0)
	addi	a0,a0,8
	li	s0,0
	j	.L17
.L24:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	fill_hashtable, .-fill_hashtable
	.section	.text.remove_entry,"ax",@progbits
	.align	1
	.type	remove_entry, @function
remove_entry:
	ld	a3,0(a0)
	srli	a3,a3,3
	ld	a2,caml_frame_descriptors_mask
	and	a3,a3,a2
.L26:
	slli	a5,a3,3
	ld	a4,caml_frame_descriptors
	add	a5,a4,a5
	ld	a5,0(a5)
	beq	a5,a0,.L28
	addi	a3,a3,1
	and	a3,a2,a3
	j	.L26
.L32:
	bltu	a5,a4,.L33
	bleu	a3,a5,.L33
.L29:
	addi	a5,a5,1
	ld	a4,caml_frame_descriptors_mask
	and	a5,a5,a4
	ld	a0,caml_frame_descriptors
	slli	a2,a5,3
	add	a2,a0,a2
	ld	a1,0(a2)
	beq	a1,zero,.L34
	ld	a2,0(a1)
	srli	a2,a2,3
	and	a4,a4,a2
	bgeu	a3,a4,.L31
	bgeu	a5,a4,.L29
.L31:
	bleu	a3,a5,.L32
	bgeu	a3,a4,.L32
	j	.L29
.L33:
	add	a0,a0,a6
	sd	a1,0(a0)
	mv	a3,a5
.L28:
	slli	a6,a3,3
	ld	a5,caml_frame_descriptors
	add	a5,a5,a6
	sd	zero,0(a5)
	mv	a5,a3
	j	.L29
.L34:
	ret
	.size	remove_entry, .-remove_entry
	.section	.text.cons,"ax",@progbits
	.align	1
	.type	cons, @function
cons:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a0
	mv	s0,a1
	li	a0,16
	call	caml_stat_alloc
	sd	s1,0(a0)
	sd	s0,8(a0)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	cons, .-cons
	.section	.text.init_frame_descriptors,"ax",@progbits
	.align	1
	.type	init_frame_descriptors, @function
init_frame_descriptors:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a0
	call	frametables_list_tail
	mv	s0,a0
	mv	a0,s1
	call	count_descriptors
	ld	a4,caml_frame_descriptors_mask
	addi	a4,a4,1
	ld	a5,num_descr
	add	a5,a0,a5
	slli	a3,a5,1
	ble	a3,a4,.L38
	lla	a5,frametables
	ld	a4,0(a5)
	sd	a4,8(s0)
	sd	zero,0(a5)
	mv	a0,s1
	call	count_descriptors
	sd	a0,num_descr,a5
	li	s0,4
.L39:
	slli	a5,a0,1
	ble	a5,s0,.L46
	slli	s0,s0,1
	j	.L39
.L46:
	addi	a5,s0,-1
	sd	a5,caml_frame_descriptors_mask,a4
	ld	a0,caml_frame_descriptors
	beq	a0,zero,.L41
	call	caml_stat_free
.L41:
	slli	a0,s0,3
	call	caml_stat_alloc
	sd	a0,caml_frame_descriptors,a5
	li	a5,0
	j	.L42
.L43:
	slli	a3,a5,3
	ld	a4,caml_frame_descriptors
	add	a4,a4,a3
	sd	zero,0(a4)
	addi	a5,a5,1
.L42:
	bgt	s0,a5,.L43
	mv	a0,s1
	call	fill_hashtable
.L44:
	sd	s1,frametables,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L38:
	sd	a5,num_descr,a4
	mv	a0,s1
	call	fill_hashtable
	ld	a5,frametables
	sd	a5,8(s0)
	j	.L44
	.size	init_frame_descriptors, .-init_frame_descriptors
	.section	.text.caml_init_frame_descriptors,"ax",@progbits
	.align	1
	.globl	caml_init_frame_descriptors
	.type	caml_init_frame_descriptors, @function
caml_init_frame_descriptors:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	li	a1,0
	li	s0,0
.L48:
	slli	a4,s0,3
	lla	a5,caml_frametable
	add	a5,a5,a4
	ld	a0,0(a5)
	beq	a0,zero,.L51
	call	cons
	mv	a1,a0
	addi	s0,s0,1
	j	.L48
.L51:
	mv	a0,a1
	call	init_frame_descriptors
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_init_frame_descriptors, .-caml_init_frame_descriptors
	.section	.text.caml_register_frametable,"ax",@progbits
	.align	1
	.globl	caml_register_frametable
	.type	caml_register_frametable, @function
caml_register_frametable:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a1,0
	call	cons
	call	init_frame_descriptors
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_register_frametable, .-caml_register_frametable
	.section	.text.caml_unregister_frametable,"ax",@progbits
	.align	1
	.globl	caml_unregister_frametable
	.type	caml_unregister_frametable, @function
caml_unregister_frametable:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	sd	s4,0(sp)
	mv	s2,a0
	ld	s4,frametables
	ld	s3,0(a0)
	addi	s0,a0,8
	li	s1,0
.L55:
	bge	s1,s3,.L62
	mv	a0,s0
	call	remove_entry
	mv	a0,s0
	call	next_frame_descr
	mv	s0,a0
	addi	s1,s1,1
	j	.L55
.L62:
	ld	a0,frametables
.L57:
	beq	a0,zero,.L54
	ld	a5,0(a0)
	beq	a5,s2,.L63
	mv	s4,a0
	ld	a0,8(a0)
	j	.L57
.L63:
	ld	a5,8(a0)
	sd	a5,8(s4)
	call	caml_stat_free
.L54:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	ld	s4,0(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_unregister_frametable, .-caml_unregister_frametable
	.section	.text.caml_register_dyn_global,"ax",@progbits
	.align	1
	.globl	caml_register_dyn_global
	.type	caml_register_dyn_global, @function
caml_register_dyn_global:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	lla	s0,caml_dyn_globals
	ld	a1,0(s0)
	call	cons
	sd	a0,0(s0)
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_register_dyn_global, .-caml_register_dyn_global
	.section	.text.caml_oldify_local_roots,"ax",@progbits
	.align	1
	.globl	caml_oldify_local_roots
	.type	caml_oldify_local_roots, @function
caml_oldify_local_roots:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	sd	s4,0(sp)
	ld	s2,caml_globals_scanned
	j	.L67
.L68:
	addi	s0,s0,1
.L70:
	ld	a4,0(s1)
	ld	a5,-8(a4)
	srli	a5,a5,10
	bleu	a5,s0,.L101
	slli	a1,s0,3
	add	a1,a1,a4
	ld	a0,0(a1)
	andi	a5,a0,1
	bne	a5,zero,.L68
	ld	a5,Caml_state
	ld	a4,40(a5)
	bleu	a4,a0,.L68
	ld	a5,32(a5)
	bleu	a0,a5,.L68
	call	caml_oldify_one
	j	.L68
.L101:
	addi	s1,s1,8
.L72:
	ld	a5,0(s1)
	beq	a5,zero,.L102
	li	s0,0
	j	.L70
.L102:
	addi	s2,s2,1
.L67:
	ld	a4,caml_globals_inited
	blt	a4,s2,.L71
	slli	a3,s2,3
	lla	a5,caml_globals
	add	a5,a5,a3
	ld	s1,0(a5)
	bne	s1,zero,.L72
.L71:
	sd	a4,caml_globals_scanned,a5
	ld	s2,caml_dyn_globals
	j	.L73
.L75:
	addi	s0,s0,1
.L77:
	ld	a4,0(s1)
	ld	a5,-8(a4)
	srli	a5,a5,10
	bleu	a5,s0,.L103
	slli	a1,s0,3
	add	a1,a1,a4
	ld	a0,0(a1)
	andi	a5,a0,1
	bne	a5,zero,.L75
	ld	a5,Caml_state
	ld	a4,40(a5)
	bleu	a4,a0,.L75
	ld	a5,32(a5)
	bleu	a0,a5,.L75
	call	caml_oldify_one
	j	.L75
.L103:
	addi	s1,s1,8
.L74:
	ld	a5,0(s1)
	beq	a5,zero,.L104
	li	s0,0
	j	.L77
.L104:
	ld	s2,8(s2)
.L73:
	beq	s2,zero,.L105
	ld	s1,0(s2)
	j	.L74
.L105:
	ld	a5,Caml_state
	ld	s1,200(a5)
	ld	a2,208(a5)
	ld	s2,216(a5)
	bne	s1,zero,.L79
.L80:
	ld	a5,Caml_state
	ld	s1,280(a5)
	j	.L90
.L81:
	lhu	a4,8(s0)
	li	a5,65536
	addi	a5,a5,-1
	bne	a4,a5,.L106
	ld	a5,16(s1)
	ld	a2,24(s1)
	ld	s2,32(s1)
	beq	a5,zero,.L80
.L89:
	mv	s1,a5
.L79:
	srli	a5,a2,3
	ld	a1,caml_frame_descriptors_mask
	and	a5,a5,a1
.L82:
	slli	a4,a5,3
	ld	a3,caml_frame_descriptors
	add	a4,a3,a4
	ld	s0,0(a4)
	ld	a4,0(s0)
	beq	a4,a2,.L81
	addi	a5,a5,1
	and	a5,a1,a5
	j	.L82
.L106:
	addi	s4,s0,12
	lhu	s3,10(s0)
	j	.L84
.L85:
	add	a1,s1,a1
	j	.L86
.L87:
	addiw	s3,s3,-1
	addi	s4,s4,2
.L84:
	ble	s3,zero,.L107
	lhu	a1,0(s4)
	sext.w	a5,a1
	andi	a4,a1,1
	beq	a4,zero,.L85
	srli	a1,a5,1
	slli	a1,a1,3
	add	a1,s2,a1
.L86:
	ld	a0,0(a1)
	andi	a5,a0,1
	bne	a5,zero,.L87
	ld	a5,Caml_state
	ld	a4,40(a5)
	bleu	a4,a0,.L87
	ld	a5,32(a5)
	bleu	a0,a5,.L87
	call	caml_oldify_one
	j	.L87
.L107:
	lhu	a5,8(s0)
	andi	a5,a5,-4
	add	a5,s1,a5
	ld	a2,-8(a5)
	j	.L89
.L91:
	addi	s0,s0,1
.L93:
	ld	a5,16(s1)
	ble	a5,s0,.L108
	addi	a5,s2,2
	slli	a5,a5,3
	add	a5,s1,a5
	ld	a1,8(a5)
	slli	a5,s0,3
	add	a1,a1,a5
	ld	a0,0(a1)
	andi	a5,a0,1
	bne	a5,zero,.L91
	ld	a5,Caml_state
	ld	a4,40(a5)
	bleu	a4,a0,.L91
	ld	a5,32(a5)
	bleu	a0,a5,.L91
	call	caml_oldify_one
	j	.L91
.L108:
	addi	s2,s2,1
.L94:
	ld	a5,8(s1)
	ble	a5,s2,.L109
	li	s0,0
	j	.L93
.L109:
	ld	s1,0(s1)
.L90:
	beq	s1,zero,.L110
	li	s2,0
	j	.L94
.L110:
	lla	a0,caml_oldify_one
	call	caml_scan_global_young_roots
	call	caml_final_oldify_young_roots
	call	caml_memprof_oldify_young_roots
	ld	a5,caml_scan_roots_hook
	beq	a5,zero,.L66
	lla	a0,caml_oldify_one
	jalr	a5
.L66:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	ld	s4,0(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_oldify_local_roots, .-caml_oldify_local_roots
	.section	.text.caml_darken_all_roots_slice,"ax",@progbits
	.align	1
	.globl	caml_darken_all_roots_slice
	.type	caml_darken_all_roots_slice, @function
caml_darken_all_roots_slice:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	lw	a5,do_resume.2496
	bne	a5,zero,.L120
	sw	zero,i.2493,a5
	mv	s1,a0
.L113:
	lw	a5,i.2493
	slli	a4,a5,3
	lla	a5,caml_globals
	add	a5,a5,a4
	ld	a5,0(a5)
	beq	a5,zero,.L122
	sd	a5,glob.2495,a4
.L114:
	ld	a5,glob.2495
	ld	a5,0(a5)
	bne	a5,zero,.L118
	lla	a4,i.2493
	lw	a5,0(a4)
	addiw	a5,a5,1
	sw	a5,0(a4)
	j	.L113
.L118:
	sw	zero,j.2494,a5
	j	.L115
.L117:
	slli	a3,a3,3
	add	a1,a3,a1
	ld	a0,0(a1)
	call	caml_darken
	addi	s1,s1,-1
	bne	s1,zero,.L112
	lla	a4,roots_count.2497
	ld	a5,0(a4)
	add	s0,a5,s0
	sd	s0,0(a4)
	li	a5,1
	sw	a5,do_resume.2496,a4
	j	.L111
.L120:
	mv	s1,a0
.L112:
	lla	a4,j.2494
	lw	a5,0(a4)
	addiw	a5,a5,1
	sw	a5,0(a4)
.L115:
	lw	a3,j.2494
	ld	a5,glob.2495
	ld	a1,0(a5)
	ld	a4,-8(a1)
	srli	a4,a4,10
	bltu	a3,a4,.L117
	addi	a5,a5,8
	sd	a5,glob.2495,a4
	j	.L114
.L122:
	lla	a5,roots_count.2497
	ld	a0,0(a5)
	add	s0,s0,a0
	sub	s0,s0,s1
	sd	s0,caml_incremental_roots_count,a4
	sw	zero,do_resume.2496,a4
	sd	zero,0(a5)
.L116:
.L111:
	mv	a0,s1
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_darken_all_roots_slice, .-caml_darken_all_roots_slice
	.section	.text.caml_do_local_roots,"ax",@progbits
	.align	1
	.globl	caml_do_local_roots
	.type	caml_do_local_roots, @function
caml_do_local_roots:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	sd	s4,16(sp)
	sd	s5,8(sp)
	sd	s6,0(sp)
	mv	s2,a0
	mv	s0,a1
	mv	s3,a3
	mv	s1,a4
	bne	a1,zero,.L124
	j	.L136
.L126:
	lhu	a4,8(s4)
	li	a5,65536
	addi	a5,a5,-1
	bne	a4,a5,.L141
	ld	a5,16(s0)
	ld	a2,24(s0)
	ld	s3,32(s0)
	beq	a5,zero,.L136
.L133:
	mv	s0,a5
.L124:
	srli	a5,a2,3
	ld	a3,caml_frame_descriptors_mask
	and	a5,a5,a3
.L127:
	slli	a4,a5,3
	ld	a0,caml_frame_descriptors
	add	a4,a0,a4
	ld	s4,0(a4)
	ld	a4,0(s4)
	beq	a4,a2,.L126
	addi	a5,a5,1
	and	a5,a3,a5
	j	.L127
.L141:
	addi	s6,s4,12
	lhu	s5,10(s4)
	j	.L129
.L130:
	add	a1,s0,a1
.L131:
	ld	a0,0(a1)
	jalr	s2
	addiw	s5,s5,-1
	addi	s6,s6,2
.L129:
	ble	s5,zero,.L142
	lhu	a1,0(s6)
	sext.w	a5,a1
	andi	a4,a1,1
	beq	a4,zero,.L130
	srli	a1,a5,1
	slli	a1,a1,3
	add	a1,s3,a1
	j	.L131
.L142:
	lhu	a5,8(s4)
	andi	a5,a5,-4
	add	a5,s0,a5
	ld	a2,-8(a5)
	j	.L133
.L134:
	addi	a5,s3,2
	slli	a5,a5,3
	add	a5,s1,a5
	ld	a1,8(a5)
	slli	a5,s0,3
	add	a1,a1,a5
	ld	a0,0(a1)
	jalr	s2
	addiw	s0,s0,1
.L135:
	ld	a5,16(s1)
	blt	s0,a5,.L134
	addiw	s3,s3,1
.L137:
	ld	a5,8(s1)
	bge	s3,a5,.L143
	li	s0,0
	j	.L135
.L143:
	ld	s1,0(s1)
.L136:
	beq	s1,zero,.L144
	li	s3,0
	j	.L137
.L144:
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	ld	s4,16(sp)
	ld	s5,8(sp)
	ld	s6,0(sp)
	addi	sp,sp,64
	jr	ra
	.size	caml_do_local_roots, .-caml_do_local_roots
	.section	.text.caml_do_roots,"ax",@progbits
	.align	1
	.globl	caml_do_roots
	.type	caml_do_roots, @function
caml_do_roots:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	mv	s1,a0
	bne	a1,zero,.L157
.L147:
	ld	s3,caml_dyn_globals
	j	.L151
.L162:
	addi	s2,s2,8
.L150:
	ld	a5,0(s2)
	beq	a5,zero,.L161
	li	s0,0
.L149:
	ld	a4,0(s2)
	ld	a5,-8(a4)
	srli	a5,a5,10
	bgeu	s0,a5,.L162
	slli	a1,s0,3
	add	a1,a1,a4
	ld	a0,0(a1)
	jalr	s1
	addiw	s0,s0,1
	j	.L149
.L161:
	addiw	s3,s3,1
.L146:
	slli	a4,s3,3
	lla	a5,caml_globals
	add	a5,a5,a4
	ld	s2,0(a5)
	bne	s2,zero,.L150
	j	.L147
.L157:
	li	s3,0
	j	.L146
.L153:
	slli	a1,s0,3
	add	a1,a1,a4
	ld	a0,0(a1)
	jalr	s1
	addiw	s0,s0,1
.L154:
	ld	a4,0(s2)
	ld	a5,-8(a4)
	srli	a5,a5,10
	bltu	s0,a5,.L153
	addi	s2,s2,8
.L152:
	ld	a5,0(s2)
	beq	a5,zero,.L163
	li	s0,0
	j	.L154
.L163:
	ld	s3,8(s3)
.L151:
	beq	s3,zero,.L164
	ld	s2,0(s3)
	j	.L152
.L164:
	ld	a5,Caml_state
	ld	a4,280(a5)
	ld	a3,216(a5)
	ld	a2,208(a5)
	ld	a1,200(a5)
	mv	a0,s1
	call	caml_do_local_roots
	mv	a0,s1
	call	caml_scan_global_roots
	mv	a0,s1
	call	caml_final_do_roots
	mv	a0,s1
	call	caml_memprof_do_roots
	ld	a5,caml_scan_roots_hook
	beq	a5,zero,.L145
	mv	a0,s1
	jalr	a5
.L145:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_do_roots, .-caml_do_roots
	.section	.text.caml_darken_all_roots_start,"ax",@progbits
	.align	1
	.globl	caml_darken_all_roots_start
	.type	caml_darken_all_roots_start, @function
caml_darken_all_roots_start:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a1,0
	lla	a0,caml_darken
	call	caml_do_roots
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_darken_all_roots_start, .-caml_darken_all_roots_start
	.section	.text.caml_stack_usage,"ax",@progbits
	.align	1
	.globl	caml_stack_usage
	.type	caml_stack_usage, @function
caml_stack_usage:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	ld	a5,Caml_state
	ld	s0,192(a5)
	ld	a5,200(a5)
	sub	s0,s0,a5
	srai	s0,s0,3
	mv	a0,s0
	ld	a5,caml_stack_usage_hook
	beq	a5,zero,.L167
	jalr	a5
	add	a0,s0,a0
.L167:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_stack_usage, .-caml_stack_usage
	.globl	caml_stack_usage_hook
	.globl	caml_incremental_roots_count
	.globl	caml_globals_inited
	.globl	caml_frame_descriptors_mask
	.globl	caml_frame_descriptors
	.globl	caml_scan_roots_hook
	.section	.sbss,"aw",@nobits
	.align	3
	.type	roots_count.2497, @object
	.size	roots_count.2497, 8
roots_count.2497:
	.zero	8
	.type	j.2494, @object
	.size	j.2494, 4
j.2494:
	.zero	4
	.zero	4
	.type	glob.2495, @object
	.size	glob.2495, 8
glob.2495:
	.zero	8
	.type	i.2493, @object
	.size	i.2493, 4
i.2493:
	.zero	4
	.type	do_resume.2496, @object
	.size	do_resume.2496, 4
do_resume.2496:
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
	.type	num_descr, @object
	.size	num_descr, 8
num_descr:
	.zero	8
	.type	frametables, @object
	.size	frametables, 8
frametables:
	.zero	8
	.type	caml_frame_descriptors_mask, @object
	.size	caml_frame_descriptors_mask, 8
caml_frame_descriptors_mask:
	.zero	8
	.type	caml_frame_descriptors, @object
	.size	caml_frame_descriptors, 8
caml_frame_descriptors:
	.zero	8
	.type	caml_scan_roots_hook, @object
	.size	caml_scan_roots_hook, 8
caml_scan_roots_hook:
	.zero	8
	.ident	"GCC: (GNU) 9.2.0"
