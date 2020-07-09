	.file	"startup_aux.c"
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
	.string	"=%u%c"
	.align	3
.LC1:
	.string	"=0x%x%c"
	.text
	.align	1
	.type	scanmult, @function
scanmult:
.LFB9:
	.file 1 "startup_aux.c"
	.loc 1 68 1
	.cfi_startproc
.LVL0:
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	mv	s1,a0
	mv	s0,a1
	.loc 1 69 3
	.loc 1 69 11 is_stmt 0
	li	a5,32
	sb	a5,15(sp)
	.loc 1 70 3 is_stmt 1
	.loc 1 70 16 is_stmt 0
	li	a5,1
	sw	a5,8(sp)
	.loc 1 71 3 is_stmt 1
	addi	a3,sp,15
	addi	a2,sp,8
	lla	a1,.LC0
.LVL1:
	call	sscanf
.LVL2:
	.loc 1 72 3
	addi	a3,sp,15
	addi	a2,sp,8
	lla	a1,.LC1
	mv	a0,s1
	call	sscanf
.LVL3:
	.loc 1 73 3
	lbu	a5,15(sp)
	li	a4,77
	beq	a5,a4,.L2
	li	a4,107
	beq	a5,a4,.L3
	li	a4,71
	beq	a5,a4,.L9
	.loc 1 77 15
	.loc 1 77 22 is_stmt 0
	lwu	a5,8(sp)
	.loc 1 77 20
	sd	a5,0(s0)
	.loc 1 77 37 is_stmt 1
	.loc 1 79 1 is_stmt 0
	j	.L1
.L3:
	.loc 1 74 19 is_stmt 1
	.loc 1 74 26 is_stmt 0
	lwu	a5,8(sp)
	.loc 1 74 40
	slli	a5,a5,10
	.loc 1 74 24
	sd	a5,0(s0)
	.loc 1 74 48 is_stmt 1
.L1:
	.loc 1 79 1 is_stmt 0
	ld	ra,40(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
.LVL4:
	ld	s1,24(sp)
	.cfi_restore 9
.LVL5:
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.LVL6:
.L2:
	.cfi_restore_state
	.loc 1 75 19 is_stmt 1
	.loc 1 75 26 is_stmt 0
	lwu	a5,8(sp)
	.loc 1 75 40
	slli	a5,a5,20
	.loc 1 75 24
	sd	a5,0(s0)
	.loc 1 75 57 is_stmt 1
	.loc 1 75 3 is_stmt 0
	j	.L1
.L9:
	.loc 1 76 19 is_stmt 1
	.loc 1 76 26 is_stmt 0
	lwu	a5,8(sp)
	.loc 1 76 40
	slli	a5,a5,30
	.loc 1 76 24
	sd	a5,0(s0)
	.loc 1 76 64 is_stmt 1
	.loc 1 76 3 is_stmt 0
	j	.L1
	.cfi_endproc
.LFE9:
	.size	scanmult, .-scanmult
	.align	1
	.type	call_registered_value, @function
call_registered_value:
.LFB12:
	.loc 1 142 1 is_stmt 1
	.cfi_startproc
.LVL7:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 143 3
	.loc 1 143 14 is_stmt 0
	call	caml_named_value
.LVL8:
	.loc 1 144 3 is_stmt 1
	.loc 1 144 6 is_stmt 0
	beq	a0,zero,.L10
	.loc 1 145 5 is_stmt 1
	li	a1,1
	ld	a0,0(a0)
.LVL9:
	call	caml_callback_exn
.LVL10:
.L10:
	.loc 1 146 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	call_registered_value, .-call_registered_value
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"Fatal error: not enough memory for initial page table"
	.text
	.align	1
	.globl	caml_init_atom_table
	.type	caml_init_atom_table, @function
caml_init_atom_table:
.LFB8:
	.loc 1 37 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 38 3
	.loc 1 39 3
.LVL11:
	.loc 1 39 9 is_stmt 0
	li	a5,0
.LVL12:
.L14:
	.loc 1 39 14 is_stmt 1 discriminator 1
	.loc 1 39 3 is_stmt 0 discriminator 1
	li	a4,255
	bgt	a5,a4,.L18
	.loc 1 41 5 is_stmt 1 discriminator 3
	.loc 1 41 26 is_stmt 0 discriminator 3
	slli	a3,a5,32
	srli	a3,a3,32
	.loc 1 41 24 discriminator 3
	slli	a2,a5,3
	lla	a4,caml_atom_table
	add	a4,a4,a2
	sd	a3,0(a4)
	.loc 1 39 23 is_stmt 1 discriminator 3
	.loc 1 39 24 is_stmt 0 discriminator 3
	addiw	a5,a5,1
.LVL13:
	j	.L14
.LVL14:
.L18:
	.loc 1 46 3 is_stmt 1
	.loc 1 46 7 is_stmt 0
	lla	a2,caml_atom_table+2048
	lla	a1,caml_atom_table
	li	a0,4
	call	caml_page_table_add
.LVL15:
	.loc 1 46 6
	bne	a0,zero,.L19
	.loc 1 50 1
	ld	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L19:
	.cfi_restore_state
	.loc 1 48 5 is_stmt 1
	lla	a0,.LC2
	call	caml_fatal_error
.LVL16:
	.cfi_endproc
.LFE8:
	.size	caml_init_atom_table, .-caml_init_atom_table
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"OCAMLRUNPARAM"
	.align	3
.LC4:
	.string	"CAMLRUNPARAM"
	.text
	.align	1
	.globl	caml_parse_ocamlrunparam
	.type	caml_parse_ocamlrunparam, @function
caml_parse_ocamlrunparam:
.LFB10:
	.loc 1 82 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.loc 1 83 3
	.loc 1 83 18 is_stmt 0
	lla	a0,.LC3
	call	caml_secure_getenv
.LVL17:
	mv	s0,a0
.LVL18:
	.loc 1 84 3 is_stmt 1
	.loc 1 86 3
	.loc 1 86 6 is_stmt 0
	beq	a0,zero,.L48
.L21:
	.loc 1 88 3 is_stmt 1
	.loc 1 88 6 is_stmt 0
	bne	s0,zero,.L22
.L20:
	.loc 1 113 1
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
.LVL19:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL20:
.L48:
	.cfi_restore_state
	.loc 1 86 20 is_stmt 1 discriminator 1
	.loc 1 86 26 is_stmt 0 discriminator 1
	lla	a0,.LC4
	call	caml_secure_getenv
.LVL21:
	mv	s0,a0
.LVL22:
	j	.L21
.L37:
	.loc 1 91 21 is_stmt 1
	addi	a1,sp,8
	mv	a0,s0
	call	scanmult
.LVL23:
	.loc 1 91 41
	ld	a0,8(sp)
	call	caml_set_allocation_policy
.LVL24:
	.loc 1 91 73
.L43:
	.loc 1 108 13 discriminator 1
	.loc 1 108 14 is_stmt 0 discriminator 1
	lbu	a5,0(s0)
	.loc 1 108 13 discriminator 1
	beq	a5,zero,.L22
	.loc 1 109 9 is_stmt 1
	.loc 1 109 17 is_stmt 0
	addi	s0,s0,1
.LVL25:
	.loc 1 109 12
	li	a4,44
	bne	a5,a4,.L43
.L22:
	.loc 1 89 11 is_stmt 1
	.loc 1 89 12 is_stmt 0
	lbu	a5,0(s0)
	.loc 1 89 11
	beq	a5,zero,.L20
	.loc 1 90 7 is_stmt 1
	.loc 1 90 19 is_stmt 0
	addi	s0,s0,1
.LVL26:
	addiw	a5,a5,-72
	andi	a3,a5,0xff
	li	a4,47
	bgtu	a3,a4,.L43
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
	.word	.L40-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L39-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L38-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L37-.L26
	.word	.L36-.L26
	.word	.L35-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L34-.L26
	.word	.L33-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L32-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L31-.L26
	.word	.L30-.L26
	.word	.L43-.L26
	.word	.L43-.L26
	.word	.L29-.L26
	.word	.L28-.L26
	.word	.L43-.L26
	.word	.L27-.L26
	.word	.L25-.L26
	.text
.L36:
	.loc 1 92 21 is_stmt 1
	addi	a1,sp,8
	mv	a0,s0
	call	scanmult
.LVL27:
	.loc 1 92 41
	.loc 1 92 63 is_stmt 0
	ld	a5,8(sp)
	.loc 1 92 41
	beq	a5,zero,.L46
	li	a0,3
.L41:
	.loc 1 92 41 discriminator 4
	call	caml_record_backtrace
.LVL28:
	.loc 1 92 78 is_stmt 1 discriminator 4
	.loc 1 92 7 is_stmt 0 discriminator 4
	j	.L43
.L46:
	.loc 1 92 41
	li	a0,1
	j	.L41
.L35:
	.loc 1 93 21 is_stmt 1
	addi	a1,sp,8
	mv	a0,s0
	call	scanmult
.LVL29:
	.loc 1 93 41
	.loc 1 93 62 is_stmt 0
	ld	a5,8(sp)
	sd	a5,caml_cleanup_on_exit,a4
	.loc 1 93 67 is_stmt 1
	.loc 1 93 7 is_stmt 0
	j	.L43
.L34:
	.loc 1 94 21 is_stmt 1
	lla	a1,caml_init_heap_wsz
	mv	a0,s0
	call	scanmult
.LVL30:
	.loc 1 94 58
	.loc 1 94 7 is_stmt 0
	j	.L43
.L40:
	.loc 1 95 21 is_stmt 1
	lla	a1,caml_use_huge_pages
	mv	a0,s0
	call	scanmult
.LVL31:
	.loc 1 95 59
	.loc 1 95 7 is_stmt 0
	j	.L43
.L33:
	.loc 1 96 21 is_stmt 1
	lla	a1,caml_init_heap_chunk_sz
	mv	a0,s0
	call	scanmult
.LVL32:
	.loc 1 96 63
	.loc 1 96 7 is_stmt 0
	j	.L43
.L32:
	.loc 1 97 21 is_stmt 1
	lla	a1,caml_init_max_stack_wsz
	mv	a0,s0
	call	scanmult
.LVL33:
	.loc 1 97 63
	.loc 1 97 7 is_stmt 0
	j	.L43
.L31:
	.loc 1 98 21 is_stmt 1
	lla	a1,caml_init_percent_free
	mv	a0,s0
	call	scanmult
.LVL34:
	.loc 1 98 62
	.loc 1 98 7 is_stmt 0
	j	.L43
.L39:
	.loc 1 99 21 is_stmt 1
	lla	a1,caml_init_max_percent_free
	mv	a0,s0
	call	scanmult
.LVL35:
	.loc 1 99 66
	.loc 1 99 7 is_stmt 0
	j	.L43
.L30:
	.loc 1 100 21 is_stmt 1
	addi	a1,sp,8
	mv	a0,s0
	call	scanmult
.LVL36:
	.loc 1 100 41
	.loc 1 100 59 is_stmt 0
	ld	a5,8(sp)
	sw	a5,caml_parser_trace,a4
	.loc 1 100 64 is_stmt 1
	.loc 1 100 7 is_stmt 0
	j	.L43
.L29:
	.loc 1 102 21 is_stmt 1
	lla	a1,caml_init_minor_heap_wsz
	mv	a0,s0
	call	scanmult
.LVL37:
	.loc 1 102 64
	.loc 1 102 7 is_stmt 0
	j	.L43
.L28:
	.loc 1 103 21 is_stmt 1
	lla	a1,caml_trace_level
	mv	a0,s0
	call	scanmult
.LVL38:
	.loc 1 103 56
	.loc 1 103 7 is_stmt 0
	j	.L43
.L27:
	.loc 1 104 21 is_stmt 1
	lla	a1,caml_verb_gc
	mv	a0,s0
	call	scanmult
.LVL39:
	.loc 1 104 52
	.loc 1 104 7 is_stmt 0
	j	.L43
.L25:
	.loc 1 105 21 is_stmt 1
	lla	a1,caml_init_major_window
	mv	a0,s0
	call	scanmult
.LVL40:
	.loc 1 105 62
	.loc 1 105 7 is_stmt 0
	j	.L43
.L38:
	.loc 1 106 21 is_stmt 1
	lla	a1,caml_runtime_warnings
	mv	a0,s0
	call	scanmult
.LVL41:
	.loc 1 106 61
	.loc 1 106 7 is_stmt 0
	j	.L43
	.cfi_endproc
.LFE10:
	.size	caml_parse_ocamlrunparam, .-caml_parse_ocamlrunparam
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	"Fatal error: caml_startup was called after the runtime was shut down with caml_shutdown"
	.text
	.align	1
	.globl	caml_startup_aux
	.type	caml_startup_aux, @function
caml_startup_aux:
.LFB11:
	.loc 1 124 1 is_stmt 1
	.cfi_startproc
.LVL42:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 125 3
	.loc 1 125 25 is_stmt 0
	lw	a4,shutdown_happened
	.loc 1 125 6
	li	a5,1
	beq	a4,a5,.L55
	.loc 1 131 3 is_stmt 1
	.loc 1 131 16 is_stmt 0
	lla	a4,startup_count
	lw	a5,0(a4)
	addiw	a5,a5,1
	sext.w	a3,a5
	sw	a5,0(a4)
	.loc 1 132 3 is_stmt 1
	.loc 1 132 6 is_stmt 0
	li	a5,1
	bgt	a3,a5,.L52
	.loc 1 135 3 is_stmt 1
	.loc 1 135 6 is_stmt 0
	bne	a0,zero,.L56
	.loc 1 138 10
	li	a0,1
.LVL43:
	j	.L51
.LVL44:
.L55:
	.loc 1 126 5 is_stmt 1
	lla	a0,.LC5
.LVL45:
	call	caml_fatal_error
.LVL46:
.L56:
	.loc 1 136 5
	call	caml_stat_create_pool
.LVL47:
	.loc 1 138 10 is_stmt 0
	li	a0,1
	j	.L51
.LVL48:
.L52:
	.loc 1 133 12
	li	a0,0
.LVL49:
.L51:
	.loc 1 139 1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	caml_startup_aux, .-caml_startup_aux
	.section	.rodata.str1.8
	.align	3
.LC6:
	.string	"Fatal error: a call to caml_shutdown has no corresponding call to caml_startup"
	.align	3
.LC7:
	.string	"Pervasives.do_at_exit"
	.align	3
.LC8:
	.string	"Thread.at_shutdown"
	.text
	.align	1
	.globl	caml_shutdown
	.type	caml_shutdown, @function
caml_shutdown:
.LFB13:
	.loc 1 149 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 150 3
	.loc 1 150 21 is_stmt 0
	lw	a5,startup_count
	.loc 1 150 6
	ble	a5,zero,.L61
	.loc 1 155 3 is_stmt 1
	.loc 1 155 16 is_stmt 0
	addiw	a5,a5,-1
	sext.w	a4,a5
	sw	a5,startup_count,a3
	.loc 1 156 3 is_stmt 1
	.loc 1 156 6 is_stmt 0
	ble	a4,zero,.L62
.L57:
	.loc 1 168 1
	ld	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L61:
	.cfi_restore_state
	.loc 1 151 5 is_stmt 1
	lla	a0,.LC6
	call	caml_fatal_error
.LVL50:
.L62:
	.loc 1 159 3
	lla	a0,.LC7
	call	call_registered_value
.LVL51:
	.loc 1 160 3
	lla	a0,.LC8
	call	call_registered_value
.LVL52:
	.loc 1 161 3
	call	caml_finalise_heap
.LVL53:
	.loc 1 165 3
	call	caml_stat_destroy_pool
.LVL54:
	.loc 1 167 3
	.loc 1 167 21 is_stmt 0
	li	a5,1
	sw	a5,shutdown_happened,a4
	j	.L57
	.cfi_endproc
.LFE13:
	.size	caml_shutdown, .-caml_shutdown
	.globl	caml_cleanup_on_exit
	.globl	caml_trace_level
	.globl	caml_init_major_window
	.globl	caml_init_max_stack_wsz
	.globl	caml_init_heap_wsz
	.globl	caml_init_heap_chunk_sz
	.globl	caml_init_minor_heap_wsz
	.globl	caml_init_max_percent_free
	.globl	caml_init_percent_free
	.comm	caml_atom_table,2048,8
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
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
	.size	caml_cleanup_on_exit, 8
caml_cleanup_on_exit:
	.zero	8
	.type	caml_trace_level, @object
	.size	caml_trace_level, 8
caml_trace_level:
	.zero	8
	.section	.sdata,"aw"
	.align	3
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
	.text
.Letext0:
	.file 2 "/home/sai/ocaml-freestanding-riscv/nolibc/include/stdio.h"
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 4 "caml/config.h"
	.file 5 "caml/misc.h"
	.file 6 "caml/mlvalues.h"
	.file 7 "caml/backtrace.h"
	.file 8 "caml/freelist.h"
	.file 9 "caml/major_gc.h"
	.file 10 "caml/address_class.h"
	.file 11 "caml/minor_gc.h"
	.file 12 "caml/memory.h"
	.file 13 "caml/callback.h"
	.file 14 "caml/startup_aux.h"
	.file 15 "caml/osdeps.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xd32
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF124
	.byte	0xc
	.4byte	.LASF125
	.4byte	.LASF126
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF0
	.byte	0x3
	.4byte	.LASF8
	.byte	0x3
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
	.byte	0x5
	.4byte	.LASF70
	.byte	0x18
	.byte	0x2
	.byte	0x8
	.byte	0x10
	.4byte	0x91
	.byte	0x6
	.4byte	.LASF4
	.byte	0x2
	.byte	0x9
	.byte	0xe
	.4byte	0xc2
	.byte	0
	.byte	0x6
	.4byte	.LASF5
	.byte	0x2
	.byte	0xa
	.byte	0xb
	.4byte	0xc8
	.byte	0x8
	.byte	0x6
	.4byte	.LASF6
	.byte	0x2
	.byte	0xb
	.byte	0xb
	.4byte	0xc8
	.byte	0x10
	.byte	0
	.byte	0x7
	.4byte	0x34
	.4byte	0xaa
	.byte	0x8
	.4byte	0xaa
	.byte	0x8
	.4byte	0xb0
	.byte	0x8
	.4byte	0x34
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x5c
	.byte	0x9
	.byte	0x8
	.4byte	0xbd
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF7
	.byte	0xa
	.4byte	0xb6
	.byte	0x9
	.byte	0x8
	.4byte	0x91
	.byte	0x9
	.byte	0x8
	.4byte	0xb6
	.byte	0x3
	.4byte	.LASF9
	.byte	0x2
	.byte	0xc
	.byte	0x3
	.4byte	0x5c
	.byte	0xb
	.4byte	.LASF10
	.byte	0x2
	.byte	0x11
	.byte	0xe
	.4byte	0xe6
	.byte	0x9
	.byte	0x8
	.4byte	0xce
	.byte	0xb
	.4byte	.LASF11
	.byte	0x2
	.byte	0x12
	.byte	0xe
	.4byte	0xe6
	.byte	0xb
	.4byte	.LASF12
	.byte	0x2
	.byte	0x1c
	.byte	0xe
	.4byte	0xe6
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF14
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF15
	.byte	0x3
	.4byte	.LASF16
	.byte	0x4
	.byte	0x5b
	.byte	0xe
	.4byte	0x2d
	.byte	0x3
	.4byte	.LASF17
	.byte	0x4
	.byte	0x5c
	.byte	0x17
	.4byte	0x40
	.byte	0x3
	.4byte	.LASF18
	.byte	0x5
	.byte	0x21
	.byte	0x10
	.4byte	0x34
	.byte	0x3
	.4byte	.LASF19
	.byte	0x5
	.byte	0x5c
	.byte	0x10
	.4byte	0x149
	.byte	0x9
	.byte	0x8
	.4byte	0x14f
	.byte	0xc
	.byte	0xb
	.4byte	.LASF20
	.byte	0x5
	.byte	0x5d
	.byte	0x19
	.4byte	0x13d
	.byte	0xb
	.4byte	.LASF21
	.byte	0x5
	.byte	0x5d
	.byte	0x36
	.4byte	0x13d
	.byte	0xb
	.4byte	.LASF22
	.byte	0x5
	.byte	0x5e
	.byte	0x19
	.4byte	0x13d
	.byte	0xb
	.4byte	.LASF23
	.byte	0x5
	.byte	0x5e
	.byte	0x33
	.4byte	0x13d
	.byte	0xb
	.4byte	.LASF24
	.byte	0x5
	.byte	0x5f
	.byte	0x19
	.4byte	0x13d
	.byte	0xb
	.4byte	.LASF25
	.byte	0x5
	.byte	0x5f
	.byte	0x33
	.4byte	0x13d
	.byte	0x3
	.4byte	.LASF26
	.byte	0x5
	.byte	0xcc
	.byte	0xe
	.4byte	0xb6
	.byte	0xd
	.byte	0x8
	.byte	0xe
	.4byte	.LASF27
	.byte	0x5
	.2byte	0x169
	.byte	0x10
	.4byte	0x125
	.byte	0xe
	.4byte	.LASF28
	.byte	0x5
	.2byte	0x171
	.byte	0x10
	.4byte	0x125
	.byte	0x3
	.4byte	.LASF29
	.byte	0x6
	.byte	0x3c
	.byte	0x10
	.4byte	0x119
	.byte	0x3
	.4byte	.LASF30
	.byte	0x6
	.byte	0x3d
	.byte	0x11
	.4byte	0x125
	.byte	0x3
	.4byte	.LASF31
	.byte	0x6
	.byte	0x3e
	.byte	0x11
	.4byte	0x125
	.byte	0x3
	.4byte	.LASF32
	.byte	0x6
	.byte	0x3f
	.byte	0x16
	.4byte	0x104
	.byte	0xf
	.4byte	0x1cc
	.4byte	0x1fb
	.byte	0x10
	.byte	0
	.byte	0xe
	.4byte	.LASF33
	.byte	0x6
	.2byte	0x15c
	.byte	0x15
	.4byte	0x1f0
	.byte	0xe
	.4byte	.LASF34
	.byte	0x6
	.2byte	0x171
	.byte	0xe
	.4byte	0x1c0
	.byte	0xb
	.4byte	.LASF35
	.byte	0x7
	.byte	0x39
	.byte	0x10
	.4byte	0x47
	.byte	0x3
	.4byte	.LASF36
	.byte	0x7
	.byte	0x41
	.byte	0x10
	.4byte	0x1a4
	.byte	0xb
	.4byte	.LASF37
	.byte	0x7
	.byte	0x52
	.byte	0x1d
	.4byte	0x239
	.byte	0x9
	.byte	0x8
	.4byte	0x221
	.byte	0xb
	.4byte	.LASF38
	.byte	0x7
	.byte	0x53
	.byte	0x10
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF39
	.byte	0x7
	.byte	0x61
	.byte	0x12
	.4byte	0x1c0
	.byte	0xb
	.4byte	.LASF40
	.byte	0x8
	.byte	0x1a
	.byte	0x10
	.4byte	0x131
	.byte	0xb
	.4byte	.LASF41
	.byte	0x9
	.byte	0x24
	.byte	0xc
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF42
	.byte	0x9
	.byte	0x25
	.byte	0xc
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF43
	.byte	0x9
	.byte	0x26
	.byte	0x10
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF44
	.byte	0x9
	.byte	0x27
	.byte	0xf
	.4byte	0x293
	.byte	0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF45
	.byte	0xb
	.4byte	.LASF46
	.byte	0x9
	.byte	0x28
	.byte	0x10
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF47
	.byte	0x9
	.byte	0x28
	.byte	0x25
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF48
	.byte	0x9
	.byte	0x29
	.byte	0x10
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF49
	.byte	0x9
	.byte	0x3e
	.byte	0x12
	.4byte	0xc8
	.byte	0xb
	.4byte	.LASF50
	.byte	0x9
	.byte	0x3f
	.byte	0x10
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF51
	.byte	0x9
	.byte	0x40
	.byte	0xe
	.4byte	0xc8
	.byte	0xb
	.4byte	.LASF52
	.byte	0x9
	.byte	0x42
	.byte	0xc
	.4byte	0x47
	.byte	0xf
	.4byte	0x293
	.4byte	0x2fe
	.byte	0x11
	.4byte	0x40
	.byte	0x31
	.byte	0
	.byte	0x12
	.4byte	.LASF53
	.byte	0x9
	.byte	0x43
	.byte	0x8
	.4byte	0x2ee
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0x12
	.4byte	.LASF54
	.byte	0x9
	.byte	0x44
	.byte	0x5
	.4byte	0x47
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0x12
	.4byte	.LASF55
	.byte	0x9
	.byte	0x45
	.byte	0x8
	.4byte	0x293
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0xb
	.4byte	.LASF56
	.byte	0x9
	.byte	0x46
	.byte	0xf
	.4byte	0x293
	.byte	0xb
	.4byte	.LASF57
	.byte	0x9
	.byte	0x4a
	.byte	0x13
	.4byte	0x149
	.byte	0xb
	.4byte	.LASF58
	.byte	0xa
	.byte	0x31
	.byte	0xf
	.4byte	0x364
	.byte	0x9
	.byte	0x8
	.4byte	0x1c0
	.byte	0xb
	.4byte	.LASF59
	.byte	0xa
	.byte	0x31
	.byte	0x22
	.4byte	0x364
	.byte	0xb
	.4byte	.LASF60
	.byte	0xa
	.byte	0x32
	.byte	0xf
	.4byte	0xc8
	.byte	0xb
	.4byte	.LASF61
	.byte	0xa
	.byte	0x32
	.byte	0x27
	.4byte	0xc8
	.byte	0xb
	.4byte	.LASF62
	.byte	0xb
	.byte	0x18
	.byte	0x13
	.4byte	0x364
	.byte	0xb
	.4byte	.LASF63
	.byte	0xb
	.byte	0x18
	.byte	0x2c
	.4byte	0x364
	.byte	0xb
	.4byte	.LASF64
	.byte	0xb
	.byte	0x19
	.byte	0x13
	.4byte	0x364
	.byte	0xb
	.4byte	.LASF65
	.byte	0xb
	.byte	0x19
	.byte	0x24
	.4byte	0x364
	.byte	0xb
	.4byte	.LASF66
	.byte	0xb
	.byte	0x1a
	.byte	0x13
	.4byte	0x364
	.byte	0xb
	.4byte	.LASF67
	.byte	0xb
	.byte	0x1b
	.byte	0x10
	.4byte	0x131
	.byte	0xb
	.4byte	.LASF68
	.byte	0xb
	.byte	0x1c
	.byte	0xc
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF69
	.byte	0xb
	.byte	0x1d
	.byte	0xf
	.4byte	0x293
	.byte	0x5
	.4byte	.LASF71
	.byte	0x38
	.byte	0xb
	.byte	0x29
	.byte	0x8
	.4byte	0x457
	.byte	0x6
	.4byte	.LASF72
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x457
	.byte	0
	.byte	0x13
	.string	"end"
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x457
	.byte	0x8
	.byte	0x6
	.4byte	.LASF73
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x457
	.byte	0x10
	.byte	0x13
	.string	"ptr"
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x457
	.byte	0x18
	.byte	0x6
	.4byte	.LASF74
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x457
	.byte	0x20
	.byte	0x6
	.4byte	.LASF75
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x131
	.byte	0x28
	.byte	0x6
	.4byte	.LASF76
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x131
	.byte	0x30
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x364
	.byte	0xb
	.4byte	.LASF71
	.byte	0xb
	.byte	0x2a
	.byte	0x22
	.4byte	0x3ee
	.byte	0x5
	.4byte	.LASF77
	.byte	0x10
	.byte	0xb
	.byte	0x2c
	.byte	0x8
	.4byte	0x491
	.byte	0x6
	.4byte	.LASF78
	.byte	0xb
	.byte	0x2d
	.byte	0x9
	.4byte	0x1c0
	.byte	0
	.byte	0x6
	.4byte	.LASF79
	.byte	0xb
	.byte	0x2e
	.byte	0xc
	.4byte	0x1d8
	.byte	0x8
	.byte	0
	.byte	0x5
	.4byte	.LASF80
	.byte	0x38
	.byte	0xb
	.byte	0x31
	.byte	0x8
	.4byte	0x4fa
	.byte	0x6
	.4byte	.LASF72
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x4fa
	.byte	0
	.byte	0x13
	.string	"end"
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x4fa
	.byte	0x8
	.byte	0x6
	.4byte	.LASF73
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x4fa
	.byte	0x10
	.byte	0x13
	.string	"ptr"
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x4fa
	.byte	0x18
	.byte	0x6
	.4byte	.LASF74
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x4fa
	.byte	0x20
	.byte	0x6
	.4byte	.LASF75
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x131
	.byte	0x28
	.byte	0x6
	.4byte	.LASF76
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x131
	.byte	0x30
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x469
	.byte	0xb
	.4byte	.LASF80
	.byte	0xb
	.byte	0x32
	.byte	0x27
	.4byte	0x491
	.byte	0x5
	.4byte	.LASF81
	.byte	0x18
	.byte	0xb
	.byte	0x34
	.byte	0x8
	.4byte	0x541
	.byte	0x6
	.4byte	.LASF82
	.byte	0xb
	.byte	0x35
	.byte	0x9
	.4byte	0x1c0
	.byte	0
	.byte	0x13
	.string	"mem"
	.byte	0xb
	.byte	0x36
	.byte	0xc
	.4byte	0x1d8
	.byte	0x8
	.byte	0x13
	.string	"max"
	.byte	0xb
	.byte	0x37
	.byte	0xc
	.4byte	0x1d8
	.byte	0x10
	.byte	0
	.byte	0x5
	.4byte	.LASF83
	.byte	0x38
	.byte	0xb
	.byte	0x3a
	.byte	0x8
	.4byte	0x5aa
	.byte	0x6
	.4byte	.LASF72
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x5aa
	.byte	0
	.byte	0x13
	.string	"end"
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x5aa
	.byte	0x8
	.byte	0x6
	.4byte	.LASF73
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x5aa
	.byte	0x10
	.byte	0x13
	.string	"ptr"
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x5aa
	.byte	0x18
	.byte	0x6
	.4byte	.LASF74
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x5aa
	.byte	0x20
	.byte	0x6
	.4byte	.LASF75
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x131
	.byte	0x28
	.byte	0x6
	.4byte	.LASF76
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x131
	.byte	0x30
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x50c
	.byte	0xb
	.4byte	.LASF83
	.byte	0xb
	.byte	0x3b
	.byte	0x25
	.4byte	0x541
	.byte	0xb
	.4byte	.LASF84
	.byte	0xc
	.byte	0x3f
	.byte	0x10
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF85
	.byte	0xc
	.byte	0xb7
	.byte	0x10
	.4byte	0x125
	.byte	0x5
	.4byte	.LASF86
	.byte	0x40
	.byte	0xc
	.byte	0xf3
	.byte	0x8
	.4byte	0x616
	.byte	0x6
	.4byte	.LASF87
	.byte	0xc
	.byte	0xf4
	.byte	0x1d
	.4byte	0x616
	.byte	0
	.byte	0x6
	.4byte	.LASF88
	.byte	0xc
	.byte	0xf5
	.byte	0xa
	.4byte	0x119
	.byte	0x8
	.byte	0x6
	.4byte	.LASF89
	.byte	0xc
	.byte	0xf6
	.byte	0xa
	.4byte	0x119
	.byte	0x10
	.byte	0x6
	.4byte	.LASF90
	.byte	0xc
	.byte	0xf7
	.byte	0xa
	.4byte	0x61c
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x5d4
	.byte	0xf
	.4byte	0x364
	.4byte	0x62c
	.byte	0x11
	.4byte	0x40
	.byte	0x4
	.byte	0
	.byte	0xb
	.4byte	.LASF91
	.byte	0xc
	.byte	0xfa
	.byte	0x26
	.4byte	0x616
	.byte	0xb
	.4byte	.LASF92
	.byte	0xd
	.byte	0x39
	.byte	0x10
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF93
	.byte	0xe
	.byte	0x19
	.byte	0x10
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF94
	.byte	0xe
	.byte	0x1a
	.byte	0x10
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF95
	.byte	0xe
	.byte	0x1b
	.byte	0x10
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF96
	.byte	0xe
	.byte	0x1c
	.byte	0x10
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF97
	.byte	0xe
	.byte	0x1d
	.byte	0x10
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF98
	.byte	0xe
	.byte	0x1e
	.byte	0x10
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF99
	.byte	0xe
	.byte	0x1f
	.byte	0x10
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF100
	.byte	0xe
	.byte	0x20
	.byte	0x10
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF101
	.byte	0xe
	.byte	0x21
	.byte	0x10
	.4byte	0x125
	.byte	0x14
	.4byte	0x1fb
	.byte	0x1
	.byte	0x23
	.byte	0x9
	.byte	0x3
	.8byte	caml_atom_table
	.byte	0x15
	.4byte	0x644
	.byte	0x1
	.byte	0x37
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_init_percent_free
	.byte	0x15
	.4byte	0x650
	.byte	0x1
	.byte	0x38
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_init_max_percent_free
	.byte	0x15
	.4byte	0x65c
	.byte	0x1
	.byte	0x39
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_init_minor_heap_wsz
	.byte	0x15
	.4byte	0x668
	.byte	0x1
	.byte	0x3a
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_init_heap_chunk_sz
	.byte	0x15
	.4byte	0x674
	.byte	0x1
	.byte	0x3b
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_init_heap_wsz
	.byte	0x15
	.4byte	0x680
	.byte	0x1
	.byte	0x3c
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_init_max_stack_wsz
	.byte	0x15
	.4byte	0x68c
	.byte	0x1
	.byte	0x3d
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_init_major_window
	.byte	0xb
	.4byte	.LASF102
	.byte	0x1
	.byte	0x3e
	.byte	0xc
	.4byte	0x47
	.byte	0x15
	.4byte	0x698
	.byte	0x1
	.byte	0x3f
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_trace_level
	.byte	0x15
	.4byte	0x6a4
	.byte	0x1
	.byte	0x40
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_cleanup_on_exit
	.byte	0x16
	.4byte	.LASF103
	.byte	0x1
	.byte	0x75
	.byte	0xc
	.4byte	0x47
	.byte	0x9
	.byte	0x3
	.8byte	startup_count
	.byte	0x16
	.4byte	.LASF104
	.byte	0x1
	.byte	0x78
	.byte	0xc
	.4byte	0x47
	.byte	0x9
	.byte	0x3
	.8byte	shutdown_happened
	.byte	0x17
	.4byte	.LASF107
	.byte	0x1
	.byte	0x94
	.byte	0x11
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0x831
	.byte	0x18
	.8byte	.LVL50
	.4byte	0xcb1
	.4byte	0x7d8
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC6
	.byte	0
	.byte	0x18
	.8byte	.LVL51
	.4byte	0x831
	.4byte	0x7f7
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC7
	.byte	0
	.byte	0x18
	.8byte	.LVL52
	.4byte	0x831
	.4byte	0x816
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC8
	.byte	0
	.byte	0x1a
	.8byte	.LVL53
	.4byte	0xcbd
	.byte	0x1a
	.8byte	.LVL54
	.4byte	0xcc9
	.byte	0
	.byte	0x1b
	.4byte	.LASF109
	.byte	0x1
	.byte	0x8d
	.byte	0xd
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x89a
	.byte	0x1c
	.4byte	.LASF105
	.byte	0x1
	.byte	0x8d
	.byte	0x29
	.4byte	0xc8
	.4byte	.LLST2
	.byte	0x1d
	.string	"f"
	.byte	0x1
	.byte	0x8f
	.byte	0xa
	.4byte	0x364
	.4byte	.LLST3
	.byte	0x18
	.8byte	.LVL8
	.4byte	0xcd5
	.4byte	0x886
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x1e
	.8byte	.LVL10
	.4byte	0xce1
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.byte	0x1f
	.4byte	.LASF127
	.byte	0x1
	.byte	0x7b
	.byte	0x5
	.4byte	0x47
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x8f9
	.byte	0x1c
	.4byte	.LASF106
	.byte	0x1
	.byte	0x7b
	.byte	0x1a
	.4byte	0x47
	.4byte	.LLST6
	.byte	0x18
	.8byte	.LVL46
	.4byte	0xcb1
	.4byte	0x8eb
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC5
	.byte	0
	.byte	0x1a
	.8byte	.LVL47
	.4byte	0xced
	.byte	0
	.byte	0x17
	.4byte	.LASF108
	.byte	0x1
	.byte	0x51
	.byte	0x6
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0xb71
	.byte	0x1d
	.string	"opt"
	.byte	0x1
	.byte	0x53
	.byte	0xc
	.4byte	0xb71
	.4byte	.LLST5
	.byte	0x20
	.string	"p"
	.byte	0x1
	.byte	0x54
	.byte	0xb
	.4byte	0x125
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.8byte	.LVL17
	.4byte	0xcf9
	.4byte	0x953
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0
	.byte	0x18
	.8byte	.LVL21
	.4byte	0xcf9
	.4byte	0x972
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC4
	.byte	0
	.byte	0x18
	.8byte	.LVL23
	.4byte	0xb77
	.4byte	0x990
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1a
	.8byte	.LVL24
	.4byte	0xd05
	.byte	0x18
	.8byte	.LVL27
	.4byte	0xb77
	.4byte	0x9bb
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1a
	.8byte	.LVL28
	.4byte	0xd11
	.byte	0x18
	.8byte	.LVL29
	.4byte	0xb77
	.4byte	0x9e6
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x18
	.8byte	.LVL30
	.4byte	0xb77
	.4byte	0xa0b
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	caml_init_heap_wsz
	.byte	0
	.byte	0x18
	.8byte	.LVL31
	.4byte	0xb77
	.4byte	0xa23
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x18
	.8byte	.LVL32
	.4byte	0xb77
	.4byte	0xa48
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	caml_init_heap_chunk_sz
	.byte	0
	.byte	0x18
	.8byte	.LVL33
	.4byte	0xb77
	.4byte	0xa6d
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	caml_init_max_stack_wsz
	.byte	0
	.byte	0x18
	.8byte	.LVL34
	.4byte	0xb77
	.4byte	0xa92
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	caml_init_percent_free
	.byte	0
	.byte	0x18
	.8byte	.LVL35
	.4byte	0xb77
	.4byte	0xab7
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	caml_init_max_percent_free
	.byte	0
	.byte	0x18
	.8byte	.LVL36
	.4byte	0xb77
	.4byte	0xad5
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x18
	.8byte	.LVL37
	.4byte	0xb77
	.4byte	0xafa
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	caml_init_minor_heap_wsz
	.byte	0
	.byte	0x18
	.8byte	.LVL38
	.4byte	0xb77
	.4byte	0xb1f
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	caml_trace_level
	.byte	0
	.byte	0x18
	.8byte	.LVL39
	.4byte	0xb77
	.4byte	0xb37
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x18
	.8byte	.LVL40
	.4byte	0xb77
	.4byte	0xb5c
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	caml_init_major_window
	.byte	0
	.byte	0x1e
	.8byte	.LVL41
	.4byte	0xb77
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x198
	.byte	0x1b
	.4byte	.LASF110
	.byte	0x1
	.byte	0x43
	.byte	0xd
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0xc32
	.byte	0x21
	.string	"opt"
	.byte	0x1
	.byte	0x43
	.byte	0x20
	.4byte	0xb71
	.4byte	.LLST0
	.byte	0x21
	.string	"var"
	.byte	0x1
	.byte	0x43
	.byte	0x2e
	.4byte	0xc32
	.4byte	.LLST1
	.byte	0x16
	.4byte	.LASF111
	.byte	0x1
	.byte	0x45
	.byte	0xb
	.4byte	0x198
	.byte	0x2
	.byte	0x91
	.byte	0x5f
	.byte	0x20
	.string	"val"
	.byte	0x1
	.byte	0x46
	.byte	0x10
	.4byte	0x104
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x18
	.8byte	.LVL2
	.4byte	0xd1d
	.4byte	0xc04
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC0
	.byte	0x19
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x19
	.byte	0x1
	.byte	0x5d
	.byte	0x2
	.byte	0x91
	.byte	0x5f
	.byte	0
	.byte	0x1e
	.8byte	.LVL3
	.4byte	0xd1d
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0x19
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x19
	.byte	0x1
	.byte	0x5d
	.byte	0x2
	.byte	0x91
	.byte	0x5f
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x125
	.byte	0x17
	.4byte	.LASF112
	.byte	0x1
	.byte	0x24
	.byte	0x6
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0xcb1
	.byte	0x1d
	.string	"i"
	.byte	0x1
	.byte	0x26
	.byte	0x7
	.4byte	0x47
	.4byte	.LLST4
	.byte	0x18
	.8byte	.LVL15
	.4byte	0xd29
	.4byte	0xc95
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x34
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	caml_atom_table
	.byte	0x19
	.byte	0x1
	.byte	0x5c
	.byte	0x9
	.byte	0x3
	.8byte	caml_atom_table+2048
	.byte	0
	.byte	0x1e
	.8byte	.LVL16
	.4byte	0xcb1
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC2
	.byte	0
	.byte	0
	.byte	0x22
	.4byte	.LASF113
	.4byte	.LASF113
	.byte	0x5
	.byte	0x6e
	.byte	0x11
	.byte	0x22
	.4byte	.LASF114
	.4byte	.LASF114
	.byte	0x9
	.byte	0x5b
	.byte	0x6
	.byte	0x22
	.4byte	.LASF115
	.4byte	.LASF115
	.byte	0xc
	.byte	0x5f
	.byte	0x11
	.byte	0x22
	.4byte	.LASF116
	.4byte	.LASF116
	.byte	0xd
	.byte	0x2e
	.byte	0x14
	.byte	0x22
	.4byte	.LASF117
	.4byte	.LASF117
	.byte	0xd
	.byte	0x24
	.byte	0x12
	.byte	0x22
	.4byte	.LASF118
	.4byte	.LASF118
	.byte	0xc
	.byte	0x57
	.byte	0x11
	.byte	0x22
	.4byte	.LASF119
	.4byte	.LASF119
	.byte	0xf
	.byte	0x63
	.byte	0x11
	.byte	0x22
	.4byte	.LASF120
	.4byte	.LASF120
	.byte	0x8
	.byte	0x22
	.byte	0x6
	.byte	0x22
	.4byte	.LASF121
	.4byte	.LASF121
	.byte	0x7
	.byte	0x6a
	.byte	0x10
	.byte	0x22
	.4byte	.LASF122
	.4byte	.LASF122
	.byte	0x2
	.byte	0x13
	.byte	0x5
	.byte	0x22
	.4byte	.LASF123
	.4byte	.LASF123
	.byte	0xc
	.byte	0xc1
	.byte	0x5
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
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x8
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0xc
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
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
	.byte	0xf
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x14
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
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x18
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
	.byte	0x19
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
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
	.byte	0x20
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
	.byte	0x21
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
	.byte	0x22
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST2:
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL8-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL8-1-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL43-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL43-.Ltext0
	.8byte	.LVL44-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL44-.Ltext0
	.8byte	.LVL45-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL45-.Ltext0
	.8byte	.LVL46-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL46-.Ltext0
	.8byte	.LVL47-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL47-1-.Ltext0
	.8byte	.LVL48-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL48-.Ltext0
	.8byte	.LVL49-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL49-.Ltext0
	.8byte	.LFE11-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL20-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL2-1-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL6-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL6-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL15-1-.Ltext0
	.2byte	0x1
	.byte	0x5f
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
.LASF74:
	.string	"limit"
.LASF36:
	.string	"backtrace_slot"
.LASF62:
	.string	"caml_young_alloc_start"
.LASF126:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF4:
	.string	"write"
.LASF19:
	.string	"caml_timing_hook"
.LASF106:
	.string	"pooling"
.LASF122:
	.string	"sscanf"
.LASF39:
	.string	"caml_backtrace_last_exn"
.LASF6:
	.string	"wend"
.LASF14:
	.string	"short int"
.LASF8:
	.string	"size_t"
.LASF81:
	.string	"caml_custom_elt"
.LASF42:
	.string	"caml_gc_subphase"
.LASF101:
	.string	"caml_cleanup_on_exit"
.LASF78:
	.string	"ephe"
.LASF5:
	.string	"wpos"
.LASF65:
	.string	"caml_young_limit"
.LASF94:
	.string	"caml_init_max_percent_free"
.LASF26:
	.string	"char_os"
.LASF63:
	.string	"caml_young_alloc_end"
.LASF124:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF29:
	.string	"value"
.LASF25:
	.string	"caml_finalise_end_hook"
.LASF71:
	.string	"caml_ref_table"
.LASF51:
	.string	"caml_gc_sweep_hp"
.LASF22:
	.string	"caml_minor_gc_begin_hook"
.LASF68:
	.string	"caml_in_minor_collection"
.LASF83:
	.string	"caml_custom_table"
.LASF67:
	.string	"caml_minor_heap_wsz"
.LASF66:
	.string	"caml_young_trigger"
.LASF103:
	.string	"startup_count"
.LASF32:
	.string	"tag_t"
.LASF127:
	.string	"caml_startup_aux"
.LASF105:
	.string	"name"
.LASF92:
	.string	"caml_callback_depth"
.LASF57:
	.string	"caml_major_gc_hook"
.LASF96:
	.string	"caml_init_heap_chunk_sz"
.LASF56:
	.string	"caml_gc_clock"
.LASF89:
	.string	"nitems"
.LASF11:
	.string	"stderr"
.LASF110:
	.string	"scanmult"
.LASF2:
	.string	"long long int"
.LASF53:
	.string	"caml_major_ring"
.LASF73:
	.string	"threshold"
.LASF114:
	.string	"caml_finalise_heap"
.LASF90:
	.string	"tables"
.LASF16:
	.string	"intnat"
.LASF0:
	.string	"long int"
.LASF79:
	.string	"offset"
.LASF76:
	.string	"reserve"
.LASF84:
	.string	"caml_huge_fallback_count"
.LASF82:
	.string	"block"
.LASF40:
	.string	"caml_fl_cur_wsz"
.LASF28:
	.string	"caml_runtime_warnings"
.LASF30:
	.string	"header_t"
.LASF99:
	.string	"caml_init_major_window"
.LASF112:
	.string	"caml_init_atom_table"
.LASF97:
	.string	"caml_init_heap_wsz"
.LASF21:
	.string	"caml_major_slice_end_hook"
.LASF33:
	.string	"caml_atom_table"
.LASF3:
	.string	"long double"
.LASF24:
	.string	"caml_finalise_begin_hook"
.LASF38:
	.string	"caml_backtrace_pos"
.LASF69:
	.string	"caml_extra_heap_resources_minor"
.LASF47:
	.string	"caml_dependent_allocated"
.LASF100:
	.string	"caml_trace_level"
.LASF121:
	.string	"caml_record_backtrace"
.LASF31:
	.string	"mlsize_t"
.LASF86:
	.string	"caml__roots_block"
.LASF17:
	.string	"uintnat"
.LASF59:
	.string	"caml_young_end"
.LASF13:
	.string	"unsigned int"
.LASF111:
	.string	"mult"
.LASF123:
	.string	"caml_page_table_add"
.LASF95:
	.string	"caml_init_minor_heap_wsz"
.LASF64:
	.string	"caml_young_ptr"
.LASF20:
	.string	"caml_major_slice_begin_hook"
.LASF15:
	.string	"short unsigned int"
.LASF70:
	.string	"_FILE"
.LASF58:
	.string	"caml_young_start"
.LASF7:
	.string	"char"
.LASF108:
	.string	"caml_parse_ocamlrunparam"
.LASF54:
	.string	"caml_major_ring_index"
.LASF91:
	.string	"caml_local_roots"
.LASF104:
	.string	"shutdown_happened"
.LASF93:
	.string	"caml_init_percent_free"
.LASF41:
	.string	"caml_gc_phase"
.LASF35:
	.string	"caml_backtrace_active"
.LASF27:
	.string	"caml_verb_gc"
.LASF23:
	.string	"caml_minor_gc_end_hook"
.LASF109:
	.string	"call_registered_value"
.LASF52:
	.string	"caml_major_window"
.LASF37:
	.string	"caml_backtrace_buffer"
.LASF107:
	.string	"caml_shutdown"
.LASF1:
	.string	"long unsigned int"
.LASF60:
	.string	"caml_code_area_start"
.LASF45:
	.string	"double"
.LASF34:
	.string	"caml_global_data"
.LASF120:
	.string	"caml_set_allocation_policy"
.LASF75:
	.string	"size"
.LASF125:
	.string	"startup_aux.c"
.LASF116:
	.string	"caml_named_value"
.LASF102:
	.string	"caml_parser_trace"
.LASF48:
	.string	"caml_fl_wsz_at_phase_change"
.LASF12:
	.string	"stdin"
.LASF115:
	.string	"caml_stat_destroy_pool"
.LASF113:
	.string	"caml_fatal_error"
.LASF61:
	.string	"caml_code_area_end"
.LASF44:
	.string	"caml_extra_heap_resources"
.LASF43:
	.string	"caml_allocated_words"
.LASF117:
	.string	"caml_callback_exn"
.LASF88:
	.string	"ntables"
.LASF46:
	.string	"caml_dependent_size"
.LASF49:
	.string	"caml_heap_start"
.LASF98:
	.string	"caml_init_max_stack_wsz"
.LASF18:
	.string	"asize_t"
.LASF9:
	.string	"FILE"
.LASF50:
	.string	"total_heap_size"
.LASF72:
	.string	"base"
.LASF55:
	.string	"caml_major_work_credit"
.LASF119:
	.string	"caml_secure_getenv"
.LASF80:
	.string	"caml_ephe_ref_table"
.LASF77:
	.string	"caml_ephe_ref_elt"
.LASF10:
	.string	"stdout"
.LASF87:
	.string	"next"
.LASF85:
	.string	"caml_use_huge_pages"
.LASF118:
	.string	"caml_stat_create_pool"
	.ident	"GCC: (GNU) 9.2.0"
