	.file	"dynlink_nat.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.Val_handle,"ax",@progbits
	.align	1
	.type	Val_handle, @function
Val_handle:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	li	a1,251
	li	a0,1
	call	caml_alloc_small
	sd	s0,0(a0)
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	Val_handle, .-Val_handle
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"caml"
	.section	.text.getsym,"ax",@progbits
	.align	1
	.type	getsym, @function
getsym:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a0
	mv	a3,a2
	mv	a2,a1
	lla	a1,.LC0
	li	a0,3
	call	caml_stat_strconcat
	mv	s0,a0
	mv	a1,a0
	mv	a0,s1
	call	caml_dlsym
	mv	s1,a0
	mv	a0,s0
	call	caml_stat_free
	mv	a0,s1
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	getsym, .-getsym
	.section	.text.caml_natdynlink_getmap,"ax",@progbits
	.align	1
	.globl	caml_natdynlink_getmap
	.type	caml_natdynlink_getmap, @function
caml_natdynlink_getmap:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a1,-2147483648
	xori	a1,a1,-1
	lla	a0,caml_globals_map
	call	caml_input_value_from_block
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_natdynlink_getmap, .-caml_natdynlink_getmap
	.section	.text.caml_natdynlink_globals_inited,"ax",@progbits
	.align	1
	.globl	caml_natdynlink_globals_inited
	.type	caml_natdynlink_globals_inited, @function
caml_natdynlink_globals_inited:
	ld	a0,caml_globals_inited
	slli	a0,a0,1
	addi	a0,a0,1
	ret
	.size	caml_natdynlink_globals_inited, .-caml_natdynlink_globals_inited
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"caml_plugin_header"
	.align	3
.LC2:
	.string	"not an OCaml plugin"
	.section	.text.caml_natdynlink_open,"ax",@progbits
	.align	1
	.globl	caml_natdynlink_open
	.type	caml_natdynlink_open, @function
caml_natdynlink_open:
	addi	sp,sp,-208
	sd	ra,200(sp)
	sd	s0,192(sp)
	sd	s1,184(sp)
	sd	s2,176(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	ld	a4,Caml_state
	ld	s2,280(a4)
	sd	s2,112(sp)
	li	a5,1
	sd	a5,128(sp)
	li	a3,2
	sd	a3,120(sp)
	addi	a3,sp,8
	sd	a3,136(sp)
	sd	sp,144(sp)
	sd	a5,104(sp)
	sd	a5,96(sp)
	sd	a5,88(sp)
	addi	a3,sp,112
	sd	a3,24(sp)
	addi	a3,sp,24
	sd	a3,280(a4)
	sd	a5,40(sp)
	li	a5,3
	sd	a5,32(sp)
	addi	a5,sp,104
	sd	a5,48(sp)
	addi	a5,sp,96
	sd	a5,56(sp)
	addi	a5,sp,88
	sd	a5,64(sp)
	call	caml_stat_strdup
	mv	s1,a0
	call	caml_enter_blocking_section
	ld	a2,0(sp)
	srai	a2,a2,1
	sext.w	a2,a2
	li	a1,1
	mv	a0,s1
	call	caml_dlopen
	mv	s0,a0
	call	caml_leave_blocking_section
	mv	a0,s1
	call	caml_stat_free
	beq	s0,zero,.L12
	lla	a1,.LC1
	mv	a0,s0
	call	caml_dlsym
	mv	s1,a0
	beq	a0,zero,.L13
	mv	a0,s0
	call	Val_handle
	sd	a0,96(sp)
	li	a1,-2147483648
	xori	a1,a1,-1
	mv	a0,s1
	call	caml_input_value_from_block
	sd	a0,88(sp)
	li	a0,2
	call	caml_alloc_tuple
	sd	a0,104(sp)
	ld	a5,96(sp)
	sd	a5,0(a0)
	ld	a4,88(sp)
	ld	a5,104(sp)
	sd	a4,8(a5)
	ld	a5,Caml_state
	sd	s2,280(a5)
	ld	a0,104(sp)
	ld	ra,200(sp)
	ld	s0,192(sp)
	ld	s1,184(sp)
	ld	s2,176(sp)
	addi	sp,sp,208
	jr	ra
.L12:
	call	caml_dlerror
	call	caml_failwith
.L13:
	lla	a0,.LC2
	call	caml_failwith
	.size	caml_natdynlink_open, .-caml_natdynlink_open
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"__frametable"
	.align	3
.LC4:
	.string	"__gc_roots"
	.align	3
.LC5:
	.string	"__data_begin"
	.align	3
.LC6:
	.string	"__data_end"
	.align	3
.LC7:
	.string	"__code_begin"
	.align	3
.LC8:
	.string	"__code_end"
	.align	3
.LC9:
	.string	"__entry"
	.section	.text.caml_natdynlink_run,"ax",@progbits
	.align	1
	.globl	caml_natdynlink_run
	.type	caml_natdynlink_run, @function
caml_natdynlink_run:
	addi	sp,sp,-208
	sd	ra,200(sp)
	sd	s0,192(sp)
	sd	s1,184(sp)
	sd	s2,176(sp)
	sd	s3,168(sp)
	sd	s4,160(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	ld	a4,Caml_state
	ld	s3,280(a4)
	sd	s3,96(sp)
	li	a5,1
	sd	a5,112(sp)
	li	a3,2
	sd	a3,104(sp)
	addi	a3,sp,8
	sd	a3,120(sp)
	sd	sp,128(sp)
	sd	a5,88(sp)
	addi	a3,sp,96
	sd	a3,24(sp)
	addi	a3,sp,24
	sd	a3,280(a4)
	sd	a5,40(sp)
	sd	a5,32(sp)
	addi	a5,sp,88
	sd	a5,48(sp)
	ld	s1,0(a0)
	mv	s0,a1
	lla	a2,.LC3
	mv	a0,s1
	call	getsym
	beq	a0,zero,.L15
	call	caml_register_frametable
.L15:
	lla	a2,.LC4
	mv	a1,s0
	mv	a0,s1
	call	getsym
	beq	a0,zero,.L16
	call	caml_register_dyn_global
.L16:
	lla	a2,.LC5
	mv	a1,s0
	mv	a0,s1
	call	getsym
	mv	s2,a0
	lla	a2,.LC6
	mv	a1,s0
	mv	a0,s1
	call	getsym
	beq	s2,zero,.L17
	beq	a0,zero,.L17
	mv	a2,a0
	mv	a1,s2
	li	a0,4
	call	caml_page_table_add
.L17:
	lla	a2,.LC7
	mv	a1,s0
	mv	a0,s1
	call	getsym
	mv	s2,a0
	lla	a2,.LC8
	mv	a1,s0
	mv	a0,s1
	call	getsym
	mv	s4,a0
	beq	s2,zero,.L18
	beq	a0,zero,.L18
	mv	a2,a0
	mv	a1,s2
	li	a0,8
	call	caml_page_table_add
	li	a0,40
	call	caml_stat_alloc
	mv	a1,a0
	sd	s2,0(a0)
	sd	s4,8(a0)
	sb	zero,32(a0)
	lla	a0,caml_code_fragments_table
	call	caml_ext_table_add
.L18:
	ld	a5,caml_natdynlink_hook
	beq	a5,zero,.L19
	mv	a1,s0
	mv	a0,s1
	jalr	a5
.L19:
	lla	a2,.LC9
	mv	a1,s0
	mv	a0,s1
	call	getsym
	sd	a0,16(sp)
	beq	a0,zero,.L20
	li	a1,0
	addi	a0,sp,16
	call	caml_callback
	sd	a0,88(sp)
.L21:
	ld	a5,Caml_state
	sd	s3,280(a5)
	ld	a0,88(sp)
	ld	ra,200(sp)
	ld	s0,192(sp)
	ld	s1,184(sp)
	ld	s2,176(sp)
	ld	s3,168(sp)
	ld	s4,160(sp)
	addi	sp,sp,208
	jr	ra
.L20:
	li	a5,1
	sd	a5,88(sp)
	j	.L21
	.size	caml_natdynlink_run, .-caml_natdynlink_run
	.section	.text.caml_natdynlink_run_toplevel,"ax",@progbits
	.align	1
	.globl	caml_natdynlink_run_toplevel
	.type	caml_natdynlink_run_toplevel, @function
caml_natdynlink_run_toplevel:
	addi	sp,sp,-208
	sd	ra,200(sp)
	sd	s0,192(sp)
	sd	s1,184(sp)
	sd	s2,176(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	ld	a4,Caml_state
	ld	s2,280(a4)
	sd	s2,112(sp)
	li	a5,1
	sd	a5,128(sp)
	li	a3,2
	sd	a3,120(sp)
	addi	a3,sp,8
	sd	a3,136(sp)
	sd	sp,144(sp)
	sd	a5,104(sp)
	sd	a5,96(sp)
	sd	a5,88(sp)
	addi	a3,sp,112
	sd	a3,24(sp)
	addi	a3,sp,24
	sd	a3,280(a4)
	sd	a5,40(sp)
	li	a5,3
	sd	a5,32(sp)
	addi	a5,sp,104
	sd	a5,48(sp)
	addi	a5,sp,96
	sd	a5,56(sp)
	addi	a5,sp,88
	sd	a5,64(sp)
	call	caml_stat_strdup
	mv	s0,a0
	call	caml_enter_blocking_section
	li	a2,1
	li	a1,1
	mv	a0,s0
	call	caml_dlopen
	mv	s1,a0
	call	caml_leave_blocking_section
	mv	a0,s0
	call	caml_stat_free
	beq	s1,zero,.L27
	mv	a0,s1
	call	Val_handle
	sd	a0,88(sp)
	li	a1,0
	li	a0,1
	call	caml_alloc
	sd	a0,104(sp)
	ld	a1,0(sp)
	ld	a0,88(sp)
	call	caml_natdynlink_run
	mv	a1,a0
	sd	a0,96(sp)
	ld	a0,104(sp)
	call	caml_modify
.L25:
	ld	a5,Caml_state
	sd	s2,280(a5)
	ld	a0,104(sp)
	ld	ra,200(sp)
	ld	s0,192(sp)
	ld	s1,184(sp)
	ld	s2,176(sp)
	addi	sp,sp,208
	jr	ra
.L27:
	li	a1,1
	li	a0,1
	call	caml_alloc
	sd	a0,104(sp)
	call	caml_dlerror
	call	caml_copy_string
	mv	a1,a0
	sd	a0,96(sp)
	ld	a0,104(sp)
	call	caml_modify
	j	.L25
	.size	caml_natdynlink_run_toplevel, .-caml_natdynlink_run_toplevel
	.section	.text.caml_natdynlink_loadsym,"ax",@progbits
	.align	1
	.globl	caml_natdynlink_loadsym
	.type	caml_natdynlink_loadsym, @function
caml_natdynlink_loadsym:
	addi	sp,sp,-176
	sd	ra,168(sp)
	sd	s0,160(sp)
	sd	a0,8(sp)
	ld	a4,Caml_state
	ld	s0,280(a4)
	sd	s0,96(sp)
	li	a5,1
	sd	a5,112(sp)
	sd	a5,104(sp)
	addi	a3,sp,8
	sd	a3,120(sp)
	sd	a5,88(sp)
	addi	a3,sp,96
	sd	a3,24(sp)
	addi	a3,sp,24
	sd	a3,280(a4)
	sd	a5,40(sp)
	sd	a5,32(sp)
	addi	a5,sp,88
	sd	a5,48(sp)
	call	caml_globalsym
	sd	a0,88(sp)
	beq	a0,zero,.L31
	ld	a5,Caml_state
	sd	s0,280(a5)
	ld	ra,168(sp)
	ld	s0,160(sp)
	addi	sp,sp,176
	jr	ra
.L31:
	ld	a0,8(sp)
	call	caml_failwith
	.size	caml_natdynlink_loadsym, .-caml_natdynlink_loadsym
	.globl	caml_natdynlink_hook
	.section	.sbss,"aw",@nobits
	.align	3
	.type	caml_natdynlink_hook, @object
	.size	caml_natdynlink_hook, 8
caml_natdynlink_hook:
	.zero	8
	.ident	"GCC: (GNU) 9.2.0"
