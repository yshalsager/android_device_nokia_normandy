TARGET_SPECIFIC_HEADER_PATH := device/nokia/normandy/include

# inherit from the proprietary version
-include vendor/nokia/normandy/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Arch related defines and optimizations
TARGET_ARCH := arm
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a5
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOOTLOADER_BOARD_NAME := 7x27
TARGET_CPU_SMP := true

TARGET_CORTEX_CACHE_LINE_32 := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

TARGET_USES_ION := true

TARGET_BOARD_PLATFORM_GPU := qcom-adreno203
BOARD_USES_ADRENO_200 := true

#Options
BOARD_USES_GENERIC_AUDIO := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp -mtune=cortex-a5
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp -mtune=cortex-a5
COMMON_GLOBAL_CFLAGS += -DQCOM_DIRECTTRACK
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK
COMMON_GLOBAL_CFLAGS += -DNO_UPDATE_PREVIEW
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP_LEGACY
COMMON_GLOBAL_CFLAGS += -DBOARD_CANT_REALLOCATE_OMX_BUFFERS

# Qualcomm hardware
COMMON_GLOBAL_CFLAGS += -DUSE_MDP3
COMMON_GLOBAL_CFLAGS += -DLPA_DEFAULT_BUFFER_SIZE=480

BOARD_CHARGER_ENABLE_SUSPEND := true

# Optimizations
TARGET_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true
ARCH_ARM_HIGH_OPTIMIZATION := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
TARGET_GRALLOC_USES_ASHMEM := true

BOARD_WANTS_EMMC_BOOT := true

WITH_ART_SMALL_MODE := true

#TARGET_PREBUILT_KERNEL := device/nokia/normandy/kernel
TARGET_KERNEL_SOURCE := kernel/nokia/normandy
TARGET_KERNEL_CONFIG := normandy_selinux_defconfig
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-

#KERNEL_EXTERNAL_MODULES:
#	mkdir -p $(KERNEL_MODULES_OUT)/ath6kl
#	rm -rf $(TARGET_OUT_INTERMEDIATES)/compat
#	cp -a device/nokia/normandy/compat $(TARGET_OUT_INTERMEDIATES)/
#	$(MAKE) -C $(TARGET_OUT_INTERMEDIATES)/compat KLIB=$(KERNEL_OUT) KLIB_BUILD=$(KERNEL_OUT) ARCH="arm" CROSS_COMPILE="arm-eabi-" install-modules
#	rm $(KERNEL_MODULES_OUT)/cfg80211.ko
#	$(TARGET_OBJCOPY) --strip-unneeded $(TARGET_OUT_INTERMEDIATES)/compat/net/wireless/cfg80211.ko $(KERNEL_MODULES_OUT)/ath6kl/cfg80211.ko
#	$(TARGET_OBJCOPY) --strip-unneeded $(TARGET_OUT_INTERMEDIATES)/compat/drivers/net/wireless/ath/ath6kl/ath6kl_core.ko $(KERNEL_MODULES_OUT)/ath6kl/ath6kl_core.ko
#	ln -sf /system/lib/modules/ath6kl/cfg80211.ko $(KERNEL_MODULES_OUT)/cfg80211.ko
KERNEL_EXTERNAL_MODULES:
	rm $(KERNEL_MODULES_OUT)/cfg80211.ko
	ln -sf /system/lib/modules/ath6kl/ath6kl_sdio.ko $(KERNEL_MODULES_OUT)/wlan.ko
	cp device/nokia/normandy/nx/other/lib/modules/cfg80211.ko $(TARGET_OUT)/lib/modules

TARGET_KERNEL_MODULES := KERNEL_EXTERNAL_MODULES

BOARD_HAS_NO_SELECT_BUTTON := true

# Kernel
BOARD_KERNEL_BASE    := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096
#Spare size is (BOARD_KERNEL_PAGESIZE>>9)*16
BOARD_KERNEL_SPARESIZE := 128
BOARD_KERNEL_BCHECC_SPARESIZE := 160

# Support to build images for 2K NAND page
BOARD_KERNEL_2KSPARESIZE := 64

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USES_UNCOMPRESSED_KERNEL := false

BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom loglevel=1 vmalloc=200M androidboot.selinux=permissive
ARCH_ARM_HAVE_TLS_REGISTER := true

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 465567744
BOARD_USERDATAIMAGE_PARTITION_SIZE := 314556416
BOARD_PERSISTIMAGE_PARTITION_SIZE := 10485760
BOARD_CACHEIMAGE_PARTITION_SIZE := 41943040
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED

# Storage / Sharing
BOARD_VOLD_MAX_PARTITIONS := 35
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun%d/file

# Media
TARGET_QCOM_MEDIA_VARIANT := caf
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/nokia/normandy/bluetooth

# Camera
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB -DNEEDS_VECTORIMPL_SYMBOLS
USE_DEVICE_SPECIFIC_CAMERA := true
USE_CAMERA_STUB := true

# audio 
TARGET_QCOM_AUDIO_VARIANT := caf
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_HAS_QACT := true

# FM
AUDIO_FEATURE_ENABLED_FM := true

# GPS
TARGET_GPS_HAL_PATH := device/nokia/normandy/gps
#BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
#BOARD_USES_QCOM_LIBS := true
BOARD_VENDOR_QCOM_AMSS_VERSION := 6225
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x27a
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Dalvik
TARGET_ARCH_LOWMEM := true

# Display
BOARD_EGL_CFG := device/nokia/normandy/config/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true                                           
BOARD_EGL_WORKAROUND_BUG_10194508 := true                                   
BOARD_USE_MHEAP_SCREENSHOT := true
TARGET_DOESNT_USE_FENCE_SYNC := true

# Hardware
BOARD_HARDWARE_CLASS := device/nokia/normandy/cmhw

# Lights
#TARGET_PROVIDES_LIBLIGHT := true

# Radio
TARGET_NEEDS_NON_PIE_SUPPORT := true
BOARD_PROVIDES_LIBRIL := true
SIM_COUNT := 2

# Sensors
SOMC_CFG_SENSORS := true
SOMC_CFG_SENSORS_COMPASS_AK8975 := yes
SOMC_CFG_SENSORS_LIGHT_AS3676 := yes
SOMC_CFG_SENSORS_LIGHT_AS3676_PATH := "/sys/devices/i2c-0/0-0040"

# SELinux
include device/qcom/sepolicy/sepolicy.mk

# RIL 
#BOARD_RIL_CLASS := ../../../device/nokia/normandy/ril/

# Webkit
ENABLE_WEBGL := true
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes
TARGET_FORCE_CPU_UPLOAD := true

# Assert
TARGET_OTA_ASSERT_DEVICE := normandy,msm8625

# Don't generate block mode update zips
BLOCK_BASED_OTA := false

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

WITH_DEXPREOPT := true
#WITH_DEXPREOPT_PIC := true
DONT_DEXPREOPT_PREBUILTS := true

#low-ram
MALLOC_IMPL := dlmalloc
TARGET_BOOTANIMATION_TEXTURE_CACHE := false

# WLAN
BOARD_HAS_ATH_WLAN          := true
BOARD_WLAN_DEVICE := ath6kl
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_ath6kl
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_ath6kl
WPA_SUPPLICANT_VERSION      := VER_0_8_X
HOSTAPD_VERSION             := VER_0_8_X
TARGET_CUSTOM_WIFI := ../../device/nokia/normandy/libhardware_legacy/wifi/wifi.c
WIFI_EXT_MODULE_PATH        := "/system/lib/modules/cfg80211.ko"
WIFI_EXT_MODULE_NAME        := "cfg80211"
WIFI_EXT_MODULE_ARG         := ""
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/ath6kl/ath6kl_sdio.ko"
WIFI_DRIVER_MODULE_NAME     := "wlan"
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_TEST_INTERFACE         := "sta"
WIFI_DRIVER_FW_PATH_STA     := "sta"
WIFI_DRIVER_FW_PATH_AP      := "ap"
WIFI_DRIVER_FW_PATH_P2P     := "p2p"

# Recovery
TARGET_RECOVERY_FSTAB := device/nokia/normandy/rootdir/twrp.fstab
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
DEVICE_RESOLUTION := 480x800
TW_FLASH_FROM_STORAGE := true
TW_INTERNAL_STORAGE_PATH := "/sdcard1"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_DEFAULT_EXTERNAL_STORAGE := true
