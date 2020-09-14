#**************************************************************************
#*                                                                        *
#*                                 OCaml                                  *
#*                                                                        *
#*            Xavier Leroy, projet Cristal, INRIA Rocquencourt            *
#*                                                                        *
#*   Copyright 1999 Institut National de Recherche en Informatique et     *
#*     en Automatique.                                                    *
#*                                                                        *
#*   All rights reserved.  This file is distributed under the terms of    *
#*   the GNU Lesser General Public License version 2.1, with the          *
#*   special exception on linking described in the file LICENSE.          *
#*                                                                        *
#**************************************************************************

# Flags :
# riscv64-unknown-linux-gnu-gcc -c -O2 -fno-strict-aliasing -fwrapv -Wall -Wdeclaration-after-statement -fno-common -fexcess-precision=standard -g -D_FILE_OFFSET_BITS=64 -D_REENTRANT -DCAML_NAME_SPACE   -DNATIVE_CODE -DTARGET_riscv -DMODEL_riscv64 -DSYS_linux
# -DOCAML_STDLIB_DIR='"/home/sai/ocaml/install_trial/lib/ocaml"' -o dynlink_nat_n.o dynlink_nat.c
# -DOCAML_STDLIB_DIR='"/home/sai/ocaml/install_trial/lib/ocaml"' -o dynlink_n.o dynlink.c
# riscv64-unknown-linux-gnu-gcc -c -DSYS_linux -I../runtime -DMODEL_riscv64 -o riscv.o riscv.S

# Newly added files:
# startup_nat.c
# fail_nat.c
# roots_nat.c
# signals_nat.c
# eventlog.c
# backtrace_nat.c
# spacetime_nat.c
# memprof.c
# domain.c


# rm -f libasmrun.a && riscv64-unknown-linux-gnu-ar rc libasmrun.a  startup_aux_n.o startup_nat_n.o main_n.o fail_nat_n.o roots_nat_n.o signals_n.o signals_nat_n.o misc_n.o freelist_n.o major_gc_n.o minor_gc_n.o memory_n.o alloc_n.o compare_n.o ints_n.o floats_n.o str_n.o array_n.o io_n.o extern_n.o intern_n.o hash_n.o sys_n.o parsing_n.o gc_ctrl_n.o eventlog_n.o md5_n.o obj_n.o lexing_n.o unix_n.o printexc_n.o callback_n.o weak_n.o compact_n.o finalise_n.o custom_n.o globroots_n.o backtrace_nat_n.o backtrace_n.o dynlink_nat_n.o debugger_n.o meta_n.o dynlink_n.o clambda_checks_n.o spacetime_nat_n.o spacetime_snapshot_n.o afl_n.o bigarray_n.o memprof_n.o domain_n.o riscv.o && riscv64-unknown-linux-gnu-ranlib libasmrun.a


.phony: generate-asm generate-initial-cap-tee add-checkap


CC=riscv64-unknown-elf-gcc
AR=riscv64-unknown-elf-ar
RANLIB=riscv64-unknown-elf-ranlib
ASPP=riscv64-unknown-elf-gcc -c

ARCH=riscv
SYSTEM=freestanding
MODEL=riscv64

CPPFLAGS += -I. -DNATIVE_CODE -DTARGET_$(ARCH)
CPPFLAGS += -DMODEL_$(MODEL)
CPPFLAGS += -DSYS_$(SYSTEM) $(IFLEXDIR) $(LIBUNWIND_INCLUDE_FLAGS)
# CFLAGS += -g
CFLAGS += $(OCAML_CFLAGS)
CFLAGS += -Wdeclaration-after-statement -fno-common -DCAML_NAME_SPACE

ASPPFLAGS = -DSYS_$(SYSTEM) -I.
ifeq "$(UNIX_OR_WIN32)" "unix"
ASPPFLAGS += -DMODEL_$(MODEL)
endif

CSRCS=startup_aux.c  startup_nat.c main.c fail_nat.c		\
  roots_nat.c signals.c signals_nat.c misc.c freelist.c	\
  major_gc.c minor_gc.c memory.c alloc.c compare.c	\
  ints.c floats.c str.c array.c io.c extern.c		\
  intern.c hash.c sys.c parsing.c gc_ctrl.c		\
  md5.c obj.c lexing.c $(UNIX_OR_WIN32).c	\
  printexc.c callback.c weak.c compact.c finalise.c	\
  custom.c globroots.c backtrace_nat.c backtrace.c		\
  dynlink_nat.c debugger.c meta.c dynlink.c			\
  clambda_checks.c spacetime_nat.c spacetime_snapshot.c		\
  afl.c bigarray.c eventlog.c memprof.c domain.c
ASMSRCS=$(ARCH).S
SRCS=$(CSRCS) $(ASMSRCS)

COBJS=startup_aux.o startup_nat.o main.o fail_nat.o		\
  roots_nat.o signals.o signals_nat.o misc.o freelist.o	\
  major_gc.o minor_gc.o memory.o alloc.o compare.o	\
  ints.o floats.o str.o array.o io.o extern.o		\
  intern.o hash.o sys.o parsing.o gc_ctrl.o		\
  md5.o obj.o lexing.o $(UNIX_OR_WIN32).o	\
  printexc.o callback.o weak.o compact.o finalise.o	\
  custom.o globroots.o backtrace_nat.o backtrace.o		\
  dynlink_nat.o debugger.o meta.o dynlink.o			\
  clambda_checks.o spacetime_nat.o spacetime_snapshot.o		\
  afl.o bigarray.o eventlog.o memprof.o domain.o
ASMOBJS=$(ARCH).o
OBJS=$(COBJS)
OBJS+=$(ASMOBJS)

ASMS=startup_aux.s startup_nat.s main.s fail_nat.s		\
  roots_nat.s signals.s signals_nat.s misc.s freelist.s	\
  major_gc.s minor_gc.s memory.s alloc.s compare.s	\
  ints.s floats.s str.s array.s io.s extern.s		\
  intern.s hash.s sys.s parsing.s gc_ctrl.s		\
  md5.s obj.s lexing.s $(UNIX_OR_WIN32).s	\
  printexc.s callback.s weak.s compact.s finalise.s	\
  custom.s globroots.s backtrace_nat.s backtrace.s		\
  dynlink_nat.s debugger.s meta.s dynlink.s			\
  clambda_checks.s spacetime_nat.s spacetime_snapshot.s		\
  afl.s bigarray.s eventlog.s memprof.s domain.s \
  $(ARCH).s

CAPS=startup_aux.cap startup_nat.cap main.cap fail_nat.cap		\
  roots_nat.cap signals.cap signals_nat.cap misc.cap freelist.cap	\
  major_gc.cap minor_gc.cap memory.cap alloc.cap compare.cap	\
  ints.cap floats.cap str.cap array.cap io.cap extern.cap		\
  intern.cap hash.cap sys.cap parsing.cap gc_ctrl.cap		\
  md5.cap obj.cap lexing.cap $(UNIX_OR_WIN32).cap	\
  printexc.cap callback.cap weak.cap compact.cap finalise.cap	\
  custom.cap globroots.cap backtrace_nat.cap backtrace.cap		\
  dynlink_nat.cap debugger.cap meta.cap dynlink.cap			\
  clambda_checks.cap spacetime_nat.cap spacetime_snapshot.cap		\
  afl.cap bigarray.cap eventlog.cap memprof.cap domain.cap \
  $(ARCH).cap

$(COBJS):%.o: %.s
	$(CC) -g $(CFLAGS) $(CPPFLAGS) -o $@ -c $<

$(ASMOBJS):%.o: %.s
	$(CC) -g $(ASPPFLAGS) -o $@ -c $<

# DFF=-O2 -fno-strict-aliasing -fwrapv -Wall -USYS_linux -DHAS_UNISTD -I/home/sai/.opam/4.07.0/include -mcmodel=medany -Og -g -isystem /home/sai/ocaml-freestanding-riscv/nolibc/include -mcmodel=medany -I../byterun -DNATIVE_CODE -DTARGET_riscv -DMODEL_riscv64 -DSYS_freestanding

generate-asm: $(CSRCS) $(ASMSRCS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(CSRCS) -S
	$(CC) $(ASPPFLAGS) $(ASMSRCS) -S > riscv.s
# 	$(CC) $(DFF) $(CPPFLAGS) $(CSRCS) -S
# 	$(CC) $(ASPPFLAGS) $(ASMSRCS) -S > riscv.s

generate-initial-cap-tee: generate-asm $(ASMS)
	initial_cap_file_generator c 255 $(ASMS)

add-checkcap: $(ASMS)
	for f in $^; do postProcessing.py ./$$f; done

libasmrun.a: generate-initial-cap-tee add-checkcap $(OBJS) # $(ASMOBJS)
	$(AR) rcs $@ $(OBJS)  # $(ASMOBJS)
