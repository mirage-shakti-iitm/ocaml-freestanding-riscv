	.file	"globroots.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.random_level,"ax",@progbits
	.align	1
	.type	random_level, @function
random_level:
	lla	a3,random_seed
	lw	a5,0(a3)
	li	a4,69632
	addiw	a4,a4,-563
	mulw	a5,a5,a4
	li	a4,24576
	addiw	a4,a4,597
	addw	a5,a5,a4
	sext.w	a4,a5
	sw	a5,0(a3)
	li	a0,0
.L2:
	li	a5,-1073741824
	and	a5,a4,a5
	sext.w	a5,a5
	li	a3,-1073741824
	bne	a5,a3,.L4
	addiw	a0,a0,1
	slliw	a4,a4,2
	j	.L2
.L4:
	ret
	.size	random_level, .-random_level
	.section	.text.caml_iterate_global_roots,"ax",@progbits
	.align	1
	.type	caml_iterate_global_roots, @function
caml_iterate_global_roots:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a0
	ld	s0,8(a1)
.L6:
	beq	s0,zero,.L9
	ld	a1,0(s0)
	ld	a0,0(a1)
	jalr	s1
	ld	s0,8(s0)
	j	.L6
.L9:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_iterate_global_roots, .-caml_iterate_global_roots
	.section	.text.caml_insert_global_root,"ax",@progbits
	.align	1
	.type	caml_insert_global_root, @function
caml_insert_global_root:
	addi	sp,sp,-176
	sd	ra,168(sp)
	sd	s0,160(sp)
	sd	s1,152(sp)
	sd	s2,144(sp)
	mv	s1,a0
	mv	s0,a1
	lw	a3,144(a0)
	mv	a5,a0
	j	.L11
.L12:
	slli	a5,a3,3
	addi	a4,sp,144
	add	a5,a4,a5
	sd	a2,-136(a5)
	addiw	a3,a3,-1
	mv	a5,a2
.L11:
	blt	a3,zero,.L22
.L13:
	mv	a2,a5
	slli	a4,a3,3
	add	a5,a5,a4
	ld	a5,8(a5)
	beq	a5,zero,.L12
	ld	a4,0(a5)
	bltu	a4,s0,.L13
	j	.L12
.L22:
	ld	a5,8(a5)
	beq	a5,zero,.L14
	ld	a5,0(a5)
	beq	a5,s0,.L10
.L14:
	call	random_level
	mv	s2,a0
	lw	a5,144(s1)
	bge	a5,a0,.L16
	addiw	a5,a5,1
	j	.L17
.L18:
	slli	a4,a5,3
	addi	a3,sp,144
	add	a4,a3,a4
	sd	s1,-136(a4)
	addiw	a5,a5,1
.L17:
	ble	a5,s2,.L18
	sw	s2,144(s1)
.L16:
	addi	a0,s2,2
	slli	a0,a0,3
	call	caml_stat_alloc
	sd	s0,0(a0)
	li	a3,0
	j	.L19
.L20:
	slli	a5,a3,3
	addi	a4,sp,144
	add	a4,a4,a5
	ld	a4,-136(a4)
	add	a4,a4,a5
	ld	a2,8(a4)
	add	a5,a0,a5
	sd	a2,8(a5)
	sd	a0,8(a4)
	addiw	a3,a3,1
.L19:
	ble	a3,s2,.L20
.L10:
	ld	ra,168(sp)
	ld	s0,160(sp)
	ld	s1,152(sp)
	ld	s2,144(sp)
	addi	sp,sp,176
	jr	ra
	.size	caml_insert_global_root, .-caml_insert_global_root
	.section	.text.caml_delete_global_root,"ax",@progbits
	.align	1
	.type	caml_delete_global_root, @function
caml_delete_global_root:
	addi	sp,sp,-160
	sd	ra,152(sp)
	sd	s0,144(sp)
	mv	s0,a0
	lw	a3,144(a0)
	mv	a5,a0
	j	.L24
.L25:
	slli	a5,a3,3
	addi	a4,sp,144
	add	a5,a4,a5
	sd	a2,-136(a5)
	addiw	a3,a3,-1
	mv	a5,a2
.L24:
	blt	a3,zero,.L37
.L26:
	mv	a2,a5
	slli	a4,a3,3
	add	a5,a5,a4
	ld	a5,8(a5)
	beq	a5,zero,.L25
	ld	a4,0(a5)
	bltu	a4,a1,.L26
	j	.L25
.L37:
	ld	a0,8(a5)
	beq	a0,zero,.L23
	ld	a5,0(a0)
	beq	a5,a1,.L38
.L23:
	ld	ra,152(sp)
	ld	s0,144(sp)
	addi	sp,sp,160
	jr	ra
.L30:
	addiw	a4,a4,1
.L28:
	lw	a5,144(s0)
	blt	a5,a4,.L39
	slli	a5,a4,3
	addi	a3,sp,144
	add	a3,a3,a5
	ld	a3,-136(a3)
	add	a5,a3,a5
	ld	a5,8(a5)
	bne	a5,a0,.L30
	slli	a5,a4,3
	add	a2,a0,a5
	ld	a2,8(a2)
	add	a3,a3,a5
	sd	a2,8(a3)
	j	.L30
.L38:
	li	a4,0
	j	.L28
.L39:
	call	caml_stat_free
	j	.L32
.L34:
	addiw	a5,a5,-1
	sw	a5,144(s0)
.L32:
	lw	a5,144(s0)
	ble	a5,zero,.L23
	slli	a4,a5,3
	add	a4,s0,a4
	ld	a4,8(a4)
	beq	a4,zero,.L34
	j	.L23
	.size	caml_delete_global_root, .-caml_delete_global_root
	.section	.text.caml_empty_global_roots,"ax",@progbits
	.align	1
	.type	caml_empty_global_roots, @function
caml_empty_global_roots:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	ld	a0,8(a0)
.L41:
	beq	a0,zero,.L46
	ld	s1,8(a0)
	call	caml_stat_free
	mv	a0,s1
	j	.L41
.L46:
	li	a5,0
	j	.L43
.L44:
	slli	a4,a5,3
	add	a4,s0,a4
	sd	zero,8(a4)
	addiw	a5,a5,1
.L43:
	lw	a4,144(s0)
	bge	a4,a5,.L44
	sw	zero,144(s0)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_empty_global_roots, .-caml_empty_global_roots
	.section	.text.classify_gc_root,"ax",@progbits
	.align	1
	.type	classify_gc_root, @function
classify_gc_root:
	andi	a5,a0,1
	bne	a5,zero,.L50
	ld	a4,Caml_state
	ld	a3,40(a4)
	bleu	a3,a0,.L49
	ld	a4,32(a4)
	bgtu	a0,a4,.L51
.L49:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_page_table_lookup
	andi	a0,a0,1
	bne	a0,zero,.L52
	li	a0,2
.L48:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L50:
	li	a0,2
	ret
.L51:
	li	a0,0
	ret
.L52:
	li	a0,1
	j	.L48
	.size	classify_gc_root, .-classify_gc_root
	.section	.text.caml_register_global_root,"ax",@progbits
	.align	1
	.globl	caml_register_global_root
	.type	caml_register_global_root, @function
caml_register_global_root:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a1,a0
	lla	a0,.LANCHOR0
	call	caml_insert_global_root
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_register_global_root, .-caml_register_global_root
	.section	.text.caml_remove_global_root,"ax",@progbits
	.align	1
	.globl	caml_remove_global_root
	.type	caml_remove_global_root, @function
caml_remove_global_root:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a1,a0
	lla	a0,.LANCHOR0
	call	caml_delete_global_root
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_remove_global_root, .-caml_remove_global_root
	.section	.text.caml_register_generational_global_root,"ax",@progbits
	.align	1
	.globl	caml_register_generational_global_root
	.type	caml_register_generational_global_root, @function
caml_register_generational_global_root:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	ld	a0,0(a0)
	call	classify_gc_root
	sext.w	a5,a0
	beq	a5,zero,.L61
	li	a4,1
	beq	a5,a4,.L62
.L60:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L61:
	mv	a1,s0
	lla	a0,.LANCHOR0+152
	call	caml_insert_global_root
	j	.L60
.L62:
	mv	a1,s0
	lla	a0,.LANCHOR0+304
	call	caml_insert_global_root
	j	.L60
	.size	caml_register_generational_global_root, .-caml_register_generational_global_root
	.section	.text.caml_remove_generational_global_root,"ax",@progbits
	.align	1
	.globl	caml_remove_generational_global_root
	.type	caml_remove_generational_global_root, @function
caml_remove_generational_global_root:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	ld	a0,0(a0)
	call	classify_gc_root
	sext.w	a5,a0
	beq	a5,zero,.L66
	li	a4,1
	bne	a5,a4,.L65
	mv	a1,s0
	lla	a0,.LANCHOR0+304
	call	caml_delete_global_root
.L66:
	mv	a1,s0
	lla	a0,.LANCHOR0+152
	call	caml_delete_global_root
.L65:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_remove_generational_global_root, .-caml_remove_generational_global_root
	.section	.text.caml_modify_generational_global_root,"ax",@progbits
	.align	1
	.globl	caml_modify_generational_global_root
	.type	caml_modify_generational_global_root, @function
caml_modify_generational_global_root:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s1,a0
	mv	s0,a1
	mv	a0,a1
	call	classify_gc_root
	sext.w	a5,a0
	li	a4,1
	beq	a5,a4,.L70
	li	a4,2
	beq	a5,a4,.L71
	beq	a5,zero,.L75
.L72:
	sd	s0,0(s1)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L75:
	ld	a0,0(s1)
	call	classify_gc_root
	sext.w	s2,a0
	li	a5,1
	beq	s2,a5,.L76
.L73:
	beq	s2,zero,.L72
	mv	a1,s1
	lla	a0,.LANCHOR0+152
	call	caml_insert_global_root
	j	.L72
.L76:
	mv	a1,s1
	lla	a0,.LANCHOR0+304
	call	caml_delete_global_root
	j	.L73
.L70:
	ld	a0,0(s1)
	call	classify_gc_root
	sext.w	a0,a0
	li	a5,2
	bne	a0,a5,.L72
	mv	a1,s1
	lla	a0,.LANCHOR0+304
	call	caml_insert_global_root
	j	.L72
.L71:
	mv	a0,s1
	call	caml_remove_generational_global_root
	j	.L72
	.size	caml_modify_generational_global_root, .-caml_modify_generational_global_root
	.section	.text.caml_scan_global_roots,"ax",@progbits
	.align	1
	.globl	caml_scan_global_roots
	.type	caml_scan_global_roots, @function
caml_scan_global_roots:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	lla	a1,.LANCHOR0
	call	caml_iterate_global_roots
	lla	a1,.LANCHOR0+152
	mv	a0,s0
	call	caml_iterate_global_roots
	lla	a1,.LANCHOR0+304
	mv	a0,s0
	call	caml_iterate_global_roots
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_scan_global_roots, .-caml_scan_global_roots
	.section	.text.caml_scan_global_young_roots,"ax",@progbits
	.align	1
	.globl	caml_scan_global_young_roots
	.type	caml_scan_global_young_roots, @function
caml_scan_global_young_roots:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	lla	s1,.LANCHOR0
	mv	a1,s1
	call	caml_iterate_global_roots
	lla	a1,.LANCHOR0+152
	mv	a0,s0
	call	caml_iterate_global_roots
	ld	s0,160(s1)
.L80:
	beq	s0,zero,.L83
	ld	a1,0(s0)
	lla	a0,.LANCHOR0+304
	call	caml_insert_global_root
	ld	s0,8(s0)
	j	.L80
.L83:
	lla	a0,.LANCHOR0+152
	call	caml_empty_global_roots
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_scan_global_young_roots, .-caml_scan_global_young_roots
	.globl	caml_global_roots_old
	.globl	caml_global_roots_young
	.globl	caml_global_roots
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
	.ident	"GCC: (GNU) 9.2.0"
