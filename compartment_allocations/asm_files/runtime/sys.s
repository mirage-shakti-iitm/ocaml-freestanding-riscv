	.file	"sys.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.error_message,"ax",@progbits
	.align	1
	.type	error_message, @function
error_message:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a0,errno
	call	strerror
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	error_message, .-error_message
	.section	.text.caml_sys_error,"ax",@progbits
	.align	1
	.globl	caml_sys_error
	.type	caml_sys_error, @function
caml_sys_error:
	addi	sp,sp,-208
	sd	ra,200(sp)
	sd	s0,192(sp)
	sd	s1,184(sp)
	sd	s2,176(sp)
	sd	s3,168(sp)
	sd	a0,8(sp)
	ld	a5,Caml_state
	ld	a4,280(a5)
	sd	a4,96(sp)
	li	s0,1
	sd	s0,112(sp)
	sd	s0,104(sp)
	addi	a4,sp,8
	sd	a4,120(sp)
	sd	s0,88(sp)
	addi	a4,sp,96
	sd	a4,24(sp)
	addi	a4,sp,24
	sd	a4,280(a5)
	sd	s0,40(sp)
	sd	s0,32(sp)
	addi	a5,sp,88
	sd	a5,48(sp)
	call	error_message
	mv	s1,a0
	ld	s3,8(sp)
	beq	s3,s0,.L7
	call	strlen
	mv	s2,a0
	mv	a0,s3
	call	caml_string_length
	mv	s0,a0
	add	a0,s2,a0
	addi	a0,a0,2
	call	caml_alloc_string
	sd	a0,88(sp)
	mv	a2,s0
	ld	a1,8(sp)
	call	memmove
	ld	a5,88(sp)
	add	a5,s0,a5
	li	a4,58
	sb	a4,0(a5)
	li	a4,32
	sb	a4,1(a5)
	ld	a0,88(sp)
	add	a0,a0,s0
	mv	a2,s2
	mv	a1,s1
	addi	a0,a0,2
	call	memmove
.L5:
	ld	a0,88(sp)
	call	caml_raise_sys_error
.L7:
	call	caml_copy_string
	sd	a0,88(sp)
	j	.L5
	.size	caml_sys_error, .-caml_sys_error
	.section	.text.caml_sys_check_path,"ax",@progbits
	.align	1
	.type	caml_sys_check_path, @function
caml_sys_check_path:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	call	caml_string_is_c_safe
	beq	a0,zero,.L11
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L11:
	li	a5,5
	sw	a5,errno,a4
	mv	a0,s0
	call	caml_sys_error
	.size	caml_sys_check_path, .-caml_sys_check_path
	.section	.text.caml_sys_io_error,"ax",@progbits
	.align	1
	.globl	caml_sys_io_error
	.type	caml_sys_io_error, @function
caml_sys_io_error:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a4,errno
	li	a5,-1
	beq	a4,a5,.L15
	call	caml_sys_error
.L15:
	call	caml_raise_sys_blocked_io
	.size	caml_sys_io_error, .-caml_sys_io_error
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"allocated_words: %.0f\n"
	.align	3
.LC1:
	.string	"minor_words: %.0f\n"
	.align	3
.LC2:
	.string	"promoted_words: %.0f\n"
	.align	3
.LC3:
	.string	"major_words: %.0f\n"
	.align	3
.LC4:
	.string	"minor_collections: %ld\n"
	.align	3
.LC5:
	.string	"major_collections: %ld\n"
	.align	3
.LC6:
	.string	"heap_words: %ld\n"
	.align	3
.LC7:
	.string	"heap_chunks: %ld\n"
	.align	3
.LC8:
	.string	"top_heap_words: %ld\n"
	.align	3
.LC9:
	.string	"compactions: %ld\n"
	.section	.text.caml_sys_exit,"ax",@progbits
	.align	1
	.globl	caml_sys_exit
	.type	caml_sys_exit, @function
caml_sys_exit:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	sd	s1,72(sp)
	sd	s2,64(sp)
	sd	s3,56(sp)
	sd	s4,48(sp)
	sd	s5,40(sp)
	sd	s6,32(sp)
	fsd	fs0,24(sp)
	fsd	fs1,16(sp)
	fsd	fs2,8(sp)
	srai	s0,a0,1
	sext.w	s0,s0
	ld	a5,caml_verb_gc
	andi	a5,a5,1024
	bne	a5,zero,.L20
.L17:
	lw	a5,caml_cleanup_on_exit
	bne	a5,zero,.L21
.L18:
	mv	a0,s0
	call	exit
.L20:
	ld	a5,Caml_state
	fld	fs1,288(a5)
	ld	a2,40(a5)
	ld	a4,0(a5)
	sub	a2,a2,a4
	srai	a2,a2,3
	fcvt.d.l	fa5,a2
	fadd.d	fs1,fs1,fa5
	fld	fs2,296(a5)
	fld	fs0,304(a5)
	ld	a4,caml_allocated_words
	fcvt.d.lu	fa5,a4
	fadd.d	fs0,fs0,fa5
	fadd.d	fa5,fs1,fs0
	ld	s6,312(a5)
	ld	s5,320(a5)
	ld	s4,328(a5)
	ld	s3,352(a5)
	ld	s2,336(a5)
	ld	s1,344(a5)
	fsub.d	fa5,fa5,fs2
	fmv.x.d	a2,fa5
	lla	a1,.LC0
	li	a0,1024
	call	caml_gc_message
	fmv.x.d	a2,fs1
	lla	a1,.LC1
	li	a0,1024
	call	caml_gc_message
	fmv.x.d	a2,fs2
	lla	a1,.LC2
	li	a0,1024
	call	caml_gc_message
	fmv.x.d	a2,fs0
	lla	a1,.LC3
	li	a0,1024
	call	caml_gc_message
	mv	a2,s6
	lla	a1,.LC4
	li	a0,1024
	call	caml_gc_message
	mv	a2,s5
	lla	a1,.LC5
	li	a0,1024
	call	caml_gc_message
	mv	a2,s4
	lla	a1,.LC6
	li	a0,1024
	call	caml_gc_message
	mv	a2,s3
	lla	a1,.LC7
	li	a0,1024
	call	caml_gc_message
	mv	a2,s2
	lla	a1,.LC8
	li	a0,1024
	call	caml_gc_message
	mv	a2,s1
	lla	a1,.LC9
	li	a0,1024
	call	caml_gc_message
	j	.L17
.L21:
	call	caml_shutdown
	j	.L18
	.size	caml_sys_exit, .-caml_sys_exit
	.section	.text.caml_sys_open,"ax",@progbits
	.align	1
	.globl	caml_sys_open
	.type	caml_sys_open, @function
caml_sys_open:
	addi	sp,sp,-144
	sd	ra,136(sp)
	sd	s0,128(sp)
	sd	s1,120(sp)
	sd	s2,112(sp)
	sd	s3,104(sp)
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	ld	a5,Caml_state
	ld	s3,280(a5)
	sd	s3,32(sp)
	addi	a4,sp,32
	sd	a4,280(a5)
	li	a5,1
	sd	a5,48(sp)
	li	a5,3
	sd	a5,40(sp)
	addi	a5,sp,24
	sd	a5,56(sp)
	addi	a5,sp,16
	sd	a5,64(sp)
	addi	a5,sp,8
	sd	a5,72(sp)
	call	caml_sys_check_path
	ld	a0,24(sp)
	call	caml_stat_strdup
	mv	s1,a0
	lla	a1,.LANCHOR0
	ld	a0,16(sp)
	call	caml_convert_flag_list
	mv	s2,a0
	ld	s0,8(sp)
	srai	s0,s0,1
	sext.w	s0,s0
	call	caml_enter_blocking_section
	mv	a2,s0
	mv	a1,s2
	mv	a0,s1
	call	open
	mv	s0,a0
	call	caml_leave_blocking_section
	mv	a0,s1
	call	caml_stat_free
	li	a5,-1
	beq	s0,a5,.L25
	slli	a0,s0,1
	ld	a5,Caml_state
	sd	s3,280(a5)
	addi	a0,a0,1
	ld	ra,136(sp)
	ld	s0,128(sp)
	ld	s1,120(sp)
	ld	s2,112(sp)
	ld	s3,104(sp)
	addi	sp,sp,144
	jr	ra
.L25:
	ld	a0,24(sp)
	call	caml_sys_error
	.size	caml_sys_open, .-caml_sys_open
	.section	.text.caml_sys_close,"ax",@progbits
	.align	1
	.globl	caml_sys_close
	.type	caml_sys_close, @function
caml_sys_close:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	srai	s0,a0,1
	sext.w	s0,s0
	call	caml_enter_blocking_section
	mv	a0,s0
	call	close
	call	caml_leave_blocking_section
	li	a0,1
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_sys_close, .-caml_sys_close
	.section	.text.caml_sys_file_exists,"ax",@progbits
	.align	1
	.globl	caml_sys_file_exists
	.type	caml_sys_file_exists, @function
caml_sys_file_exists:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	mv	s0,a0
	call	caml_string_is_c_safe
	bne	a0,zero,.L33
	li	a0,1
.L28:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	addi	sp,sp,48
	jr	ra
.L33:
	mv	a0,s0
	call	caml_stat_strdup
	mv	s0,a0
	call	caml_enter_blocking_section
	addi	a1,sp,8
	mv	a0,s0
	call	stat
	mv	s1,a0
	call	caml_leave_blocking_section
	mv	a0,s0
	call	caml_stat_free
	beq	s1,zero,.L34
	li	a0,1
	j	.L28
.L34:
	li	a0,3
	j	.L28
	.size	caml_sys_file_exists, .-caml_sys_file_exists
	.section	.text.caml_sys_is_directory,"ax",@progbits
	.align	1
	.globl	caml_sys_is_directory
	.type	caml_sys_is_directory, @function
caml_sys_is_directory:
	addi	sp,sp,-128
	sd	ra,120(sp)
	sd	s0,112(sp)
	sd	s1,104(sp)
	sd	s2,96(sp)
	sd	a0,8(sp)
	ld	a5,Caml_state
	ld	s2,280(a5)
	sd	s2,32(sp)
	addi	a4,sp,32
	sd	a4,280(a5)
	li	a5,1
	sd	a5,48(sp)
	sd	a5,40(sp)
	addi	a5,sp,8
	sd	a5,56(sp)
	call	caml_sys_check_path
	ld	a0,8(sp)
	call	caml_stat_strdup
	mv	s0,a0
	call	caml_enter_blocking_section
	addi	a1,sp,24
	mv	a0,s0
	call	stat
	mv	s1,a0
	call	caml_leave_blocking_section
	mv	a0,s0
	call	caml_stat_free
	li	a5,-1
	beq	s1,a5,.L38
	ld	a5,Caml_state
	sd	s2,280(a5)
	li	a0,1
	ld	ra,120(sp)
	ld	s0,112(sp)
	ld	s1,104(sp)
	ld	s2,96(sp)
	addi	sp,sp,128
	jr	ra
.L38:
	ld	a0,8(sp)
	call	caml_sys_error
	.size	caml_sys_is_directory, .-caml_sys_is_directory
	.section	.text.caml_sys_remove,"ax",@progbits
	.align	1
	.globl	caml_sys_remove
	.type	caml_sys_remove, @function
caml_sys_remove:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	s2,80(sp)
	sd	a0,8(sp)
	ld	a5,Caml_state
	ld	s2,280(a5)
	sd	s2,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	call	caml_sys_check_path
	ld	a0,8(sp)
	call	caml_stat_strdup
	mv	s0,a0
	call	caml_enter_blocking_section
	mv	a0,s0
	call	unlink
	mv	s1,a0
	call	caml_leave_blocking_section
	mv	a0,s0
	call	caml_stat_free
	bne	s1,zero,.L42
	ld	a5,Caml_state
	sd	s2,280(a5)
	li	a0,1
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	ld	s2,80(sp)
	addi	sp,sp,112
	jr	ra
.L42:
	ld	a0,8(sp)
	call	caml_sys_error
	.size	caml_sys_remove, .-caml_sys_remove
	.section	.text.caml_sys_rename,"ax",@progbits
	.align	1
	.globl	caml_sys_rename
	.type	caml_sys_rename, @function
caml_sys_rename:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s0,a0
	mv	s1,a1
	call	caml_sys_check_path
	mv	a0,s1
	call	caml_sys_check_path
	mv	a0,s0
	call	caml_stat_strdup
	mv	s0,a0
	mv	a0,s1
	call	caml_stat_strdup
	mv	s1,a0
	call	caml_enter_blocking_section
	mv	a1,s1
	mv	a0,s0
	call	rename
	mv	s2,a0
	call	caml_leave_blocking_section
	mv	a0,s1
	call	caml_stat_free
	mv	a0,s0
	call	caml_stat_free
	bne	s2,zero,.L46
	li	a0,1
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L46:
	li	a0,1
	call	caml_sys_error
	.size	caml_sys_rename, .-caml_sys_rename
	.section	.text.caml_sys_chdir,"ax",@progbits
	.align	1
	.globl	caml_sys_chdir
	.type	caml_sys_chdir, @function
caml_sys_chdir:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	s2,80(sp)
	sd	a0,8(sp)
	ld	a5,Caml_state
	ld	s2,280(a5)
	sd	s2,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	call	caml_sys_check_path
	ld	a0,8(sp)
	call	caml_stat_strdup
	mv	s0,a0
	call	caml_enter_blocking_section
	mv	a0,s0
	call	chdir
	mv	s1,a0
	call	caml_leave_blocking_section
	mv	a0,s0
	call	caml_stat_free
	bne	s1,zero,.L50
	ld	a5,Caml_state
	sd	s2,280(a5)
	li	a0,1
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	ld	s2,80(sp)
	addi	sp,sp,112
	jr	ra
.L50:
	ld	a0,8(sp)
	call	caml_sys_error
	.size	caml_sys_chdir, .-caml_sys_chdir
	.section	.rodata.str1.8
	.align	3
.LC10:
	.string	"Sys.getcwd not implemented"
	.section	.text.caml_sys_getcwd,"ax",@progbits
	.align	1
	.globl	caml_sys_getcwd
	.type	caml_sys_getcwd, @function
caml_sys_getcwd:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,.LC10
	call	caml_invalid_argument
	.size	caml_sys_getcwd, .-caml_sys_getcwd
	.section	.text.caml_sys_unsafe_getenv,"ax",@progbits
	.align	1
	.globl	caml_sys_unsafe_getenv
	.type	caml_sys_unsafe_getenv, @function
caml_sys_unsafe_getenv:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	call	caml_string_is_c_safe
	beq	a0,zero,.L57
	mv	a0,s0
	call	caml_stat_strdup
	mv	s1,a0
	call	getenv
	mv	s0,a0
	mv	a0,s1
	call	caml_stat_free
	beq	s0,zero,.L58
	mv	a0,s0
	call	caml_copy_string
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L57:
	call	caml_raise_not_found
.L58:
	call	caml_raise_not_found
	.size	caml_sys_unsafe_getenv, .-caml_sys_unsafe_getenv
	.section	.text.caml_sys_getenv,"ax",@progbits
	.align	1
	.globl	caml_sys_getenv
	.type	caml_sys_getenv, @function
caml_sys_getenv:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	call	caml_string_is_c_safe
	beq	a0,zero,.L63
	mv	a0,s0
	call	caml_stat_strdup
	mv	s1,a0
	call	caml_secure_getenv
	mv	s0,a0
	mv	a0,s1
	call	caml_stat_free
	beq	s0,zero,.L64
	mv	a0,s0
	call	caml_copy_string
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L63:
	call	caml_raise_not_found
.L64:
	call	caml_raise_not_found
	.size	caml_sys_getenv, .-caml_sys_getenv
	.section	.text.caml_sys_get_argv,"ax",@progbits
	.align	1
	.globl	caml_sys_get_argv
	.type	caml_sys_get_argv, @function
caml_sys_get_argv:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	lla	s1,Caml_state
	ld	a4,0(s1)
	ld	s0,280(a4)
	li	a5,1
	sd	a5,72(sp)
	sd	a5,64(sp)
	sd	s0,0(sp)
	sd	sp,280(a4)
	sd	a5,16(sp)
	li	a5,2
	sd	a5,8(sp)
	addi	a5,sp,72
	sd	a5,24(sp)
	addi	a5,sp,64
	sd	a5,32(sp)
	ld	a0,caml_exe_name
	call	caml_copy_string
	sd	a0,72(sp)
	li	a1,0
	li	a0,2
	call	caml_alloc_small
	sd	a0,64(sp)
	ld	a5,72(sp)
	sd	a5,0(a0)
	ld	a4,main_argv
	ld	a5,64(sp)
	sd	a4,8(a5)
	ld	a5,0(s1)
	sd	s0,280(a5)
	ld	a0,64(sp)
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	addi	sp,sp,112
	jr	ra
	.size	caml_sys_get_argv, .-caml_sys_get_argv
	.section	.text.caml_sys_argv,"ax",@progbits
	.align	1
	.globl	caml_sys_argv
	.type	caml_sys_argv, @function
caml_sys_argv:
	ld	a0,main_argv
	ret
	.size	caml_sys_argv, .-caml_sys_argv
	.section	.text.caml_sys_modify_argv,"ax",@progbits
	.align	1
	.globl	caml_sys_modify_argv
	.type	caml_sys_modify_argv, @function
caml_sys_modify_argv:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a1,a0
	lla	a0,main_argv
	call	caml_modify_generational_global_root
	li	a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_sys_modify_argv, .-caml_sys_modify_argv
	.section	.text.caml_sys_executable_name,"ax",@progbits
	.align	1
	.globl	caml_sys_executable_name
	.type	caml_sys_executable_name, @function
caml_sys_executable_name:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,caml_exe_name
	call	caml_copy_string
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_sys_executable_name, .-caml_sys_executable_name
	.section	.text.caml_sys_init,"ax",@progbits
	.align	1
	.globl	caml_sys_init
	.type	caml_sys_init, @function
caml_sys_init:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	a0,caml_exe_name,a5
	lla	a0,caml_copy_string
	call	caml_alloc_array
	lla	a5,main_argv
	sd	a0,0(a5)
	mv	a0,a5
	call	caml_register_generational_global_root
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_sys_init, .-caml_sys_init
	.section	.text.caml_sys_system_command,"ax",@progbits
	.align	1
	.globl	caml_sys_system_command
	.type	caml_sys_system_command, @function
caml_sys_system_command:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	s2,80(sp)
	sd	a0,8(sp)
	ld	a5,Caml_state
	ld	s2,280(a5)
	sd	s2,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	call	caml_string_is_c_safe
	beq	a0,zero,.L80
	ld	a0,8(sp)
	call	caml_stat_strdup
	mv	s1,a0
	call	caml_enter_blocking_section
	mv	a0,s1
	call	system
	mv	s0,a0
	call	caml_leave_blocking_section
	mv	a0,s1
	call	caml_stat_free
	li	a5,-1
	beq	s0,a5,.L81
	andi	a5,s0,0xff
	bne	a5,zero,.L78
	sraiw	a0,s0,8
	andi	a0,a0,0xff
	j	.L77
.L80:
	li	a5,6
	sw	a5,errno,a4
	ld	a0,8(sp)
	call	caml_sys_error
.L81:
	ld	a0,8(sp)
	call	caml_sys_error
.L78:
	li	a0,255
.L77:
	slli	a0,a0,1
	ld	a5,Caml_state
	sd	s2,280(a5)
	addi	a0,a0,1
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	ld	s2,80(sp)
	addi	sp,sp,112
	jr	ra
	.size	caml_sys_system_command, .-caml_sys_system_command
	.section	.text.caml_sys_time_include_children_unboxed,"ax",@progbits
	.align	1
	.globl	caml_sys_time_include_children_unboxed
	.type	caml_sys_time_include_children_unboxed, @function
caml_sys_time_include_children_unboxed:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	mv	s0,a0
	mv	a0,sp
	call	times
	lw	a4,0(sp)
	lw	a5,4(sp)
	addw	a4,a4,a5
	sext.w	a5,a4
	srai	s0,s0,1
	sext.w	s0,s0
	beq	s0,zero,.L83
	lw	a5,8(sp)
	lw	a3,12(sp)
	addw	a5,a5,a3
	addw	a5,a4,a5
.L83:
	fcvt.d.w	fa5,a5
	fld	fa0,.LC11,a5
	fdiv.d	fa0,fa5,fa0
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_sys_time_include_children_unboxed, .-caml_sys_time_include_children_unboxed
	.section	.text.caml_sys_time_include_children,"ax",@progbits
	.align	1
	.globl	caml_sys_time_include_children
	.type	caml_sys_time_include_children, @function
caml_sys_time_include_children:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_sys_time_include_children_unboxed
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_sys_time_include_children, .-caml_sys_time_include_children
	.section	.text.caml_sys_time_unboxed,"ax",@progbits
	.align	1
	.globl	caml_sys_time_unboxed
	.type	caml_sys_time_unboxed, @function
caml_sys_time_unboxed:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a0,1
	call	caml_sys_time_include_children_unboxed
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_sys_time_unboxed, .-caml_sys_time_unboxed
	.section	.text.caml_sys_time,"ax",@progbits
	.align	1
	.globl	caml_sys_time
	.type	caml_sys_time, @function
caml_sys_time:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_sys_time_unboxed
	call	caml_copy_double
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_sys_time, .-caml_sys_time
	.section	.rodata.str1.8
	.align	3
.LC12:
	.string	"/dev/urandom"
	.section	.text.caml_sys_random_seed,"ax",@progbits
	.align	1
	.globl	caml_sys_random_seed
	.type	caml_sys_random_seed, @function
caml_sys_random_seed:
	addi	sp,sp,-176
	sd	ra,168(sp)
	sd	s0,160(sp)
	sd	s1,152(sp)
	sd	s2,144(sp)
	li	a2,0
	li	a1,1
	lla	a0,.LC12
	call	open
	li	a5,-1
	beq	a0,a5,.L98
	mv	s0,a0
	li	a2,12
	mv	a1,sp
	call	read
	mv	s1,a0
	mv	a0,s0
	call	close
	li	s0,0
.L93:
	ble	s1,zero,.L100
	addiw	s1,s1,-1
	addi	a5,sp,144
	add	a5,a5,s1
	lbu	a4,-144(a5)
	slli	a5,s0,3
	addi	a3,sp,144
	add	a5,a3,a5
	sd	a4,-128(a5)
	addiw	s0,s0,1
	j	.L93
.L100:
	li	a5,11
	bgt	s0,a5,.L95
	j	.L92
.L98:
	li	s0,0
.L92:
	li	a1,0
	mv	a0,sp
	call	gettimeofday
	addiw	a5,s0,1
	slli	a4,s0,3
	addi	a3,sp,144
	add	a4,a3,a4
	ld	a3,8(sp)
	sd	a3,-128(a4)
	addiw	s2,s0,2
	slli	a5,a5,3
	addi	a4,sp,144
	add	a5,a4,a5
	ld	a4,0(sp)
	sd	a4,-128(a5)
	call	getpid
	addiw	s1,s0,3
	slli	s2,s2,3
	addi	a5,sp,144
	add	s2,a5,s2
	sd	a0,-128(s2)
	call	getppid
	slli	s1,s1,3
	addiw	s0,s0,4
	addi	a5,sp,144
	add	s1,a5,s1
	sd	a0,-128(s1)
.L95:
	li	a1,0
	mv	a0,s0
	call	caml_alloc_small
	li	a3,0
	j	.L96
.L97:
	slli	a4,a3,3
	addi	a5,sp,144
	add	a5,a5,a4
	ld	a5,-128(a5)
	slli	a5,a5,1
	add	a4,a4,a0
	addi	a5,a5,1
	sd	a5,0(a4)
	addiw	a3,a3,1
.L96:
	bgt	s0,a3,.L97
	ld	ra,168(sp)
	ld	s0,160(sp)
	ld	s1,152(sp)
	ld	s2,144(sp)
	addi	sp,sp,176
	jr	ra
	.size	caml_sys_random_seed, .-caml_sys_random_seed
	.section	.text.caml_sys_const_big_endian,"ax",@progbits
	.align	1
	.globl	caml_sys_const_big_endian
	.type	caml_sys_const_big_endian, @function
caml_sys_const_big_endian:
	li	a0,1
	ret
	.size	caml_sys_const_big_endian, .-caml_sys_const_big_endian
	.section	.text.caml_sys_const_word_size,"ax",@progbits
	.align	1
	.globl	caml_sys_const_word_size
	.type	caml_sys_const_word_size, @function
caml_sys_const_word_size:
	li	a0,129
	ret
	.size	caml_sys_const_word_size, .-caml_sys_const_word_size
	.section	.text.caml_sys_const_int_size,"ax",@progbits
	.align	1
	.globl	caml_sys_const_int_size
	.type	caml_sys_const_int_size, @function
caml_sys_const_int_size:
	li	a0,127
	ret
	.size	caml_sys_const_int_size, .-caml_sys_const_int_size
	.section	.text.caml_sys_const_max_wosize,"ax",@progbits
	.align	1
	.globl	caml_sys_const_max_wosize
	.type	caml_sys_const_max_wosize, @function
caml_sys_const_max_wosize:
	li	a0,-1
	srli	a0,a0,9
	ret
	.size	caml_sys_const_max_wosize, .-caml_sys_const_max_wosize
	.section	.text.caml_sys_const_ostype_unix,"ax",@progbits
	.align	1
	.globl	caml_sys_const_ostype_unix
	.type	caml_sys_const_ostype_unix, @function
caml_sys_const_ostype_unix:
	li	a0,1
	ret
	.size	caml_sys_const_ostype_unix, .-caml_sys_const_ostype_unix
	.section	.text.caml_sys_const_ostype_win32,"ax",@progbits
	.align	1
	.globl	caml_sys_const_ostype_win32
	.type	caml_sys_const_ostype_win32, @function
caml_sys_const_ostype_win32:
	li	a0,1
	ret
	.size	caml_sys_const_ostype_win32, .-caml_sys_const_ostype_win32
	.section	.text.caml_sys_const_ostype_cygwin,"ax",@progbits
	.align	1
	.globl	caml_sys_const_ostype_cygwin
	.type	caml_sys_const_ostype_cygwin, @function
caml_sys_const_ostype_cygwin:
	li	a0,1
	ret
	.size	caml_sys_const_ostype_cygwin, .-caml_sys_const_ostype_cygwin
	.section	.text.caml_sys_const_backend_type,"ax",@progbits
	.align	1
	.globl	caml_sys_const_backend_type
	.type	caml_sys_const_backend_type, @function
caml_sys_const_backend_type:
	li	a0,3
	ret
	.size	caml_sys_const_backend_type, .-caml_sys_const_backend_type
	.section	.rodata.str1.8
	.align	3
.LC13:
	.string	"None"
	.section	.text.caml_sys_get_config,"ax",@progbits
	.align	1
	.globl	caml_sys_get_config
	.type	caml_sys_get_config, @function
caml_sys_get_config:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	s2,80(sp)
	lla	s2,Caml_state
	ld	a5,0(s2)
	ld	s1,280(a5)
	li	s0,1
	sd	s0,72(sp)
	sd	s0,64(sp)
	sd	s1,0(sp)
	sd	sp,280(a5)
	sd	s0,16(sp)
	li	a5,2
	sd	a5,8(sp)
	addi	a5,sp,72
	sd	a5,24(sp)
	addi	a5,sp,64
	sd	a5,32(sp)
	lla	a0,.LC13
	call	caml_copy_string
	sd	a0,64(sp)
	li	a1,0
	li	a0,3
	call	caml_alloc_small
	sd	a0,72(sp)
	ld	a5,64(sp)
	sd	a5,0(a0)
	ld	a5,72(sp)
	li	a4,129
	sd	a4,8(a5)
	ld	a5,72(sp)
	sd	s0,16(a5)
	ld	a5,0(s2)
	sd	s1,280(a5)
	ld	a0,72(sp)
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	ld	s2,80(sp)
	addi	sp,sp,112
	jr	ra
	.size	caml_sys_get_config, .-caml_sys_get_config
	.section	.text.caml_sys_read_directory,"ax",@progbits
	.align	1
	.globl	caml_sys_read_directory
	.type	caml_sys_read_directory, @function
caml_sys_read_directory:
	addi	sp,sp,-208
	sd	ra,200(sp)
	sd	s0,192(sp)
	sd	s1,184(sp)
	sd	s2,176(sp)
	sd	a0,8(sp)
	ld	a4,Caml_state
	ld	s2,280(a4)
	sd	s2,112(sp)
	li	a5,1
	sd	a5,128(sp)
	sd	a5,120(sp)
	addi	a3,sp,8
	sd	a3,136(sp)
	sd	a5,104(sp)
	addi	a3,sp,112
	sd	a3,40(sp)
	addi	a3,sp,40
	sd	a3,280(a4)
	sd	a5,56(sp)
	sd	a5,48(sp)
	addi	a5,sp,104
	sd	a5,64(sp)
	call	caml_sys_check_path
	li	a1,50
	addi	a0,sp,24
	call	caml_ext_table_init
	ld	a0,8(sp)
	call	caml_stat_strdup
	mv	s0,a0
	call	caml_enter_blocking_section
	addi	a1,sp,24
	mv	a0,s0
	call	caml_read_directory
	mv	s1,a0
	call	caml_leave_blocking_section
	mv	a0,s0
	call	caml_stat_free
	li	a5,-1
	beq	s1,a5,.L114
	li	a1,0
	addi	a0,sp,24
	call	caml_ext_table_add
	ld	a0,32(sp)
	call	caml_copy_string_array
	sd	a0,104(sp)
	li	a1,1
	addi	a0,sp,24
	call	caml_ext_table_free
	ld	a5,Caml_state
	sd	s2,280(a5)
	ld	a0,104(sp)
	ld	ra,200(sp)
	ld	s0,192(sp)
	ld	s1,184(sp)
	ld	s2,176(sp)
	addi	sp,sp,208
	jr	ra
.L114:
	li	a1,1
	addi	a0,sp,24
	call	caml_ext_table_free
	ld	a0,8(sp)
	call	caml_sys_error
	.size	caml_sys_read_directory, .-caml_sys_read_directory
	.section	.text.caml_sys_isatty,"ax",@progbits
	.align	1
	.globl	caml_sys_isatty
	.type	caml_sys_isatty, @function
caml_sys_isatty:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a5,8(a0)
	lw	a0,0(a5)
	call	isatty
	bne	a0,zero,.L119
	li	a0,1
.L115:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L119:
	li	a0,3
	j	.L115
	.size	caml_sys_isatty, .-caml_sys_isatty
	.globl	caml_exe_name
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC11:
	.word	0
	.word	1078853632
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	sys_open_flags, @object
	.size	sys_open_flags, 36
sys_open_flags:
	.word	1
	.word	2
	.word	6
	.word	8
	.word	16
	.word	32
	.word	0
	.word	0
	.word	0
	.section	.sbss,"aw",@nobits
	.align	3
	.type	main_argv, @object
	.size	main_argv, 8
main_argv:
	.zero	8
	.type	caml_exe_name, @object
	.size	caml_exe_name, 8
caml_exe_name:
	.zero	8
	.ident	"GCC: (GNU) 9.2.0"
