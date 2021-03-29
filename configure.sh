#!/bin/sh

TOP=`pwd`
FREESTANDING_CFLAGS="-I/home/sai/Shakti-TEE-Practical/benchmarks/ocaml-boot-riscv -I. -mcmodel=medany -Og -isystem ${TOP}/nolibc/include -ffunction-sections"


if [ -z "$BUILD_PATH" ]
then
    BUILD_PATH="`pwd`/build"
fi


cat <<EOM >Makeconf
FREESTANDING_CFLAGS=${FREESTANDING_CFLAGS}
BUILD_PATH=${BUILD_PATH}
EOM