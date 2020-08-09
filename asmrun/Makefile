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

ASPPFLAGS = -DSYS_$(SYSTEM) -I.
ifeq "$(UNIX_OR_WIN32)" "unix"
ASPPFLAGS += -DMODEL_$(MODEL)
endif

CSRCS=startup_aux.c startup.c main.c fail.c		\
  roots.c signals.c signals_asm.c misc.c freelist.c	\
  major_gc.c minor_gc.c memory.c alloc.c compare.c	\
  ints.c floats.c str.c array.c io.c extern.c		\
  intern.c hash.c sys.c parsing.c gc_ctrl.c		\
  md5.c obj.c lexing.c $(UNIX_OR_WIN32).c	\
  printexc.c callback.c weak.c compact.c finalise.c	\
  custom.c globroots.c backtrace_prim.c backtrace.c		\
  natdynlink.c debugger.c meta.c dynlink.c			\
  clambda_checks.c spacetime.c spacetime_snapshot.c		\
  afl.c bigarray.c
ASMSRCS=$(ARCH).S
SRCS=$(CSRCS) $(ASMSRCS)

COBJS=startup_aux.o startup.o main.o fail.o		\
  roots.o signals.o signals_asm.o misc.o freelist.o	\
  major_gc.o minor_gc.o memory.o alloc.o compare.o	\
  ints.o floats.o str.o array.o io.o extern.o		\
  intern.o hash.o sys.o parsing.o gc_ctrl.o		\
  md5.o obj.o lexing.o $(UNIX_OR_WIN32).o	\
  printexc.o callback.o weak.o compact.o finalise.o	\
  custom.o globroots.o backtrace_prim.o backtrace.o		\
  natdynlink.o debugger.o meta.o dynlink.o			\
  clambda_checks.o spacetime.o spacetime_snapshot.o		\
  afl.o bigarray.o
ASMOBJS=$(ARCH).o
OBJS=$(COBJS)
OBJS+=$(ASMOBJS)

ASMS=startup_aux.s startup.s main.s fail.s		\
  roots.s signals.s signals_asm.s misc.s freelist.s	\
  major_gc.s minor_gc.s memory.s alloc.s compare.s	\
  ints.s floats.s str.s array.s io.s extern.s		\
  intern.s hash.s sys.s parsing.s gc_ctrl.s		\
  md5.s obj.s lexing.s $(UNIX_OR_WIN32).s	\
  printexc.s callback.s weak.s compact.s finalise.s	\
  custom.s globroots.s backtrace_prim.s backtrace.s		\
  natdynlink.s debugger.s meta.s dynlink.s			\
  clambda_checks.s spacetime.s spacetime_snapshot.s		\
  afl.s bigarray.s \
  $(ARCH).s

CAPS=startup_aux.cap startup.cap main.cap fail.cap		\
  roots.cap signals.cap signals_asm.cap misc.cap freelist.cap	\
  major_gc.cap minor_gc.cap memory.cap alloc.cap compare.cap	\
  ints.cap floats.cap str.cap array.cap io.cap extern.cap		\
  intern.cap hash.cap sys.cap parsing.cap gc_ctrl.cap		\
  md5.cap obj.cap lexing.cap $(UNIX_OR_WIN32).cap	\
  printexc.cap callback.cap weak.cap compact.cap finalise.cap	\
  custom.cap globroots.cap backtrace_prim.cap backtrace.cap		\
  natdynlink.cap debugger.cap meta.cap dynlink.cap			\
  clambda_checks.cap spacetime.cap spacetime_snapshot.cap		\
  afl.cap bigarray.cap \
  $(ARCH).cap

$(COBJS):%.o: %.s
	$(CC) -g $(CFLAGS) $(CPPFLAGS) -o $@ -c $<

$(ASMOBJS):%.o: %.s
	$(CC) -g $(ASPPFLAGS) -o $@ -c $<

DFF=-O2 -fno-strict-aliasing -fwrapv -Wall -USYS_linux -DHAS_UNISTD -I/home/sai/.opam/4.07.0/include -mcmodel=medany -Og -g -isystem /home/sai/ocaml-freestanding-riscv/nolibc/include -mcmodel=medany -I../byterun -DNATIVE_CODE -DTARGET_riscv -DMODEL_riscv64 -DSYS_freestanding

generate-asm: $(CSRCS) $(ASMSRCS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(CSRCS) -S
	$(CC) $(ASPPFLAGS) $(ASMSRCS) -S > riscv.s
# 	$(CC) $(DFF) $(CPPFLAGS) $(CSRCS) -S
# 	$(CC) $(ASPPFLAGS) $(ASMSRCS) -S > riscv.s

generate-initial-cap-tee: generate-asm $(ASMS)
	initial_cap_file_generator c 255 $(ASMS)

add-checkcap: $(ASMS)
	for f in $^; do postProcessing.py ./$$f; done

libasmrun.a: generate-asm add-checkcap $(OBJS) # $(ASMOBJS)
	$(AR) rcs $@ $(OBJS)  # $(ASMOBJS)
