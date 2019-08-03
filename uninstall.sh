#!/bin/sh -ex

prefix=$1
if [ "$prefix" = "" ]; then
  prefix=`opam config var prefix`
fi

odir=$prefix/lib
rm -f $odir/pkgconfig/ocaml-freestanding-riscv.pc
rm -rf $odir/ocaml-freestanding-riscv
rm -rf $prefix/include/ocaml-freestanding-riscv
