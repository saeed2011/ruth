# Copyright (C) 2009 The Android Open Source Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/motorola/ruth/BoardConfigVendor.mk

# Hardware
TARGET_BOARD_PLATFORM := omap3
TARGET_ARCH_VARIANT := armv7l
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
BOARD_VENDOR_USE_AKMD := akm8973
BOARD_USES_QCOM_LIBS := true
TARGET_BOOTLOADER_BOARD_NAME := ruth
TARGET_NO_BOOTLOADER := true

# Kernel
TARGET_PREBUILT_KERNEL := device/motorola/ruth/kernel
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null quiet
BOARD_KERNEL_BASE := 0x10000000
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_CUSTOM_USB_CONTROLLER := ../../device/motorola/ruth/UsbController.cpp

# FM Radio
BOARD_HAVE_FM_RADIO := true
TARGET_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
TARGET_GLOBAL_CPPFLAGS += -DHAVE_FM_RADIO
BOARD_USE_BROADCOM_FM_VOLUME_HACK := true

# Browser JS engine
JS_ENGINE := v8

# WiFi
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_5_X
BOARD_WLAN_DEVICE           := bcm4329
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/tiwlan_drv.ko"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/fw_wlan1271.bin nvram_path=/system/etc/wifi/nvram.txt"
WIFI_DRIVER_MODULE_NAME     := "tiwlan"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# # dev:    size   erasesize  name
#mtd0: 00180000 00020000 "pds"
#mtd1: 00060000 00020000 "cid"
#mtd2: 000a0000 00020000 "logo"
#mtd3: 00060000 00020000 "misc"
#mtd4: 00380000 00020000 "boot"
#mtd5: 00480000 00020000 "recovery"
#mtd6: 008e0000 00020000 "cdrom"
#mtd7: 0b260000 00020000 "system"
#mtd8: 080c0000 00020000 "cache"
#mtd9: 0ab20000 00020000 "userdata"
#mtd10: 00200000 00020000 "kpanic"

#BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00380000
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00480000
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0b260000   # limited so we enforce room to grow
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0ab20000
#BOARD_FLASH_BLOCK_SIZE := 131072  #need to confirm still

# System
WITH_DEXPREOPT := false

# Graphics
# Use RGB565 surfaces until userspace drivers are upgraded
BOARD_NO_RGBX_8888 := true
BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
BOARD_EGL_CFG := device/motorola/ruth/egl.cfg
TARGET_SF_NEEDS_REAL_DIMENSIONS := true
TARGET_ELECTRONBEAM_FRAMES := 10

# GPS must be checked
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7k
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 3200
BOARD_VENDOR_QCOM_AMSS_VERSION := 3200
BOARD_USES_GPSSHIM := false

# Audio
BOARD_USES_GENERIC_AUDIO := false
TARGET_PROVIDES_LIBAUDIO := true

# Vibrator
BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/motorola/ruth/vibrator.c

# Recovery
TARGET_RECOVERY_PRE_COMMAND := "setrecovery recovery"
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/motorola/ruth/recovery/recovery_ui.c

TARGET_PREBUILT_RECOVERY_KERNEL := device/motorola/ruth/recovery_kernel
