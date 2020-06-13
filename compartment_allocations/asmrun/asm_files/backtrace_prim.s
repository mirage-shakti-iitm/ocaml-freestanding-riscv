	.file	"backtrace_prim.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	caml_next_frame_descriptor
	.type	caml_next_frame_descriptor, @function
caml_next_frame_descriptor:
.LFB12:
	.file 1 "backtrace_prim.c"
	.loc 1 35 1
	.cfi_startproc
.LVL0:
	mv	a7,a0
.LVL1:
.L6:
	.loc 1 36 3
	.loc 1 37 3
	.loc 1 39 3
	.loc 1 40 5
	.loc 1 40 9 is_stmt 0
	ld	a2,0(a7)
	srli	a5,a2,3
	lw	a6,caml_frame_descriptors_mask
	.loc 1 40 7
	and	a5,a5,a6
.LVL2:
.L4:
	.loc 1 41 5 is_stmt 1
	.loc 1 42 7
	.loc 1 42 33 is_stmt 0
	slli	a4,a5,3
	ld	a3,caml_frame_descriptors
	add	a4,a3,a4
	.loc 1 42 9
	ld	a0,0(a4)
.LVL3:
	.loc 1 43 7 is_stmt 1
	.loc 1 43 10 is_stmt 0
	beq	a0,zero,.L1
	.loc 1 44 7 is_stmt 1
	.loc 1 44 12 is_stmt 0
	ld	a4,0(a0)
	.loc 1 44 10
	beq	a2,a4,.L3
	.loc 1 45 7 is_stmt 1
	.loc 1 45 13 is_stmt 0
	addi	a5,a5,1
.LVL4:
	.loc 1 45 9
	and	a5,a6,a5
.LVL5:
	.loc 1 41 11 is_stmt 1
	.loc 1 42 9 is_stmt 0
	j	.L4
.L3:
	.loc 1 48 5 is_stmt 1
	.loc 1 48 10 is_stmt 0
	lhu	a4,8(a0)
	.loc 1 48 8
	sext.w	a3,a4
	li	a5,65536
.LVL6:
	addi	a5,a5,-1
	bne	a3,a5,.L7
.LBB2:
	.loc 1 63 7 is_stmt 1
	.loc 1 63 44 is_stmt 0
	ld	a5,0(a1)
.LVL7:
	.loc 1 64 7 is_stmt 1
	.loc 1 64 25 is_stmt 0
	ld	a4,16(a5)
	.loc 1 64 11
	sd	a4,0(a1)
	.loc 1 65 7 is_stmt 1
	.loc 1 65 25 is_stmt 0
	ld	a5,24(a5)
.LVL8:
	.loc 1 65 11
	sd	a5,0(a7)
	.loc 1 67 7 is_stmt 1
	.loc 1 67 11 is_stmt 0
	ld	a0,0(a1)
.LVL9:
	.loc 1 67 10
	bne	a0,zero,.L6
.L1:
.LBE2:
	.loc 1 70 1
	ret
.LVL10:
.L7:
	.loc 1 51 7 is_stmt 1
	.loc 1 51 29 is_stmt 0
	andi	a4,a4,-4
	.loc 1 51 11
	ld	a5,0(a1)
	add	a4,a5,a4
	sd	a4,0(a1)
	.loc 1 55 7 is_stmt 1
	.loc 1 55 13 is_stmt 0
	ld	a5,-8(a4)
	.loc 1 55 11
	sd	a5,0(a7)
	.loc 1 59 7 is_stmt 1
	.loc 1 59 14 is_stmt 0
	ret
	.cfi_endproc
.LFE12:
	.size	caml_next_frame_descriptor, .-caml_next_frame_descriptor
	.align	1
	.globl	caml_alloc_backtrace_buffer
	.type	caml_alloc_backtrace_buffer, @function
caml_alloc_backtrace_buffer:
.LFB13:
	.loc 1 72 38 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 73 3
	.loc 1 74 3
	.loc 1 75 5 is_stmt 0
	li	a0,8192
	call	caml_stat_alloc_noexc
.LVL11:
	.loc 1 74 25
	sd	a0,caml_backtrace_buffer,a5
	.loc 1 76 3 is_stmt 1
	.loc 1 76 6 is_stmt 0
	beq	a0,zero,.L10
	.loc 1 77 10
	li	a0,0
.L9:
	.loc 1 78 1
	ld	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L10:
	.cfi_restore_state
	.loc 1 76 45
	li	a0,-1
	j	.L9
	.cfi_endproc
.LFE13:
	.size	caml_alloc_backtrace_buffer, .-caml_alloc_backtrace_buffer
	.align	1
	.globl	caml_stash_backtrace
	.type	caml_stash_backtrace, @function
caml_stash_backtrace:
.LFB14:
	.loc 1 87 1 is_stmt 1
	.cfi_startproc
.LVL12:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	sd	a1,8(sp)
	sd	a2,0(sp)
	mv	s0,a3
	.loc 1 88 3
	.loc 1 88 11 is_stmt 0
	ld	a5,caml_backtrace_last_exn
	.loc 1 88 6
	beq	a5,a0,.L13
	.loc 1 89 5 is_stmt 1
	.loc 1 89 24 is_stmt 0
	sw	zero,caml_backtrace_pos,a5
	.loc 1 90 5 is_stmt 1
	.loc 1 90 29 is_stmt 0
	sd	a0,caml_backtrace_last_exn,a5
.L13:
	.loc 1 93 3 is_stmt 1
	.loc 1 93 29 is_stmt 0
	ld	a5,caml_backtrace_buffer
	.loc 1 93 6
	beq	a5,zero,.L18
.LVL13:
.L16:
	.loc 1 97 3 is_stmt 1
.LBB3:
	.loc 1 98 5
	.loc 1 98 27 is_stmt 0
	mv	a1,sp
	addi	a0,sp,8
	call	caml_next_frame_descriptor
.LVL14:
	.loc 1 99 5 is_stmt 1
	.loc 1 99 8 is_stmt 0
	beq	a0,zero,.L12
	.loc 1 101 5 is_stmt 1
	.loc 1 101 28 is_stmt 0
	lw	a5,caml_backtrace_pos
	.loc 1 101 8
	li	a4,1023
	bgt	a5,a4,.L12
	.loc 1 102 5 is_stmt 1
	.loc 1 102 45 is_stmt 0
	addiw	a4,a5,1
	sw	a4,caml_backtrace_pos,a3
	.loc 1 102 26
	slli	a5,a5,3
	ld	a4,caml_backtrace_buffer
	add	a5,a4,a5
	.loc 1 102 49
	sd	a0,0(a5)
	.loc 1 106 5 is_stmt 1
	.loc 1 106 12 is_stmt 0
	ld	a5,0(sp)
	.loc 1 106 8
	bleu	a5,s0,.L16
.LVL15:
.L12:
.LBE3:
	.loc 1 111 1
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
.LVL16:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL17:
.L18:
	.cfi_restore_state
	.loc 1 93 40 discriminator 1
	call	caml_alloc_backtrace_buffer
.LVL18:
	.loc 1 93 37 discriminator 1
	li	a5,-1
	bne	a0,a5,.L16
	j	.L12
	.cfi_endproc
.LFE14:
	.size	caml_stash_backtrace, .-caml_stash_backtrace
	.align	1
	.globl	caml_get_current_callstack
	.type	caml_get_current_callstack, @function
caml_get_current_callstack:
.LFB15:
	.loc 1 120 1 is_stmt 1
	.cfi_startproc
.LVL19:
	addi	sp,sp,-224
	.cfi_def_cfa_offset 224
	sd	ra,216(sp)
	sd	s0,208(sp)
	sd	s1,200(sp)
	sd	s2,192(sp)
	sd	s3,184(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	sd	a0,8(sp)
	.loc 1 121 3
	lla	a4,caml_local_roots
	ld	s2,0(a4)
.LVL20:
	.loc 1 121 3
	.loc 1 121 3
	sd	s2,112(sp)
	li	a5,1
	sd	a5,128(sp)
	sd	a5,120(sp)
	addi	a3,sp,8
	sd	a3,136(sp)
.LVL21:
	.loc 1 122 3
	sd	a5,104(sp)
	.loc 1 122 3
	.loc 1 122 3
	addi	a3,sp,112
	sd	a3,40(sp)
	addi	a3,sp,40
	sd	a3,0(a4)
	sd	a5,56(sp)
	sd	a5,48(sp)
	addi	a5,sp,104
	sd	a5,64(sp)
.LVL22:
	.loc 1 126 3
	.loc 1 126 10 is_stmt 0
	srai	s1,a0,1
.LVL23:
	.loc 1 127 3 is_stmt 1
.LBB4:
	.loc 1 131 5
	.loc 1 131 13 is_stmt 0
	ld	a5,caml_last_return_address
	sd	a5,24(sp)
	.loc 1 134 5 is_stmt 1
	.loc 1 134 12 is_stmt 0
	ld	a5,caml_bottom_of_stack
	sd	a5,32(sp)
	.loc 1 135 5 is_stmt 1
	.loc 1 135 12 is_stmt 0
	ld	s3,caml_top_of_stack
.LVL24:
	.loc 1 137 5 is_stmt 1
	.loc 1 137 16 is_stmt 0
	li	s0,0
.LVL25:
.L21:
	.loc 1 138 5 is_stmt 1
.LBB5:
	.loc 1 139 7
	.loc 1 139 29 is_stmt 0
	addi	a1,sp,32
	addi	a0,sp,24
	call	caml_next_frame_descriptor
.LVL26:
	.loc 1 140 7 is_stmt 1
	.loc 1 140 10 is_stmt 0
	beq	a0,zero,.L20
	.loc 1 141 7 is_stmt 1
	.loc 1 141 10 is_stmt 0
	bge	s0,s1,.L20
	.loc 1 142 7 is_stmt 1
	addi	s0,s0,1
.LVL27:
	.loc 1 145 7
	.loc 1 145 14 is_stmt 0
	ld	a5,32(sp)
	.loc 1 145 10
	bleu	a5,s3,.L21
.L20:
.LBE5:
.LBE4:
	.loc 1 152 3 is_stmt 1
	.loc 1 152 11 is_stmt 0
	li	a1,0
	mv	a0,s0
.LVL28:
	call	caml_alloc
.LVL29:
	.loc 1 152 9
	sd	a0,104(sp)
.LBB6:
	.loc 1 156 5 is_stmt 1
	.loc 1 156 13 is_stmt 0
	ld	a5,caml_last_return_address
	sd	a5,24(sp)
	.loc 1 157 5 is_stmt 1
	.loc 1 157 12 is_stmt 0
	ld	a5,caml_bottom_of_stack
	sd	a5,32(sp)
	.loc 1 158 5 is_stmt 1
	.loc 1 160 5
.LVL30:
	.loc 1 160 20 is_stmt 0
	li	s1,0
.LVL31:
	.loc 1 160 5
	j	.L22
.LVL32:
.L23:
.LBB7:
	.loc 1 161 7 is_stmt 1 discriminator 3
	.loc 1 161 29 is_stmt 0 discriminator 3
	addi	a1,sp,32
	addi	a0,sp,24
	call	caml_next_frame_descriptor
.LVL33:
	.loc 1 162 7 is_stmt 1 discriminator 3
	.loc 1 163 7 discriminator 3
	slli	a5,s1,3
	ld	a4,104(sp)
	add	a5,a5,a4
	.loc 1 163 33 is_stmt 0 discriminator 3
	ori	a0,a0,1
.LVL34:
	.loc 1 163 31 discriminator 3
	sd	a0,0(a5)
.LBE7:
	.loc 1 160 49 is_stmt 1 discriminator 3
	.loc 1 160 58 is_stmt 0 discriminator 3
	addi	s1,s1,1
.LVL35:
.L22:
	.loc 1 160 25 is_stmt 1 discriminator 1
	.loc 1 160 5 is_stmt 0 discriminator 1
	bgt	s0,s1,.L23
.LBE6:
	.loc 1 167 3 is_stmt 1
.LBB8:
	.loc 1 167 3
.LVL36:
	.loc 1 167 3
	sd	s2,caml_local_roots,a5
	.loc 1 167 3
.LBE8:
	.loc 1 167 3
	.loc 1 168 1 is_stmt 0
	ld	a0,104(sp)
	ld	ra,216(sp)
	.cfi_restore 1
	ld	s0,208(sp)
	.cfi_restore 8
.LVL37:
	ld	s1,200(sp)
	.cfi_restore 9
.LVL38:
	ld	s2,192(sp)
	.cfi_restore 18
.LVL39:
	ld	s3,184(sp)
	.cfi_restore 19
.LVL40:
	addi	sp,sp,224
	.cfi_def_cfa_offset 0
.LVL41:
	jr	ra
	.cfi_endproc
.LFE15:
	.size	caml_get_current_callstack, .-caml_get_current_callstack
	.align	1
	.globl	caml_debuginfo_extract
	.type	caml_debuginfo_extract, @function
caml_debuginfo_extract:
.LFB16:
	.loc 1 172 1 is_stmt 1
	.cfi_startproc
.LVL42:
	.loc 1 173 3
	.loc 1 174 3
	.loc 1 176 3
	.loc 1 176 9 is_stmt 0
	lhu	a5,8(a0)
	.loc 1 176 6
	andi	a5,a5,1
	beq	a5,zero,.L27
	.loc 1 180 3 is_stmt 1
	.loc 1 182 31 is_stmt 0
	lhu	a5,10(a0)
	.loc 1 182 28
	slli	a5,a5,1
	.loc 1 181 61
	add	a5,a5,a0
	.loc 1 182 66
	addi	a5,a5,19
	.loc 1 180 11
	andi	a5,a5,-8
.LVL43:
	.loc 1 184 3 is_stmt 1
	.loc 1 184 10 is_stmt 0
	ld	a0,0(a5)
.LVL44:
	ret
.LVL45:
.L27:
	.loc 1 177 12
	li	a0,0
.LVL46:
	.loc 1 185 1
	ret
	.cfi_endproc
.LFE16:
	.size	caml_debuginfo_extract, .-caml_debuginfo_extract
	.align	1
	.globl	caml_debuginfo_next
	.type	caml_debuginfo_next, @function
caml_debuginfo_next:
.LFB17:
	.loc 1 188 1 is_stmt 1
	.cfi_startproc
.LVL47:
	.loc 1 189 3
	.loc 1 191 3
	.loc 1 191 6 is_stmt 0
	beq	a0,zero,.L28
	.loc 1 194 3 is_stmt 1
.LVL48:
	.loc 1 195 3
	.loc 1 196 3
	.loc 1 196 10 is_stmt 0
	ld	a0,8(a0)
.LVL49:
.L28:
	.loc 1 197 1
	ret
	.cfi_endproc
.LFE17:
	.size	caml_debuginfo_next, .-caml_debuginfo_next
	.align	1
	.globl	caml_debuginfo_location
	.type	caml_debuginfo_location, @function
caml_debuginfo_location:
.LFB18:
	.loc 1 201 1 is_stmt 1
	.cfi_startproc
.LVL50:
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	mv	s0,a1
	.loc 1 202 3
	.loc 1 207 3
	.loc 1 207 6 is_stmt 0
	beq	a0,zero,.L35
	mv	s1,a0
	.loc 1 214 3 is_stmt 1
	.loc 1 214 9 is_stmt 0
	lw	s3,0(a0)
.LVL51:
	.loc 1 215 3 is_stmt 1
	.loc 1 215 9 is_stmt 0
	lw	s2,4(a0)
.LVL52:
	.loc 1 226 3 is_stmt 1
	.loc 1 226 17 is_stmt 0
	li	a5,1
	sw	a5,0(a1)
	.loc 1 227 3 is_stmt 1
	.loc 1 227 29 is_stmt 0
	andi	a5,s3,3
	.loc 1 227 34
	addi	a5,a5,-1
	seqz	a5,a5
	.loc 1 227 20
	sw	a5,4(a1)
	.loc 1 228 3 is_stmt 1
	.loc 1 228 24 is_stmt 0
	call	caml_debuginfo_next
.LVL53:
	.loc 1 228 49
	snez	a0,a0
	.loc 1 228 22
	sw	a0,28(s0)
	.loc 1 229 3 is_stmt 1
	.loc 1 229 44 is_stmt 0
	li	a0,67108864
	addi	a0,a0,-4
	and	a0,s3,a0
	slli	a0,a0,32
	srli	a0,a0,32
	.loc 1 229 35
	add	s1,s1,a0
.LVL54:
	.loc 1 229 20
	sd	s1,8(s0)
	.loc 1 230 3 is_stmt 1
	.loc 1 230 24 is_stmt 0
	srliw	a5,s2,12
	.loc 1 230 16
	sw	a5,16(s0)
	.loc 1 231 3 is_stmt 1
	.loc 1 231 29 is_stmt 0
	srliw	a5,s2,4
	.loc 1 231 35
	andi	a5,a5,0xff
	.loc 1 231 20
	sw	a5,20(s0)
	.loc 1 232 3 is_stmt 1
	.loc 1 232 35 is_stmt 0
	slliw	a5,s2,6
	andi	a5,a5,960
	.loc 1 232 50
	srliw	s3,s3,26
.LVL55:
	.loc 1 232 41
	or	a5,a5,s3
	.loc 1 232 18
	sw	a5,24(s0)
.LVL56:
.L31:
	.loc 1 233 1
	ld	ra,40(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
.LVL57:
	ld	s1,24(sp)
	.cfi_restore 9
	ld	s2,16(sp)
	.cfi_restore 18
	ld	s3,8(sp)
	.cfi_restore 19
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.LVL58:
.L35:
	.cfi_restore_state
	.loc 1 208 5 is_stmt 1
	.loc 1 208 19 is_stmt 0
	sw	zero,0(a1)
	.loc 1 209 5 is_stmt 1
	.loc 1 209 22 is_stmt 0
	li	a5,1
	sw	a5,4(a1)
	.loc 1 210 5 is_stmt 1
	.loc 1 210 24 is_stmt 0
	sw	zero,28(a1)
	.loc 1 211 5 is_stmt 1
	j	.L31
	.cfi_endproc
.LFE18:
	.size	caml_debuginfo_location, .-caml_debuginfo_location
	.align	1
	.globl	caml_add_debug_info
	.type	caml_add_debug_info, @function
caml_add_debug_info:
.LFB19:
	.loc 1 237 1
	.cfi_startproc
.LVL59:
	.loc 1 238 3
	.loc 1 239 1 is_stmt 0
	li	a0,1
.LVL60:
	ret
	.cfi_endproc
.LFE19:
	.size	caml_add_debug_info, .-caml_add_debug_info
	.align	1
	.globl	caml_remove_debug_info
	.type	caml_remove_debug_info, @function
caml_remove_debug_info:
.LFB20:
	.loc 1 242 1 is_stmt 1
	.cfi_startproc
.LVL61:
	.loc 1 243 3
	.loc 1 244 1 is_stmt 0
	li	a0,1
.LVL62:
	ret
	.cfi_endproc
.LFE20:
	.size	caml_remove_debug_info, .-caml_remove_debug_info
	.align	1
	.globl	caml_debug_info_available
	.type	caml_debug_info_available, @function
caml_debug_info_available:
.LFB21:
	.loc 1 247 1 is_stmt 1
	.cfi_startproc
	.loc 1 248 3
	.loc 1 249 1 is_stmt 0
	li	a0,1
	ret
	.cfi_endproc
.LFE21:
	.size	caml_debug_info_available, .-caml_debug_info_available
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
.Letext0:
	.file 2 "/home/sai/ocaml-freestanding-riscv/nolibc/include/stdio.h"
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 4 "caml/config.h"
	.file 5 "caml/misc.h"
	.file 6 "caml/mlvalues.h"
	.file 7 "caml/backtrace.h"
	.file 8 "caml/backtrace_prim.h"
	.file 9 "caml/freelist.h"
	.file 10 "caml/major_gc.h"
	.file 11 "caml/address_class.h"
	.file 12 "caml/minor_gc.h"
	.file 13 "caml/memory.h"
	.file 14 "caml/stack.h"
	.file 15 "caml/alloc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xd26
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF153
	.byte	0xc
	.4byte	.LASF154
	.4byte	.LASF155
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
	.4byte	.LASF39
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
	.byte	0x3
	.4byte	.LASF13
	.byte	0x4
	.byte	0x4e
	.byte	0x1a
	.4byte	0x110
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF14
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF15
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF16
	.byte	0x3
	.4byte	.LASF17
	.byte	0x4
	.byte	0x5b
	.byte	0xe
	.4byte	0x2d
	.byte	0x3
	.4byte	.LASF18
	.byte	0x4
	.byte	0x5c
	.byte	0x17
	.4byte	0x40
	.byte	0x3
	.4byte	.LASF19
	.byte	0x5
	.byte	0x21
	.byte	0x10
	.4byte	0x34
	.byte	0x3
	.4byte	.LASF20
	.byte	0x5
	.byte	0x5c
	.byte	0x10
	.4byte	0x155
	.byte	0x9
	.byte	0x8
	.4byte	0x15b
	.byte	0xc
	.byte	0xb
	.4byte	.LASF21
	.byte	0x5
	.byte	0x5d
	.byte	0x19
	.4byte	0x149
	.byte	0xb
	.4byte	.LASF22
	.byte	0x5
	.byte	0x5d
	.byte	0x36
	.4byte	0x149
	.byte	0xb
	.4byte	.LASF23
	.byte	0x5
	.byte	0x5e
	.byte	0x19
	.4byte	0x149
	.byte	0xb
	.4byte	.LASF24
	.byte	0x5
	.byte	0x5e
	.byte	0x33
	.4byte	0x149
	.byte	0xb
	.4byte	.LASF25
	.byte	0x5
	.byte	0x5f
	.byte	0x19
	.4byte	0x149
	.byte	0xb
	.4byte	.LASF26
	.byte	0x5
	.byte	0x5f
	.byte	0x33
	.4byte	0x149
	.byte	0xd
	.byte	0x8
	.byte	0xe
	.4byte	.LASF27
	.byte	0x5
	.2byte	0x169
	.byte	0x10
	.4byte	0x131
	.byte	0xe
	.4byte	.LASF28
	.byte	0x5
	.2byte	0x171
	.byte	0x10
	.4byte	0x131
	.byte	0x3
	.4byte	.LASF29
	.byte	0x6
	.byte	0x3c
	.byte	0x10
	.4byte	0x125
	.byte	0x3
	.4byte	.LASF30
	.byte	0x6
	.byte	0x3d
	.byte	0x11
	.4byte	0x131
	.byte	0x3
	.4byte	.LASF31
	.byte	0x6
	.byte	0x3e
	.byte	0x11
	.4byte	0x131
	.byte	0xf
	.4byte	0x1cc
	.4byte	0x1ef
	.byte	0x10
	.byte	0
	.byte	0xe
	.4byte	.LASF32
	.byte	0x6
	.2byte	0x15c
	.byte	0x15
	.4byte	0x1e4
	.byte	0xe
	.4byte	.LASF33
	.byte	0x6
	.2byte	0x171
	.byte	0xe
	.4byte	0x1c0
	.byte	0xb
	.4byte	.LASF34
	.byte	0x7
	.byte	0x39
	.byte	0x10
	.4byte	0x47
	.byte	0x3
	.4byte	.LASF35
	.byte	0x7
	.byte	0x41
	.byte	0x10
	.4byte	0x1a4
	.byte	0xb
	.4byte	.LASF36
	.byte	0x7
	.byte	0x52
	.byte	0x1d
	.4byte	0x22d
	.byte	0x9
	.byte	0x8
	.4byte	0x215
	.byte	0xb
	.4byte	.LASF37
	.byte	0x7
	.byte	0x53
	.byte	0x10
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF38
	.byte	0x7
	.byte	0x61
	.byte	0x12
	.4byte	0x1c0
	.byte	0x5
	.4byte	.LASF40
	.byte	0x20
	.byte	0x8
	.byte	0x22
	.byte	0x8
	.4byte	0x2b4
	.byte	0x6
	.4byte	.LASF41
	.byte	0x8
	.byte	0x23
	.byte	0x7
	.4byte	0x47
	.byte	0
	.byte	0x6
	.4byte	.LASF42
	.byte	0x8
	.byte	0x24
	.byte	0x7
	.4byte	0x47
	.byte	0x4
	.byte	0x6
	.4byte	.LASF43
	.byte	0x8
	.byte	0x25
	.byte	0xa
	.4byte	0xc8
	.byte	0x8
	.byte	0x6
	.4byte	.LASF44
	.byte	0x8
	.byte	0x26
	.byte	0x7
	.4byte	0x47
	.byte	0x10
	.byte	0x6
	.4byte	.LASF45
	.byte	0x8
	.byte	0x27
	.byte	0x7
	.4byte	0x47
	.byte	0x14
	.byte	0x6
	.4byte	.LASF46
	.byte	0x8
	.byte	0x28
	.byte	0x7
	.4byte	0x47
	.byte	0x18
	.byte	0x6
	.4byte	.LASF47
	.byte	0x8
	.byte	0x29
	.byte	0x7
	.4byte	0x47
	.byte	0x1c
	.byte	0
	.byte	0x3
	.4byte	.LASF48
	.byte	0x8
	.byte	0x2f
	.byte	0x10
	.4byte	0x1a4
	.byte	0xb
	.4byte	.LASF49
	.byte	0x9
	.byte	0x1a
	.byte	0x10
	.4byte	0x13d
	.byte	0xb
	.4byte	.LASF50
	.byte	0xa
	.byte	0x24
	.byte	0xc
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF51
	.byte	0xa
	.byte	0x25
	.byte	0xc
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF52
	.byte	0xa
	.byte	0x26
	.byte	0x10
	.4byte	0x131
	.byte	0xb
	.4byte	.LASF53
	.byte	0xa
	.byte	0x27
	.byte	0xf
	.4byte	0x2fc
	.byte	0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF54
	.byte	0xb
	.4byte	.LASF55
	.byte	0xa
	.byte	0x28
	.byte	0x10
	.4byte	0x131
	.byte	0xb
	.4byte	.LASF56
	.byte	0xa
	.byte	0x28
	.byte	0x25
	.4byte	0x131
	.byte	0xb
	.4byte	.LASF57
	.byte	0xa
	.byte	0x29
	.byte	0x10
	.4byte	0x131
	.byte	0xb
	.4byte	.LASF58
	.byte	0xa
	.byte	0x3e
	.byte	0x12
	.4byte	0xc8
	.byte	0xb
	.4byte	.LASF59
	.byte	0xa
	.byte	0x3f
	.byte	0x10
	.4byte	0x131
	.byte	0xb
	.4byte	.LASF60
	.byte	0xa
	.byte	0x40
	.byte	0xe
	.4byte	0xc8
	.byte	0xb
	.4byte	.LASF61
	.byte	0xa
	.byte	0x42
	.byte	0xc
	.4byte	0x47
	.byte	0xf
	.4byte	0x2fc
	.4byte	0x367
	.byte	0x11
	.4byte	0x40
	.byte	0x31
	.byte	0
	.byte	0x12
	.4byte	.LASF62
	.byte	0xa
	.byte	0x43
	.byte	0x8
	.4byte	0x357
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0x12
	.4byte	.LASF63
	.byte	0xa
	.byte	0x44
	.byte	0x5
	.4byte	0x47
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0x12
	.4byte	.LASF64
	.byte	0xa
	.byte	0x45
	.byte	0x8
	.4byte	0x2fc
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0xb
	.4byte	.LASF65
	.byte	0xa
	.byte	0x46
	.byte	0xf
	.4byte	0x2fc
	.byte	0xb
	.4byte	.LASF66
	.byte	0xa
	.byte	0x4a
	.byte	0x13
	.4byte	0x155
	.byte	0xb
	.4byte	.LASF67
	.byte	0xb
	.byte	0x31
	.byte	0xf
	.4byte	0x3cd
	.byte	0x9
	.byte	0x8
	.4byte	0x1c0
	.byte	0xb
	.4byte	.LASF68
	.byte	0xb
	.byte	0x31
	.byte	0x22
	.4byte	0x3cd
	.byte	0xb
	.4byte	.LASF69
	.byte	0xb
	.byte	0x32
	.byte	0xf
	.4byte	0xc8
	.byte	0xb
	.4byte	.LASF70
	.byte	0xb
	.byte	0x32
	.byte	0x27
	.4byte	0xc8
	.byte	0xb
	.4byte	.LASF71
	.byte	0xc
	.byte	0x18
	.byte	0x13
	.4byte	0x3cd
	.byte	0xb
	.4byte	.LASF72
	.byte	0xc
	.byte	0x18
	.byte	0x2c
	.4byte	0x3cd
	.byte	0xb
	.4byte	.LASF73
	.byte	0xc
	.byte	0x19
	.byte	0x13
	.4byte	0x3cd
	.byte	0xb
	.4byte	.LASF74
	.byte	0xc
	.byte	0x19
	.byte	0x24
	.4byte	0x3cd
	.byte	0xb
	.4byte	.LASF75
	.byte	0xc
	.byte	0x1a
	.byte	0x13
	.4byte	0x3cd
	.byte	0xb
	.4byte	.LASF76
	.byte	0xc
	.byte	0x1b
	.byte	0x10
	.4byte	0x13d
	.byte	0xb
	.4byte	.LASF77
	.byte	0xc
	.byte	0x1c
	.byte	0xc
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF78
	.byte	0xc
	.byte	0x1d
	.byte	0xf
	.4byte	0x2fc
	.byte	0x5
	.4byte	.LASF79
	.byte	0x38
	.byte	0xc
	.byte	0x29
	.byte	0x8
	.4byte	0x4c0
	.byte	0x6
	.4byte	.LASF80
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x4c0
	.byte	0
	.byte	0x13
	.string	"end"
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x4c0
	.byte	0x8
	.byte	0x6
	.4byte	.LASF81
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x4c0
	.byte	0x10
	.byte	0x13
	.string	"ptr"
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x4c0
	.byte	0x18
	.byte	0x6
	.4byte	.LASF82
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x4c0
	.byte	0x20
	.byte	0x6
	.4byte	.LASF83
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x13d
	.byte	0x28
	.byte	0x6
	.4byte	.LASF84
	.byte	0xc
	.byte	0x29
	.byte	0x17
	.4byte	0x13d
	.byte	0x30
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x3cd
	.byte	0xb
	.4byte	.LASF79
	.byte	0xc
	.byte	0x2a
	.byte	0x22
	.4byte	0x457
	.byte	0x5
	.4byte	.LASF85
	.byte	0x10
	.byte	0xc
	.byte	0x2c
	.byte	0x8
	.4byte	0x4fa
	.byte	0x6
	.4byte	.LASF86
	.byte	0xc
	.byte	0x2d
	.byte	0x9
	.4byte	0x1c0
	.byte	0
	.byte	0x6
	.4byte	.LASF87
	.byte	0xc
	.byte	0x2e
	.byte	0xc
	.4byte	0x1d8
	.byte	0x8
	.byte	0
	.byte	0x5
	.4byte	.LASF88
	.byte	0x38
	.byte	0xc
	.byte	0x31
	.byte	0x8
	.4byte	0x563
	.byte	0x6
	.4byte	.LASF80
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x563
	.byte	0
	.byte	0x13
	.string	"end"
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x563
	.byte	0x8
	.byte	0x6
	.4byte	.LASF81
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x563
	.byte	0x10
	.byte	0x13
	.string	"ptr"
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x563
	.byte	0x18
	.byte	0x6
	.4byte	.LASF82
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x563
	.byte	0x20
	.byte	0x6
	.4byte	.LASF83
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x13d
	.byte	0x28
	.byte	0x6
	.4byte	.LASF84
	.byte	0xc
	.byte	0x31
	.byte	0x1c
	.4byte	0x13d
	.byte	0x30
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x4d2
	.byte	0xb
	.4byte	.LASF88
	.byte	0xc
	.byte	0x32
	.byte	0x27
	.4byte	0x4fa
	.byte	0x5
	.4byte	.LASF89
	.byte	0x18
	.byte	0xc
	.byte	0x34
	.byte	0x8
	.4byte	0x5aa
	.byte	0x6
	.4byte	.LASF90
	.byte	0xc
	.byte	0x35
	.byte	0x9
	.4byte	0x1c0
	.byte	0
	.byte	0x13
	.string	"mem"
	.byte	0xc
	.byte	0x36
	.byte	0xc
	.4byte	0x1d8
	.byte	0x8
	.byte	0x13
	.string	"max"
	.byte	0xc
	.byte	0x37
	.byte	0xc
	.4byte	0x1d8
	.byte	0x10
	.byte	0
	.byte	0x5
	.4byte	.LASF91
	.byte	0x38
	.byte	0xc
	.byte	0x3a
	.byte	0x8
	.4byte	0x613
	.byte	0x6
	.4byte	.LASF80
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x613
	.byte	0
	.byte	0x13
	.string	"end"
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x613
	.byte	0x8
	.byte	0x6
	.4byte	.LASF81
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x613
	.byte	0x10
	.byte	0x13
	.string	"ptr"
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x613
	.byte	0x18
	.byte	0x6
	.4byte	.LASF82
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x613
	.byte	0x20
	.byte	0x6
	.4byte	.LASF83
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x13d
	.byte	0x28
	.byte	0x6
	.4byte	.LASF84
	.byte	0xc
	.byte	0x3a
	.byte	0x1a
	.4byte	0x13d
	.byte	0x30
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x575
	.byte	0xb
	.4byte	.LASF91
	.byte	0xc
	.byte	0x3b
	.byte	0x25
	.4byte	0x5aa
	.byte	0xb
	.4byte	.LASF92
	.byte	0xd
	.byte	0x3f
	.byte	0x10
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF93
	.byte	0xd
	.byte	0xb7
	.byte	0x10
	.4byte	0x131
	.byte	0x5
	.4byte	.LASF94
	.byte	0x40
	.byte	0xd
	.byte	0xf3
	.byte	0x8
	.4byte	0x67f
	.byte	0x6
	.4byte	.LASF95
	.byte	0xd
	.byte	0xf4
	.byte	0x1d
	.4byte	0x67f
	.byte	0
	.byte	0x6
	.4byte	.LASF96
	.byte	0xd
	.byte	0xf5
	.byte	0xa
	.4byte	0x125
	.byte	0x8
	.byte	0x6
	.4byte	.LASF97
	.byte	0xd
	.byte	0xf6
	.byte	0xa
	.4byte	0x125
	.byte	0x10
	.byte	0x6
	.4byte	.LASF98
	.byte	0xd
	.byte	0xf7
	.byte	0xa
	.4byte	0x685
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x63d
	.byte	0xf
	.4byte	0x3cd
	.4byte	0x695
	.byte	0x11
	.4byte	0x40
	.byte	0x4
	.byte	0
	.byte	0xb
	.4byte	.LASF99
	.byte	0xd
	.byte	0xfa
	.byte	0x26
	.4byte	0x67f
	.byte	0x5
	.4byte	.LASF100
	.byte	0x18
	.byte	0xe
	.byte	0x50
	.byte	0x8
	.4byte	0x6d6
	.byte	0x6
	.4byte	.LASF101
	.byte	0xe
	.byte	0x51
	.byte	0xa
	.4byte	0xc8
	.byte	0
	.byte	0x6
	.4byte	.LASF102
	.byte	0xe
	.byte	0x52
	.byte	0xb
	.4byte	0x131
	.byte	0x8
	.byte	0x6
	.4byte	.LASF103
	.byte	0xe
	.byte	0x53
	.byte	0xb
	.4byte	0x3cd
	.byte	0x10
	.byte	0
	.byte	0x14
	.byte	0x10
	.byte	0xe
	.byte	0x5b
	.byte	0x9
	.4byte	0x714
	.byte	0x6
	.4byte	.LASF104
	.byte	0xe
	.byte	0x5c
	.byte	0xb
	.4byte	0x131
	.byte	0
	.byte	0x6
	.4byte	.LASF105
	.byte	0xe
	.byte	0x5d
	.byte	0x12
	.4byte	0x11e
	.byte	0x8
	.byte	0x6
	.4byte	.LASF106
	.byte	0xe
	.byte	0x5e
	.byte	0x12
	.4byte	0x11e
	.byte	0xa
	.byte	0x6
	.4byte	.LASF107
	.byte	0xe
	.byte	0x5f
	.byte	0x12
	.4byte	0x714
	.byte	0xc
	.byte	0
	.byte	0xf
	.4byte	0x11e
	.4byte	0x724
	.byte	0x11
	.4byte	0x40
	.byte	0
	.byte	0
	.byte	0x3
	.4byte	.LASF108
	.byte	0xe
	.byte	0x60
	.byte	0x3
	.4byte	0x6d6
	.byte	0xb
	.4byte	.LASF109
	.byte	0xe
	.byte	0x64
	.byte	0x17
	.4byte	0x73c
	.byte	0x9
	.byte	0x8
	.4byte	0x742
	.byte	0x9
	.byte	0x8
	.4byte	0x724
	.byte	0xb
	.4byte	.LASF110
	.byte	0xe
	.byte	0x65
	.byte	0xc
	.4byte	0x47
	.byte	0x15
	.4byte	0x131
	.byte	0xb
	.4byte	.LASF111
	.byte	0xe
	.byte	0x70
	.byte	0x12
	.4byte	0x765
	.byte	0x9
	.byte	0x8
	.4byte	0x754
	.byte	0xb
	.4byte	.LASF112
	.byte	0xe
	.byte	0x73
	.byte	0xf
	.4byte	0xc8
	.byte	0xb
	.4byte	.LASF113
	.byte	0xe
	.byte	0x74
	.byte	0xf
	.4byte	0xc8
	.byte	0xb
	.4byte	.LASF114
	.byte	0xe
	.byte	0x75
	.byte	0x10
	.4byte	0x131
	.byte	0xb
	.4byte	.LASF115
	.byte	0xe
	.byte	0x76
	.byte	0x10
	.4byte	0x3cd
	.byte	0xb
	.4byte	.LASF116
	.byte	0xe
	.byte	0x77
	.byte	0xf
	.4byte	0xc8
	.byte	0xf
	.4byte	0x3cd
	.4byte	0x7b2
	.byte	0x10
	.byte	0
	.byte	0xb
	.4byte	.LASF117
	.byte	0xe
	.byte	0x78
	.byte	0x10
	.4byte	0x7a7
	.byte	0xf
	.4byte	0xb6
	.4byte	0x7c9
	.byte	0x10
	.byte	0
	.byte	0xb
	.4byte	.LASF118
	.byte	0xe
	.byte	0x79
	.byte	0xd
	.4byte	0x7be
	.byte	0xb
	.4byte	.LASF119
	.byte	0xe
	.byte	0x7a
	.byte	0xf
	.4byte	0x125
	.byte	0xf
	.4byte	0x7ec
	.4byte	0x7ec
	.byte	0x10
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF120
	.byte	0xe
	.byte	0x7b
	.byte	0x11
	.4byte	0x7e1
	.byte	0x16
	.4byte	.LASF156
	.byte	0x1
	.byte	0xf6
	.byte	0x5
	.4byte	0x47
	.8byte	.LFB21
	.8byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.byte	0x17
	.4byte	.LASF121
	.byte	0x1
	.byte	0xf1
	.byte	0x10
	.4byte	0x1c0
	.8byte	.LFB20
	.8byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x84f
	.byte	0x18
	.4byte	.LASF123
	.byte	0x1
	.byte	0xf1
	.byte	0x36
	.4byte	0x215
	.4byte	.LLST28
	.byte	0
	.byte	0x17
	.4byte	.LASF122
	.byte	0x1
	.byte	0xeb
	.byte	0x10
	.4byte	0x1c0
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x89e
	.byte	0x18
	.4byte	.LASF123
	.byte	0x1
	.byte	0xeb
	.byte	0x33
	.4byte	0x215
	.4byte	.LLST27
	.byte	0x19
	.4byte	.LASF83
	.byte	0x1
	.byte	0xeb
	.byte	0x40
	.4byte	0x1c0
	.byte	0x1
	.byte	0x5b
	.byte	0x19
	.4byte	.LASF124
	.byte	0x1
	.byte	0xec
	.byte	0x2a
	.4byte	0x1c0
	.byte	0x1
	.byte	0x5c
	.byte	0
	.byte	0x1a
	.4byte	.LASF145
	.byte	0x1
	.byte	0xc8
	.byte	0x6
	.8byte	.LFB18
	.8byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x910
	.byte	0x1b
	.string	"dbg"
	.byte	0x1
	.byte	0xc8
	.byte	0x28
	.4byte	0x2b4
	.4byte	.LLST23
	.byte	0x1b
	.string	"li"
	.byte	0x1
	.byte	0xc8
	.byte	0x4c
	.4byte	0x910
	.4byte	.LLST24
	.byte	0x1c
	.4byte	.LASF125
	.byte	0x1
	.byte	0xca
	.byte	0xc
	.4byte	0x104
	.4byte	.LLST25
	.byte	0x1c
	.4byte	.LASF126
	.byte	0x1
	.byte	0xca
	.byte	0x13
	.4byte	0x104
	.4byte	.LLST26
	.byte	0x1d
	.8byte	.LVL53
	.4byte	0x916
	.byte	0x1e
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x24b
	.byte	0x17
	.4byte	.LASF127
	.byte	0x1
	.byte	0xbb
	.byte	0xb
	.4byte	0x2b4
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0x959
	.byte	0x1b
	.string	"dbg"
	.byte	0x1
	.byte	0xbb
	.byte	0x29
	.4byte	0x2b4
	.4byte	.LLST21
	.byte	0x1c
	.4byte	.LASF128
	.byte	0x1
	.byte	0xbd
	.byte	0xe
	.4byte	0x959
	.4byte	.LLST22
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x104
	.byte	0x17
	.4byte	.LASF129
	.byte	0x1
	.byte	0xab
	.byte	0xb
	.4byte	0x2b4
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x9b0
	.byte	0x18
	.4byte	.LASF130
	.byte	0x1
	.byte	0xab
	.byte	0x31
	.4byte	0x215
	.4byte	.LLST18
	.byte	0x1c
	.4byte	.LASF128
	.byte	0x1
	.byte	0xad
	.byte	0xb
	.4byte	0x131
	.4byte	.LLST19
	.byte	0x1f
	.string	"d"
	.byte	0x1
	.byte	0xae
	.byte	0x11
	.4byte	0x742
	.4byte	.LLST20
	.byte	0
	.byte	0x17
	.4byte	.LASF131
	.byte	0x1
	.byte	0x77
	.byte	0x10
	.4byte	0x1c0
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0xba0
	.byte	0x18
	.4byte	.LASF132
	.byte	0x1
	.byte	0x77
	.byte	0x31
	.4byte	0x1c0
	.4byte	.LLST9
	.byte	0x1c
	.4byte	.LASF133
	.byte	0x1
	.byte	0x79
	.byte	0x3
	.4byte	0x67f
	.4byte	.LLST10
	.byte	0x20
	.4byte	.LASF134
	.byte	0x1
	.byte	0x79
	.byte	0x3
	.4byte	0x63d
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x7f
	.byte	0x21
	.4byte	.LASF135
	.byte	0x1
	.byte	0x79
	.byte	0x3
	.4byte	0x47
	.byte	0
	.byte	0x20
	.4byte	.LASF136
	.byte	0x1
	.byte	0x7a
	.byte	0x3
	.4byte	0x1c0
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0x20
	.4byte	.LASF137
	.byte	0x1
	.byte	0x7a
	.byte	0x3
	.4byte	0x63d
	.byte	0x3
	.byte	0x91
	.byte	0xc8,0x7e
	.byte	0x21
	.4byte	.LASF138
	.byte	0x1
	.byte	0x7a
	.byte	0x3
	.4byte	0x47
	.byte	0
	.byte	0x1c
	.4byte	.LASF139
	.byte	0x1
	.byte	0x7e
	.byte	0xa
	.4byte	0x125
	.4byte	.LLST11
	.byte	0x1c
	.4byte	.LASF140
	.byte	0x1
	.byte	0x7f
	.byte	0xa
	.4byte	0x125
	.4byte	.LLST12
	.byte	0x22
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0xade
	.byte	0x23
	.string	"pc"
	.byte	0x1
	.byte	0x83
	.byte	0xd
	.4byte	0x131
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7e
	.byte	0x23
	.string	"sp"
	.byte	0x1
	.byte	0x86
	.byte	0xc
	.4byte	0xc8
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7e
	.byte	0x1c
	.4byte	.LASF141
	.byte	0x1
	.byte	0x87
	.byte	0xc
	.4byte	0xc8
	.4byte	.LLST13
	.byte	0x24
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.byte	0x1c
	.4byte	.LASF142
	.byte	0x1
	.byte	0x8b
	.byte	0x15
	.4byte	0x742
	.4byte	.LLST14
	.byte	0x1d
	.8byte	.LVL26
	.4byte	0xc82
	.byte	0x1e
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7e
	.byte	0x1e
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7e
	.byte	0
	.byte	0
	.byte	0
	.byte	0x22
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.4byte	0xb60
	.byte	0x23
	.string	"pc"
	.byte	0x1
	.byte	0x9c
	.byte	0xd
	.4byte	0x131
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7e
	.byte	0x23
	.string	"sp"
	.byte	0x1
	.byte	0x9d
	.byte	0xc
	.4byte	0xc8
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7e
	.byte	0x1c
	.4byte	.LASF143
	.byte	0x1
	.byte	0x9e
	.byte	0xc
	.4byte	0x125
	.4byte	.LLST15
	.byte	0x24
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.byte	0x1c
	.4byte	.LASF142
	.byte	0x1
	.byte	0xa1
	.byte	0x15
	.4byte	0x742
	.4byte	.LLST16
	.byte	0x1d
	.8byte	.LVL33
	.4byte	0xc82
	.byte	0x1e
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7e
	.byte	0x1e
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7e
	.byte	0
	.byte	0
	.byte	0
	.byte	0x22
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.4byte	0xb86
	.byte	0x1c
	.4byte	.LASF144
	.byte	0x1
	.byte	0xa7
	.byte	0x3
	.4byte	0x1c0
	.4byte	.LLST17
	.byte	0
	.byte	0x1d
	.8byte	.LVL29
	.4byte	0xd11
	.byte	0x1e
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x1e
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0x1a
	.4byte	.LASF146
	.byte	0x1
	.byte	0x56
	.byte	0x6
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0xc4a
	.byte	0x1b
	.string	"exn"
	.byte	0x1
	.byte	0x56
	.byte	0x21
	.4byte	0x1c0
	.4byte	.LLST4
	.byte	0x1b
	.string	"pc"
	.byte	0x1
	.byte	0x56
	.byte	0x2e
	.4byte	0x131
	.4byte	.LLST5
	.byte	0x1b
	.string	"sp"
	.byte	0x1
	.byte	0x56
	.byte	0x39
	.4byte	0xc8
	.4byte	.LLST6
	.byte	0x18
	.4byte	.LASF147
	.byte	0x1
	.byte	0x56
	.byte	0x44
	.4byte	0xc8
	.4byte	.LLST7
	.byte	0x22
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0xc3c
	.byte	0x1c
	.4byte	.LASF142
	.byte	0x1
	.byte	0x62
	.byte	0x13
	.4byte	0x742
	.4byte	.LLST8
	.byte	0x1d
	.8byte	.LVL14
	.4byte	0xc82
	.byte	0x1e
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1e
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x72
	.byte	0
	.byte	0
	.byte	0
	.byte	0x25
	.8byte	.LVL18
	.4byte	0xc4a
	.byte	0
	.byte	0x17
	.4byte	.LASF148
	.byte	0x1
	.byte	0x48
	.byte	0x5
	.4byte	0x47
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0xc82
	.byte	0x1d
	.8byte	.LVL11
	.4byte	0xd1d
	.byte	0x1e
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xa
	.2byte	0x2000
	.byte	0
	.byte	0
	.byte	0x17
	.4byte	.LASF149
	.byte	0x1
	.byte	0x22
	.byte	0xf
	.4byte	0x742
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0xcff
	.byte	0x1b
	.string	"pc"
	.byte	0x1
	.byte	0x22
	.byte	0x34
	.4byte	0xcff
	.4byte	.LLST0
	.byte	0x26
	.string	"sp"
	.byte	0x1
	.byte	0x22
	.byte	0x40
	.4byte	0xd05
	.byte	0x1
	.byte	0x5b
	.byte	0x1f
	.string	"d"
	.byte	0x1
	.byte	0x24
	.byte	0x11
	.4byte	0x742
	.4byte	.LLST1
	.byte	0x1f
	.string	"h"
	.byte	0x1
	.byte	0x25
	.byte	0xb
	.4byte	0x131
	.4byte	.LLST2
	.byte	0x24
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x1c
	.4byte	.LASF150
	.byte	0x1
	.byte	0x3f
	.byte	0x1d
	.4byte	0xd0b
	.4byte	.LLST3
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x131
	.byte	0x9
	.byte	0x8
	.4byte	0xc8
	.byte	0x9
	.byte	0x8
	.4byte	0x6a1
	.byte	0x27
	.4byte	.LASF151
	.4byte	.LASF151
	.byte	0xf
	.byte	0x1e
	.byte	0x12
	.byte	0x27
	.4byte	.LASF152
	.4byte	.LASF152
	.byte	0xd
	.byte	0x6c
	.byte	0x1c
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
	.byte	0x13
	.byte	0x1
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
	.byte	0x15
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x19
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1a
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
	.byte	0x1b
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
	.byte	0x1c
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
	.byte	0x1d
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1f
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
	.byte	0x20
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
	.byte	0x21
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
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x23
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
	.byte	0x24
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x25
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x26
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x27
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
.LLST28:
	.8byte	.LVL61-.Ltext0
	.8byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL62-.Ltext0
	.8byte	.LFE20-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST27:
	.8byte	.LVL59-.Ltext0
	.8byte	.LVL60-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL60-.Ltext0
	.8byte	.LFE19-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST23:
	.8byte	.LVL50-.Ltext0
	.8byte	.LVL53-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL53-1-.Ltext0
	.8byte	.LVL54-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL54-.Ltext0
	.8byte	.LVL58-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL58-.Ltext0
	.8byte	.LFE18-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST24:
	.8byte	.LVL50-.Ltext0
	.8byte	.LVL53-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL53-1-.Ltext0
	.8byte	.LVL57-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL57-.Ltext0
	.8byte	.LVL58-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL58-.Ltext0
	.8byte	.LFE18-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST25:
	.8byte	.LVL51-.Ltext0
	.8byte	.LVL55-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST26:
	.8byte	.LVL52-.Ltext0
	.8byte	.LVL56-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST21:
	.8byte	.LVL47-.Ltext0
	.8byte	.LVL49-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL49-.Ltext0
	.8byte	.LFE17-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST22:
	.8byte	.LVL48-.Ltext0
	.8byte	.LVL49-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.byte	0x8
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST18:
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL44-.Ltext0
	.8byte	.LVL45-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL45-.Ltext0
	.8byte	.LVL46-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL46-.Ltext0
	.8byte	.LFE16-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST19:
	.8byte	.LVL43-.Ltext0
	.8byte	.LVL45-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST20:
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL44-.Ltext0
	.8byte	.LVL45-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL45-.Ltext0
	.8byte	.LVL46-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL46-.Ltext0
	.8byte	.LFE16-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST10:
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST11:
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL31-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x6
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x31
	.byte	0x26
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST12:
	.8byte	.LVL24-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST13:
	.8byte	.LVL24-.Ltext0
	.8byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST14:
	.8byte	.LVL26-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST15:
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL32-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL32-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST16:
	.8byte	.LVL33-.Ltext0
	.8byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST17:
	.8byte	.LVL36-.Ltext0
	.8byte	.LVL41-.Ltext0
	.2byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.8byte	.LVL41-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL13-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL18-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL18-1-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL18-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL18-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL13-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5d
	.byte	0x9f
	.8byte	.LVL17-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL1-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x61
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL10-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x10
	.byte	0x9f
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
.LASF100:
	.string	"caml_context"
.LASF78:
	.string	"caml_extra_heap_resources_minor"
.LASF8:
	.string	"size_t"
.LASF77:
	.string	"caml_in_minor_collection"
.LASF97:
	.string	"nitems"
.LASF58:
	.string	"caml_heap_start"
.LASF113:
	.string	"caml_bottom_of_stack"
.LASF28:
	.string	"caml_runtime_warnings"
.LASF33:
	.string	"caml_global_data"
.LASF41:
	.string	"loc_valid"
.LASF64:
	.string	"caml_major_work_credit"
.LASF30:
	.string	"header_t"
.LASF6:
	.string	"wend"
.LASF122:
	.string	"caml_add_debug_info"
.LASF127:
	.string	"caml_debuginfo_next"
.LASF116:
	.string	"caml_exception_pointer"
.LASF82:
	.string	"limit"
.LASF133:
	.string	"caml__frame"
.LASF154:
	.string	"backtrace_prim.c"
.LASF95:
	.string	"next"
.LASF119:
	.string	"caml_globals_inited"
.LASF104:
	.string	"retaddr"
.LASF68:
	.string	"caml_young_end"
.LASF20:
	.string	"caml_timing_hook"
.LASF2:
	.string	"long long int"
.LASF57:
	.string	"caml_fl_wsz_at_phase_change"
.LASF145:
	.string	"caml_debuginfo_location"
.LASF117:
	.string	"caml_globals"
.LASF61:
	.string	"caml_major_window"
.LASF47:
	.string	"loc_is_inlined"
.LASF106:
	.string	"num_live"
.LASF0:
	.string	"long int"
.LASF139:
	.string	"max_frames"
.LASF40:
	.string	"caml_loc_info"
.LASF156:
	.string	"caml_debug_info_available"
.LASF131:
	.string	"caml_get_current_callstack"
.LASF12:
	.string	"stdin"
.LASF102:
	.string	"last_retaddr"
.LASF85:
	.string	"caml_ephe_ref_elt"
.LASF54:
	.string	"double"
.LASF52:
	.string	"caml_allocated_words"
.LASF98:
	.string	"tables"
.LASF120:
	.string	"caml_frametable"
.LASF35:
	.string	"backtrace_slot"
.LASF44:
	.string	"loc_lnum"
.LASF108:
	.string	"frame_descr"
.LASF5:
	.string	"wpos"
.LASF45:
	.string	"loc_startchr"
.LASF112:
	.string	"caml_top_of_stack"
.LASF27:
	.string	"caml_verb_gc"
.LASF76:
	.string	"caml_minor_heap_wsz"
.LASF140:
	.string	"trace_size"
.LASF151:
	.string	"caml_alloc"
.LASF59:
	.string	"total_heap_size"
.LASF129:
	.string	"caml_debuginfo_extract"
.LASF62:
	.string	"caml_major_ring"
.LASF147:
	.string	"caml_trapsp"
.LASF138:
	.string	"caml__dummy_trace"
.LASF29:
	.string	"value"
.LASF71:
	.string	"caml_young_alloc_start"
.LASF135:
	.string	"caml__dummy_max_frames_value"
.LASF90:
	.string	"block"
.LASF14:
	.string	"unsigned int"
.LASF49:
	.string	"caml_fl_cur_wsz"
.LASF72:
	.string	"caml_young_alloc_end"
.LASF17:
	.string	"intnat"
.LASF134:
	.string	"caml__roots_max_frames_value"
.LASF1:
	.string	"long unsigned int"
.LASF42:
	.string	"loc_is_raise"
.LASF38:
	.string	"caml_backtrace_last_exn"
.LASF31:
	.string	"mlsize_t"
.LASF39:
	.string	"_FILE"
.LASF83:
	.string	"size"
.LASF16:
	.string	"short unsigned int"
.LASF18:
	.string	"uintnat"
.LASF37:
	.string	"caml_backtrace_pos"
.LASF153:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF89:
	.string	"caml_custom_elt"
.LASF149:
	.string	"caml_next_frame_descriptor"
.LASF130:
	.string	"slot"
.LASF66:
	.string	"caml_major_gc_hook"
.LASF110:
	.string	"caml_frame_descriptors_mask"
.LASF10:
	.string	"stdout"
.LASF150:
	.string	"next_context"
.LASF121:
	.string	"caml_remove_debug_info"
.LASF4:
	.string	"write"
.LASF111:
	.string	"caml_stack_usage_hook"
.LASF63:
	.string	"caml_major_ring_index"
.LASF19:
	.string	"asize_t"
.LASF3:
	.string	"long double"
.LASF56:
	.string	"caml_dependent_allocated"
.LASF92:
	.string	"caml_huge_fallback_count"
.LASF48:
	.string	"debuginfo"
.LASF99:
	.string	"caml_local_roots"
.LASF118:
	.string	"caml_globals_map"
.LASF88:
	.string	"caml_ephe_ref_table"
.LASF24:
	.string	"caml_minor_gc_end_hook"
.LASF67:
	.string	"caml_young_start"
.LASF125:
	.string	"info1"
.LASF126:
	.string	"info2"
.LASF152:
	.string	"caml_stat_alloc_noexc"
.LASF21:
	.string	"caml_major_slice_begin_hook"
.LASF148:
	.string	"caml_alloc_backtrace_buffer"
.LASF141:
	.string	"limitsp"
.LASF80:
	.string	"base"
.LASF81:
	.string	"threshold"
.LASF23:
	.string	"caml_minor_gc_begin_hook"
.LASF142:
	.string	"descr"
.LASF25:
	.string	"caml_finalise_begin_hook"
.LASF43:
	.string	"loc_filename"
.LASF15:
	.string	"short int"
.LASF114:
	.string	"caml_last_return_address"
.LASF34:
	.string	"caml_backtrace_active"
.LASF105:
	.string	"frame_size"
.LASF107:
	.string	"live_ofs"
.LASF9:
	.string	"FILE"
.LASF91:
	.string	"caml_custom_table"
.LASF109:
	.string	"caml_frame_descriptors"
.LASF124:
	.string	"events"
.LASF13:
	.string	"uint32_t"
.LASF96:
	.string	"ntables"
.LASF65:
	.string	"caml_gc_clock"
.LASF143:
	.string	"trace_pos"
.LASF69:
	.string	"caml_code_area_start"
.LASF7:
	.string	"char"
.LASF103:
	.string	"gc_regs"
.LASF137:
	.string	"caml__roots_trace"
.LASF32:
	.string	"caml_atom_table"
.LASF128:
	.string	"infoptr"
.LASF136:
	.string	"trace"
.LASF87:
	.string	"offset"
.LASF144:
	.string	"caml__temp_result"
.LASF60:
	.string	"caml_gc_sweep_hp"
.LASF74:
	.string	"caml_young_limit"
.LASF11:
	.string	"stderr"
.LASF101:
	.string	"bottom_of_stack"
.LASF84:
	.string	"reserve"
.LASF75:
	.string	"caml_young_trigger"
.LASF93:
	.string	"caml_use_huge_pages"
.LASF70:
	.string	"caml_code_area_end"
.LASF146:
	.string	"caml_stash_backtrace"
.LASF155:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF55:
	.string	"caml_dependent_size"
.LASF53:
	.string	"caml_extra_heap_resources"
.LASF115:
	.string	"caml_gc_regs"
.LASF123:
	.string	"start"
.LASF46:
	.string	"loc_endchr"
.LASF73:
	.string	"caml_young_ptr"
.LASF26:
	.string	"caml_finalise_end_hook"
.LASF22:
	.string	"caml_major_slice_end_hook"
.LASF50:
	.string	"caml_gc_phase"
.LASF94:
	.string	"caml__roots_block"
.LASF36:
	.string	"caml_backtrace_buffer"
.LASF79:
	.string	"caml_ref_table"
.LASF86:
	.string	"ephe"
.LASF132:
	.string	"max_frames_value"
.LASF51:
	.string	"caml_gc_subphase"
	.ident	"GCC: (GNU) 9.2.0"
