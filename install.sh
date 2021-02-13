#!/bin/sh -ex

prefix=${1:-$PREFIX}
if [ "$prefix" = "" ]; then
    prefix=`opam config var prefix`
fi
DESTINC=${prefix}/riscv-sysroot/include/ocaml-freestanding-riscv
DESTLIB=${prefix}/riscv-sysroot/lib/ocaml-freestanding-riscv
mkdir -p ${DESTINC} ${DESTLIB}

# "nolibc"
cp -r build/nolibc/include/* ${DESTINC}
cp build/nolibc/libnolibc.a ${DESTLIB}

# Openlibm
#cp -r build/openlibm/include/*  ${DESTINC}
#cp build/openlibm/src/*h ${DESTINC}
#cp build/openlibm/libopenlibm.a ${DESTLIB}

# Ocaml runtime
OCAML_INCLUDES="alloc.h callback.h config.h custom.h fail.h hash.h intext.h \
  memory.h misc.h mlvalues.h printexc.h signals.h compatibility.h"
mkdir -p ${DESTINC}/caml

# # Assume OCaml >= 4.06.0 here.
# OCAML_INCLUDES="${OCAML_INCLUDES} bigarray.h m.h s.h"
# for f in ${OCAML_INCLUDES}; do
#     cp build/runtime/caml/${f} ${DESTINC}/caml/${f}
# done

cp build/runtime/caml/* ${DESTINC}/caml/

cp build/runtime/libasmrun.a ${DESTLIB}/libasmrun.a

# META: ocamlfind and other build utilities test for existance ${DESTLIB}/META
# when figuring out whether a library is installed
touch ${DESTLIB}/META

# pkg-config
mkdir -p ${prefix}/riscv-sysroot/lib/pkgconfig
cp ocaml-freestanding-riscv.pc ${prefix}/riscv-sysroot/lib/pkgconfig/ocaml-freestanding-riscv.pc
cp cflags ${DESTLIB}
cp libs ${DESTLIB}