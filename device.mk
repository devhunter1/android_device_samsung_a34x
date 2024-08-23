#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

# Health Hal
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

PRODUCT_PACKAGES += shrink

# TWRP TZData
PRODUCT_PACKAGES_ENG += \
    tzdata_twrp

# EROFS Tools
PRODUCT_HOST_PACKAGES_ENG += \
    liberofs \
    mkfs.erofs \
    make_erofs \
    dump.erofs \
    fsck.erofs

PRODUCT_PACKAGES += \
    advanced_format_package
    
# MTK plpath utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# Flashlight
PRODUCT_PACKAGES += \
    flashlight  # Menambahkan flashlight ke dalam produk build
    
# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
