	.file	"dynlink.c"
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
	.string	"Opening shared library %s\n"
	.text
	.align	1
	.globl	caml_dynlink_open_lib
	.type	caml_dynlink_open_lib, @function
caml_dynlink_open_lib:
.LFB12:
	.file 1 "dynlink.c"
	.loc 1 226 1
	.cfi_startproc
.LVL0:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	mv	s0,a0
	mv	s1,a1
	.loc 1 227 3
	.loc 1 228 3
	.loc 1 229 3
	.loc 1 231 3
	mv	a2,a1
	lla	a1,.LC0
.LVL1:
	li	a0,256
.LVL2:
	call	caml_gc_message
.LVL3:
	.loc 1 233 3
	.loc 1 233 7 is_stmt 0
	mv	a0,s1
	call	caml_stat_strdup
.LVL4:
	mv	s1,a0
.LVL5:
	.loc 1 234 3 is_stmt 1
	call	caml_enter_blocking_section
.LVL6:
	.loc 1 235 3
	.loc 1 235 27 is_stmt 0
	srai	a1,s0,1
	.loc 1 235 12
	li	a2,1
	sext.w	a1,a1
	mv	a0,s1
	call	caml_dlopen
.LVL7:
	mv	s0,a0
.LVL8:
	.loc 1 236 3 is_stmt 1
	call	caml_leave_blocking_section
.LVL9:
	.loc 1 237 3
	mv	a0,s1
	call	caml_stat_free
.LVL10:
	.loc 1 238 3
	.loc 1 238 6 is_stmt 0
	beq	s0,zero,.L4
	.loc 1 239 3 is_stmt 1
	.loc 1 239 12 is_stmt 0
	li	a1,251
	li	a0,1
	call	caml_alloc_small
.LVL11:
	.loc 1 240 3 is_stmt 1
	.loc 1 240 22 is_stmt 0
	sd	s0,0(a0)
	.loc 1 241 3 is_stmt 1
	.loc 1 242 1 is_stmt 0
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
.LVL12:
	ld	s1,8(sp)
	.cfi_restore 9
.LVL13:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL14:
.L4:
	.cfi_restore_state
	.loc 1 238 23 is_stmt 1 discriminator 1
	.loc 1 238 37 is_stmt 0 discriminator 1
	call	caml_dlerror
.LVL15:
	.loc 1 238 23 discriminator 1
	call	caml_failwith
.LVL16:
	.cfi_endproc
.LFE12:
	.size	caml_dynlink_open_lib, .-caml_dynlink_open_lib
	.align	1
	.globl	caml_dynlink_close_lib
	.type	caml_dynlink_close_lib, @function
caml_dynlink_close_lib:
.LFB13:
	.loc 1 245 1 is_stmt 1
	.cfi_startproc
.LVL17:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 246 3
	ld	a0,0(a0)
.LVL18:
	call	caml_dlclose
.LVL19:
	.loc 1 247 3
	.loc 1 248 1 is_stmt 0
	li	a0,1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE13:
	.size	caml_dynlink_close_lib, .-caml_dynlink_close_lib
	.align	1
	.globl	caml_dynlink_lookup_symbol
	.type	caml_dynlink_lookup_symbol, @function
caml_dynlink_lookup_symbol:
.LFB14:
	.loc 1 252 1 is_stmt 1
	.cfi_startproc
.LVL20:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.loc 1 253 3
	.loc 1 254 3
	.loc 1 255 3
	.loc 1 255 10 is_stmt 0
	ld	a0,0(a0)
.LVL21:
	call	caml_dlsym
.LVL22:
	.loc 1 258 3 is_stmt 1
	.loc 1 258 6 is_stmt 0
	beq	a0,zero,.L9
	mv	s0,a0
	.loc 1 259 3 is_stmt 1
	.loc 1 259 12 is_stmt 0
	li	a1,251
	li	a0,1
.LVL23:
	call	caml_alloc_small
.LVL24:
	.loc 1 260 3 is_stmt 1
	.loc 1 260 22 is_stmt 0
	sd	s0,0(a0)
	.loc 1 261 3 is_stmt 1
.LVL25:
.L7:
	.loc 1 262 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL26:
.L9:
	.cfi_restore_state
	.loc 1 258 28
	li	a0,1
.LVL27:
	j	.L7
	.cfi_endproc
.LFE14:
	.size	caml_dynlink_lookup_symbol, .-caml_dynlink_lookup_symbol
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"dynlink_add_primitive"
	.text
	.align	1
	.globl	caml_dynlink_add_primitive
	.type	caml_dynlink_add_primitive, @function
caml_dynlink_add_primitive:
.LFB15:
	.loc 1 289 1 is_stmt 1
	.cfi_startproc
.LVL28:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 290 3
	lla	a0,.LC1
.LVL29:
	call	caml_invalid_argument
.LVL30:
	.cfi_endproc
.LFE15:
	.size	caml_dynlink_add_primitive, .-caml_dynlink_add_primitive
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"dynlink_get_current_libs"
	.text
	.align	1
	.globl	caml_dynlink_get_current_libs
	.type	caml_dynlink_get_current_libs, @function
caml_dynlink_get_current_libs:
.LFB16:
	.loc 1 295 1
	.cfi_startproc
.LVL31:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 296 3
	lla	a0,.LC2
.LVL32:
	call	caml_invalid_argument
.LVL33:
	.cfi_endproc
.LFE16:
	.size	caml_dynlink_get_current_libs, .-caml_dynlink_get_current_libs
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 3 "caml/config.h"
	.file 4 "caml/misc.h"
	.file 5 "caml/mlvalues.h"
	.file 6 "caml/dynlink.h"
	.file 7 "/home/sai/ocaml-freestanding-riscv/nolibc/include/signal.h"
	.file 8 "caml/fail.h"
	.file 9 "caml/freelist.h"
	.file 10 "caml/major_gc.h"
	.file 11 "caml/address_class.h"
	.file 12 "caml/minor_gc.h"
	.file 13 "caml/memory.h"
	.file 14 "caml/prims.h"
	.file 15 "caml/signals.h"
	.file 16 "caml/osdeps.h"
	.file 17 "caml/alloc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xa30
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF125
	.byte	0xc
	.4byte	.LASF126
	.4byte	.LASF127
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF0
	.byte	0x3
	.4byte	.LASF7
	.byte	0x2
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
	.byte	0x5
	.4byte	0x47
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x10
	.byte	0x4
	.4byte	.LASF3
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.byte	0x3
	.4byte	.LASF8
	.byte	0x3
	.byte	0x5b
	.byte	0xe
	.4byte	0x2d
	.byte	0x5
	.4byte	0x76
	.byte	0x3
	.4byte	.LASF9
	.byte	0x3
	.byte	0x5c
	.byte	0x17
	.4byte	0x40
	.byte	0x3
	.4byte	.LASF10
	.byte	0x4
	.byte	0x21
	.byte	0x10
	.4byte	0x34
	.byte	0x6
	.byte	0x8
	.4byte	0xa5
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.byte	0x3
	.4byte	.LASF12
	.byte	0x4
	.byte	0x5c
	.byte	0x10
	.4byte	0xb8
	.byte	0x6
	.byte	0x8
	.4byte	0xc3
	.byte	0x5
	.4byte	0xb8
	.byte	0x7
	.byte	0x8
	.4byte	.LASF13
	.byte	0x4
	.byte	0x5d
	.byte	0x19
	.4byte	0xac
	.byte	0x8
	.4byte	.LASF14
	.byte	0x4
	.byte	0x5d
	.byte	0x36
	.4byte	0xac
	.byte	0x8
	.4byte	.LASF15
	.byte	0x4
	.byte	0x5e
	.byte	0x19
	.4byte	0xac
	.byte	0x8
	.4byte	.LASF16
	.byte	0x4
	.byte	0x5e
	.byte	0x33
	.4byte	0xac
	.byte	0x8
	.4byte	.LASF17
	.byte	0x4
	.byte	0x5f
	.byte	0x19
	.4byte	0xac
	.byte	0x8
	.4byte	.LASF18
	.byte	0x4
	.byte	0x5f
	.byte	0x33
	.4byte	0xac
	.byte	0x3
	.4byte	.LASF19
	.byte	0x4
	.byte	0xcc
	.byte	0xe
	.4byte	0xa5
	.byte	0x9
	.4byte	.LASF32
	.byte	0x10
	.byte	0x4
	.2byte	0x152
	.byte	0x8
	.4byte	0x151
	.byte	0xa
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x153
	.byte	0x7
	.4byte	0x47
	.byte	0
	.byte	0xa
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x154
	.byte	0x7
	.4byte	0x47
	.byte	0x4
	.byte	0xa
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x155
	.byte	0xb
	.4byte	0x151
	.byte	0x8
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x157
	.byte	0xb
	.byte	0x8
	.byte	0xc
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x169
	.byte	0x10
	.4byte	0x87
	.byte	0xc
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x171
	.byte	0x10
	.4byte	0x87
	.byte	0x3
	.4byte	.LASF25
	.byte	0x5
	.byte	0x3c
	.byte	0x10
	.4byte	0x76
	.byte	0x3
	.4byte	.LASF26
	.byte	0x5
	.byte	0x3d
	.byte	0x11
	.4byte	0x87
	.byte	0x3
	.4byte	.LASF27
	.byte	0x5
	.byte	0x3e
	.byte	0x11
	.4byte	0x87
	.byte	0xd
	.4byte	0x17f
	.4byte	0x1a2
	.byte	0xe
	.byte	0
	.byte	0xc
	.4byte	.LASF28
	.byte	0x5
	.2byte	0x15c
	.byte	0x15
	.4byte	0x197
	.byte	0xc
	.4byte	.LASF29
	.byte	0x5
	.2byte	0x171
	.byte	0xe
	.4byte	0x173
	.byte	0x8
	.4byte	.LASF30
	.byte	0x6
	.byte	0x23
	.byte	0x19
	.4byte	0x118
	.byte	0x3
	.4byte	.LASF31
	.byte	0x7
	.byte	0x4
	.byte	0xd
	.4byte	0x47
	.byte	0xf
	.4byte	.LASF33
	.byte	0x4
	.byte	0x8
	.byte	0x2c
	.byte	0x8
	.4byte	0x1ef
	.byte	0x10
	.string	"buf"
	.byte	0x8
	.byte	0x2d
	.byte	0xe
	.4byte	0x1c8
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	.LASF34
	.byte	0x8
	.byte	0x3e
	.byte	0x24
	.4byte	0x1fb
	.byte	0x6
	.byte	0x8
	.4byte	0x1d4
	.byte	0x8
	.4byte	.LASF35
	.byte	0x8
	.byte	0x3f
	.byte	0xe
	.4byte	0x173
	.byte	0x8
	.4byte	.LASF36
	.byte	0x9
	.byte	0x1a
	.byte	0x10
	.4byte	0x93
	.byte	0x8
	.4byte	.LASF37
	.byte	0xa
	.byte	0x24
	.byte	0xc
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF38
	.byte	0xa
	.byte	0x25
	.byte	0xc
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF39
	.byte	0xa
	.byte	0x26
	.byte	0x10
	.4byte	0x87
	.byte	0x8
	.4byte	.LASF40
	.byte	0xa
	.byte	0x27
	.byte	0xf
	.4byte	0x249
	.byte	0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF41
	.byte	0x8
	.4byte	.LASF42
	.byte	0xa
	.byte	0x28
	.byte	0x10
	.4byte	0x87
	.byte	0x8
	.4byte	.LASF43
	.byte	0xa
	.byte	0x28
	.byte	0x25
	.4byte	0x87
	.byte	0x8
	.4byte	.LASF44
	.byte	0xa
	.byte	0x29
	.byte	0x10
	.4byte	0x87
	.byte	0x8
	.4byte	.LASF45
	.byte	0xa
	.byte	0x3e
	.byte	0x12
	.4byte	0x9f
	.byte	0x8
	.4byte	.LASF46
	.byte	0xa
	.byte	0x3f
	.byte	0x10
	.4byte	0x87
	.byte	0x8
	.4byte	.LASF47
	.byte	0xa
	.byte	0x40
	.byte	0xe
	.4byte	0x9f
	.byte	0x8
	.4byte	.LASF48
	.byte	0xa
	.byte	0x42
	.byte	0xc
	.4byte	0x47
	.byte	0xd
	.4byte	0x249
	.4byte	0x2b4
	.byte	0x11
	.4byte	0x40
	.byte	0x31
	.byte	0
	.byte	0x12
	.4byte	.LASF49
	.byte	0xa
	.byte	0x43
	.byte	0x8
	.4byte	0x2a4
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0x12
	.4byte	.LASF50
	.byte	0xa
	.byte	0x44
	.byte	0x5
	.4byte	0x47
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0x12
	.4byte	.LASF51
	.byte	0xa
	.byte	0x45
	.byte	0x8
	.4byte	0x249
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0x8
	.4byte	.LASF52
	.byte	0xa
	.byte	0x46
	.byte	0xf
	.4byte	0x249
	.byte	0x8
	.4byte	.LASF53
	.byte	0xa
	.byte	0x4a
	.byte	0x13
	.4byte	0xb8
	.byte	0x8
	.4byte	.LASF54
	.byte	0xb
	.byte	0x31
	.byte	0xf
	.4byte	0x31a
	.byte	0x6
	.byte	0x8
	.4byte	0x173
	.byte	0x8
	.4byte	.LASF55
	.byte	0xb
	.byte	0x31
	.byte	0x22
	.4byte	0x31a
	.byte	0x8
	.4byte	.LASF56
	.byte	0xb
	.byte	0x32
	.byte	0xf
	.4byte	0x9f
	.byte	0x8
	.4byte	.LASF57
	.byte	0xb
	.byte	0x32
	.byte	0x27
	.4byte	0x9f
	.byte	0x8
	.4byte	.LASF58
	.byte	0xc
	.byte	0x18
	.byte	0x13
	.4byte	0x31a
	.byte	0x8
	.4byte	.LASF59
	.byte	0xc
	.byte	0x18
	.byte	0x2c
	.4byte	0x31a
	.byte	0x8
	.4byte	.LASF60
	.byte	0xc
	.byte	0x19
	.byte	0x13
	.4byte	0x31a
	.byte	0x8
	.4byte	.LASF61
	.byte	0xc
	.byte	0x19
	.byte	0x24
	.4byte	0x31a
	.byte	0x8
	.4byte	.LASF62
	.byte	0xc
	.byte	0x1a
	.byte	0x13
	.4byte	0x31a
	.byte	0x8
	.4byte	.LASF63
	.byte	0xc
	.byte	0x1b
	.byte	0x10
	.4byte	0x93
	.byte	0x8
	.4byte	.LASF64
	.byte	0xc
	.byte	0x1c
	.byte	0xc
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF65
	.byte	0xc
	.byte	0x1d
	.byte	0xf
	.4byte	0x249
	.byte	0xf
	.4byte	.LASF66
	.byte	0x38
	.byte	0xc
	.byte	0x29
	.byte	0x8
	.4byte	0x40d
	.byte	0x13
	.4byte	.LASF67
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x40d
	.byte	0
	.byte	0x10
	.string	"end"
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x40d
	.byte	0x8
	.byte	0x13
	.4byte	.LASF68
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x40d
	.byte	0x10
	.byte	0x10
	.string	"ptr"
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x40d
	.byte	0x18
	.byte	0x13
	.4byte	.LASF69
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x40d
	.byte	0x20
	.byte	0x13
	.4byte	.LASF20
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x93
	.byte	0x28
	.byte	0x13
	.4byte	.LASF70
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x93
	.byte	0x30
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x31a
	.byte	0x8
	.4byte	.LASF66
	.byte	0xc
	.byte	0x2a
	.byte	0x22
	.4byte	0x3a4
	.byte	0xf
	.4byte	.LASF71
	.byte	0x10
	.byte	0xc
	.byte	0x2c
	.byte	0x8
	.4byte	0x447
	.byte	0x13
	.4byte	.LASF72
	.byte	0xc
	.byte	0x2d
	.byte	0x9
	.4byte	0x173
	.byte	0
	.byte	0x13
	.4byte	.LASF73
	.byte	0xc
	.byte	0x2e
	.byte	0xc
	.4byte	0x18b
	.byte	0x8
	.byte	0
	.byte	0xf
	.4byte	.LASF74
	.byte	0x38
	.byte	0xc
	.byte	0x31
	.byte	0x8
	.4byte	0x4b0
	.byte	0x13
	.4byte	.LASF67
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x4b0
	.byte	0
	.byte	0x10
	.string	"end"
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x4b0
	.byte	0x8
	.byte	0x13
	.4byte	.LASF68
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x4b0
	.byte	0x10
	.byte	0x10
	.string	"ptr"
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x4b0
	.byte	0x18
	.byte	0x13
	.4byte	.LASF69
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x4b0
	.byte	0x20
	.byte	0x13
	.4byte	.LASF20
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x93
	.byte	0x28
	.byte	0x13
	.4byte	.LASF70
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x93
	.byte	0x30
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x41f
	.byte	0x8
	.4byte	.LASF74
	.byte	0xc
	.byte	0x32
	.byte	0x27
	.4byte	0x447
	.byte	0xf
	.4byte	.LASF75
	.byte	0x18
	.byte	0xc
	.byte	0x34
	.byte	0x8
	.4byte	0x4f7
	.byte	0x13
	.4byte	.LASF76
	.byte	0xc
	.byte	0x35
	.byte	0x9
	.4byte	0x173
	.byte	0
	.byte	0x10
	.string	"mem"
	.byte	0xc
	.byte	0x36
	.byte	0xc
	.4byte	0x18b
	.byte	0x8
	.byte	0x10
	.string	"max"
	.byte	0xc
	.byte	0x37
	.byte	0xc
	.4byte	0x18b
	.byte	0x10
	.byte	0
	.byte	0xf
	.4byte	.LASF77
	.byte	0x38
	.byte	0xc
	.byte	0x3a
	.byte	0x8
	.4byte	0x560
	.byte	0x13
	.4byte	.LASF67
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x560
	.byte	0
	.byte	0x10
	.string	"end"
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x560
	.byte	0x8
	.byte	0x13
	.4byte	.LASF68
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x560
	.byte	0x10
	.byte	0x10
	.string	"ptr"
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x560
	.byte	0x18
	.byte	0x13
	.4byte	.LASF69
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x560
	.byte	0x20
	.byte	0x13
	.4byte	.LASF20
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x93
	.byte	0x28
	.byte	0x13
	.4byte	.LASF70
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x93
	.byte	0x30
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x4c2
	.byte	0x8
	.4byte	.LASF77
	.byte	0xc
	.byte	0x3b
	.byte	0x25
	.4byte	0x4f7
	.byte	0x8
	.4byte	.LASF78
	.byte	0xd
	.byte	0x3f
	.byte	0x10
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF79
	.byte	0xd
	.byte	0xb7
	.byte	0x10
	.4byte	0x87
	.byte	0xf
	.4byte	.LASF80
	.byte	0x40
	.byte	0xd
	.byte	0xf3
	.byte	0x8
	.4byte	0x5cc
	.byte	0x13
	.4byte	.LASF81
	.byte	0xd
	.byte	0xf4
	.byte	0x1d
	.4byte	0x5cc
	.byte	0
	.byte	0x13
	.4byte	.LASF82
	.byte	0xd
	.byte	0xf5
	.byte	0xa
	.4byte	0x76
	.byte	0x8
	.byte	0x13
	.4byte	.LASF83
	.byte	0xd
	.byte	0xf6
	.byte	0xa
	.4byte	0x76
	.byte	0x10
	.byte	0x13
	.4byte	.LASF84
	.byte	0xd
	.byte	0xf7
	.byte	0xa
	.4byte	0x5d2
	.byte	0x18
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x58a
	.byte	0xd
	.4byte	0x31a
	.4byte	0x5e2
	.byte	0x11
	.4byte	0x40
	.byte	0x4
	.byte	0
	.byte	0x8
	.4byte	.LASF85
	.byte	0xd
	.byte	0xfa
	.byte	0x26
	.4byte	0x5cc
	.byte	0x3
	.4byte	.LASF86
	.byte	0xe
	.byte	0x17
	.byte	0x11
	.4byte	0x5fa
	.byte	0x6
	.byte	0x8
	.4byte	0x600
	.byte	0x14
	.4byte	0x173
	.4byte	0x60b
	.byte	0x15
	.byte	0
	.byte	0xd
	.4byte	0x5ee
	.4byte	0x616
	.byte	0xe
	.byte	0
	.byte	0x8
	.4byte	.LASF87
	.byte	0xe
	.byte	0x19
	.byte	0x14
	.4byte	0x60b
	.byte	0xd
	.4byte	0x9f
	.4byte	0x62d
	.byte	0xe
	.byte	0
	.byte	0x8
	.4byte	.LASF88
	.byte	0xe
	.byte	0x1a
	.byte	0xf
	.4byte	0x622
	.byte	0x8
	.4byte	.LASF89
	.byte	0xe
	.byte	0x1c
	.byte	0x19
	.4byte	0x118
	.byte	0x8
	.4byte	.LASF90
	.byte	0xe
	.byte	0x23
	.byte	0xf
	.4byte	0x9f
	.byte	0x8
	.4byte	.LASF91
	.byte	0xe
	.byte	0x24
	.byte	0x10
	.4byte	0x93
	.byte	0x8
	.4byte	.LASF92
	.byte	0xf
	.byte	0x1e
	.byte	0x1c
	.4byte	0x82
	.byte	0xd
	.4byte	0x82
	.4byte	0x674
	.byte	0xe
	.byte	0
	.byte	0x5
	.4byte	0x669
	.byte	0x8
	.4byte	.LASF93
	.byte	0xf
	.byte	0x1f
	.byte	0x1c
	.4byte	0x674
	.byte	0x8
	.4byte	.LASF94
	.byte	0xf
	.byte	0x20
	.byte	0x19
	.4byte	0x4e
	.byte	0x8
	.4byte	.LASF95
	.byte	0xf
	.byte	0x21
	.byte	0x15
	.4byte	0x4e
	.byte	0x8
	.4byte	.LASF96
	.byte	0xf
	.byte	0x22
	.byte	0x15
	.4byte	0x4e
	.byte	0x8
	.4byte	.LASF97
	.byte	0xf
	.byte	0x2e
	.byte	0x13
	.4byte	0xb8
	.byte	0x8
	.4byte	.LASF98
	.byte	0xf
	.byte	0x2f
	.byte	0x13
	.4byte	0xb8
	.byte	0x16
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF99
	.byte	0xf
	.byte	0x30
	.byte	0x12
	.4byte	0x6d2
	.byte	0x6
	.byte	0x8
	.4byte	0x6c1
	.byte	0x8
	.4byte	.LASF100
	.byte	0xf
	.byte	0x31
	.byte	0x1d
	.4byte	0xbe
	.byte	0x17
	.4byte	.LASF101
	.byte	0x1
	.2byte	0x126
	.byte	0x7
	.4byte	0x173
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x734
	.byte	0x18
	.4byte	.LASF103
	.byte	0x1
	.2byte	0x126
	.byte	0x2b
	.4byte	0x173
	.4byte	.LLST11
	.byte	0x19
	.8byte	.LVL33
	.4byte	0x9a2
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC2
	.byte	0
	.byte	0
	.byte	0x17
	.4byte	.LASF102
	.byte	0x1
	.2byte	0x120
	.byte	0x7
	.4byte	0x173
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x784
	.byte	0x18
	.4byte	.LASF104
	.byte	0x1
	.2byte	0x120
	.byte	0x28
	.4byte	0x173
	.4byte	.LLST10
	.byte	0x19
	.8byte	.LVL30
	.4byte	0x9a2
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0
	.byte	0
	.byte	0x1b
	.4byte	.LASF105
	.byte	0x1
	.byte	0xfb
	.byte	0x10
	.4byte	0x173
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x819
	.byte	0x1c
	.4byte	.LASF104
	.byte	0x1
	.byte	0xfb
	.byte	0x31
	.4byte	0x173
	.4byte	.LLST6
	.byte	0x1c
	.4byte	.LASF106
	.byte	0x1
	.byte	0xfb
	.byte	0x3f
	.4byte	0x173
	.4byte	.LLST7
	.byte	0x1d
	.4byte	.LASF107
	.byte	0x1
	.byte	0xfd
	.byte	0xa
	.4byte	0x157
	.4byte	.LLST8
	.byte	0x1d
	.4byte	.LASF108
	.byte	0x1
	.byte	0xfe
	.byte	0x9
	.4byte	0x173
	.4byte	.LLST9
	.byte	0x1e
	.8byte	.LVL22
	.4byte	0x9ae
	.4byte	0x7ff
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0x19
	.8byte	.LVL24
	.4byte	0x9ba
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x8
	.byte	0xfb
	.byte	0
	.byte	0
	.byte	0x1b
	.4byte	.LASF109
	.byte	0x1
	.byte	0xf4
	.byte	0x10
	.4byte	0x173
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0x859
	.byte	0x1c
	.4byte	.LASF104
	.byte	0x1
	.byte	0xf4
	.byte	0x2d
	.4byte	0x173
	.4byte	.LLST5
	.byte	0x1f
	.8byte	.LVL19
	.4byte	0x9c6
	.byte	0
	.byte	0x1b
	.4byte	.LASF110
	.byte	0x1
	.byte	0xe1
	.byte	0x10
	.4byte	0x173
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x99c
	.byte	0x1c
	.4byte	.LASF111
	.byte	0x1
	.byte	0xe1
	.byte	0x2c
	.4byte	0x173
	.4byte	.LLST0
	.byte	0x1c
	.4byte	.LASF112
	.byte	0x1
	.byte	0xe1
	.byte	0x38
	.4byte	0x173
	.4byte	.LLST1
	.byte	0x1d
	.4byte	.LASF104
	.byte	0x1
	.byte	0xe3
	.byte	0xa
	.4byte	0x157
	.4byte	.LLST2
	.byte	0x1d
	.4byte	.LASF108
	.byte	0x1
	.byte	0xe4
	.byte	0x9
	.4byte	0x173
	.4byte	.LLST3
	.byte	0x20
	.string	"p"
	.byte	0x1
	.byte	0xe5
	.byte	0xd
	.4byte	0x99c
	.4byte	.LLST4
	.byte	0x1e
	.8byte	.LVL3
	.4byte	0x9d2
	.4byte	0x8f5
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xa
	.2byte	0x100
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC0
	.byte	0x1a
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x1e
	.8byte	.LVL4
	.4byte	0x9df
	.4byte	0x90d
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x1f
	.8byte	.LVL6
	.4byte	0x9eb
	.byte	0x1e
	.8byte	.LVL7
	.4byte	0x9f7
	.4byte	0x93f
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x4
	.byte	0x78
	.byte	0
	.byte	0x31
	.byte	0x26
	.byte	0x1a
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x1f
	.8byte	.LVL9
	.4byte	0xa03
	.byte	0x1e
	.8byte	.LVL10
	.4byte	0xa0f
	.4byte	0x964
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x1e
	.8byte	.LVL11
	.4byte	0x9ba
	.4byte	0x981
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x8
	.byte	0xfb
	.byte	0
	.byte	0x1f
	.8byte	.LVL15
	.4byte	0xa1b
	.byte	0x1f
	.8byte	.LVL16
	.4byte	0xa27
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x10c
	.byte	0x21
	.4byte	.LASF113
	.4byte	.LASF113
	.byte	0x8
	.byte	0x65
	.byte	0x11
	.byte	0x21
	.4byte	.LASF114
	.4byte	.LASF114
	.byte	0x10
	.byte	0x4f
	.byte	0xf
	.byte	0x21
	.4byte	.LASF115
	.4byte	.LASF115
	.byte	0x11
	.byte	0x1f
	.byte	0x12
	.byte	0x21
	.4byte	.LASF116
	.4byte	.LASF116
	.byte	0x10
	.byte	0x4b
	.byte	0xd
	.byte	0x22
	.4byte	.LASF117
	.4byte	.LASF117
	.byte	0x4
	.2byte	0x16a
	.byte	0x6
	.byte	0x21
	.4byte	.LASF118
	.4byte	.LASF118
	.byte	0xd
	.byte	0x9e
	.byte	0x1d
	.byte	0x21
	.4byte	.LASF119
	.4byte	.LASF119
	.byte	0xf
	.byte	0x34
	.byte	0x11
	.byte	0x21
	.4byte	.LASF120
	.4byte	.LASF120
	.byte	0x10
	.byte	0x48
	.byte	0xf
	.byte	0x21
	.4byte	.LASF121
	.4byte	.LASF121
	.byte	0xf
	.byte	0x35
	.byte	0x11
	.byte	0x21
	.4byte	.LASF122
	.4byte	.LASF122
	.byte	0xd
	.byte	0x85
	.byte	0x11
	.byte	0x21
	.4byte	.LASF123
	.4byte	.LASF123
	.byte	0x10
	.byte	0x54
	.byte	0xf
	.byte	0x21
	.4byte	.LASF124
	.4byte	.LASF124
	.byte	0x8
	.byte	0x5d
	.byte	0x11
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
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
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
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0xd
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
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0xd
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x14
	.byte	0x15
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
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
	.byte	0x5
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
	.byte	0x18
	.byte	0x5
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1b
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
	.byte	0x1e
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
	.byte	0x1f
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x21
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
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST11:
	.8byte	.LVL31-.Ltext0
	.8byte	.LVL32-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL32-.Ltext0
	.8byte	.LFE16-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST10:
	.8byte	.LVL28-.Ltext0
	.8byte	.LVL29-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL29-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL21-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL22-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL22-1-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL22-.Ltext0
	.8byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL26-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL24-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL18-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL8-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL5-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL14-.Ltext0
	.2byte	0x2
	.byte	0x7a
	.byte	0
	.8byte	.LVL14-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL14-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x59
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
.LASF97:
	.string	"caml_enter_blocking_section_hook"
.LASF69:
	.string	"limit"
.LASF98:
	.string	"caml_leave_blocking_section_hook"
.LASF108:
	.string	"result"
.LASF58:
	.string	"caml_young_alloc_start"
.LASF127:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF31:
	.string	"sigjmp_buf"
.LASF12:
	.string	"caml_timing_hook"
.LASF118:
	.string	"caml_stat_strdup"
.LASF94:
	.string	"caml_something_to_do"
.LASF62:
	.string	"caml_young_trigger"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF75:
	.string	"caml_custom_elt"
.LASF38:
	.string	"caml_gc_subphase"
.LASF48:
	.string	"caml_major_window"
.LASF61:
	.string	"caml_young_limit"
.LASF89:
	.string	"caml_prim_table"
.LASF112:
	.string	"filename"
.LASF92:
	.string	"caml_signals_are_pending"
.LASF19:
	.string	"char_os"
.LASF59:
	.string	"caml_young_alloc_end"
.LASF111:
	.string	"mode"
.LASF124:
	.string	"caml_failwith"
.LASF125:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF25:
	.string	"value"
.LASF99:
	.string	"caml_try_leave_blocking_section_hook"
.LASF66:
	.string	"caml_ref_table"
.LASF22:
	.string	"contents"
.LASF15:
	.string	"caml_minor_gc_begin_hook"
.LASF64:
	.string	"caml_in_minor_collection"
.LASF85:
	.string	"caml_local_roots"
.LASF103:
	.string	"unit"
.LASF113:
	.string	"caml_invalid_argument"
.LASF122:
	.string	"caml_stat_free"
.LASF93:
	.string	"caml_pending_signals"
.LASF110:
	.string	"caml_dynlink_open_lib"
.LASF106:
	.string	"symbolname"
.LASF88:
	.string	"caml_names_of_builtin_cprim"
.LASF53:
	.string	"caml_major_gc_hook"
.LASF52:
	.string	"caml_gc_clock"
.LASF83:
	.string	"nitems"
.LASF18:
	.string	"caml_finalise_end_hook"
.LASF2:
	.string	"long long int"
.LASF47:
	.string	"caml_gc_sweep_hp"
.LASF49:
	.string	"caml_major_ring"
.LASF68:
	.string	"threshold"
.LASF84:
	.string	"tables"
.LASF8:
	.string	"intnat"
.LASF0:
	.string	"long int"
.LASF119:
	.string	"caml_enter_blocking_section"
.LASF73:
	.string	"offset"
.LASF30:
	.string	"caml_shared_libs_path"
.LASF114:
	.string	"caml_dlsym"
.LASF101:
	.string	"caml_dynlink_get_current_libs"
.LASF78:
	.string	"caml_huge_fallback_count"
.LASF76:
	.string	"block"
.LASF36:
	.string	"caml_fl_cur_wsz"
.LASF24:
	.string	"caml_runtime_warnings"
.LASF26:
	.string	"header_t"
.LASF95:
	.string	"caml_requested_major_slice"
.LASF14:
	.string	"caml_major_slice_end_hook"
.LASF28:
	.string	"caml_atom_table"
.LASF3:
	.string	"long double"
.LASF17:
	.string	"caml_finalise_begin_hook"
.LASF65:
	.string	"caml_extra_heap_resources_minor"
.LASF32:
	.string	"ext_table"
.LASF43:
	.string	"caml_dependent_allocated"
.LASF109:
	.string	"caml_dynlink_close_lib"
.LASF27:
	.string	"mlsize_t"
.LASF80:
	.string	"caml__roots_block"
.LASF21:
	.string	"capacity"
.LASF9:
	.string	"uintnat"
.LASF55:
	.string	"caml_young_end"
.LASF4:
	.string	"unsigned int"
.LASF107:
	.string	"symb"
.LASF116:
	.string	"caml_dlclose"
.LASF72:
	.string	"ephe"
.LASF121:
	.string	"caml_leave_blocking_section"
.LASF13:
	.string	"caml_major_slice_begin_hook"
.LASF6:
	.string	"short unsigned int"
.LASF54:
	.string	"caml_young_start"
.LASF11:
	.string	"char"
.LASF120:
	.string	"caml_dlopen"
.LASF115:
	.string	"caml_alloc_small"
.LASF50:
	.string	"caml_major_ring_index"
.LASF102:
	.string	"caml_dynlink_add_primitive"
.LASF105:
	.string	"caml_dynlink_lookup_symbol"
.LASF33:
	.string	"longjmp_buffer"
.LASF96:
	.string	"caml_requested_minor_gc"
.LASF57:
	.string	"caml_code_area_end"
.LASF37:
	.string	"caml_gc_phase"
.LASF63:
	.string	"caml_minor_heap_wsz"
.LASF23:
	.string	"caml_verb_gc"
.LASF16:
	.string	"caml_minor_gc_end_hook"
.LASF34:
	.string	"caml_external_raise"
.LASF70:
	.string	"reserve"
.LASF1:
	.string	"long unsigned int"
.LASF56:
	.string	"caml_code_area_start"
.LASF100:
	.string	"caml_async_action_hook"
.LASF41:
	.string	"double"
.LASF35:
	.string	"caml_exn_bucket"
.LASF29:
	.string	"caml_global_data"
.LASF104:
	.string	"handle"
.LASF20:
	.string	"size"
.LASF87:
	.string	"caml_builtin_cprim"
.LASF117:
	.string	"caml_gc_message"
.LASF91:
	.string	"caml_section_table_size"
.LASF44:
	.string	"caml_fl_wsz_at_phase_change"
.LASF77:
	.string	"caml_custom_table"
.LASF126:
	.string	"dynlink.c"
.LASF40:
	.string	"caml_extra_heap_resources"
.LASF39:
	.string	"caml_allocated_words"
.LASF82:
	.string	"ntables"
.LASF86:
	.string	"c_primitive"
.LASF42:
	.string	"caml_dependent_size"
.LASF45:
	.string	"caml_heap_start"
.LASF123:
	.string	"caml_dlerror"
.LASF10:
	.string	"asize_t"
.LASF60:
	.string	"caml_young_ptr"
.LASF46:
	.string	"total_heap_size"
.LASF67:
	.string	"base"
.LASF51:
	.string	"caml_major_work_credit"
.LASF90:
	.string	"caml_section_table"
.LASF74:
	.string	"caml_ephe_ref_table"
.LASF71:
	.string	"caml_ephe_ref_elt"
.LASF81:
	.string	"next"
.LASF79:
	.string	"caml_use_huge_pages"
	.ident	"GCC: (GNU) 9.2.0"
