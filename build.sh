#!/bin/sh -ex

STRATEGY=1
./configure.sh
./choose_compartment_strategy.sh ${STRATEGY}
make
DESTLIB=/home/sai/Shakti-TEE-Practical/benchmarks/linked_list/strategy_${STRATEGY}
cp build/nolibc/libnolibc.a ${DESTLIB}/libnolibc.a
make clean