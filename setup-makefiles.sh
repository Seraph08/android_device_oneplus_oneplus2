#!/bin/bash

DEVICE=oneplus2
VENDOR=oneplus

OUTDIR=vendor/$VENDOR/$DEVICE
MAKEFILE=../../../$OUTDIR/$DEVICE-vendor-blobs.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

PRODUCT_COPY_FILES += \\
EOF

LINEEND=" \\"
COUNT=`wc -l proprietary-files.txt | awk {'print $1'}`
DISM=`egrep -c '(^#|^$)' proprietary-files.txt`
COUNT=`expr $COUNT - $DISM`
for FILE in `egrep -v '(^#|^$)' ../$DEVICE/proprietary-files.txt`; do
  COUNT=`expr $COUNT - 1`
  if [[ ! "$FILE" =~ ^-.* ]]; then
    echo "        $OUTDIR/proprietary/$FILE:/system/$FILE$LINEEND" >> $MAKEFILE
  fi
done

(cat << EOF) > ../../../$OUTDIR/$DEVICE-vendor.mk
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

# Pick up overlay for features that depend on non-open-source files
PRODUCT_PACKAGES += \\
    CNEService \\
    dpmserviceapp

PRODUCT_PACKAGES += \\
    qcrilmsgtunnel \\
    shutdownlistener \\
    TimeService

PRODUCT_PACKAGES += \\
    qcnvitems \\
    qcrilhook

PRODUCT_PACKAGES += \\
    libmm-abl
    qcrilhook \\
    qcrilmsgtunnel \\
    libmdmdetect \\
    libril \\
    shutdownlistener

PRODUCT_PACKAGES += \\
    libloc_api_v02 \\
    libloc_ds_api

PRODUCT_PACKAGES += \\
    libtime_genoff \\
    libdiag \\
    libdsutils \\
    libmdmdetect \\
    libwpa_qmi_eap_proxy \\
    libidl \\
    libqcci_legacy \\
    libqmi \\
    libqmi_cci \\
    libqmi_client_qmux \\
    libqmiservices

PRODUCT_PACKAGES += \\
    ims \\
    imssettings

\$(call inherit-product, vendor/$VENDOR/$DEVICE/$DEVICE-vendor-blobs.mk)
EOF

(cat << EOF) > ../../../$OUTDIR/BoardConfigVendor.mk
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh
EOF

(cat << EOF) > ../../../$OUTDIR/Android.mk
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

LOCAL_PATH := \$(call my-dir)

ifeq (\$(TARGET_DEVICE),$DEVICE)

include \$(CLEAR_VARS)
LOCAL_MODULE := CNEService
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES := proprietary/priv-app/CNEService/CNEService.apk
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_CERTIFICATE := platform
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := dpmserviceapp
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES := proprietary/priv-app/dpmserviceapp/dpmserviceapp.apk
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_CERTIFICATE := platform
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := qcrilmsgtunnel
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES := proprietary/priv-app/qcrilmsgtunnel/qcrilmsgtunnel.apk
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_CERTIFICATE := platform
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := shutdownlistener
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES := proprietary/app/shutdownlistener/shutdownlistener.apk
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := platform
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := TimeService
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES := proprietary/app/TimeService/TimeService.apk
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := platform
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := qcnvitems
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES := proprietary/framework/qcnvitems.jar
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := \$(COMMON_JAVA_PACKAGE_SUFFIX)
LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_CERTIFICATE := PRESIGNED
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := qcrilhook
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES := proprietary/framework/qcrilhook.jar
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := \$(COMMON_JAVA_PACKAGE_SUFFIX)
LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_CERTIFICATE := PRESIGNED
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libloc_api_v02
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES_64 := proprietary/lib64/libloc_api_v02.so
LOCAL_SRC_FILES_32 := proprietary/lib/libloc_api_v02.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_64 := \$(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MODULE_PATH_32 := \$(2ND_TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MULTILIB := both
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libloc_ds_api
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES_64 := proprietary/lib64/libloc_ds_api.so
LOCAL_SRC_FILES_32 := proprietary/lib/libloc_ds_api.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_64 := \$(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MODULE_PATH_32 := \$(2ND_TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MULTILIB := both
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libdiag
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES_64 := proprietary/vendor/lib64/libdiag.so
LOCAL_SRC_FILES_32 := proprietary/vendor/lib/libdiag.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_64 := \$(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MODULE_PATH_32 := \$(2ND_TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MULTILIB := both
LOCAL_PROPRIETARY_MODULE := true
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libdsutils
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES_64 := proprietary/vendor/lib64/libdsutils.so
LOCAL_SRC_FILES_32 := proprietary/vendor/lib/libdsutils.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_64 := \$(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MODULE_PATH_32 := \$(2ND_TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MULTILIB := both
LOCAL_PROPRIETARY_MODULE := true
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libmdmdetect
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES_64 := proprietary/vendor/lib64/libmdmdetect.so
LOCAL_SRC_FILES_32 := proprietary/vendor/lib/libmdmdetect.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_64 := \$(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MODULE_PATH_32 := \$(2ND_TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MULTILIB := both
LOCAL_PROPRIETARY_MODULE := true
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libwpa_qmi_eap_proxy
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES := proprietary/lib64/libwpa_qmi_eap_proxy.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MULTILIB := 64
LOCAL_PROPRIETARY_MODULE := true
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libidl
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES_64 := proprietary/vendor/lib64/libidl.so
LOCAL_SRC_FILES_32 := proprietary/vendor/lib/libidl.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_64 := \$(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MODULE_PATH_32 := \$(2ND_TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MULTILIB := both
LOCAL_PROPRIETARY_MODULE := true
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libqcci_legacy
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES_64 := proprietary/vendor/lib64/libqcci_legacy.so
LOCAL_SRC_FILES_32 := proprietary/vendor/lib/libqcci_legacy.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_64 := \$(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MODULE_PATH_32 := \$(2ND_TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MULTILIB := both
LOCAL_PROPRIETARY_MODULE := true
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libqmi
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES_64 := proprietary/vendor/lib64/libqmi.so
LOCAL_SRC_FILES_32 := proprietary/vendor/lib/libqmi.so
LOCAL_ADDITIONAL_DEPENDENCIES := libdiag libqmi_client_qmux libdsutils libmdmdetect
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_64 := \$(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MODULE_PATH_32 := \$(2ND_TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MULTILIB := both
LOCAL_PROPRIETARY_MODULE := true
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libqmi_cci
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES_64 := proprietary/vendor/lib64/libqmi_cci.so
LOCAL_SRC_FILES_32 := proprietary/vendor/lib/libqmi_cci.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_64 := \$(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MODULE_PATH_32 := \$(2ND_TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MULTILIB := both
LOCAL_PROPRIETARY_MODULE := true
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libqmi_client_qmux
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES_64 := proprietary/vendor/lib64/libqmi_client_qmux.so
LOCAL_SRC_FILES_32 := proprietary/vendor/lib/libqmi_client_qmux.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_64 := \$(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MODULE_PATH_32 := \$(2ND_TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MULTILIB := both
LOCAL_PROPRIETARY_MODULE := true
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libqmiservices
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES_64 := proprietary/vendor/lib64/libqmiservices.so
LOCAL_SRC_FILES_32 := proprietary/vendor/lib/libqmiservices.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_64 := \$(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MODULE_PATH_32 := \$(2ND_TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MULTILIB := both
LOCAL_PROPRIETARY_MODULE := true
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libtime_genoff
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES_64 := proprietary/vendor/lib64/libtime_genoff.so
LOCAL_SRC_FILES_32 := proprietary/vendor/lib/libtime_genoff.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_64 := \$(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MODULE_PATH_32 := \$(2ND_TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MULTILIB := both
LOCAL_PROPRIETARY_MODULE := true
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libril
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES_64 := proprietary/lib64/libril.so
LOCAL_SRC_FILES_32 := proprietary/lib/libril.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_64 := \$(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MODULE_PATH_32 := \$(2ND_TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MULTILIB := both
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libmm-disp-apis
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES_64 := proprietary/vendor/lib64/libmm-abl.so
LOCAL_SRC_FILES_32 := proprietary/vendor/lib/libmm-abl.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_64 := \$(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MODULE_PATH_32 := \$(2ND_TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MULTILIB := both
LOCAL_PROPRIETARY_MODULE := true
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := ims
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES := proprietary/vendor/app/ims/ims.apk
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := platform
LOCAL_PROPRIETARY_MODULE := true
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := imssettings
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES := proprietary/vendor/app/imssettings/imssettings.apk
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := platform
LOCAL_PROPRIETARY_MODULE := true
include \$(BUILD_PREBUILT)

\$(shell mkdir -p \$(PRODUCT_OUT)/system/vendor/lib/egl && pushd \$(PRODUCT_OUT)/system/vendor/lib > /dev/null && ln -s egl/libEGL_adreno.so libEGL_adreno.so && popd > /dev/null)
\$(shell mkdir -p \$(PRODUCT_OUT)/system/vendor/lib64/egl && pushd \$(PRODUCT_OUT)/system/vendor/lib64 > /dev/null && ln -s egl/libEGL_adreno.so libEGL_adreno.so && popd > /dev/null)

endif

EOF
