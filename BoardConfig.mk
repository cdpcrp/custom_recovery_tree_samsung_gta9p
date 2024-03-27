#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/gta9p

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := holi
TARGET_NO_BOOTLOADER := true

# Crypto
TW_INCLUDE_CRYPTO := true
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_METADATA_PARTITION := true

# Display
TARGET_SCREEN_DENSITY := 240

# Device Prebuilts
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

# Kernel
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE += \
	console=ttyMSM0,115200n8 \
	earlycon=msm_geni_serial,0x04C8C000 \
	androidboot.hardware=qcom \
	androidboot.console=ttyMSM0 \
	androidboot.memcg=1 \
	lpm_levels.sleep_disabled=1 \
	video=vfb:640x400,bpp=32,memsize=3072000 m\
	sm_rtb.filter=0x237 \
	service_locator.enable=1 \
	androidboot.usbcontroller=4e00000.dwc3 \
	swiotlb=0 loop.max_part=7 \
	cgroup.memory=nokmem,nosocket \
	iptable_raw.raw_before_defrag=1 \
	ip6table_raw.raw_before_defrag=1 \
	firmware_class.path=/vendor/firmware_mnt/image
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_KERNEL_TAGS_OFFSET := 0x01e00000
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CONFIG := gta9p_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/gta9p

# MKBOOTIMG
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk

# Partitions
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product odm vendor_dlkm
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 101584896
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Partitions - type
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := holi
QCOM_BOARD_PLATFORMS += $(TARGET_BOARD_PLATFORM)

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Version / Patch
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_FASTBOOTD := true
TW_HAS_DOWNLOAD_MODE := true
TW_DEVICE_VERSION := TEST