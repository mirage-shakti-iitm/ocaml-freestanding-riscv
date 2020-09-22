	.file	"dynlink.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Opening shared library %s\n"
	.section	.text.caml_dynlink_open_lib,"ax",@progbits
	.align	1
	.globl	caml_dynlink_open_lib
	.type	caml_dynlink_open_lib, @function
caml_dynlink_open_lib:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	mv	s1,a1
	mv	a2,a1
	lla	a1,.LC0
	li	a0,256
	call	caml_gc_message
	mv	a0,s1
	call	caml_stat_strdup
	mv	s1,a0
	call	caml_enter_blocking_section
	srai	a1,s0,1
	li	a2,1
	sext.w	a1,a1
	mv	a0,s1
	call	caml_dlopen
	mv	s0,a0
	call	caml_leave_blocking_section
	mv	a0,s1
	call	caml_stat_free
	beq	s0,zero,.L4
	li	a1,251
	li	a0,1
	call	caml_alloc_small
	sd	s0,0(a0)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L4:
	call	caml_dlerror
	call	caml_failwith
	.size	caml_dynlink_open_lib, .-caml_dynlink_open_lib
	.section	.text.caml_dynlink_close_lib,"ax",@progbits
	.align	1
	.globl	caml_dynlink_close_lib
	.type	caml_dynlink_close_lib, @function
caml_dynlink_close_lib:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,0(a0)
	call	caml_dlclose
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_dynlink_close_lib, .-caml_dynlink_close_lib
	.section	.text.caml_dynlink_lookup_symbol,"ax",@progbits
	.align	1
	.globl	caml_dynlink_lookup_symbol
	.type	caml_dynlink_lookup_symbol, @function
caml_dynlink_lookup_symbol:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	ld	a0,0(a0)
	call	caml_dlsym
	beq	a0,zero,.L9
	mv	s0,a0
	li	a1,251
	li	a0,1
	call	caml_alloc_small
	sd	s0,0(a0)
.L7:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L9:
	li	a0,1
	j	.L7
	.size	caml_dynlink_lookup_symbol, .-caml_dynlink_lookup_symbol
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"dynlink_add_primitive"
	.section	.text.caml_dynlink_add_primitive,"ax",@progbits
	.align	1
	.globl	caml_dynlink_add_primitive
	.type	caml_dynlink_add_primitive, @function
caml_dynlink_add_primitive:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,.LC1
	call	caml_invalid_argument
	.size	caml_dynlink_add_primitive, .-caml_dynlink_add_primitive
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"dynlink_get_current_libs"
	.section	.text.caml_dynlink_get_current_libs,"ax",@progbits
	.align	1
	.globl	caml_dynlink_get_current_libs
	.type	caml_dynlink_get_current_libs, @function
caml_dynlink_get_current_libs:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,.LC2
	call	caml_invalid_argument
	.size	caml_dynlink_get_current_libs, .-caml_dynlink_get_current_libs
	.ident	"GCC: (GNU) 9.2.0"
