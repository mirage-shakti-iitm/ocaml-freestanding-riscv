	.file	"startup_nat.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"not enough memory for initial page table"
	.section	.text.init_static,"ax",@progbits
	.align	1
	.type	init_static, @function
init_static:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	call	caml_init_atom_table
	li	s0,0
.L2:
	slli	a4,s0,4
	lla	a5,caml_data_segments
	add	a5,a5,a4
	ld	a1,0(a5)
	beq	a1,zero,.L10
	slli	a4,s0,4
	lla	a5,caml_data_segments
	add	a5,a5,a4
	ld	a2,8(a5)
	addi	a2,a2,8
	li	a0,4
	call	caml_page_table_add
	bne	a0,zero,.L11
	addiw	s0,s0,1
	j	.L2
.L11:
	lla	a0,.LC0
	call	caml_fatal_error
.L10:
	lla	a5,caml_code_segments
	ld	a4,0(a5)
	sd	a4,caml_code_area_start,a3
	ld	a5,8(a5)
	sd	a5,caml_code_area_end,a4
	li	a4,1
	j	.L5
.L7:
	addiw	a4,a4,1
.L5:
	slli	a3,a4,4
	lla	a5,caml_code_segments
	add	a5,a5,a3
	ld	a5,0(a5)
	beq	a5,zero,.L12
	ld	a3,caml_code_area_start
	bleu	a3,a5,.L6
	sd	a5,caml_code_area_start,a3
.L6:
	slli	a3,a4,4
	lla	a5,caml_code_segments
	add	a5,a5,a3
	ld	a5,8(a5)
	ld	a3,caml_code_area_end
	bleu	a5,a3,.L7
	sd	a5,caml_code_area_end,a3
	j	.L7
.L12:
	li	a0,40
	call	caml_stat_alloc
	mv	s0,a0
	ld	a5,caml_code_area_start
	sd	a5,0(a0)
	ld	a5,caml_code_area_end
	sd	a5,8(a0)
	sb	zero,32(a0)
	lla	s1,.LANCHOR0
	li	a1,8
	mv	a0,s1
	call	caml_ext_table_init
	mv	a1,s0
	mv	a0,s1
	call	caml_ext_table_add
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	init_static, .-init_static
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	""
	.section	.text.caml_startup_common,"ax",@progbits
	.align	1
	.globl	caml_startup_common
	.type	caml_startup_common, @function
caml_startup_common:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	mv	s1,a0
	mv	s0,a1
	call	caml_init_domain
	call	caml_parse_ocamlrunparam
	lw	a5,caml_cleanup_on_exit
	beq	a5,zero,.L14
	li	s0,1
.L14:
	mv	a0,s0
	call	caml_startup_aux
	bne	a0,zero,.L25
	li	a0,1
.L13:
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	addi	sp,sp,64
	jr	ra
.L25:
	call	caml_init_frame_descriptors
	call	caml_init_ieee_floats
	call	caml_init_locale
	call	caml_init_custom_operations
	ld	a5,Caml_state
	addi	a4,sp,31
	sd	a4,192(a5)
	ld	a5,caml_init_custom_minor_max_bsz
	sd	a5,0(sp)
	ld	a7,caml_init_custom_minor_ratio
	ld	a6,caml_init_custom_major_ratio
	ld	a5,caml_init_major_window
	ld	a4,caml_init_max_percent_free
	ld	a3,caml_init_percent_free
	ld	a2,caml_init_heap_chunk_sz
	ld	a1,caml_init_heap_wsz
	ld	a0,caml_init_minor_heap_wsz
	call	caml_init_gc
	call	init_static
	call	caml_init_signals
	call	caml_init_backtrace
	call	caml_debugger_init
	ld	s0,0(s1)
	beq	s0,zero,.L26
.L16:
	call	caml_executable_name
	beq	a0,zero,.L27
.L17:
	mv	a1,s1
	call	caml_sys_init
	lw	a0,caml_termination_jmpbuf
	call	setjmp
	beq	a0,zero,.L19
	ld	a5,caml_termination_hook
	beq	a5,zero,.L20
	li	a0,0
	jalr	a5
.L20:
	li	a0,1
	j	.L13
.L26:
	lla	s0,.LC1
	j	.L16
.L27:
	mv	a0,s0
	call	caml_search_exe_in_path
	j	.L17
.L19:
	ld	a0,Caml_state
	call	caml_start_program
	j	.L13
	.size	caml_startup_common, .-caml_startup_common
	.section	.text.caml_startup_exn,"ax",@progbits
	.align	1
	.globl	caml_startup_exn
	.type	caml_startup_exn, @function
caml_startup_exn:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a1,0
	call	caml_startup_common
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_startup_exn, .-caml_startup_exn
	.section	.text.caml_startup,"ax",@progbits
	.align	1
	.globl	caml_startup
	.type	caml_startup, @function
caml_startup:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_startup_exn
	andi	a4,a0,3
	li	a5,2
	beq	a4,a5,.L33
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L33:
	andi	a0,a0,-4
	call	caml_fatal_uncaught_exception
	.size	caml_startup, .-caml_startup
	.section	.text.caml_main,"ax",@progbits
	.align	1
	.globl	caml_main
	.type	caml_main, @function
caml_main:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_startup
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_main, .-caml_main
	.section	.text.caml_startup_pooled_exn,"ax",@progbits
	.align	1
	.globl	caml_startup_pooled_exn
	.type	caml_startup_pooled_exn, @function
caml_startup_pooled_exn:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a1,1
	call	caml_startup_common
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_startup_pooled_exn, .-caml_startup_pooled_exn
	.section	.text.caml_startup_pooled,"ax",@progbits
	.align	1
	.globl	caml_startup_pooled
	.type	caml_startup_pooled, @function
caml_startup_pooled:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_startup_pooled_exn
	andi	a4,a0,3
	li	a5,2
	beq	a4,a5,.L41
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L41:
	andi	a0,a0,-4
	call	caml_fatal_uncaught_exception
	.size	caml_startup_pooled, .-caml_startup_pooled
	.globl	caml_termination_hook
	.globl	caml_termination_jmpbuf
	.globl	caml_code_fragments_table
	.globl	caml_code_area_end
	.globl	caml_code_area_start
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	caml_code_fragments_table, @object
	.size	caml_code_fragments_table, 16
caml_code_fragments_table:
	.zero	16
	.section	.sbss,"aw",@nobits
	.align	3
	.type	caml_termination_hook, @object
	.size	caml_termination_hook, 8
caml_termination_hook:
	.zero	8
	.type	caml_termination_jmpbuf, @object
	.size	caml_termination_jmpbuf, 4
caml_termination_jmpbuf:
	.zero	4
	.zero	4
	.type	caml_code_area_end, @object
	.size	caml_code_area_end, 8
caml_code_area_end:
	.zero	8
	.type	caml_code_area_start, @object
	.size	caml_code_area_start, 8
caml_code_area_start:
	.zero	8
	.ident	"GCC: (GNU) 9.2.0"
