#!/bin/sh

if pkg-config --exists ocaml-boot-riscv
then
    PKG_CONFIG_DEPS="ocaml-boot-riscv"
elif [ -z "$NO_PKGCONFIG" ]
then
    echo "ERROR: No supported ocaml boot code package found" 1>&2
    echo "ERROR: ocaml-boot-riscv must be installed" 
    exit 1
fi

if [ -z "$FREESTANDING_CFLAGS" ]
then
    FREESTANDING_CFLAGS="$(pkg-config --cflags ${PKG_CONFIG_DEPS}) -mcmodel=medany -Og"
fi

if [ -z "$BUILD_ARCH" ]
then
    BUILD_ARCH=$(uname -m)
fi
BUILD_OS=$(uname -s)

if [ -z "$BUILD_PATH" ]
then
    BUILD_PATH="`pwd`/build"
fi

# FreeBSD uses amd64, unify to x86_64 here.
if [ "${BUILD_ARCH}" = "amd64" ]; then
    BUILD_ARCH="x86_64"
fi

if [ ! -f config.in/Makefile.${BUILD_OS}.${BUILD_ARCH} ]; then
    echo "ERROR: Unsupported build OS/architecture combination: ${BUILD_OS}/${BUILD_ARCH}" 1>&2
    exit 1
fi

# cp -r config.in config
# OCAML_GTE_4_06_0=no
# OCAML_GTE_4_07_0=yes

cat <<EOM >Makeconf
FREESTANDING_CFLAGS=${FREESTANDING_CFLAGS}
BUILD_ARCH=${BUILD_ARCH}
BUILD_OS=${BUILD_OS}
NOLIBC_SYSDEP_OBJS=sysdeps_riscv.o
PKG_CONFIG_DEPS=${PKG_CONFIG_DEPS}
PKG_CONFIG_EXTRA_LIBS=${PKG_CONFIG_EXTRA_LIBS}
OCAML_EXTRA_DEPS=${OCAML_EXTRA_DEPS}
OCAML_GTE_4_06_0=${OCAML_GTE_4_06_0}
OCAML_GTE_4_07_0=${OCAML_GTE_4_07_0}
OCAML_SRC_DIR=${OCAML_SRC_DIR}
BUILD_PATH=${BUILD_PATH}
EOM
