project(libicucore)
cmake_minimum_required(VERSION 3.13)

# Darling's build of libicucore from Apple's ICU sources (icu/icu4c/source),
# with the configuration of Apple's makefile (the top-level makefile): one
# library of the common, i18n and io parts and the stub data, which loads its
# data from /usr/share/icu.

find_program(XZ_PROGRAM NAMES xz)
if (NOT XZ_PROGRAM)
	message(FATAL_ERROR "The xz compression utility was not found")
endif (NOT XZ_PROGRAM)

set(ICU_SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/../icu/icu4c/source")

add_definitions(
	-DU_SHOW_CPLUSPLUS_API=1
	-DU_SHOW_INTERNAL_API=1
	-DU_DISABLE_RENAMING=1
	-DU_DEFAULT_SHOW_DRAFT=0
	-DU_SHOW_DRAFT_API
	-DU_HAVE_STRTOD_L=1
	-DU_HAVE_XLOCALE_H=1
	-DU_HAVE_STRING_VIEW=1
	-DU_COMBINED_IMPLEMENTATION=1
	-DU_ALL_IMPLEMENTATION=1
	-DU_COMMON_IMPLEMENTATION
	-DU_I18N_IMPLEMENTATION
	-DU_IO_IMPLEMENTATION
	-DU_LOCAL_SERVICE_HOOK=1
	-DU_TIMEZONE=timezone
	-DUCONFIG_NO_MF2=1
	-DSTD_INSPIRED
	-DICU_DATA_DIR=\"/usr/share/icu\"
	-DU_TIMEZONE_FILES_DIR=\"/var/db/timezone/icutz\"
	-DU_TIMEZONE_PACKAGE=\"icutz44l\"
	-D__DARWIN_UNIX03
)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -nostdinc -fno-exceptions -fvisibility=hidden -w")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -nostdinc -nostdinc++ -std=c++17 -fno-exceptions -fvisibility=hidden -fvisibility-inlines-hidden -w")

include_directories(BEFORE
	${ICU_SOURCE}/common
	${ICU_SOURCE}/i18n
	${ICU_SOURCE}/io
)

include(icucore_sources.cmake)

set(DYLIB_INSTALL_NAME "/usr/lib/libicucore.A.dylib")
set(DYLIB_COMPAT_VERSION "1.0.0")
set(DYLIB_CURRENT_VERSION "78.1.0")
add_darling_library(icucore SHARED ${icucore_SRCS})
make_fat(icucore)
set_target_properties(icucore PROPERTIES OUTPUT_NAME "icucore.A")
target_link_libraries(icucore system cxx)
# The symbols Apple's makefile keeps out of the library's exports.
target_link_options(icucore PRIVATE
	"-Wl,-unexported_symbols_list,${ICU_SOURCE}/common/common_weakexterns.unexports"
	"-Wl,-unexported_symbols_list,${ICU_SOURCE}/i18n/i18n_weakexterns.unexports"
)

# set like this to make targets that link to icucore also define it
#
# needed because Apple has modified ICU to not define it by default,
# and in fact, they discourage its use in other OS components
#
# we set it like this because darling-dmg depends on it, and it's easier
# to set it at the source and that way darling-dmg doesn't have to change its
# expectations of available ICU APIs
target_compile_definitions(icucore PUBLIC U_SHOW_CPLUSPLUS_API=1)

# icudt78l is the data this libicucore loads, built from these sources (see
# notes/UPDATE_SOURCE.md).
set(ICU_DATA_FILES icudt78l)
set(ICU_DATA_OUTPUTS)
foreach(icu_data ${ICU_DATA_FILES})
	add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${icu_data}.dat
		COMMAND ${XZ_PROGRAM} -d -k -c ${CMAKE_CURRENT_SOURCE_DIR}/data/${icu_data}.dat.xz > ${CMAKE_CURRENT_BINARY_DIR}/${icu_data}.dat
		DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/data/${icu_data}.dat.xz
		COMMENT "Unpacking ICU data ${icu_data}")
	list(APPEND ICU_DATA_OUTPUTS ${CMAKE_CURRENT_BINARY_DIR}/${icu_data}.dat)
endforeach()
add_custom_target(icu_data ALL DEPENDS ${ICU_DATA_OUTPUTS})

install(TARGETS icucore DESTINATION libexec/darling/usr/lib)
InstallSymlink(libicucore.A.dylib "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/lib/libicucore.dylib")

if (NOT DARLING_NO_EXECUTABLES)
	install(FILES ${ICU_DATA_OUTPUTS} DESTINATION libexec/darling/usr/share/icu)
endif (NOT DARLING_NO_EXECUTABLES)
