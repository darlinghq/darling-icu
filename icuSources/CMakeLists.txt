project(libicucore)

cmake_minimum_required(VERSION 3.0)

if(COMMAND cmake_policy)
	cmake_policy(SET CMP0003 NEW)
	cmake_policy(SET CMP0005 NEW)
endif(COMMAND cmake_policy)

find_program(XZ_PROGRAM NAMES xz)
if (NOT XZ_PROGRAM)
	message(FATAL_ERROR "The xz compression utility was not found")
endif (NOT XZ_PROGRAM)

add_definitions(
	-DHAVE_STDINT_H=1
	-DU_SHOW_CPLUSPLUS_API=1
	-DU_SHOW_INTERNAL_API=1
	-DU_TIMEZONE=timezone
	-DICU_DATA_DIR=\"/usr/share/icu/\"
	-DU_TIMEZONE_FILES_DIR=\"\\\"/var/db/timezone/icutz\\\"\"
	-DU_TIMEZONE_PACKAGE=\"\\\"icutz44l\\\"\"

	-DU_COMMON_IMPLEMENTATION
	-DU_I18N_IMPLEMENTATION
	-DU_COMBINED_IMPLEMENTATION
)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -nostdinc -D__DARWIN_UNIX03 -fPIC -w -fno-exceptions")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -nostdinc -D__DARWIN_UNIX03 -fPIC -w -nostdinc++ -fno-exceptions -std=c++11")

include_directories(BEFORE
	${CMAKE_CURRENT_SOURCE_DIR}/common
)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/i18n)

# Hide warnings
add_definitions(
	-Wno-tautological-undefined-compare
	-Wno-deprecated-declarations
)

set(icucore_SRCS
	common/aaplbfct.cpp
	common/appendable.cpp
	common/bmpset.cpp
	common/brkeng.cpp
	common/brkiter.cpp
	common/bytesinkutil.cpp
	common/bytestream.cpp
	common/bytestriebuilder.cpp
	common/bytestrie.cpp
	common/bytestrieiterator.cpp
	common/caniter.cpp
	common/characterproperties.cpp
	common/chariter.cpp
	common/charstr.cpp
	common/cmemory.cpp
	common/cstr.cpp
	common/cstring.cpp
	common/cwchar.cpp
	common/dictbe.cpp
	common/dictionarydata.cpp
	common/dtintrv.cpp
	common/edits.cpp
	common/errorcode.cpp
	common/filteredbrk.cpp
	common/filterednormalizer2.cpp
	common/icudataver.cpp
	common/icuplug.cpp
	# common/icuuc40shim.cpp
	common/loadednormalizer2impl.cpp
	common/localebuilder.cpp
	common/localsvc.cpp
	common/locavailable.cpp
	common/locbased.cpp
	common/locdispnames.cpp
	common/locdspnm.cpp
	common/locid.cpp
	common/loclikely.cpp
	common/locmap.cpp
	common/locresdata.cpp
	common/locutil.cpp
	common/messagepattern.cpp
	common/normalizer2.cpp
	common/normalizer2impl.cpp
	common/normlzr.cpp
	common/parsepos.cpp
	common/patternprops.cpp
	common/pluralmap.cpp
	common/propname.cpp
	common/propsvec.cpp
	common/punycode.cpp
	common/putil.cpp
	common/rbbi57.cpp
	common/rbbi_cache.cpp
	common/rbbi.cpp
	common/rbbidata57.cpp
	common/rbbidata.cpp
	common/rbbinode.cpp
	common/rbbirb57.cpp
	common/rbbirb.cpp
	common/rbbiscan57.cpp
	common/rbbiscan.cpp
	common/rbbisetb57.cpp
	common/rbbisetb.cpp
	common/rbbistbl57.cpp
	common/rbbistbl.cpp
	common/rbbitblb57.cpp
	common/rbbitblb.cpp
	common/rbtok.cpp
	common/resbund_cnv.cpp
	common/resbund.cpp
	common/resource.cpp
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
	common/simpleformatter.cpp
	common/static_unicode_sets.cpp
	common/stringpiece.cpp
	common/stringtriebuilder.cpp
	common/ualoc.cpp
	common/uarrsort.cpp
	common/ubidi.cpp
	common/ubidiln.cpp
	common/ubidi_props.cpp
	common/ubiditransform.cpp
	common/ubidiwrt.cpp
	common/ubrk.cpp
	common/ucase.cpp
	common/ucasemap.cpp
	common/ucasemap_titlecase_brkiter.cpp
	common/ucat.cpp
	common/uchar.cpp
	common/ucharstriebuilder.cpp
	common/ucharstrie.cpp
	common/ucharstrieiterator.cpp
	common/uchriter.cpp
	common/ucln_cmn.cpp
	common/ucmndata.cpp
	common/ucnv2022.cpp
	common/ucnv_bld.cpp
	common/ucnvbocu.cpp
	common/ucnv_cb.cpp
	common/ucnv_cnv.cpp
	common/ucnv.cpp
	common/ucnv_ct.cpp
	common/ucnvdisp.cpp
	common/ucnv_err.cpp
	common/ucnv_ext.cpp
	common/ucnvhz.cpp
	common/ucnv_io.cpp
	common/ucnvisci.cpp
	common/ucnvlat1.cpp
	common/ucnv_lmb.cpp
	common/ucnvmbcs.cpp
	common/ucnvscsu.cpp
	common/ucnvsel.cpp
	common/ucnv_set.cpp
	common/ucnv_u16.cpp
	common/ucnv_u32.cpp
	common/ucnv_u7.cpp
	common/ucnv_u8.cpp
	common/ucol_swp.cpp
	common/ucptrie.cpp
	common/ucurr.cpp
	common/udata.cpp
	common/udatamem.cpp
	common/udataswp.cpp
	common/uenum.cpp
	common/uhash.cpp
	common/uhash_us.cpp
	common/uidna.cpp
	common/uinit.cpp
	common/uinvchar.cpp
	common/uiter.cpp
	common/ulist.cpp
	common/uloc.cpp
	common/uloc_keytype.cpp
	common/uloc_tag.cpp
	common/umapfile.cpp
	common/umath.cpp
	common/umutablecptrie.cpp
	common/umutex.cpp
	common/unames.cpp
	common/unifiedcache.cpp
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
	common/ures_cnv.cpp
	common/uresdata.cpp
	common/usc_impl.cpp
	common/uscript.cpp
	common/uscript_props.cpp
	common/uset.cpp
	common/usetiter.cpp
	common/uset_props.cpp
	common/ushape.cpp
	common/usprep.cpp
	common/ustack.cpp
	common/ustrcase.cpp
	common/ustrcase_locale.cpp
	common/ustr_cnv.cpp
	common/ustrenum.cpp
	common/ustrfmt.cpp
	common/ustring.cpp
	common/ustr_titlecase_brkiter.cpp
	common/ustrtrns.cpp
	common/ustr_wcs.cpp
	common/utext.cpp
	common/utf_impl.cpp
	common/util.cpp
	common/util_props.cpp
	common/utrace.cpp
	common/utrie2_builder.cpp
	common/utrie2.cpp
	common/utrie.cpp
	common/utrie_swap.cpp
	common/uts46.cpp
	common/utypes.cpp
	common/uvector.cpp
	common/uvectr32.cpp
	common/uvectr64.cpp
	common/wintz.cpp

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
	i18n/dayperiodrules.cpp
	i18n/dcfmtsym.cpp
	i18n/decContext.cpp
	i18n/decimfmt.cpp
	i18n/decNumber.cpp
	i18n/double-conversion-bignum.cpp
	i18n/double-conversion-bignum-dtoa.cpp
	i18n/double-conversion-cached-powers.cpp
	i18n/double-conversion.cpp
	i18n/double-conversion-diy-fp.cpp
	i18n/double-conversion-fast-dtoa.cpp
	i18n/double-conversion-strtod.cpp
	i18n/dtfmtsym.cpp
	i18n/dtitvfmt.cpp
	i18n/dtitvinf.cpp
	i18n/dtptngen.cpp
	i18n/dtrule.cpp
	i18n/erarules.cpp
	i18n/esctrn.cpp
	i18n/ethpccal.cpp
	i18n/fmtable_cnv.cpp
	i18n/fmtable.cpp
	i18n/format.cpp
	i18n/formattedval_iterimpl.cpp
	i18n/formattedval_sbimpl.cpp
	i18n/formattedvalue.cpp
	i18n/fphdlimp.cpp
	i18n/fpositer.cpp
	i18n/funcrepl.cpp
	i18n/gender.cpp
	i18n/gregocal.cpp
	i18n/gregoimp.cpp
	i18n/hebrwcal.cpp
	i18n/icuin40shim.cpp
	i18n/indiancal.cpp
	i18n/inputext.cpp
	i18n/islamcal.cpp
	i18n/japancal.cpp
	i18n/listformatter.cpp
	i18n/measfmt.cpp
	i18n/measunit.cpp
	i18n/measure.cpp
	i18n/msgfmt.cpp
	i18n/name2uni.cpp
	i18n/nfrs.cpp
	i18n/nfrule.cpp
	i18n/nfsubs.cpp
	i18n/nortrans.cpp
	i18n/nounit.cpp
	i18n/nultrans.cpp
	i18n/number_affixutils.cpp
	i18n/number_asformat.cpp
	i18n/number_capi.cpp
	i18n/number_compact.cpp
	i18n/number_currencysymbols.cpp
	i18n/number_decimalquantity.cpp
	i18n/number_decimfmtprops.cpp
	i18n/number_fluent.cpp
	i18n/number_formatimpl.cpp
	i18n/number_grouping.cpp
	i18n/number_integerwidth.cpp
	i18n/number_longnames.cpp
	i18n/number_mapper.cpp
	i18n/number_modifiers.cpp
	i18n/number_multiplier.cpp
	i18n/number_notation.cpp
	i18n/number_output.cpp
	i18n/number_padding.cpp
	i18n/number_patternmodifier.cpp
	i18n/number_patternstring.cpp
	i18n/number_rounding.cpp
	i18n/number_scientific.cpp
	i18n/number_skeletons.cpp
	i18n/number_stringbuilder.cpp
	i18n/number_utils.cpp
	i18n/numfmt.cpp
	i18n/numparse_affixes.cpp
	i18n/numparse_compositions.cpp
	i18n/numparse_currency.cpp
	i18n/numparse_decimal.cpp
	i18n/numparse_impl.cpp
	i18n/numparse_parsednumber.cpp
	i18n/numparse_scientific.cpp
	i18n/numparse_stringsegment.cpp
	i18n/numparse_symbols.cpp
	i18n/numparse_validators.cpp
	i18n/numrange_fluent.cpp
	i18n/numrange_impl.cpp
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
	i18n/scientificnumberformatter.cpp
	i18n/scriptset.cpp
	i18n/search.cpp
	i18n/selfmt.cpp
	i18n/sharedbreakiterator.cpp
	i18n/simpletz.cpp
	i18n/smpdtfmt.cpp
	i18n/smpdtfst.cpp
	i18n/sortkey.cpp
	i18n/standardplural.cpp
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
	i18n/ucln_in.cpp
	i18n/ucol.cpp
	i18n/ucoleitr.cpp
	i18n/ucol_res.cpp
	i18n/ucol_sit.cpp
	i18n/ucsdet.cpp
	i18n/udat.cpp
	i18n/udateintervalformat.cpp
	i18n/udatintv.cpp
	i18n/udatpg.cpp
	i18n/ufieldpositer.cpp
	i18n/uitercollationiterator.cpp
	i18n/ulistformatter.cpp
	i18n/ulocdata.cpp
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
	i18n/utf16collationiterator.cpp
	i18n/utf8collationiterator.cpp
	i18n/utmscale.cpp
	i18n/utrans.cpp
	i18n/vtzone.cpp
	i18n/vzone.cpp
	i18n/windtfmt.cpp
	i18n/winnmfmt.cpp
	i18n/wintzimpl.cpp
	i18n/zonemeta.cpp
	i18n/zrule.cpp
	i18n/ztrans.cpp

	stubdata/stubdata.cpp
)

set(DYLIB_INSTALL_NAME "/usr/lib/libicucore.A.dylib")
add_darling_library(icucore SHARED ${icucore_SRCS})
make_fat(icucore)
set_target_properties(icucore PROPERTIES OUTPUT_NAME "icucore.A")
target_link_libraries(icucore system cxx)

# set like this to make targets that link to icucore also define it
#
# needed because Apple has modified ICU to not define it by default,
# and in fact, they discourage its use in other OS components
#
# we set it like this because darling-dmg depends on it, and it's easier
# to set it at the source and that way darling-dmg doesn't have to change its
# expectations of available ICU APIs
target_compile_definitions(icucore PUBLIC U_SHOW_CPLUSPLUS_API=1)

add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/icudt64l.dat
	COMMAND ${XZ_PROGRAM} -d -k -c ${CMAKE_CURRENT_SOURCE_DIR}/data/out/icudt64l.dat.xz > ${CMAKE_CURRENT_BINARY_DIR}/icudt64l.dat
	COMMENT "Unpacking ICU data")
add_custom_target(icu_data ALL DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/icudt64l.dat)

install(TARGETS icucore DESTINATION libexec/darling/usr/lib)

InstallSymlink(libicucore.A.dylib "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/lib/libicucore.dylib")

if (NOT DARLING_NO_EXECUTABLES)
	install(FILES ${CMAKE_CURRENT_BINARY_DIR}/icudt64l.dat DESTINATION libexec/darling/usr/share/icu)
endif (NOT DARLING_NO_EXECUTABLES)

