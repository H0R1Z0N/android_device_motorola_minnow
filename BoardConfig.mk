# Board properties
TARGET_BOARD_PLATFORM := omap3
TARGET_BOARD_OMAP_CPU := 3630
TARGET_BOOTLOADER_BOARD_NAME := minnow
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a8
TARGET_CPU_VARIANT := cortex-a8
TARGET_ARCH_VARIANT_FPU := neon
TARGET_ARCH_LOWMEM := true

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp

# inherit from omap4
#-include hardware/ti/omap4/BoardConfigCommon.mk

BOARD_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP3 -DOVERLAY_SUPPORT_USERPTR_BUF

# MOTOROLA
#USE_MOTOROLA_CODE := true
#USE_MOTOROLA_USERS := true
#BOARD_GLOBAL_CFLAGS += -DUSE_MOTOROLA_CODE -DUSE_MOTOROLA_USERS -DMOTOROLA_UIDS

# Hijack
#TARGET_NEEDS_MOTOROLA_HIJACK := true

# WLAN
USES_TI_MAC80211 := true
BOARD_WPA_SUPPLICANT_DRIVER := NL80211 #WEXT << note use of NL80211 and not WEXT
WPA_SUPPLICANT_VERSION := VER_0_8_X #VER_0_6_X
BOARD_WLAN_DEVICE := wl18xx_mac80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wl18xx
#BOARD_SOFTAP_DEVICE := wl18xx_mac80211
WIFI_DRIVER_FW_STA_PATH := "/system/etc/firmware/ti-connectivity/wl18xx-fw-4.bin"
WIFI_DRIVER_FW_AP_PATH := "/system/etc/firmware/ti-connectivity/wl18xx-fw-4.bin"
#WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/firmware/ti-connectivity/wl18xx-fw-4.bin"
#WIFI_DRIVER_MODULE_NAME := "wlcore_sdio"
BOARD_WIFI_SKIP_CAPABILITIES := true
BOARD_GLOBAL_CFLAGS += -DUSES_TI_MAC80211

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_TI := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/motorola/minnow/bluetooth

# Graphics
BOARD_EGL_CFG := device/motorola/minnow/egl.cfg
BOARD_GLOBAL_CFLAGS += -DOMAP_COMPAT -DBINDER_COMPAT -DHAS_CONTEXT_PRIORITY -DDONT_USE_FENCE_SYNC
#DEFAULT_FB_NUM := 0
#GL_OES_compressed_ETC1_RGB8_texture := true
#BOARD_USES_OVERLAY := true
USE_OPENGL_RENDERER := true
TARGET_USE_OMX_RECOVERY := true
#TARGET_USES_ION := false
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_USES_OPENGLES_FOR_SCREEN_CAPTURE := true
BOARD_EGL_WORKAROUND_BUG_10194508 ?= true
TARGET_FORCE_SCREENSHOT_CPU_PATH ?= true

TARGET_NO_RADIOIMAGE := true
TARGET_SPECIFIC_HEADER_PATH += device/motorola/minnow/include

TARGET_PROVIDES_INIT_TARGET_RC := true

TARGET_PREBUILT_KERNEL := TARGET_SPECIFIC_HEADER_PATH += $(COMMON_FOLDER)/includekernel

TARGET_KERNEL_SOURCE := kernel/motorola/minnow
TARGET_KERNEL_CONFIG := minnow_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.8/bin
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-

BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x10000000
#BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := rootwait init=/init utags.blkdev=/dev/block/platform/ocp.2/mmcblk0p7 omapfb.vram=0:1200K androidboot.selinux=permissive androidboot.hardware=minnow

# fix this up by examining /proc/mtd on a running device
#BOARD_NAND_PAGE_SIZE := 4096
#BOARD_NAND_SPARE_SIZE := 128
BOARD_PAGE_SIZE := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 268435456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3235905536
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/omap/musb-omap2430/musb-hdrc/gadget/lun%d/file"

TARGET_RECOVERY_DEVICE_DIRS += device/motorola/minnow

# HWC
#TARGET_OMAP3_HWC_DISABLE_YUV_OVERLAY := true
#TARGET_OMAP3_HWC_BOOTLOADER_DISPLAY_INIT := true

# Media / Radio
BOARD_GLOBAL_CFLAGS += -DQCOM_LEGACY_UIDS
BOARD_USE_TI_DOMX_LOW_SECURE_HEAP := true
BOARD_GLOBAL_CFLAGS += -DBOARD_USE_MOTOROLA_DOMX_ENHANCEMENTS

# Recovery
BOARD_HAS_LOCKED_BOOTLOADER := true
BOARD_ALWAYS_INSECURE := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := device/motorola/minnow/rootdir/fstab.minnow
#RECOVERY_FSTAB_VERSION := 2
#TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#BOARD_USE_CUSTOM_RECOVERY_FONT := \"font_7x16.h\"
#TARGET_RECOVERY_PRE_COMMAND_CLEAR_REASON := true
#TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /data/.recovery_mode; sync;"

#TWRP flags
TW_THEME = watch_mdpi
DEVICE_RESOLUTION := 320x320
TW_ROUND_SCREEN := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_USB_STORAGE := true
TW_INCLUDE_JB_CRYPTO := true
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
#TARGET_RECOVERY_INITRC := device/motorola/minnow/rootdir/init.rc
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness

TARGET_OTA_ASSERT_DEVICE := minnow
