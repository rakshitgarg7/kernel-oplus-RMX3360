# Copyright (C), 2008-2030, OPPO Mobile Comm Corp., Ltd
### All rights reserved.
###
### File: - OplusKernelEnvConfig.mk
### Description:
###     you can get the oplus feature variables set in android side in this file
###     this file will add global macro for common oplus added feature
###     BSP team can do customzation by referring the feature variables
### Version: 1.0
### Date: 2020-03-18
### Author: Liang.Sun
###
### ------------------------------- Revision History: ----------------------------
### <author>                        <date>       <version>   <desc>
### ------------------------------------------------------------------------------
##################################################################################

-include oplus_native_features.mk

#bsp team should check and modify neccessary to make sure the following macro is allowed to declare
#can add or delete item for the top level macro
ALLOWED_MCROS := OPLUS_FEATURE_FINGERPRINT \
OPLUS_FEATURE_UFS_DRIVER  \
OPLUS_FEATURE_UFS_SHOW_LATENCY \
OPLUS_FEATURE_UFSPLUS  \
OPLUS_FEATURE_TP_BASIC \
OPLUS_FEATURE_TP_BSPFWUPDATE  \
OPLUS_FEATURE_CHG_BASIC  \
OPLUS_FEATURE_SENSOR_DRIVER \
OPLUS_FEATURE_SENSOR_SMEM  \
OPLUS_BUG_STABILITY \
OPLUS_ARCH_EXTENDS \
VENDOR_EDIT \
OPLUS_FEATURE_POWERINFO_STANDBY \
OPLUS_FEATURE_POWERINFO_STANDBY_DEBUG \
OPLUS_FEATURE_POWERINFO_RPMH \
OPLUS_FEATURE_POWERINFO_FTM \
OPLUS_FEATURE_CAMERA_COMMON \
OPLUS_FEATURE_PXLW_IRIS5


#only declare a macro if nativefeature is define and also added in above ALLOWED_MCROS
$(foreach myfeature,$(ALLOWED_MCROS),\
    $(if $(strip $($(myfeature))),\
         $(warning make $(myfeature) to be a macro here) \
         $(eval KBUILD_CFLAGS += -D$(myfeature)) \
         $(eval KBUILD_CPPFLAGS += -D$(myfeature)) \
         $(eval CFLAGS_KERNEL += -D$(myfeature)) \
         $(eval CFLAGS_MODULE += -D$(myfeature)) \
))


