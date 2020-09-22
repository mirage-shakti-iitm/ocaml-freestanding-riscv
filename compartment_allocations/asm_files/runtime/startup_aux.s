	.file	"startup_aux.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"=%u%c"
	.align	3
.LC1:
	.string	"=0x%x%c"
	.section	.text.scanmult,"ax",@progbits
	.align	1
	.type	scanmult, @function
scanmult:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	mv	s1,a0
	mv	s0,a1
	li	a5,32
	sb	a5,15(sp)
	li	a5,1
	sw	a5,8(sp)
	addi	a3,sp,15
	addi	a2,sp,8
	lla	a1,.LC0
	call	sscanf
	addi	a3,sp,15
	addi	a2,sp,8
	lla	a1,.LC1
	mv	a0,s1
	call	sscanf
	lbu	a5,15(sp)
	li	a4,77
	beq	a5,a4,.L2
	li	a4,107
	beq	a5,a4,.L3
	li	a4,71
	beq	a5,a4,.L9
	lwu	a5,8(sp)
	sd	a5,0(s0)
	j	.L1
.L3:
	lwu	a5,8(sp)
	slli	a5,a5,10
	sd	a5,0(s0)
.L1:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	addi	sp,sp,48
	jr	ra
.L2:
	lwu	a5,8(sp)
	slli	a5,a5,20
	sd	a5,0(s0)
	j	.L1
.L9:
	lwu	a5,8(sp)
	slli	a5,a5,30
	sd	a5,0(s0)
	j	.L1
	.size	scanmult, .-scanmult
	.section	.text.call_registered_value,"ax",@progbits
	.align	1
	.type	call_registered_value, @function
call_registered_value:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_named_value
	beq	a0,zero,.L10
	li	a1,1
	ld	a0,0(a0)
	call	caml_callback_exn
.L10:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	call_registered_value, .-call_registered_value
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"not enough memory for initial page table"
	.section	.text.caml_init_atom_table,"ax",@progbits
	.align	1
	.globl	caml_init_atom_table
	.type	caml_init_atom_table, @function
caml_init_atom_table:
	addi	sp,sp,-32
	sd	ra,24(sp)
	addi	a2,sp,8
	li	a1,0
	li	a0,4096
	call	caml_stat_alloc_aligned_noexc
	sd	a0,caml_atom_table,a5
	li	a5,0
.L14:
	li	a4,255
	bgt	a5,a4,.L18
	slli	a3,a5,3
	ld	a4,caml_atom_table
	add	a4,a4,a3
	slli	a3,a5,32
	srli	a3,a3,32
	sd	a3,0(a4)
	addiw	a5,a5,1
	j	.L14
.L18:
	ld	a1,caml_atom_table
	li	a2,4096
	addi	a2,a2,-2040
	add	a2,a1,a2
	li	a0,4
	call	caml_page_table_add
	bne	a0,zero,.L19
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
.L19:
	lla	a0,.LC2
	call	caml_fatal_error
	.size	caml_init_atom_table, .-caml_init_atom_table
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"OCAMLRUNPARAM"
	.align	3
.LC4:
	.string	"CAMLRUNPARAM"
	.section	.text.caml_parse_ocamlrunparam,"ax",@progbits
	.align	1
	.globl	caml_parse_ocamlrunparam
	.type	caml_parse_ocamlrunparam, @function
caml_parse_ocamlrunparam:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	lla	a0,.LC3
	call	caml_secure_getenv
	mv	s0,a0
	beq	a0,zero,.L51
.L21:
	bne	s0,zero,.L22
.L20:
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
.L51:
	lla	a0,.LC4
	call	caml_secure_getenv
	mv	s0,a0
	j	.L21
.L39:
	addi	a1,sp,8
	mv	a0,s0
	call	scanmult
	ld	a0,8(sp)
	call	caml_set_allocation_policy
.L46:
	lbu	a5,0(s0)
	beq	a5,zero,.L22
	addi	s0,s0,1
	li	a4,44
	bne	a5,a4,.L46
.L22:
	lbu	a5,0(s0)
	beq	a5,zero,.L20
	addi	s0,s0,1
	addiw	a5,a5,-72
	andi	a3,a5,0xff
	li	a4,47
	bgtu	a3,a4,.L46
	slli	a5,a3,2
	lla	a4,.L26
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L26:
	.word	.L43-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L42-.L26
	.word	.L46-.L26
	.word	.L41-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L40-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L39-.L26
	.word	.L38-.L26
	.word	.L37-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L36-.L26
	.word	.L35-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L34-.L26
	.word	.L33-.L26
	.word	.L32-.L26
	.word	.L31-.L26
	.word	.L30-.L26
	.word	.L46-.L26
	.word	.L46-.L26
	.word	.L29-.L26
	.word	.L28-.L26
	.word	.L46-.L26
	.word	.L27-.L26
	.word	.L25-.L26
	.section	.text.caml_parse_ocamlrunparam
.L38:
	addi	a1,sp,8
	mv	a0,s0
	call	scanmult
	ld	a5,8(sp)
	beq	a5,zero,.L49
	li	a0,3
.L44:
	call	caml_record_backtrace
	j	.L46
.L49:
	li	a0,1
	j	.L44
.L37:
	addi	a1,sp,8
	mv	a0,s0
	call	scanmult
	ld	a5,8(sp)
	snez	a5,a5
	sw	a5,caml_cleanup_on_exit,a4
	j	.L46
.L36:
	lla	a1,caml_init_heap_wsz
	mv	a0,s0
	call	scanmult
	j	.L46
.L43:
	lla	a1,caml_use_huge_pages
	mv	a0,s0
	call	scanmult
	j	.L46
.L35:
	lla	a1,caml_init_heap_chunk_sz
	mv	a0,s0
	call	scanmult
	j	.L46
.L34:
	lla	a1,caml_init_max_stack_wsz
	mv	a0,s0
	call	scanmult
	j	.L46
.L42:
	lla	a1,caml_init_custom_major_ratio
	mv	a0,s0
	call	scanmult
	j	.L46
.L33:
	lla	a1,caml_init_custom_minor_ratio
	mv	a0,s0
	call	scanmult
	j	.L46
.L32:
	lla	a1,caml_init_custom_minor_max_bsz
	mv	a0,s0
	call	scanmult
	j	.L46
.L31:
	lla	a1,caml_init_percent_free
	mv	a0,s0
	call	scanmult
	j	.L46
.L41:
	lla	a1,caml_init_max_percent_free
	mv	a0,s0
	call	scanmult
	j	.L46
.L30:
	addi	a1,sp,8
	mv	a0,s0
	call	scanmult
	ld	a5,8(sp)
	snez	a5,a5
	sw	a5,caml_parser_trace,a4
	j	.L46
.L29:
	lla	a1,caml_init_minor_heap_wsz
	mv	a0,s0
	call	scanmult
	j	.L46
.L28:
	lla	a1,caml_trace_level
	mv	a0,s0
	call	scanmult
	j	.L46
.L27:
	lla	a1,caml_verb_gc
	mv	a0,s0
	call	scanmult
	j	.L46
.L25:
	lla	a1,caml_init_major_window
	mv	a0,s0
	call	scanmult
	j	.L46
.L40:
	lla	a1,caml_runtime_warnings
	mv	a0,s0
	call	scanmult
	j	.L46
	.size	caml_parse_ocamlrunparam, .-caml_parse_ocamlrunparam
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	"caml_startup was called after the runtime was shut down with caml_shutdown"
	.section	.text.caml_startup_aux,"ax",@progbits
	.align	1
	.globl	caml_startup_aux
	.type	caml_startup_aux, @function
caml_startup_aux:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a4,shutdown_happened
	li	a5,1
	beq	a4,a5,.L58
	lla	a4,startup_count
	lw	a5,0(a4)
	addiw	a5,a5,1
	sext.w	a3,a5
	sw	a5,0(a4)
	li	a5,1
	bgt	a3,a5,.L55
	bne	a0,zero,.L59
	li	a0,1
	j	.L54
.L58:
	lla	a0,.LC5
	call	caml_fatal_error
.L59:
	call	caml_stat_create_pool
	li	a0,1
	j	.L54
.L55:
	li	a0,0
.L54:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_startup_aux, .-caml_startup_aux
	.section	.rodata.str1.8
	.align	3
.LC6:
	.string	"a call to caml_shutdown has no corresponding call to caml_startup"
	.align	3
.LC7:
	.string	"Pervasives.do_at_exit"
	.align	3
.LC8:
	.string	"Thread.at_shutdown"
	.section	.text.caml_shutdown,"ax",@progbits
	.align	1
	.globl	caml_shutdown
	.type	caml_shutdown, @function
caml_shutdown:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a5,startup_count
	ble	a5,zero,.L64
	addiw	a5,a5,-1
	sext.w	a4,a5
	sw	a5,startup_count,a3
	ble	a4,zero,.L65
.L60:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L64:
	lla	a0,.LC6
	call	caml_fatal_error
.L65:
	lla	a0,.LC7
	call	call_registered_value
	lla	a0,.LC8
	call	call_registered_value
	call	caml_finalise_heap
	call	caml_memprof_shutdown
	call	caml_free_locale
	call	caml_stat_destroy_pool
	li	a5,1
	sw	a5,shutdown_happened,a4
	j	.L60
	.size	caml_shutdown, .-caml_shutdown
	.globl	caml_cleanup_on_exit
	.globl	caml_trace_level
	.globl	caml_init_custom_minor_max_bsz
	.globl	caml_init_custom_minor_ratio
	.globl	caml_init_custom_major_ratio
	.globl	caml_init_major_window
	.globl	caml_init_max_stack_wsz
	.globl	caml_init_heap_wsz
	.globl	caml_init_heap_chunk_sz
	.globl	caml_init_minor_heap_wsz
	.globl	caml_init_max_percent_free
	.globl	caml_init_percent_free
	.globl	caml_atom_table
	.section	.sbss,"aw",@nobits
	.align	3
	.type	shutdown_happened, @object
	.size	shutdown_happened, 4
shutdown_happened:
	.zero	4
	.type	startup_count, @object
	.size	startup_count, 4
startup_count:
	.zero	4
	.type	caml_cleanup_on_exit, @object
	.size	caml_cleanup_on_exit, 4
caml_cleanup_on_exit:
	.zero	4
	.zero	4
	.type	caml_trace_level, @object
	.size	caml_trace_level, 8
caml_trace_level:
	.zero	8
	.type	caml_atom_table, @object
	.size	caml_atom_table, 8
caml_atom_table:
	.zero	8
	.section	.sdata,"aw"
	.align	3
	.type	caml_init_custom_minor_max_bsz, @object
	.size	caml_init_custom_minor_max_bsz, 8
caml_init_custom_minor_max_bsz:
	.dword	8192
	.type	caml_init_custom_minor_ratio, @object
	.size	caml_init_custom_minor_ratio, 8
caml_init_custom_minor_ratio:
	.dword	100
	.type	caml_init_custom_major_ratio, @object
	.size	caml_init_custom_major_ratio, 8
caml_init_custom_major_ratio:
	.dword	44
	.type	caml_init_major_window, @object
	.size	caml_init_major_window, 8
caml_init_major_window:
	.dword	1
	.type	caml_init_max_stack_wsz, @object
	.size	caml_init_max_stack_wsz, 8
caml_init_max_stack_wsz:
	.dword	1048576
	.type	caml_init_heap_wsz, @object
	.size	caml_init_heap_wsz, 8
caml_init_heap_wsz:
	.dword	126976
	.type	caml_init_heap_chunk_sz, @object
	.size	caml_init_heap_chunk_sz, 8
caml_init_heap_chunk_sz:
	.dword	15
	.type	caml_init_minor_heap_wsz, @object
	.size	caml_init_minor_heap_wsz, 8
caml_init_minor_heap_wsz:
	.dword	262144
	.type	caml_init_max_percent_free, @object
	.size	caml_init_max_percent_free, 8
caml_init_max_percent_free:
	.dword	500
	.type	caml_init_percent_free, @object
	.size	caml_init_percent_free, 8
caml_init_percent_free:
	.dword	80
	.ident	"GCC: (GNU) 9.2.0"
