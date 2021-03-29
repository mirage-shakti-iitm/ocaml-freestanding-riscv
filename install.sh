#!/bin/sh -ex

prefix=`pwd`/../install_dir

DESTINC=-I/home/sai/Shakti-TEE-Practical/benchmarks/linked_list/strategy_${STRATEGY}
DESTLIB=${prefix}/freestanding-riscv/lib
mkdir -p ${DESTINC} ${DESTLIB}

# "nolibc"
cp build/nolibc/libnolibc.a ${DESTLIB}

# Openlibm
#cp -r build/openlibm/include/*  ${DESTINC}
#cp build/openlibm/src/*h ${DESTINC}
#cp build/openlibm/libopenlibm.a ${DESTLIB}