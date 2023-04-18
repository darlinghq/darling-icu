# Based on commit notes:
# https://github.com/darlinghq/darling-icu/commit/8cc3d36eddff8e6eabc50b356fc3aa3908e2815a

ICU_ROOT=$(cd ../.. && pwd)
BUILD_DIR="$ICU_ROOT/tmp/build"

rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR
cp -rp $ICU_ROOT/icuSources/* $BUILD_DIR

cd $BUILD_DIR
chmod +x runConfigureICU && chmod +x configure

APPLE_INTERNAL_DIR="/AppleInternal" \
LANG="en_US.utf8" \
CPPFLAGS="-DU_DISABLE_RENAMING=1"  \
CFLAGS="-DU_SHOW_CPLUSPLUS_API=1 -DU_SHOW_INTERNAL_API=1 -DICU_DATA_DIR=\"\\\"/usr/local/share/icu/\\\"\" -DICU_DATA_DIR_PREFIX_ENV_VAR=\"\\\"APPLE_FRAMEWORKS_ROOT\\\"\" -m64 -g -Os -fno-exceptions -fvisibility=hidden" \
CXXFLAGS="-std=c++11 -DU_SHOW_CPLUSPLUS_API=1 -DU_SHOW_INTERNAL_API=1 -DICU_DATA_DIR=\"\\\"/usr/local/share/icu/\\\"\" -DICU_DATA_DIR_PREFIX_ENV_VAR=\"\\\"APPLE_FRAMEWORKS_ROOT\\\"\" -m64 -g -Os -fno-exceptions -fvisibility=hidden -fvisibility-inlines-hidden" \
DYLD_LIBRARY_PATH="/usr/local/lib" \
./runConfigureICU Linux --disable-renaming --disable-extras --disable-layout --disable-samples --with-data-packaging=archive --prefix=/usr/local --with-library-bits=64

APPLE_INTERNAL_DIR="/AppleInternal" \
LANG="en_US.utf8" \
CFLAGS="-DU_SHOW_CPLUSPLUS_API=1 -DU_SHOW_INTERNAL_API=1 -DICU_DATA_DIR=\"\\\"/usr/local/share/icu/\\\"\" -DICU_DATA_DIR_PREFIX_ENV_VAR=\"\\\"APPLE_FRAMEWORKS_ROOT\\\"\" -m64 -g -Os -fno-exceptions -fvisibility=hidden" \
CXXFLAGS="-std=c++11 -DU_SHOW_CPLUSPLUS_API=1 -DU_SHOW_INTERNAL_API=1 -DICU_DATA_DIR=\"\\\"/usr/local/share/icu/\\\"\" -DICU_DATA_DIR_PREFIX_ENV_VAR=\"\\\"APPLE_FRAMEWORKS_ROOT\\\"\" -m64 -g -Os -fno-exceptions -fvisibility=hidden -fvisibility-inlines-hidden" \
DYLD_LIBRARY_PATH="/usr/local/lib" \
make
