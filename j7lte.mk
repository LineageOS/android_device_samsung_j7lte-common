#
# Copyright (C) 2017 The LineageOS Project
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
#

# Inherit from vendor
$(call inherit-product-if-exists, vendor/samsung/j7lte-common/j7lte-common-vendor.mk)

# Inherit from common
$(call inherit-product, device/samsung/msm8916-common/msm8916.mk)

LOCAL_PATH := device/samsung/j7lte-common

# Audio configuration files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
	$(LOCAL_PATH)/configs/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Camera
PRODUCT_PACKAGES += \
	Snap

# Common overlay
DEVICE_PACKAGE_OVERLAYS += \
	$(LOCAL_PATH)/overlay

# Dalvik/ART
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Doze
PRODUCT_PACKAGES += \
	SamsungDoze

# HWUI Caches
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Media (camera) configuration files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml

# NFC
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
	$(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
	$(LOCAL_PATH)/configs/nfc/nfcee_access.xml:system/etc/nfcee_access.xml

PRODUCT_PACKAGES += \
	com.android.nfc_extras \
	nfc_nci.pn54x.msm8916 \
	libnfc_nci_jni \
	libnfc-nci \
	NfcNci \
	Tag

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Remove packages
PRODUCT_PACKAGES += \
	RemovePackages

# Ramdisk
PRODUCT_PACKAGES += \
	init.target.rc

# RIL Shim
PRODUCT_PACKAGES += \
	libril_shim

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# System properties
-include $(LOCAL_PATH)/system_prop.mk

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
