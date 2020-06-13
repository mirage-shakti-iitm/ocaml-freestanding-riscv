	.file	"stubs.c"
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
	.string	"fflush"
	.align	3
.LC1:
	.string	"STUB: %s() called\n"
	.text
	.align	1
	.globl	fflush
	.type	fflush, @function
fflush:
.LFB0:
	.file 1 "stubs.c"
	.loc 1 46 1
	.cfi_startproc
	.loc 1 46 1
	.loc 1 46 1
	lw	a5,called.1529
	beq	a5,zero,.L7
	.loc 1 46 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 46 1
	li	a0,0
	ret
.L7:
	.loc 1 46 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 46 1 is_stmt 1 discriminator 1
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
.LVL0:
	.loc 1 46 1 discriminator 1
	li	a5,1
	sw	a5,called.1529,a4
	.loc 1 46 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 46 1 discriminator 1
	li	a0,0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	fflush, .-fflush
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"rename"
	.align	3
.LC3:
	.string	"STUB: abort: %s() called\n"
	.text
	.align	1
	.globl	rename
	.type	rename, @function
rename:
.LFB1:
	.loc 1 47 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 47 1
	lla	a1,.LC2
	lla	a0,.LC3
	call	printf
.LVL1:
	.loc 1 47 1
	call	abort
.LVL2:
	.cfi_endproc
.LFE1:
	.size	rename, .-rename
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"sscanf"
	.text
	.align	1
	.globl	sscanf
	.type	sscanf, @function
sscanf:
.LFB2:
	.loc 1 48 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 48 1
	lla	a1,.LC4
	lla	a0,.LC3
	call	printf
.LVL3:
	.loc 1 48 1
	call	abort
.LVL4:
	.cfi_endproc
.LFE2:
	.size	sscanf, .-sscanf
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	"fread"
	.text
	.align	1
	.globl	fread
	.type	fread, @function
fread:
.LFB3:
	.loc 1 53 1
	.cfi_startproc
	.loc 1 53 1
	.loc 1 53 1
	lw	a5,called.1545
	beq	a5,zero,.L18
	.loc 1 53 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 53 1
	li	a0,0
	ret
.L18:
	.loc 1 53 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 53 1 is_stmt 1 discriminator 1
	lla	a1,.LC5
	lla	a0,.LC1
	call	printf
.LVL5:
	.loc 1 53 1 discriminator 1
	li	a5,1
	sw	a5,called.1545,a4
	.loc 1 53 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 53 1 discriminator 1
	li	a0,0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	fread, .-fread
	.section	.rodata.str1.8
	.align	3
.LC6:
	.string	"getc"
	.text
	.align	1
	.globl	getc
	.type	getc, @function
getc:
.LFB4:
	.loc 1 54 1
	.cfi_startproc
	.loc 1 54 1
	.loc 1 54 1
	lw	a5,called.1551
	beq	a5,zero,.L25
	.loc 1 54 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 54 1
	li	a0,-1
	ret
.L25:
	.loc 1 54 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 54 1 is_stmt 1 discriminator 1
	lla	a1,.LC6
	lla	a0,.LC1
	call	printf
.LVL6:
	.loc 1 54 1 discriminator 1
	li	a5,1
	sw	a5,called.1551,a4
	.loc 1 54 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 54 1 discriminator 1
	li	a0,-1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	getc, .-getc
	.section	.rodata.str1.8
	.align	3
.LC7:
	.string	"ungetc"
	.text
	.align	1
	.globl	ungetc
	.type	ungetc, @function
ungetc:
.LFB5:
	.loc 1 55 1
	.cfi_startproc
	.loc 1 55 1
	.loc 1 55 1
	lw	a5,called.1557
	beq	a5,zero,.L32
	.loc 1 55 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 55 1
	li	a0,-1
	ret
.L32:
	.loc 1 55 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 55 1 is_stmt 1 discriminator 1
	lla	a1,.LC7
	lla	a0,.LC1
	call	printf
.LVL7:
	.loc 1 55 1 discriminator 1
	li	a5,1
	sw	a5,called.1557,a4
	.loc 1 55 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 55 1 discriminator 1
	li	a0,-1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE5:
	.size	ungetc, .-ungetc
	.section	.rodata.str1.8
	.align	3
.LC8:
	.string	"fwrite"
	.text
	.align	1
	.globl	fwrite
	.type	fwrite, @function
fwrite:
.LFB6:
	.loc 1 56 1
	.cfi_startproc
	.loc 1 56 1
	.loc 1 56 1
	lw	a5,called.1563
	beq	a5,zero,.L39
	.loc 1 56 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 56 1
	li	a0,0
	ret
.L39:
	.loc 1 56 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 56 1 is_stmt 1 discriminator 1
	lla	a1,.LC8
	lla	a0,.LC1
	call	printf
.LVL8:
	.loc 1 56 1 discriminator 1
	li	a5,1
	sw	a5,called.1563,a4
	.loc 1 56 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 56 1 discriminator 1
	li	a0,0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	fwrite, .-fwrite
	.section	.rodata.str1.8
	.align	3
.LC9:
	.string	"fputc"
	.text
	.align	1
	.globl	fputc
	.type	fputc, @function
fputc:
.LFB7:
	.loc 1 57 1
	.cfi_startproc
	.loc 1 57 1
	.loc 1 57 1
	lw	a5,called.1569
	beq	a5,zero,.L46
	.loc 1 57 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 57 1
	li	a0,-1
	ret
.L46:
	.loc 1 57 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 57 1 is_stmt 1 discriminator 1
	lla	a1,.LC9
	lla	a0,.LC1
	call	printf
.LVL9:
	.loc 1 57 1 discriminator 1
	li	a5,1
	sw	a5,called.1569,a4
	.loc 1 57 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 57 1 discriminator 1
	li	a0,-1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	fputc, .-fputc
	.section	.rodata.str1.8
	.align	3
.LC10:
	.string	"putc"
	.text
	.align	1
	.globl	putc
	.type	putc, @function
putc:
.LFB8:
	.loc 1 58 1
	.cfi_startproc
	.loc 1 58 1
	.loc 1 58 1
	lw	a5,called.1575
	beq	a5,zero,.L53
	.loc 1 58 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 58 1
	li	a0,-1
	ret
.L53:
	.loc 1 58 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 58 1 is_stmt 1 discriminator 1
	lla	a1,.LC10
	lla	a0,.LC1
	call	printf
.LVL10:
	.loc 1 58 1 discriminator 1
	li	a5,1
	sw	a5,called.1575,a4
	.loc 1 58 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 58 1 discriminator 1
	li	a0,-1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	putc, .-putc
	.section	.rodata.str1.8
	.align	3
.LC11:
	.string	"ferror"
	.text
	.align	1
	.globl	ferror
	.type	ferror, @function
ferror:
.LFB9:
	.loc 1 59 1
	.cfi_startproc
	.loc 1 59 1
	.loc 1 59 1
	lw	a5,called.1581
	beq	a5,zero,.L60
	.loc 1 59 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 59 1
	li	a0,1
	ret
.L60:
	.loc 1 59 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 59 1 is_stmt 1 discriminator 1
	lla	a1,.LC11
	lla	a0,.LC1
	call	printf
.LVL11:
	.loc 1 59 1 discriminator 1
	li	a5,1
	sw	a5,called.1581,a4
	.loc 1 59 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 59 1 discriminator 1
	li	a0,1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	ferror, .-ferror
	.section	.rodata.str1.8
	.align	3
.LC12:
	.string	"fputs"
	.text
	.align	1
	.globl	fputs
	.type	fputs, @function
fputs:
.LFB10:
	.loc 1 61 1
	.cfi_startproc
	.loc 1 61 1
	.loc 1 61 1
	lw	a5,called.1587
	beq	a5,zero,.L67
	.loc 1 61 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 61 1
	li	a0,-1
	ret
.L67:
	.loc 1 61 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 61 1 is_stmt 1 discriminator 1
	lla	a1,.LC12
	lla	a0,.LC1
	call	printf
.LVL12:
	.loc 1 61 1 discriminator 1
	li	a5,1
	sw	a5,called.1587,a4
	.loc 1 61 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 61 1 discriminator 1
	li	a0,-1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	fputs, .-fputs
	.section	.rodata.str1.8
	.align	3
.LC13:
	.string	"fgets"
	.text
	.align	1
	.globl	fgets
	.type	fgets, @function
fgets:
.LFB11:
	.loc 1 62 1
	.cfi_startproc
	.loc 1 62 1
	.loc 1 62 1
	lw	a5,called.1593
	beq	a5,zero,.L74
	.loc 1 62 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 62 1
	li	a0,-1
	ret
.L74:
	.loc 1 62 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 62 1 is_stmt 1 discriminator 1
	lla	a1,.LC13
	lla	a0,.LC1
	call	printf
.LVL13:
	.loc 1 62 1 discriminator 1
	li	a5,1
	sw	a5,called.1593,a4
	.loc 1 62 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 62 1 discriminator 1
	li	a0,-1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	fgets, .-fgets
	.section	.rodata.str1.8
	.align	3
.LC14:
	.string	"getenv"
	.text
	.align	1
	.globl	getenv
	.type	getenv, @function
getenv:
.LFB12:
	.loc 1 65 1
	.cfi_startproc
	.loc 1 65 1
	.loc 1 65 1
	lw	a5,called.1599
	beq	a5,zero,.L81
	.loc 1 65 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 65 1
	li	a0,0
	ret
.L81:
	.loc 1 65 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 65 1 is_stmt 1 discriminator 1
	lla	a1,.LC14
	lla	a0,.LC1
	call	printf
.LVL14:
	.loc 1 65 1 discriminator 1
	li	a5,1
	sw	a5,called.1599,a4
	.loc 1 65 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 65 1 discriminator 1
	li	a0,0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	getenv, .-getenv
	.section	.rodata.str1.8
	.align	3
.LC15:
	.string	"secure_getenv"
	.text
	.align	1
	.globl	secure_getenv
	.type	secure_getenv, @function
secure_getenv:
.LFB13:
	.loc 1 66 1
	.cfi_startproc
	.loc 1 66 1
	.loc 1 66 1
	lw	a5,called.1605
	beq	a5,zero,.L88
	.loc 1 66 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 66 1
	li	a0,0
	ret
.L88:
	.loc 1 66 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 66 1 is_stmt 1 discriminator 1
	lla	a1,.LC15
	lla	a0,.LC1
	call	printf
.LVL15:
	.loc 1 66 1 discriminator 1
	li	a5,1
	sw	a5,called.1605,a4
	.loc 1 66 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 66 1 discriminator 1
	li	a0,0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE13:
	.size	secure_getenv, .-secure_getenv
	.section	.rodata.str1.8
	.align	3
.LC16:
	.string	"system"
	.text
	.align	1
	.globl	system
	.type	system, @function
system:
.LFB14:
	.loc 1 67 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 67 1
	lla	a1,.LC16
	lla	a0,.LC3
	call	printf
.LVL16:
	.loc 1 67 1
	call	abort
.LVL17:
	.cfi_endproc
.LFE14:
	.size	system, .-system
	.section	.rodata.str1.8
	.align	3
.LC17:
	.string	"chdir"
	.text
	.align	1
	.globl	chdir
	.type	chdir, @function
chdir:
.LFB15:
	.loc 1 70 1
	.cfi_startproc
	.loc 1 70 1
	.loc 1 70 1
	lw	a5,called.1616
	beq	a5,zero,.L97
	.loc 1 70 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 70 1
	li	a0,-1
	ret
.L97:
	.loc 1 70 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 70 1 is_stmt 1 discriminator 1
	lla	a1,.LC17
	lla	a0,.LC1
	call	printf
.LVL18:
	.loc 1 70 1 discriminator 1
	li	a5,1
	sw	a5,called.1616,a4
	.loc 1 70 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 70 1 discriminator 1
	li	a0,-1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE15:
	.size	chdir, .-chdir
	.section	.rodata.str1.8
	.align	3
.LC18:
	.string	"close"
	.text
	.align	1
	.globl	close
	.type	close, @function
close:
.LFB16:
	.loc 1 71 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 71 1
	lla	a1,.LC18
	lla	a0,.LC3
	call	printf
.LVL19:
	.loc 1 71 1
	call	abort
.LVL20:
	.cfi_endproc
.LFE16:
	.size	close, .-close
	.section	.rodata.str1.8
	.align	3
.LC19:
	.string	"getcwd"
	.text
	.align	1
	.globl	getcwd
	.type	getcwd, @function
getcwd:
.LFB17:
	.loc 1 72 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 72 1
	lla	a1,.LC19
	lla	a0,.LC3
	call	printf
.LVL21:
	.loc 1 72 1
	call	abort
.LVL22:
	.cfi_endproc
.LFE17:
	.size	getcwd, .-getcwd
	.section	.rodata.str1.8
	.align	3
.LC20:
	.string	"getpid"
	.text
	.align	1
	.globl	getpid
	.type	getpid, @function
getpid:
.LFB18:
	.loc 1 73 1
	.cfi_startproc
	.loc 1 73 1
	.loc 1 73 1
	lw	a5,called.1632
	beq	a5,zero,.L108
	.loc 1 73 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 73 1
	li	a0,2
	ret
.L108:
	.loc 1 73 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 73 1 is_stmt 1 discriminator 1
	lla	a1,.LC20
	lla	a0,.LC1
	call	printf
.LVL23:
	.loc 1 73 1 discriminator 1
	li	a5,1
	sw	a5,called.1632,a4
	.loc 1 73 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 73 1 discriminator 1
	li	a0,2
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE18:
	.size	getpid, .-getpid
	.section	.rodata.str1.8
	.align	3
.LC21:
	.string	"getppid"
	.text
	.align	1
	.globl	getppid
	.type	getppid, @function
getppid:
.LFB19:
	.loc 1 74 1
	.cfi_startproc
	.loc 1 74 1
	.loc 1 74 1
	lw	a5,called.1638
	beq	a5,zero,.L115
	.loc 1 74 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 74 1
	li	a0,1
	ret
.L115:
	.loc 1 74 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 74 1 is_stmt 1 discriminator 1
	lla	a1,.LC21
	lla	a0,.LC1
	call	printf
.LVL24:
	.loc 1 74 1 discriminator 1
	li	a5,1
	sw	a5,called.1638,a4
	.loc 1 74 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 74 1 discriminator 1
	li	a0,1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE19:
	.size	getppid, .-getppid
	.align	1
	.globl	isatty
	.type	isatty, @function
isatty:
.LFB20:
	.loc 1 75 1
	.cfi_startproc
	.loc 1 75 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 75 1
	li	a0,0
	ret
	.cfi_endproc
.LFE20:
	.size	isatty, .-isatty
	.align	1
	.globl	lseek
	.type	lseek, @function
lseek:
.LFB21:
	.loc 1 76 1
	.cfi_startproc
	.loc 1 76 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 76 1
	li	a0,-1
	ret
	.cfi_endproc
.LFE21:
	.size	lseek, .-lseek
	.section	.rodata.str1.8
	.align	3
.LC22:
	.string	"read"
	.text
	.align	1
	.globl	read
	.type	read, @function
read:
.LFB22:
	.loc 1 77 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 77 1
	lla	a1,.LC22
	lla	a0,.LC3
	call	printf
.LVL25:
	.loc 1 77 1
	call	abort
.LVL26:
	.cfi_endproc
.LFE22:
	.size	read, .-read
	.align	1
	.globl	readlink
	.type	readlink, @function
readlink:
.LFB23:
	.loc 1 78 1
	.cfi_startproc
	.loc 1 78 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 78 1
	li	a0,-1
	ret
	.cfi_endproc
.LFE23:
	.size	readlink, .-readlink
	.section	.rodata.str1.8
	.align	3
.LC23:
	.string	"unlink"
	.text
	.align	1
	.globl	unlink
	.type	unlink, @function
unlink:
.LFB24:
	.loc 1 79 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 79 1
	lla	a1,.LC23
	lla	a0,.LC3
	call	printf
.LVL27:
	.loc 1 79 1
	call	abort
.LVL28:
	.cfi_endproc
.LFE24:
	.size	unlink, .-unlink
	.section	.rodata.str1.8
	.align	3
.LC24:
	.string	"closedir"
	.text
	.align	1
	.globl	closedir
	.type	closedir, @function
closedir:
.LFB25:
	.loc 1 82 1
	.cfi_startproc
	.loc 1 82 1
	.loc 1 82 1
	lw	a5,called.1669
	beq	a5,zero,.L129
	.loc 1 82 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 82 1
	li	a0,-1
	ret
.L129:
	.loc 1 82 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 82 1 is_stmt 1 discriminator 1
	lla	a1,.LC24
	lla	a0,.LC1
	call	printf
.LVL29:
	.loc 1 82 1 discriminator 1
	li	a5,1
	sw	a5,called.1669,a4
	.loc 1 82 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 82 1 discriminator 1
	li	a0,-1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE25:
	.size	closedir, .-closedir
	.section	.rodata.str1.8
	.align	3
.LC25:
	.string	"opendir"
	.text
	.align	1
	.globl	opendir
	.type	opendir, @function
opendir:
.LFB26:
	.loc 1 83 1
	.cfi_startproc
	.loc 1 83 1
	.loc 1 83 1
	lw	a5,called.1675
	beq	a5,zero,.L136
	.loc 1 83 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 83 1
	li	a0,0
	ret
.L136:
	.loc 1 83 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 83 1 is_stmt 1 discriminator 1
	lla	a1,.LC25
	lla	a0,.LC1
	call	printf
.LVL30:
	.loc 1 83 1 discriminator 1
	li	a5,1
	sw	a5,called.1675,a4
	.loc 1 83 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 83 1 discriminator 1
	li	a0,0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE26:
	.size	opendir, .-opendir
	.section	.rodata.str1.8
	.align	3
.LC26:
	.string	"readdir"
	.text
	.align	1
	.globl	readdir
	.type	readdir, @function
readdir:
.LFB27:
	.loc 1 84 1
	.cfi_startproc
	.loc 1 84 1
	.loc 1 84 1
	lw	a5,called.1681
	beq	a5,zero,.L143
	.loc 1 84 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 84 1
	li	a0,0
	ret
.L143:
	.loc 1 84 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 84 1 is_stmt 1 discriminator 1
	lla	a1,.LC26
	lla	a0,.LC1
	call	printf
.LVL31:
	.loc 1 84 1 discriminator 1
	li	a5,1
	sw	a5,called.1681,a4
	.loc 1 84 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 84 1 discriminator 1
	li	a0,0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE27:
	.size	readdir, .-readdir
	.section	.rodata.str1.8
	.align	3
.LC27:
	.string	"fcntl"
	.text
	.align	1
	.globl	fcntl
	.type	fcntl, @function
fcntl:
.LFB28:
	.loc 1 87 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 87 1
	lla	a1,.LC27
	lla	a0,.LC3
	call	printf
.LVL32:
	.loc 1 87 1
	call	abort
.LVL33:
	.cfi_endproc
.LFE28:
	.size	fcntl, .-fcntl
	.section	.rodata.str1.8
	.align	3
.LC28:
	.string	"open"
	.text
	.align	1
	.globl	open
	.type	open, @function
open:
.LFB29:
	.loc 1 88 1
	.cfi_startproc
	.loc 1 88 1
	.loc 1 88 1
	lw	a5,called.1692
	beq	a5,zero,.L152
	.loc 1 88 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 88 1
	li	a0,-1
	ret
.L152:
	.loc 1 88 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 88 1 is_stmt 1 discriminator 1
	lla	a1,.LC28
	lla	a0,.LC1
	call	printf
.LVL34:
	.loc 1 88 1 discriminator 1
	li	a5,1
	sw	a5,called.1692,a4
	.loc 1 88 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 88 1 discriminator 1
	li	a0,-1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE29:
	.size	open, .-open
	.align	1
	.globl	sigaction
	.type	sigaction, @function
sigaction:
.LFB30:
	.loc 1 91 1
	.cfi_startproc
	.loc 1 91 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 91 1
	li	a0,-1
	ret
	.cfi_endproc
.LFE30:
	.size	sigaction, .-sigaction
	.align	1
	.globl	sigsetjmp
	.type	sigsetjmp, @function
sigsetjmp:
.LFB31:
	.loc 1 92 1
	.cfi_startproc
	.loc 1 92 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 92 1
	li	a0,0
	ret
	.cfi_endproc
.LFE31:
	.size	sigsetjmp, .-sigsetjmp
	.align	1
	.globl	sigaddset
	.type	sigaddset, @function
sigaddset:
.LFB32:
	.loc 1 93 1
	.cfi_startproc
	.loc 1 93 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 93 1
	li	a0,-1
	ret
	.cfi_endproc
.LFE32:
	.size	sigaddset, .-sigaddset
	.align	1
	.globl	sigdelset
	.type	sigdelset, @function
sigdelset:
.LFB33:
	.loc 1 94 1
	.cfi_startproc
	.loc 1 94 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 94 1
	li	a0,-1
	ret
	.cfi_endproc
.LFE33:
	.size	sigdelset, .-sigdelset
	.align	1
	.globl	sigemptyset
	.type	sigemptyset, @function
sigemptyset:
.LFB34:
	.loc 1 95 1
	.cfi_startproc
	.loc 1 95 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 95 1
	li	a0,-1
	ret
	.cfi_endproc
.LFE34:
	.size	sigemptyset, .-sigemptyset
	.align	1
	.globl	sigprocmask
	.type	sigprocmask, @function
sigprocmask:
.LFB35:
	.loc 1 96 1
	.cfi_startproc
	.loc 1 96 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 96 1
	li	a0,-1
	ret
	.cfi_endproc
.LFE35:
	.size	sigprocmask, .-sigprocmask
	.section	.rodata.str1.8
	.align	3
.LC29:
	.string	"raise"
	.text
	.align	1
	.globl	raise
	.type	raise, @function
raise:
.LFB36:
	.loc 1 101 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 101 1
	lla	a1,.LC29
	lla	a0,.LC3
	call	printf
.LVL35:
	.loc 1 101 1
	call	abort
.LVL36:
	.cfi_endproc
.LFE36:
	.size	raise, .-raise
	.section	.rodata.str1.8
	.align	3
.LC30:
	.string	"strerror"
	.text
	.align	1
	.globl	strerror
	.type	strerror, @function
strerror:
.LFB37:
	.loc 1 104 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 104 1
	lla	a1,.LC30
	lla	a0,.LC3
	call	printf
.LVL37:
	.loc 1 104 1
	call	abort
.LVL38:
	.cfi_endproc
.LFE37:
	.size	strerror, .-strerror
	.section	.rodata.str1.8
	.align	3
.LC31:
	.string	"stat"
	.text
	.align	1
	.globl	stat
	.type	stat, @function
stat:
.LFB38:
	.loc 1 107 1
	.cfi_startproc
	.loc 1 107 1
	.loc 1 107 1
	lw	a5,called.1738
	beq	a5,zero,.L169
	.loc 1 107 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 107 1
	li	a0,-1
	ret
.L169:
	.loc 1 107 1 is_stmt 0 discriminator 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 107 1 is_stmt 1 discriminator 1
	lla	a1,.LC31
	lla	a0,.LC1
	call	printf
.LVL39:
	.loc 1 107 1 discriminator 1
	li	a5,1
	sw	a5,called.1738,a4
	.loc 1 107 1 discriminator 1
	li	a5,3
	sw	a5,errno,a4
	.loc 1 107 1 discriminator 1
	li	a0,-1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE38:
	.size	stat, .-stat
	.section	.rodata.str1.8
	.align	3
.LC32:
	.string	"caml_ba_map_file"
	.text
	.align	1
	.globl	caml_ba_map_file
	.type	caml_ba_map_file, @function
caml_ba_map_file:
.LFB39:
	.loc 1 109 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 109 1
	lla	a1,.LC32
	lla	a0,.LC3
	call	printf
.LVL40:
	.loc 1 109 1
	call	abort
.LVL41:
	.cfi_endproc
.LFE39:
	.size	caml_ba_map_file, .-caml_ba_map_file
	.section	.sdata,"aw"
	.align	2
	.type	called.1738, @object
	.size	called.1738, 4
called.1738:
	.word	1
	.type	called.1692, @object
	.size	called.1692, 4
called.1692:
	.word	1
	.type	called.1681, @object
	.size	called.1681, 4
called.1681:
	.word	1
	.type	called.1675, @object
	.size	called.1675, 4
called.1675:
	.word	1
	.type	called.1669, @object
	.size	called.1669, 4
called.1669:
	.word	1
	.type	called.1638, @object
	.size	called.1638, 4
called.1638:
	.word	1
	.type	called.1632, @object
	.size	called.1632, 4
called.1632:
	.word	1
	.type	called.1616, @object
	.size	called.1616, 4
called.1616:
	.word	1
	.type	called.1605, @object
	.size	called.1605, 4
called.1605:
	.word	1
	.type	called.1599, @object
	.size	called.1599, 4
called.1599:
	.word	1
	.type	called.1593, @object
	.size	called.1593, 4
called.1593:
	.word	1
	.type	called.1587, @object
	.size	called.1587, 4
called.1587:
	.word	1
	.type	called.1581, @object
	.size	called.1581, 4
called.1581:
	.word	1
	.type	called.1575, @object
	.size	called.1575, 4
called.1575:
	.word	1
	.type	called.1569, @object
	.size	called.1569, 4
called.1569:
	.word	1
	.type	called.1563, @object
	.size	called.1563, 4
called.1563:
	.word	1
	.type	called.1557, @object
	.size	called.1557, 4
called.1557:
	.word	1
	.type	called.1551, @object
	.size	called.1551, 4
called.1551:
	.word	1
	.type	called.1545, @object
	.size	called.1545, 4
called.1545:
	.word	1
	.type	called.1529, @object
	.size	called.1529, 4
called.1529:
	.word	1
	.text
.Letext0:
	.file 2 "/home/sai/ocaml-freestanding-riscv/nolibc/include/dirent.h"
	.file 3 "/home/sai/ocaml-freestanding-riscv/nolibc/include/stdio.h"
	.file 4 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 5 "/home/sai/ocaml-freestanding-riscv/nolibc/include/errno.h"
	.file 6 "/home/sai/ocaml-freestanding-riscv/nolibc/include/unistd.h"
	.file 7 "/home/sai/ocaml-freestanding-riscv/nolibc/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xe88
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF100
	.byte	0xc
	.4byte	.LASF101
	.4byte	.LASF102
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF3
	.byte	0x8
	.byte	0x2
	.byte	0x7
	.byte	0x8
	.4byte	0x4f
	.byte	0x4
	.4byte	.LASF5
	.byte	0x2
	.byte	0x8
	.byte	0xb
	.4byte	0x4f
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x55
	.byte	0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF0
	.byte	0x7
	.4byte	0x55
	.byte	0x8
	.4byte	.LASF11
	.byte	0x5
	.byte	0x4
	.byte	0xc
	.4byte	0x2d
	.byte	0x6
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1
	.byte	0x9
	.4byte	.LASF9
	.byte	0x4
	.byte	0xd1
	.byte	0x17
	.4byte	0x80
	.byte	0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF2
	.byte	0x3
	.4byte	.LASF4
	.byte	0x18
	.byte	0x3
	.byte	0x8
	.byte	0x10
	.4byte	0xbc
	.byte	0x4
	.4byte	.LASF6
	.byte	0x3
	.byte	0x9
	.byte	0xe
	.4byte	0xe1
	.byte	0
	.byte	0x4
	.4byte	.LASF7
	.byte	0x3
	.byte	0xa
	.byte	0xb
	.4byte	0x4f
	.byte	0x8
	.byte	0x4
	.4byte	.LASF8
	.byte	0x3
	.byte	0xb
	.byte	0xb
	.4byte	0x4f
	.byte	0x10
	.byte	0
	.byte	0xa
	.4byte	0x74
	.4byte	0xd5
	.byte	0xb
	.4byte	0xd5
	.byte	0xb
	.4byte	0xdb
	.byte	0xb
	.4byte	0x74
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x87
	.byte	0x5
	.byte	0x8
	.4byte	0x5c
	.byte	0x5
	.byte	0x8
	.4byte	0xbc
	.byte	0x9
	.4byte	.LASF10
	.byte	0x3
	.byte	0xc
	.byte	0x3
	.4byte	0x87
	.byte	0x8
	.4byte	.LASF12
	.byte	0x3
	.byte	0x11
	.byte	0xe
	.4byte	0xff
	.byte	0x5
	.byte	0x8
	.4byte	0xe7
	.byte	0x8
	.4byte	.LASF13
	.byte	0x3
	.byte	0x12
	.byte	0xe
	.4byte	0xff
	.byte	0x8
	.4byte	.LASF14
	.byte	0x3
	.byte	0x1c
	.byte	0xe
	.4byte	0xff
	.byte	0x9
	.4byte	.LASF15
	.byte	0x6
	.byte	0x7
	.byte	0xd
	.4byte	0x2d
	.byte	0x9
	.4byte	.LASF16
	.byte	0x6
	.byte	0xb
	.byte	0xd
	.4byte	0x2d
	.byte	0xc
	.4byte	.LASF17
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	.LASF19
	.4byte	0x2d
	.8byte	.LFB39
	.8byte	.LFE39-.LFB39
	.byte	0x1
	.byte	0x9c
	.4byte	0x195
	.byte	0xd
	.8byte	.LVL40
	.4byte	0xe73
	.4byte	0x187
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC32
	.byte	0
	.byte	0xf
	.8byte	.LVL41
	.4byte	0xe7f
	.byte	0
	.byte	0x10
	.4byte	.LASF35
	.byte	0x1
	.byte	0x6b
	.byte	0x1
	.4byte	.LASF37
	.4byte	0x2d
	.8byte	.LFB38
	.8byte	.LFE38-.LFB38
	.byte	0x1
	.byte	0x9c
	.4byte	0x1fa
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x6b
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1738
	.byte	0x12
	.8byte	.LVL39
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC31
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	.LASF18
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.4byte	.LASF20
	.4byte	0x2d
	.8byte	.LFB37
	.8byte	.LFE37-.LFB37
	.byte	0x1
	.byte	0x9c
	.4byte	0x25a
	.byte	0xd
	.8byte	.LVL37
	.4byte	0xe73
	.4byte	0x24c
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC30
	.byte	0
	.byte	0xf
	.8byte	.LVL38
	.4byte	0xe7f
	.byte	0
	.byte	0xc
	.4byte	.LASF21
	.byte	0x1
	.byte	0x65
	.byte	0x1
	.4byte	.LASF22
	.4byte	0x2d
	.8byte	.LFB36
	.8byte	.LFE36-.LFB36
	.byte	0x1
	.byte	0x9c
	.4byte	0x2ba
	.byte	0xd
	.8byte	.LVL35
	.4byte	0xe73
	.4byte	0x2ac
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC29
	.byte	0
	.byte	0xf
	.8byte	.LVL36
	.4byte	0xe7f
	.byte	0
	.byte	0x13
	.4byte	.LASF23
	.byte	0x1
	.byte	0x60
	.byte	0x1
	.4byte	.LASF25
	.4byte	0x2d
	.8byte	.LFB35
	.8byte	.LFE35-.LFB35
	.byte	0x1
	.byte	0x9c
	.byte	0x13
	.4byte	.LASF24
	.byte	0x1
	.byte	0x5f
	.byte	0x1
	.4byte	.LASF26
	.4byte	0x2d
	.8byte	.LFB34
	.8byte	.LFE34-.LFB34
	.byte	0x1
	.byte	0x9c
	.byte	0x13
	.4byte	.LASF27
	.byte	0x1
	.byte	0x5e
	.byte	0x1
	.4byte	.LASF28
	.4byte	0x2d
	.8byte	.LFB33
	.8byte	.LFE33-.LFB33
	.byte	0x1
	.byte	0x9c
	.byte	0x13
	.4byte	.LASF29
	.byte	0x1
	.byte	0x5d
	.byte	0x1
	.4byte	.LASF30
	.4byte	0x2d
	.8byte	.LFB32
	.8byte	.LFE32-.LFB32
	.byte	0x1
	.byte	0x9c
	.byte	0x13
	.4byte	.LASF31
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.4byte	.LASF32
	.4byte	0x2d
	.8byte	.LFB31
	.8byte	.LFE31-.LFB31
	.byte	0x1
	.byte	0x9c
	.byte	0x13
	.4byte	.LASF33
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.4byte	.LASF34
	.4byte	0x2d
	.8byte	.LFB30
	.8byte	.LFE30-.LFB30
	.byte	0x1
	.byte	0x9c
	.byte	0x10
	.4byte	.LASF36
	.byte	0x1
	.byte	0x58
	.byte	0x1
	.4byte	.LASF38
	.4byte	0x2d
	.8byte	.LFB29
	.8byte	.LFE29-.LFB29
	.byte	0x1
	.byte	0x9c
	.4byte	0x3eb
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x58
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1692
	.byte	0x12
	.8byte	.LVL34
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC28
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	.LASF40
	.byte	0x1
	.byte	0x57
	.byte	0x1
	.4byte	.LASF41
	.4byte	0x2d
	.8byte	.LFB28
	.8byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.4byte	0x44b
	.byte	0xd
	.8byte	.LVL32
	.4byte	0xe73
	.4byte	0x43d
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC27
	.byte	0
	.byte	0xf
	.8byte	.LVL33
	.4byte	0xe7f
	.byte	0
	.byte	0x10
	.4byte	.LASF42
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.4byte	.LASF43
	.4byte	0x4b0
	.8byte	.LFB27
	.8byte	.LFE27-.LFB27
	.byte	0x1
	.byte	0x9c
	.4byte	0x4b0
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1681
	.byte	0x12
	.8byte	.LVL31
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC26
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x8
	.4byte	0x34
	.byte	0x10
	.4byte	.LASF44
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.4byte	.LASF45
	.4byte	0x51b
	.8byte	.LFB26
	.8byte	.LFE26-.LFB26
	.byte	0x1
	.byte	0x9c
	.4byte	0x51b
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1675
	.byte	0x12
	.8byte	.LVL30
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC25
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x8
	.byte	0x10
	.4byte	.LASF46
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.4byte	.LASF47
	.4byte	0x2d
	.8byte	.LFB25
	.8byte	.LFE25-.LFB25
	.byte	0x1
	.byte	0x9c
	.4byte	0x582
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1669
	.byte	0x12
	.8byte	.LVL29
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC24
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	.LASF48
	.byte	0x1
	.byte	0x4f
	.byte	0x1
	.4byte	.LASF49
	.4byte	0x2d
	.8byte	.LFB24
	.8byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.4byte	0x5e2
	.byte	0xd
	.8byte	.LVL27
	.4byte	0xe73
	.4byte	0x5d4
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC23
	.byte	0
	.byte	0xf
	.8byte	.LVL28
	.4byte	0xe7f
	.byte	0
	.byte	0x13
	.4byte	.LASF50
	.byte	0x1
	.byte	0x4e
	.byte	0x1
	.4byte	.LASF51
	.4byte	0x2d
	.8byte	.LFB23
	.8byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.byte	0xc
	.4byte	.LASF52
	.byte	0x1
	.byte	0x4d
	.byte	0x1
	.4byte	.LASF53
	.4byte	0x2d
	.8byte	.LFB22
	.8byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0x664
	.byte	0xd
	.8byte	.LVL25
	.4byte	0xe73
	.4byte	0x656
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC22
	.byte	0
	.byte	0xf
	.8byte	.LVL26
	.4byte	0xe7f
	.byte	0
	.byte	0x13
	.4byte	.LASF54
	.byte	0x1
	.byte	0x4c
	.byte	0x1
	.4byte	.LASF55
	.4byte	0x129
	.8byte	.LFB21
	.8byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.byte	0x13
	.4byte	.LASF56
	.byte	0x1
	.byte	0x4b
	.byte	0x1
	.4byte	.LASF57
	.4byte	0x2d
	.8byte	.LFB20
	.8byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.byte	0x10
	.4byte	.LASF58
	.byte	0x1
	.byte	0x4a
	.byte	0x1
	.4byte	.LASF59
	.4byte	0x11d
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x70d
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x4a
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1638
	.byte	0x12
	.8byte	.LVL24
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC21
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF60
	.byte	0x1
	.byte	0x49
	.byte	0x1
	.4byte	.LASF61
	.4byte	0x11d
	.8byte	.LFB18
	.8byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x772
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x49
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1632
	.byte	0x12
	.8byte	.LVL23
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC20
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	.LASF62
	.byte	0x1
	.byte	0x48
	.byte	0x1
	.4byte	.LASF63
	.4byte	0x2d
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0x7d2
	.byte	0xd
	.8byte	.LVL21
	.4byte	0xe73
	.4byte	0x7c4
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC19
	.byte	0
	.byte	0xf
	.8byte	.LVL22
	.4byte	0xe7f
	.byte	0
	.byte	0xc
	.4byte	.LASF64
	.byte	0x1
	.byte	0x47
	.byte	0x1
	.4byte	.LASF65
	.4byte	0x2d
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x832
	.byte	0xd
	.8byte	.LVL19
	.4byte	0xe73
	.4byte	0x824
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC18
	.byte	0
	.byte	0xf
	.8byte	.LVL20
	.4byte	0xe7f
	.byte	0
	.byte	0x10
	.4byte	.LASF66
	.byte	0x1
	.byte	0x46
	.byte	0x1
	.4byte	.LASF67
	.4byte	0x2d
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x897
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x46
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1616
	.byte	0x12
	.8byte	.LVL18
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC17
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	.LASF68
	.byte	0x1
	.byte	0x43
	.byte	0x1
	.4byte	.LASF69
	.4byte	0x2d
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x8f7
	.byte	0xd
	.8byte	.LVL16
	.4byte	0xe73
	.4byte	0x8e9
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC16
	.byte	0
	.byte	0xf
	.8byte	.LVL17
	.4byte	0xe7f
	.byte	0
	.byte	0x10
	.4byte	.LASF70
	.byte	0x1
	.byte	0x42
	.byte	0x1
	.4byte	.LASF71
	.4byte	0x4f
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0x95c
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x42
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1605
	.byte	0x12
	.8byte	.LVL15
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC15
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF72
	.byte	0x1
	.byte	0x41
	.byte	0x1
	.4byte	.LASF73
	.4byte	0x4f
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x9c1
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x41
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1599
	.byte	0x12
	.8byte	.LVL14
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC14
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF74
	.byte	0x1
	.byte	0x3e
	.byte	0x1
	.4byte	.LASF75
	.4byte	0x2d
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0xa26
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x3e
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1593
	.byte	0x12
	.8byte	.LVL13
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC13
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF76
	.byte	0x1
	.byte	0x3d
	.byte	0x1
	.4byte	.LASF77
	.4byte	0x2d
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0xa8b
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x3d
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1587
	.byte	0x12
	.8byte	.LVL12
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC12
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF78
	.byte	0x1
	.byte	0x3b
	.byte	0x1
	.4byte	.LASF79
	.4byte	0x2d
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0xaf0
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x3b
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1581
	.byte	0x12
	.8byte	.LVL11
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC11
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF80
	.byte	0x1
	.byte	0x3a
	.byte	0x1
	.4byte	.LASF81
	.4byte	0x2d
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0xb55
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x3a
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1575
	.byte	0x12
	.8byte	.LVL10
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC10
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF82
	.byte	0x1
	.byte	0x39
	.byte	0x1
	.4byte	.LASF83
	.4byte	0x2d
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.4byte	0xbba
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x39
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1569
	.byte	0x12
	.8byte	.LVL9
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC9
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF84
	.byte	0x1
	.byte	0x38
	.byte	0x1
	.4byte	.LASF85
	.4byte	0x2d
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0xc1f
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x38
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1563
	.byte	0x12
	.8byte	.LVL8
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC8
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF86
	.byte	0x1
	.byte	0x37
	.byte	0x1
	.4byte	.LASF87
	.4byte	0x2d
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0xc84
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x37
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1557
	.byte	0x12
	.8byte	.LVL7
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC7
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF88
	.byte	0x1
	.byte	0x36
	.byte	0x1
	.4byte	.LASF89
	.4byte	0x2d
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0xce9
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x36
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1551
	.byte	0x12
	.8byte	.LVL6
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC6
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF90
	.byte	0x1
	.byte	0x35
	.byte	0x1
	.4byte	.LASF91
	.4byte	0x2d
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0xd4e
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x35
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1545
	.byte	0x12
	.8byte	.LVL5
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC5
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	.LASF92
	.byte	0x1
	.byte	0x30
	.byte	0x1
	.4byte	.LASF93
	.4byte	0x2d
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0xdae
	.byte	0xd
	.8byte	.LVL3
	.4byte	0xe73
	.4byte	0xda0
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC4
	.byte	0
	.byte	0xf
	.8byte	.LVL4
	.4byte	0xe7f
	.byte	0
	.byte	0xc
	.4byte	.LASF94
	.byte	0x1
	.byte	0x2f
	.byte	0x1
	.4byte	.LASF95
	.4byte	0x2d
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0xe0e
	.byte	0xd
	.8byte	.LVL1
	.4byte	0xe73
	.4byte	0xe00
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC2
	.byte	0
	.byte	0xf
	.8byte	.LVL2
	.4byte	0xe7f
	.byte	0
	.byte	0x10
	.4byte	.LASF96
	.byte	0x1
	.byte	0x2e
	.byte	0x1
	.4byte	.LASF97
	.4byte	0x2d
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0xe73
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x2e
	.byte	0x1
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	called.1529
	.byte	0x12
	.8byte	.LVL0
	.4byte	0xe73
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC0
	.byte	0
	.byte	0
	.byte	0x15
	.4byte	.LASF98
	.4byte	.LASF98
	.byte	0x3
	.byte	0xf
	.byte	0x5
	.byte	0x15
	.4byte	.LASF99
	.4byte	.LASF99
	.byte	0x7
	.byte	0x6
	.byte	0x6
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
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x3
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
	.byte	0x4
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
	.byte	0x5
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0x7
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x9
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
	.byte	0xa
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
	.byte	0xb
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0x6e
	.byte	0xe
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x87,0x1
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
	.byte	0xd
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
	.byte	0xe
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x6e
	.byte	0xe
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
	.byte	0x11
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
	.byte	0x12
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x2e
	.byte	0
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
	.byte	0x6e
	.byte	0xe
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
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x15
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
.LASF65:
	.string	"close"
.LASF39:
	.string	"called"
.LASF24:
	.string	"__unsup_sigemptyset"
.LASF89:
	.string	"getc"
.LASF6:
	.string	"write"
.LASF86:
	.string	"__unsup_ungetc"
.LASF78:
	.string	"__unsup_ferror"
.LASF35:
	.string	"__unsup_stat"
.LASF8:
	.string	"wend"
.LASF9:
	.string	"size_t"
.LASF43:
	.string	"readdir"
.LASF70:
	.string	"__unsup_secure_getenv"
.LASF83:
	.string	"fputc"
.LASF3:
	.string	"dirent"
.LASF27:
	.string	"__unsup_sigdelset"
.LASF7:
	.string	"wpos"
.LASF30:
	.string	"sigaddset"
.LASF40:
	.string	"__unsup_fcntl"
.LASF51:
	.string	"readlink"
.LASF42:
	.string	"__unsup_readdir"
.LASF80:
	.string	"__unsup_putc"
.LASF20:
	.string	"strerror"
.LASF49:
	.string	"unlink"
.LASF23:
	.string	"__unsup_sigprocmask"
.LASF64:
	.string	"__unsup_close"
.LASF73:
	.string	"getenv"
.LASF75:
	.string	"fgets"
.LASF77:
	.string	"fputs"
.LASF18:
	.string	"__unsup_strerror"
.LASF74:
	.string	"__unsup_fgets"
.LASF84:
	.string	"__unsup_fwrite"
.LASF45:
	.string	"opendir"
.LASF48:
	.string	"__unsup_unlink"
.LASF72:
	.string	"__unsup_getenv"
.LASF13:
	.string	"stderr"
.LASF33:
	.string	"__unsup_sigaction"
.LASF61:
	.string	"getpid"
.LASF93:
	.string	"sscanf"
.LASF1:
	.string	"long int"
.LASF81:
	.string	"putc"
.LASF98:
	.string	"printf"
.LASF21:
	.string	"__unsup_raise"
.LASF101:
	.string	"stubs.c"
.LASF55:
	.string	"lseek"
.LASF16:
	.string	"off_t"
.LASF54:
	.string	"__unsup_lseek"
.LASF97:
	.string	"fflush"
.LASF71:
	.string	"secure_getenv"
.LASF44:
	.string	"__unsup_opendir"
.LASF46:
	.string	"__unsup_closedir"
.LASF52:
	.string	"__unsup_read"
.LASF19:
	.string	"caml_ba_map_file"
.LASF59:
	.string	"getppid"
.LASF53:
	.string	"read"
.LASF79:
	.string	"ferror"
.LASF96:
	.string	"__unsup_fflush"
.LASF36:
	.string	"__unsup_open"
.LASF28:
	.string	"sigdelset"
.LASF41:
	.string	"fcntl"
.LASF76:
	.string	"__unsup_fputs"
.LASF94:
	.string	"__unsup_rename"
.LASF100:
	.string	"GNU C99 9.2.0 -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -O2 -Og -std=c99"
.LASF85:
	.string	"fwrite"
.LASF4:
	.string	"_FILE"
.LASF11:
	.string	"errno"
.LASF67:
	.string	"chdir"
.LASF0:
	.string	"char"
.LASF60:
	.string	"__unsup_getpid"
.LASF26:
	.string	"sigemptyset"
.LASF66:
	.string	"__unsup_chdir"
.LASF56:
	.string	"__unsup_isatty"
.LASF32:
	.string	"sigsetjmp"
.LASF82:
	.string	"__unsup_fputc"
.LASF102:
	.string	"/home/sai/ocaml-freestanding-riscv/build/nolibc"
.LASF88:
	.string	"__unsup_getc"
.LASF50:
	.string	"__unsup_readlink"
.LASF5:
	.string	"d_name"
.LASF29:
	.string	"__unsup_sigaddset"
.LASF69:
	.string	"system"
.LASF34:
	.string	"sigaction"
.LASF2:
	.string	"long unsigned int"
.LASF31:
	.string	"__unsup_sigsetjmp"
.LASF15:
	.string	"pid_t"
.LASF17:
	.string	"__unsup_caml_ba_map_file"
.LASF63:
	.string	"getcwd"
.LASF68:
	.string	"__unsup_system"
.LASF14:
	.string	"stdin"
.LASF95:
	.string	"rename"
.LASF57:
	.string	"isatty"
.LASF25:
	.string	"sigprocmask"
.LASF38:
	.string	"open"
.LASF62:
	.string	"__unsup_getcwd"
.LASF58:
	.string	"__unsup_getppid"
.LASF92:
	.string	"__unsup_sscanf"
.LASF37:
	.string	"stat"
.LASF10:
	.string	"FILE"
.LASF22:
	.string	"raise"
.LASF47:
	.string	"closedir"
.LASF91:
	.string	"fread"
.LASF87:
	.string	"ungetc"
.LASF99:
	.string	"abort"
.LASF12:
	.string	"stdout"
.LASF90:
	.string	"__unsup_fread"
	.ident	"GCC: (GNU) 9.2.0"
