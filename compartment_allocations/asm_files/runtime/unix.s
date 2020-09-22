	.file	"unix.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.caml_read_fd,"ax",@progbits
	.align	1
	.globl	caml_read_fd
	.type	caml_read_fd, @function
caml_read_fd:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	mv	s3,a0
	mv	s2,a2
	mv	s1,a3
.L3:
	call	caml_enter_blocking_section
	mv	a2,s1
	mv	a1,s2
	mv	a0,s3
	call	read
	mv	s0,a0
	call	caml_leave_blocking_section
	li	a5,-1
	bne	s0,a5,.L2
	lw	a4,errno
	beq	a4,a5,.L3
.L2:
	li	a5,-1
	beq	s0,a5,.L6
	mv	a0,s0
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L6:
	li	a0,1
	call	caml_sys_io_error
	.size	caml_read_fd, .-caml_read_fd
	.section	.text.caml_write_fd,"ax",@progbits
	.align	1
	.globl	caml_write_fd
	.type	caml_write_fd, @function
caml_write_fd:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	mv	s3,a0
	mv	s2,a2
	mv	s1,a3
.L8:
	call	caml_enter_blocking_section
	mv	a2,s1
	mv	a1,s2
	mv	a0,s3
	call	write
	mv	s0,a0
	call	caml_leave_blocking_section
	li	a5,-1
	bne	s0,a5,.L9
	lw	a4,errno
	beq	a4,a5,.L8
.L9:
	li	a5,-1
	beq	s0,a5,.L12
	mv	a0,s0
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L12:
	li	a0,1
	call	caml_sys_io_error
	.size	caml_write_fd, .-caml_write_fd
	.section	.text.caml_decompose_path,"ax",@progbits
	.align	1
	.globl	caml_decompose_path
	.type	caml_decompose_path, @function
caml_decompose_path:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s1,a0
	mv	a0,a1
	beq	a1,zero,.L19
	call	caml_stat_strdup
	mv	s2,a0
	mv	a1,a0
	j	.L18
.L17:
	addi	a4,a4,1
.L15:
	add	s0,a1,a4
	lbu	a5,0(s0)
	beq	a5,zero,.L16
	li	a3,58
	bne	a5,a3,.L17
.L16:
	mv	a0,s1
	call	caml_ext_table_add
	lbu	a5,0(s0)
	beq	a5,zero,.L13
	sb	zero,0(s0)
	addi	a1,s0,1
.L18:
	li	a4,0
	j	.L15
.L19:
	mv	s2,a1
.L13:
	mv	a0,s2
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_decompose_path, .-caml_decompose_path
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"."
	.align	3
.LC1:
	.string	"/"
	.section	.text.caml_search_in_path,"ax",@progbits
	.align	1
	.globl	caml_search_in_path
	.type	caml_search_in_path, @function
caml_search_in_path:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	mv	s2,a0
	mv	s3,a1
	mv	a4,a1
.L22:
	lbu	a5,0(a4)
	beq	a5,zero,.L30
	li	a3,47
	beq	a5,a3,.L23
	addi	a4,a4,1
	j	.L22
.L30:
	li	s0,0
	j	.L25
.L26:
	mv	a3,s3
	lla	a2,.LC1
	li	a0,3
	call	caml_stat_strconcat
	mv	s1,a0
	addi	a1,sp,8
	call	stat
	mv	a0,s1
	call	caml_stat_free
	addiw	s0,s0,1
.L25:
	lw	a5,0(s2)
	ble	a5,s0,.L23
	ld	a5,8(s2)
	slli	a4,s0,3
	add	a5,a5,a4
	ld	a1,0(a5)
	lbu	a5,0(a1)
	bne	a5,zero,.L26
	lla	a1,.LC0
	j	.L26
.L23:
	mv	a0,s3
	call	caml_stat_strdup
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	addi	sp,sp,64
	jr	ra
	.size	caml_search_in_path, .-caml_search_in_path
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"PATH"
	.section	.text.caml_search_exe_in_path,"ax",@progbits
	.align	1
	.globl	caml_search_exe_in_path
	.type	caml_search_exe_in_path, @function
caml_search_exe_in_path:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	mv	s0,a0
	li	a1,8
	mv	a0,sp
	call	caml_ext_table_init
	lla	a0,.LC2
	call	getenv
	mv	a1,a0
	mv	a0,sp
	call	caml_decompose_path
	mv	s1,a0
	mv	a1,s0
	mv	a0,sp
	call	caml_search_in_path
	mv	s0,a0
	mv	a0,s1
	call	caml_stat_free
	li	a1,0
	mv	a0,sp
	call	caml_ext_table_free
	mv	a0,s0
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_search_exe_in_path, .-caml_search_exe_in_path
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	".so"
	.section	.text.caml_search_dll_in_path,"ax",@progbits
	.align	1
	.globl	caml_search_dll_in_path
	.type	caml_search_dll_in_path, @function
caml_search_dll_in_path:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a0
	lla	a2,.LC3
	li	a0,2
	call	caml_stat_strconcat
	mv	s0,a0
	mv	a1,a0
	mv	a0,s1
	call	caml_search_in_path
	mv	s1,a0
	mv	a0,s0
	call	caml_stat_free
	mv	a0,s1
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_search_dll_in_path, .-caml_search_dll_in_path
	.section	.text.caml_dlopen,"ax",@progbits
	.align	1
	.globl	caml_dlopen
	.type	caml_dlopen, @function
caml_dlopen:
	li	a0,0
	ret
	.size	caml_dlopen, .-caml_dlopen
	.section	.text.caml_dlclose,"ax",@progbits
	.align	1
	.globl	caml_dlclose
	.type	caml_dlclose, @function
caml_dlclose:
	ret
	.size	caml_dlclose, .-caml_dlclose
	.section	.text.caml_dlsym,"ax",@progbits
	.align	1
	.globl	caml_dlsym
	.type	caml_dlsym, @function
caml_dlsym:
	li	a0,0
	ret
	.size	caml_dlsym, .-caml_dlsym
	.section	.text.caml_globalsym,"ax",@progbits
	.align	1
	.globl	caml_globalsym
	.type	caml_globalsym, @function
caml_globalsym:
	li	a0,0
	ret
	.size	caml_globalsym, .-caml_globalsym
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"dynamic loading not supported on this platform"
	.section	.text.caml_dlerror,"ax",@progbits
	.align	1
	.globl	caml_dlerror
	.type	caml_dlerror, @function
caml_dlerror:
	lla	a0,.LC4
	ret
	.size	caml_dlerror, .-caml_dlerror
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	".."
	.section	.text.caml_read_directory,"ax",@progbits
	.align	1
	.globl	caml_read_directory
	.type	caml_read_directory, @function
caml_read_directory:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s2,a1
	call	opendir
	mv	s1,a0
	beq	a0,zero,.L45
.L42:
	mv	a0,s1
	call	readdir
	beq	a0,zero,.L43
	ld	s0,0(a0)
	lla	a1,.LC0
	mv	a0,s0
	call	strcmp
	beq	a0,zero,.L42
	lla	a1,.LC5
	mv	a0,s0
	call	strcmp
	beq	a0,zero,.L42
	mv	a0,s0
	call	caml_stat_strdup
	mv	a1,a0
	mv	a0,s2
	call	caml_ext_table_add
	j	.L42
.L43:
	mv	a0,s1
	call	closedir
	li	a0,0
.L41:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L45:
	li	a0,-1
	j	.L41
	.size	caml_read_directory, .-caml_read_directory
	.section	.text.caml_executable_name,"ax",@progbits
	.align	1
	.globl	caml_executable_name
	.type	caml_executable_name, @function
caml_executable_name:
	li	a0,0
	ret
	.size	caml_executable_name, .-caml_executable_name
	.section	.text.caml_secure_getenv,"ax",@progbits
	.align	1
	.globl	caml_secure_getenv
	.type	caml_secure_getenv, @function
caml_secure_getenv:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	secure_getenv
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_secure_getenv, .-caml_secure_getenv
	.section	.text.caml_num_rows_fd,"ax",@progbits
	.align	1
	.globl	caml_num_rows_fd
	.type	caml_num_rows_fd, @function
caml_num_rows_fd:
	li	a0,-1
	ret
	.size	caml_num_rows_fd, .-caml_num_rows_fd
	.ident	"GCC: (GNU) 9.2.0"
