	.file	"misc.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.caml_gc_message,"ax",@progbits
	.align	1
	.globl	caml_gc_message
	.type	caml_gc_message, @function
caml_gc_message:
	addi	sp,sp,-80
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	a2,32(sp)
	sd	a3,40(sp)
	sd	a4,48(sp)
	sd	a5,56(sp)
	sd	a6,64(sp)
	sd	a7,72(sp)
	ld	a5,caml_verb_gc
	and	a0,a0,a5
	bne	a0,zero,.L4
.L1:
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,80
	jr	ra
.L4:
	addi	a2,sp,32
	sd	a2,8(sp)
	lla	s0,stderr
	ld	a0,0(s0)
	call	vfprintf
	ld	a0,0(s0)
	call	fflush
	j	.L1
	.size	caml_gc_message, .-caml_gc_message
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Fatal error: "
	.section	.text.caml_fatal_error,"ax",@progbits
	.align	1
	.globl	caml_fatal_error
	.type	caml_fatal_error, @function
caml_fatal_error:
	addi	sp,sp,-112
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	mv	s0,a0
	sd	a1,56(sp)
	sd	a2,64(sp)
	sd	a3,72(sp)
	sd	a4,80(sp)
	sd	a5,88(sp)
	sd	a6,96(sp)
	sd	a7,104(sp)
	addi	a5,sp,56
	sd	a5,8(sp)
	ld	a5,caml_fatal_error_hook
	beq	a5,zero,.L6
	ld	a1,8(sp)
	jalr	a5
.L7:
	call	abort
.L6:
	lla	s1,stderr
	ld	a3,0(s1)
	li	a2,13
	li	a1,1
	lla	a0,.LC0
	call	fwrite
	ld	a2,8(sp)
	mv	a1,s0
	ld	a0,0(s1)
	call	vfprintf
	ld	a1,0(s1)
	li	a0,10
	call	fputc
	j	.L7
	.size	caml_fatal_error, .-caml_fatal_error
	.section	.text.caml_ext_table_init,"ax",@progbits
	.align	1
	.globl	caml_ext_table_init
	.type	caml_ext_table_init, @function
caml_ext_table_init:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	sw	zero,0(a0)
	sw	a1,4(a0)
	slli	a0,a1,3
	call	caml_stat_alloc
	sd	a0,8(s0)
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ext_table_init, .-caml_ext_table_init
	.section	.text.caml_ext_table_add,"ax",@progbits
	.align	1
	.globl	caml_ext_table_add
	.type	caml_ext_table_add, @function
caml_ext_table_add:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	mv	s1,a1
	lw	a4,0(a0)
	lw	a5,4(a0)
	bge	a4,a5,.L14
.L12:
	lw	a0,0(s0)
	ld	a5,8(s0)
	slli	a4,a0,3
	add	a5,a5,a4
	sd	s1,0(a5)
	lw	a5,0(s0)
	addiw	a5,a5,1
	sw	a5,0(s0)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L14:
	slliw	a5,a5,1
	sext.w	a1,a5
	sw	a5,4(a0)
	slli	a1,a1,3
	ld	a0,8(a0)
	call	caml_stat_resize
	sd	a0,8(s0)
	j	.L12
	.size	caml_ext_table_add, .-caml_ext_table_add
	.section	.text.caml_ext_table_remove,"ax",@progbits
	.align	1
	.globl	caml_ext_table_remove
	.type	caml_ext_table_remove, @function
caml_ext_table_remove:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	mv	s1,a0
	mv	s3,a1
	li	s0,0
	j	.L16
.L17:
	addiw	s0,s0,1
.L16:
	lw	a5,0(s1)
	ble	a5,s0,.L20
	ld	a5,8(s1)
	slli	s2,s0,3
	add	a5,a5,s2
	ld	a0,0(a5)
	bne	a0,s3,.L17
	call	caml_stat_free
	ld	a0,8(s1)
	addi	a1,s0,1
	slli	a1,a1,3
	lw	a2,0(s1)
	subw	a2,a2,s0
	addiw	a2,a2,-1
	slli	a2,a2,3
	add	a1,a0,a1
	add	a0,a0,s2
	call	memmove
	lw	a5,0(s1)
	addiw	a5,a5,-1
	sw	a5,0(s1)
	j	.L17
.L20:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_ext_table_remove, .-caml_ext_table_remove
	.section	.text.caml_ext_table_clear,"ax",@progbits
	.align	1
	.globl	caml_ext_table_clear
	.type	caml_ext_table_clear, @function
caml_ext_table_clear:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a0
	bne	a1,zero,.L25
.L23:
	sw	zero,0(s1)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L25:
	li	s0,0
.L22:
	lw	a5,0(s1)
	ble	a5,s0,.L23
	ld	a5,8(s1)
	slli	a4,s0,3
	add	a5,a5,a4
	ld	a0,0(a5)
	call	caml_stat_free
	addiw	s0,s0,1
	j	.L22
	.size	caml_ext_table_clear, .-caml_ext_table_clear
	.section	.text.caml_ext_table_free,"ax",@progbits
	.align	1
	.globl	caml_ext_table_free
	.type	caml_ext_table_free, @function
caml_ext_table_free:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	call	caml_ext_table_clear
	ld	a0,8(s0)
	call	caml_stat_free
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ext_table_free, .-caml_ext_table_free
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"[ocaml] (use Sys.enable_runtime_warnings to control these warnings)\n"
	.section	.text.caml_runtime_warnings_active,"ax",@progbits
	.align	1
	.globl	caml_runtime_warnings_active
	.type	caml_runtime_warnings_active, @function
caml_runtime_warnings_active:
	ld	a5,caml_runtime_warnings
	beq	a5,zero,.L31
	lw	a5,caml_runtime_warnings_first
	bne	a5,zero,.L37
	li	a0,1
	ret
.L37:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a3,stderr
	li	a2,68
	li	a1,1
	lla	a0,.LC1
	call	fwrite
	sw	zero,caml_runtime_warnings_first,a5
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L31:
	li	a0,0
	ret
	.size	caml_runtime_warnings_active, .-caml_runtime_warnings_active
	.section	.text.caml_find_code_fragment,"ax",@progbits
	.align	1
	.globl	caml_find_code_fragment
	.type	caml_find_code_fragment, @function
caml_find_code_fragment:
	li	a5,0
	j	.L39
.L40:
	addiw	a5,a5,1
.L39:
	lw	a4,caml_code_fragments_table
	ble	a4,a5,.L45
	slli	a4,a5,3
	ld	a3,caml_code_fragments_table+8
	add	a4,a3,a4
	ld	a4,0(a4)
	ld	a3,0(a4)
	bgtu	a3,a0,.L40
	ld	a3,8(a4)
	bleu	a3,a0,.L40
	beq	a1,zero,.L41
	sw	a5,0(a1)
.L41:
	beq	a2,zero,.L42
	sd	a4,0(a2)
.L42:
	li	a0,1
	ret
.L45:
	li	a0,0
	ret
	.size	caml_find_code_fragment, .-caml_find_code_fragment
	.globl	caml_runtime_warnings
	.globl	caml_fatal_error_hook
	.globl	caml_verb_gc
	.globl	caml_finalise_end_hook
	.globl	caml_finalise_begin_hook
	.globl	caml_minor_gc_end_hook
	.globl	caml_minor_gc_begin_hook
	.globl	caml_major_slice_end_hook
	.globl	caml_major_slice_begin_hook
	.section	.sbss,"aw",@nobits
	.align	3
	.type	caml_runtime_warnings, @object
	.size	caml_runtime_warnings, 8
caml_runtime_warnings:
	.zero	8
	.type	caml_fatal_error_hook, @object
	.size	caml_fatal_error_hook, 8
caml_fatal_error_hook:
	.zero	8
	.type	caml_verb_gc, @object
	.size	caml_verb_gc, 8
caml_verb_gc:
	.zero	8
	.type	caml_finalise_end_hook, @object
	.size	caml_finalise_end_hook, 8
caml_finalise_end_hook:
	.zero	8
	.type	caml_finalise_begin_hook, @object
	.size	caml_finalise_begin_hook, 8
caml_finalise_begin_hook:
	.zero	8
	.type	caml_minor_gc_end_hook, @object
	.size	caml_minor_gc_end_hook, 8
caml_minor_gc_end_hook:
	.zero	8
	.type	caml_minor_gc_begin_hook, @object
	.size	caml_minor_gc_begin_hook, 8
caml_minor_gc_begin_hook:
	.zero	8
	.type	caml_major_slice_end_hook, @object
	.size	caml_major_slice_end_hook, 8
caml_major_slice_end_hook:
	.zero	8
	.type	caml_major_slice_begin_hook, @object
	.size	caml_major_slice_begin_hook, 8
caml_major_slice_begin_hook:
	.zero	8
	.section	.sdata,"aw"
	.align	2
	.type	caml_runtime_warnings_first, @object
	.size	caml_runtime_warnings_first, 4
caml_runtime_warnings_first:
	.word	1
	.ident	"GCC: (GNU) 9.2.0"
