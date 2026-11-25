#!/bin/bash
# Builds ICU on the host from icu/icu4c/source, with the configuration of
# Apple's makefile, for its data package: tmp/build/data/out/icudt78l.dat.
# See ../notes/UPDATE_SOURCE.md.
set -e
ICU_ROOT=$(cd "$(dirname "$0")/../.." && pwd)
SRC="$ICU_ROOT/icu/icu4c/source"
BUILD_DIR="$ICU_ROOT/tmp/build"

rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

FLAGS='-DU_SHOW_CPLUSPLUS_API=1 -DU_SHOW_INTERNAL_API=1 -DUCONFIG_NO_MF2=1 -g -Os -fno-exceptions -fvisibility=hidden'
LANG=en_US.utf8 CPPFLAGS="-DU_DISABLE_RENAMING=1" CC=clang CXX=clang++ \
	CFLAGS="$FLAGS" CXXFLAGS="-std=c++17 $FLAGS -fvisibility-inlines-hidden" \
	"$SRC/runConfigureICU" Linux --srcdir="$SRC" --disable-renaming --disable-extras --disable-layout \
	--disable-samples --disable-tests --with-data-packaging=archive --prefix=/usr/local
LANG=en_US.utf8 make -j"$(nproc)"
