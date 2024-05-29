#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Platform
TARGET_BOARD_PLATFORM := sdm660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno509
TARGET_USES_64_BIT_BINDER := true

# Board
BOARD_VENDOR := htc
TARGET_BOOTLOADER_BOARD_NAME := $(shell echo $(TARGET_BOARD_PLATFORM) | tr  '[:lower:]' '[:upper:]')

# Default device path
DEVICE_PATH := device/$(BOARD_VENDOR)/$(TARGET_DEVICE)

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# # Assert
# TARGET_OTA_ASSERT_DEVICE := htc_iml, htc_imldugl

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864 # This is the maximum known partition size, but it can be higher, so we just omit it
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.console=ttyMSM0 earlycon=msm_serial_dm,0xc170000 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 sched_enable_hmp=1 sched_enable_power_aware=1 service_locator.enable=1 swiotlb=1 androidboot.configfs=true androidboot.usbcontroller=a800000.dwc3 buildvariant=user
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/htc/htc_iml
TARGET_KERNEL_CONFIG := htc_iml_defconfig

# Encryption
PLATFORM_SECURITY_PATCH := 2019-06-05
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
BOARD_USES_QCOM_FBE_DECRYPTION := true
USE_COMMON_GPTUTILS := true

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
#TW_SCREEN_BLANK_ON_BOOT := true
#TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
