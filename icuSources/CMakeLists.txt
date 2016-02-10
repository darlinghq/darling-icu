project(libicucore)

cmake_minimum_required(VERSION 2.4.0)

enable_language(C ASM)

if(COMMAND cmake_policy)
	cmake_policy(SET CMP0003 NEW)
	cmake_policy(SET CMP0005 NEW)
endif(COMMAND cmake_policy)

find_program(XZ_PROGRAM NAMES xz)
if (NOT XZ_PROGRAM)
	message(FATAL_ERROR "The xz compression utility was not found")
endif (NOT XZ_PROGRAM)

add_definitions(-D__APPLE__ -D__MACH__)
add_definitions(-DTARGET_OS_MAC=1)
add_definitions(-DHAVE_STDINT_H=1)
add_definitions(-D__APPLE__ -D__DYNAMIC__)
add_definitions(-D__ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__=1080)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -nostdinc -D__DARWIN_UNIX03 -fPIC -w -fno-exceptions")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -nostdinc -D__DARWIN_UNIX03 -fPIC -w -nostdinc++ -fno-exceptions")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -nostdlib -Wl,--version-script=${DARLING_TOP_DIRECTORY}/darwin.map")

SET(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/darling")
SET(CMAKE_BUILD_WITH_INSTALL_RPATH TRUE) 
SET(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

include_directories(BEFORE ${CMAKE_CURRENT_SOURCE_DIR}/common)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/i18n)
include_directories(${DARLING_TOP_DIRECTORY}/platform-include)
include_directories(${DARLING_TOP_DIRECTORY}/src/external/libcxx/include)
include_directories(${DARLING_TOP_DIRECTORY}/src/libc/stdtime/FreeBSD)

add_definitions(-DICU_DATA_DIR=\"${CMAKE_INSTALL_PREFIX}/share/darling/icu\")
add_definitions("-DU_COMMON_IMPLEMENTATION")
add_definitions("-DU_I18N_IMPLEMENTATION")
add_definitions("-DU_COMBINED_IMPLEMENTATION")
add_definitions("-DU_PLATFORM_IS_DARWIN_BASED")
add_definitions("-DU_PLATFORM=3500")

set(icucore_SRCS
	common/cmemory.c
	common/cstring.c
	common/cwchar.c
	common/icudataver.c
	common/icuplug.c
	common/locmap.c
	common/propsvec.c
	common/uarrsort.c
	common/ubidi.c
	common/ubidiln.c
	common/ubidi_props.c
	common/ubidiwrt.c
	common/ucat.c
	common/uchar.c
	common/ucln_cmn.c
	common/ucmndata.c
	common/ucnv.c
	common/ucnv_cb.c
	common/ucnv_cnv.c
	common/ucnv_ct.c
	common/ucnvdisp.c
	common/ucnv_err.c
	common/ucnvhz.c
	common/ucnvisci.c
	common/ucnvlat1.c
	common/ucnv_lmb.c
	common/ucnvmbcs.c
	common/ucnvscsu.c
	common/ucnv_set.c
	common/ucnv_u16.c
	common/ucnv_u32.c
	common/ucnv_u7.c
	common/ucnv_u8.c
	common/udatamem.c
	common/udataswp.c
	common/uenum.c
	common/uhash.c
	common/uinvchar.c
	common/ulist.c
	common/uloc_tag.c
	common/umapfile.c
	common/umath.c
	common/ures_cnv.c
	common/uresdata.c
	common/usc_impl.c
	common/uscript.c
	common/ustr_cnv.c
	common/ustrfmt.c
	common/utf_impl.c
	common/utrace.c
	common/utypes.c
	common/wintz.c

	common/aaplbfct.cpp
	common/appendable.cpp
	common/bmpset.cpp
	common/brkeng.cpp
	common/brkiter.cpp
	common/bytestream.cpp
	common/bytestriebuilder.cpp
	common/bytestrie.cpp
	common/bytestrieiterator.cpp
	common/caniter.cpp
	common/chariter.cpp
	common/charstr.cpp
	common/dictbe.cpp
	common/dictionarydata.cpp
	common/dtintrv.cpp
	common/errorcode.cpp
	common/filterednormalizer2.cpp
	# common/icuuc40shim.cpp
	common/listformatter.cpp
	common/localsvc.cpp
	common/locavailable.cpp
	common/locbased.cpp
	common/locdispnames.cpp
	common/locid.cpp
	common/loclikely.cpp
	common/locresdata.cpp
	common/locutil.cpp
	common/lrucache.cpp
	common/messagepattern.cpp
	common/normalizer2.cpp
	common/normalizer2impl.cpp
	common/normlzr.cpp
	common/parsepos.cpp
	common/patternprops.cpp
	common/propname.cpp
	common/punycode.cpp
	common/putil.cpp
	common/rbbi.cpp
	common/rbbidata.cpp
	common/rbbinode.cpp
	common/rbbirb.cpp
	common/rbbiscan.cpp
	common/rbbisetb.cpp
	common/rbbistbl.cpp
	common/rbbitblb.cpp
	common/rbtok.cpp
	common/resbund_cnv.cpp
	common/resbund.cpp
	common/ruleiter.cpp
	common/schriter.cpp
	common/serv.cpp
	common/servlk.cpp
	common/servlkf.cpp
	common/servls.cpp
	common/servnotf.cpp
	common/servrbf.cpp
	common/servslkf.cpp
	common/sharedobject.cpp
	common/simplepatternformatter.cpp
	common/stringpiece.cpp
	common/stringtriebuilder.cpp
	common/ualoc.cpp
	common/ubrk.cpp
	common/ucase.cpp
	common/ucasemap.cpp
	common/ucasemap_titlecase_brkiter.cpp
	common/ucharstriebuilder.cpp
	common/ucharstrie.cpp
	common/ucharstrieiterator.cpp
	common/uchriter.cpp
	common/ucnv2022.cpp
	common/ucnv_bld.cpp
	common/ucnvbocu.cpp
	common/ucnv_ext.cpp
	common/ucnv_io.cpp
	common/ucnvsel.cpp
	common/ucol_swp.cpp
	common/udata.cpp
	common/uhash_us.cpp
	common/uidna.cpp
	common/uinit.cpp
	common/uiter.cpp
	common/uloc.cpp
	common/umutex.cpp
	common/unames.cpp
	common/unifilt.cpp
	common/unifunct.cpp
	common/uniset_closure.cpp
	common/uniset.cpp
	common/uniset_props.cpp
	common/unisetspan.cpp
	common/unistr_case.cpp
	common/unistr_case_locale.cpp
	common/unistr_cnv.cpp
	common/unistr.cpp
	common/unistr_props.cpp
	common/unistr_titlecase_brkiter.cpp
	common/unormcmp.cpp
	common/unorm.cpp
	common/uobject.cpp
	common/uprops.cpp
	common/urbtok.cpp
	common/uresbund.cpp
	common/uscript_props.cpp
	common/uset.cpp
	common/usetiter.cpp
	common/uset_props.cpp
	common/ushape.cpp
	common/usprep.cpp
	common/ustack.cpp
	common/ustrcase.cpp
	common/ustrcase_locale.cpp
	common/ustrenum.cpp
	common/ustring.cpp
	common/ustr_titlecase_brkiter.cpp
	common/ustrtrns.cpp
	common/ustr_wcs.cpp
	common/utext.cpp
	common/util.cpp
	common/util_props.cpp
	common/utrie2_builder.cpp
	common/utrie2.cpp
	common/utrie.cpp
	common/uts46.cpp
	common/uvector.cpp
	common/uvectr32.cpp
	common/uvectr64.cpp

	i18n/decContext.c
	i18n/decNumber.c
	i18n/ucln_in.c
	i18n/ulocdata.c
	i18n/utmscale.c

	i18n/alphaindex.cpp
	i18n/anytrans.cpp
	i18n/astro.cpp
	i18n/basictz.cpp
	i18n/bocsu.cpp
	i18n/brktrans.cpp
	i18n/buddhcal.cpp
	i18n/calendar.cpp
	i18n/casetrn.cpp
	i18n/cecal.cpp
	i18n/chnsecal.cpp
	i18n/choicfmt.cpp
	i18n/coleitr.cpp
	i18n/collationbasedatabuilder.cpp
	i18n/collationbuilder.cpp
	i18n/collationcompare.cpp
	i18n/collation.cpp
	i18n/collationdatabuilder.cpp
	i18n/collationdata.cpp
	i18n/collationdatareader.cpp
	i18n/collationdatawriter.cpp
	i18n/collationfastlatinbuilder.cpp
	i18n/collationfastlatin.cpp
	i18n/collationfcd.cpp
	i18n/collationiterator.cpp
	i18n/collationkeys.cpp
	i18n/collationroot.cpp
	i18n/collationrootelements.cpp
	i18n/collationruleparser.cpp
	i18n/collationsets.cpp
	i18n/collationsettings.cpp
	i18n/collationtailoring.cpp
	i18n/collationweights.cpp
	i18n/coll.cpp
	i18n/compactdecimalformat.cpp
	i18n/coptccal.cpp
	i18n/cpdtrans.cpp
	i18n/csdetect.cpp
	i18n/csmatch.cpp
	i18n/csr2022.cpp
	i18n/csrecog.cpp
	i18n/csrmbcs.cpp
	i18n/csrsbcs.cpp
	i18n/csrucode.cpp
	i18n/csrutf8.cpp
	i18n/curramt.cpp
	i18n/currfmt.cpp
	i18n/currpinf.cpp
	i18n/currunit.cpp
	i18n/dangical.cpp
	i18n/datefmt.cpp
	i18n/dcfmtsym.cpp
	i18n/decfmtst.cpp
	i18n/decimalformatpattern.cpp
	i18n/decimfmt.cpp
	i18n/digitlst.cpp
	i18n/dtfmtsym.cpp
	i18n/dtitvfmt.cpp
	i18n/dtitvinf.cpp
	i18n/dtptngen.cpp
	i18n/dtrule.cpp
	i18n/esctrn.cpp
	i18n/ethpccal.cpp
	i18n/filteredbrk.cpp
	i18n/fmtable_cnv.cpp
	i18n/fmtable.cpp
	i18n/format.cpp
	i18n/fphdlimp.cpp
	i18n/fpositer.cpp
	i18n/funcrepl.cpp
	i18n/gender.cpp
	i18n/gregocal.cpp
	i18n/gregoimp.cpp
	i18n/hebrwcal.cpp
	i18n/icuin40shim.cpp
	i18n/identifier_info.cpp
	i18n/indiancal.cpp
	i18n/inputext.cpp
	i18n/islamcal.cpp
	i18n/japancal.cpp
	i18n/locdspnm.cpp
	i18n/measfmt.cpp
	i18n/measunit.cpp
	i18n/measure.cpp
	i18n/msgfmt.cpp
	i18n/name2uni.cpp
	i18n/nfrs.cpp
	i18n/nfrule.cpp
	i18n/nfsubs.cpp
	i18n/nortrans.cpp
	i18n/nultrans.cpp
	i18n/numfmt.cpp
	i18n/numsys.cpp
	i18n/olsontz.cpp
	i18n/persncal.cpp
	i18n/plurfmt.cpp
	i18n/plurrule.cpp
	i18n/quant.cpp
	i18n/quantityformatter.cpp
	i18n/rbnf.cpp
	i18n/rbt.cpp
	i18n/rbt_data.cpp
	i18n/rbt_pars.cpp
	i18n/rbt_rule.cpp
	i18n/rbt_set.cpp
	i18n/rbtz.cpp
	i18n/regexcmp.cpp
	i18n/regeximp.cpp
	i18n/regexst.cpp
	i18n/regextxt.cpp
	i18n/region.cpp
	i18n/reldatefmt.cpp
	i18n/reldtfmt.cpp
	i18n/rematch.cpp
	i18n/remtrans.cpp
	i18n/repattrn.cpp
	i18n/rulebasedcollator.cpp
	i18n/scriptset.cpp
	i18n/search.cpp
	i18n/selfmt.cpp
	i18n/simpletz.cpp
	i18n/smpdtfmt.cpp
	i18n/smpdtfst.cpp
	i18n/sortkey.cpp
	i18n/strmatch.cpp
	i18n/strrepl.cpp
	i18n/stsearch.cpp
	i18n/taiwncal.cpp
	i18n/timezone.cpp
	i18n/titletrn.cpp
	i18n/tmunit.cpp
	i18n/tmutamt.cpp
	i18n/tmutfmt.cpp
	i18n/tolowtrn.cpp
	i18n/toupptrn.cpp
	i18n/translit.cpp
	i18n/transreg.cpp
	i18n/tridpars.cpp
	i18n/tzfmt.cpp
	i18n/tzgnames.cpp
	i18n/tznames.cpp
	i18n/tznames_impl.cpp
	i18n/tzrule.cpp
	i18n/tztrans.cpp
	i18n/uameasureformat.cpp
	i18n/uatimeunitformat.cpp
	i18n/ucal.cpp
	i18n/ucol.cpp
	i18n/ucoleitr.cpp
	i18n/ucol_res.cpp
	i18n/ucol_sit.cpp
	i18n/ucsdet.cpp
	i18n/ucurr.cpp
	i18n/udat.cpp
	i18n/udateintervalformat.cpp
	i18n/udatintv.cpp
	i18n/udatpg.cpp
	i18n/uitercollationiterator.cpp
	i18n/umsg.cpp
	i18n/unesctrn.cpp
	i18n/uni2name.cpp
	i18n/unum.cpp
	i18n/unumsys.cpp
	i18n/uplrule.cpp
	i18n/upluralrules.cpp
	i18n/uregexc.cpp
	i18n/uregex.cpp
	i18n/uregion.cpp
	i18n/usearch.cpp
	i18n/uspoof_build.cpp
	i18n/uspoof_conf.cpp
	i18n/uspoof.cpp
	i18n/uspoof_impl.cpp
	i18n/uspoof_wsconf.cpp
	i18n/utf16collationiterator.cpp
	i18n/utf8collationiterator.cpp
	i18n/utrans.cpp
	i18n/vtzone.cpp
	i18n/vzone.cpp
	i18n/windtfmt.cpp
	i18n/winnmfmt.cpp
	i18n/wintzimpl.cpp
	i18n/zonemeta.cpp
	i18n/zrule.cpp
	i18n/ztrans.cpp
	
	stubdata/stubdata.c
)

add_library(icucore SHARED ${icucore_SRCS})
target_link_libraries(icucore system cxx)

add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/icudt53l.dat
	COMMAND ${XZ_PROGRAM} -d -k -c ${CMAKE_CURRENT_SOURCE_DIR}/data/in/icudt53l.dat.xz > ${CMAKE_CURRENT_BINARY_DIR}/icudt53l.dat
	COMMENT "Unpacking ICU data")
add_custom_target(icu_data ALL DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/icudt53l.dat)

install(TARGETS icucore DESTINATION ${CMAKE_INSTALL_LIBDIR}/darling)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/icudt53l.dat DESTINATION share/darling/icu)

