# *   Copyright (C) 1997-2003, International Business Machines
# *   Corporation and others.  All Rights Reserved.
# A list of txt's to build
# Note: 
#
#   If you are thinking of modifying this file, READ THIS. 
#
# Instead of changing this file [unless you want to check it back in],
# you should consider creating a 'reslocal.mk' file in this same directory.
# Then, you can have your local changes remain even if you upgrade or re-
# configure ICU.
#
# Example 'reslocal.mk' files:
#
#  * To add an additional locale to the list: 
#    _____________________________________________________
#    |  GENRB_SOURCE_LOCAL =   myLocale.txt ...
#
#  * To REPLACE the default list and only build with a few
#     locale:
#    _____________________________________________________
#    |  GENRB_SOURCE = ar.txt ar_AE.txt en.txt de.txt zh.txt
#
#


# This is the list of locales that are built, but not considered installed in ICU.
# These are usually aliased locales or the root locale.
GENRB_ALIAS_SOURCE = \
iw.txt iw_IL.txt\
no.txt no_NO.txt no_NO_NY.txt


# Please try to keep this list in alphabetical order
GENRB_SOURCE = \
af.txt af_ZA.txt\
am.txt am_ET.txt\
ar.txt ar_AE.txt ar_BH.txt ar_DZ.txt ar_EG.txt\
ar_IQ.txt ar_IN.txt ar_JO.txt ar_KW.txt ar_LB.txt ar_LY.txt\
ar_MA.txt ar_OM.txt ar_QA.txt ar_SA.txt ar_SD.txt\
ar_SY.txt ar_TN.txt ar_YE.txt\
be.txt be_BY.txt\
bg.txt bg_BG.txt\
bn.txt bn_IN.txt\
ca.txt ca_ES.txt ca_ES_PREEURO.txt\
cs.txt cs_CZ.txt\
da.txt da_DK.txt\
de.txt de__PHONEBOOK.txt de_AT.txt de_AT_PREEURO.txt de_BE.txt de_CH.txt\
de_DE.txt de_DE_PREEURO.txt de_LU.txt de_LU_PREEURO.txt\
el.txt el_GR.txt el_GR_PREEURO.txt\
en.txt en_AU.txt en_BE.txt en_BE_PREEURO.txt en_BW.txt en_CA.txt en_GB.txt en_GB_EURO.txt\
en_HK.txt en_IE.txt en_IE_PREEURO.txt en_IN.txt en_NZ.txt en_PH.txt en_SG.txt en_MT.txt\
en_US.txt en_US_POSIX.txt en_VI.txt en_ZA.txt en_ZW.txt\
eo.txt\
es.txt es__TRADITIONAL.txt es_AR.txt es_BO.txt es_CL.txt es_CO.txt\
es_CR.txt es_DO.txt es_EC.txt es_ES.txt es_ES_PREEURO.txt\
es_GT.txt es_HN.txt es_MX.txt es_NI.txt es_PA.txt\
es_PE.txt es_PR.txt es_PY.txt es_SV.txt es_US.txt\
es_UY.txt es_VE.txt\
et.txt et_EE.txt\
eu.txt eu_ES.txt eu_ES_PREEURO.txt\
fa.txt fa_IR.txt\
fi.txt fi_FI.txt fi_FI_PREEURO.txt\
fo.txt fo_FO.txt\
fr.txt fr_BE.txt fr_BE_PREEURO.txt fr_CA.txt fr_CH.txt\
fr_FR.txt fr_FR_PREEURO.txt fr_LU.txt fr_LU_PREEURO.txt\
ga.txt ga_IE.txt ga_IE_PREEURO.txt\
gl.txt gl_ES.txt gl_ES_PREEURO.txt\
gv.txt gv_GB.txt\
gu.txt gu_IN.txt\
haw.txt haw_US.txt\
he.txt he_IL.txt\
hi.txt hi_IN.txt hi__DIRECT.txt\
hr.txt hr_HR.txt\
hu.txt hu_HU.txt\
hy.txt hy_AM.txt hy_AM_REVISED.txt\
id.txt id_ID.txt\
is.txt is_IS.txt\
it.txt it_CH.txt it_IT.txt it_IT_PREEURO.txt\
ja.txt ja_JP.txt ja_JP_TRADITIONAL.txt\
kl.txt kl_GL.txt\
ko.txt ko_KR.txt\
kok.txt kok_IN.txt\
kn.txt kn_IN.txt\
kw.txt kw_GB.txt\
lt.txt lt_LT.txt\
lv.txt lv_LV.txt\
mk.txt mk_MK.txt\
mr.txt mr_IN.txt\
mt.txt mt_MT.txt\
nb.txt nb_NO.txt\
nl.txt nl_BE.txt nl_BE_PREEURO.txt nl_NL.txt nl_NL_PREEURO.txt\
nn.txt nn_NO.txt\
om.txt om_ET.txt om_KE.txt\
pl.txt pl_PL.txt\
pt.txt pt_BR.txt pt_PT.txt pt_PT_PREEURO.txt\
ro.txt ro_RO.txt\
ru.txt ru_RU.txt ru_UA.txt\
sh.txt sh_YU.txt\
sk.txt sk_SK.txt\
sl.txt sl_SI.txt\
so.txt so_DJ.txt so_ET.txt so_KE.txt so_SO.txt\
sq.txt sq_AL.txt\
sr.txt sr_YU.txt\
sv.txt sv_FI.txt sv_SE.txt\
sw.txt sw_KE.txt sw_TZ.txt\
ta.txt ta_IN.txt\
te.txt te_IN.txt\
th.txt th_TH.txt th_TH_TRADITIONAL.txt\
ti.txt ti_ET.txt ti_ER.txt\
tr.txt tr_TR.txt\
uk.txt uk_UA.txt\
vi.txt vi_VN.txt\
zh.txt zh__PINYIN.txt zh_CN.txt zh_HK.txt zh_MO.txt zh_SG.txt zh_TW.txt zh_TW_STROKE.txt


