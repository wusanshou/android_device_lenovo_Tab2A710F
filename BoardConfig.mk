# BoardConfig.mk for Lenovo Tab2 A7-10F (Omnirom)

# A laisser en premier pour être éventuellement écrasé par BoardConfigVendor
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/lenovo/Tab2A710F/BoardConfigVendor.mk

################################ Define cross compiler configuration
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := mt8127
TARGET_BOARD_PLATFORM_GPU := mali-450
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true		# A tester - n'a pas empeche la compilation du recovery, et assez logique


################################# Define Flash topography 

# ToDo : see if this parameter can be changed to match the Lenovo's name of Board
TARGET_BOOTLOADER_BOARD_NAME := Tab2A710F

# assert
#TARGET_OTA_ASSERT_DEVICE := Tab2A7-10F,Tab2_A7-10F, Tab2A710F  # TODO

BOARD_KERNEL_CMDLINE :=             # pas teste. d'apres la config du boot
BOARD_KERNEL_BASE := 0x80000000			# teste. d'apres la config du boot...
BOARD_KERNEL_PAGESIZE := 2048		    # = 2048 (doit rester en decimal)
BOARD_KERNEL_OFFSET := 0x00008000		# pas teste. d'apres la config du boot
BOARD_RAMDISK_OFFSET := 0x04000000	  # pas teste. d'apres la config du boot
BOARD_TAGS_OFFSET := 0x00000100		    # pas teste. d'apres la config du boot

# Values displayed by MTK Droid Tools, from a tablet running KitKat Stock Rom
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216       # = 16MB (OK with MTKDroidTools value)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216   # = 16MB (OK with MTKDroidTools value)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736   # = 1,5 GB  (OK with MTKDroidTools value)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3221225472 # = 3 GB sur 5,5 GB max  (OK with MTKDroidTools value)

BOARD_FLASH_BLOCK_SIZE := 0x020000	           # BOARD_KERNEL_PAGESIZE * 64 trouve sur un forum, valeur generee par CM

# Needed for Android 6 ###########################
BOARD_CACHEIMAGE_PARTITION_SIZE := 132120576      # = 0x07e00000 = 128MB
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
# TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true   #Not supported by 5.1
##################################################

BOARD_HAS_LARGE_FILESYSTEM := true      # utile ?
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false  # utile ?

BOARD_HAS_NO_SELECT_BUTTON := true


############################### Boot
BOARD_USES_UBOOT := true                # pas sur mais probable
# init
#TARGET_PROVIDES_INIT_RC := true                        # A tester
HAVE_AEE_FEATURE := yes
BUILD_MTK_INIT := true
#MTK_KERNEL_POWER_OFF_CHARGING := true                  # A tester
#BOARD_CUSTOM_BOOTIMG_MK := device/lenovo/Tab2A710F/boot.mk    # A tester


############################## Kernel parameters to use ##########
# activate following parameter to use a prebuilt kernel
TARGET_PREBUILT_KERNEL := device/lenovo/Tab2A710F/prebuilt/kernel  

# activate following parameter to build the normal kernel
# config file located in kernel/lenovo/Tab2A710F/arch/arm/configs/
#TARGET_KERNEL_CONFIG := bitland8127_tb_l_defconfig		  

# activate following parameter to build a debug kernel
#TARGET_KERNEL_CONFIG := bitland8127_tb_l_debug_defconfig
###################################################################

############################## Recovery (TWRP)
DEVICE_RESOLUTION := 1024x600
TARGET_RECOVERY_PIXEL_FORMAT := "BGR_565"
RECOVERY_VARIANT := twrp
#RECOVERY_GRAPHICS_USE_LINELENGTH := true       # A tester (this line is supposed to improve graphics on some devices)

TW_THEME := portrait_mdpi
# To use the same theme than twrp customized by ??? (VVizard@lenovo-forum.ru ?)
TW_CUSTOM_THEME := device/lenovo/Tab2A710F/recovery/twres

# Storage configuration
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_FLASH_FROM_STORAGE := true

#TW_EXTERNAL_STORAGE_PATH := "/external_sd"
#TW_EXTERNAL_STORAGE_MOUNT_POINT := "extsdcard"
# For classic partitioned device
# TW_INTERNAL_STORAGE_PATH := "/media"
# TW_INTERNAL_STORAGE_MOUNT_POINT := "media"
# For datamedia device		# A tester
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"

# To use conventional name (Tab2A7-10F) for TWRP backup path
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

# Force use of following .rc files for recovery.img
TW_EXCLUDE_DEFAULT_USB_INIT := true
TARGET_RECOVERY_INITRC := device/lenovo/Tab2A710F/recovery/init.rc 
TARGET_RECOVERY_INITRC += device/lenovo/Tab2A710F/recovery/init.recovery.usb.rc 
TARGET_RECOVERY_INITRC += device/lenovo/Tab2A710F/recovery/ueventd.rc 

# Let recovery Android.mk expect a standard V2 recovery.fstab, to put it in root
TARGET_RECOVERY_FSTAB := device/lenovo/Tab2A710F/recovery/recovery.fstab
RECOVERY_FSTAB_VERSION := 2
# The true recovery.fstab will be obtained from /etc/twrp.fstab, copied by Tab2A710F.mk directive
#TARGET_RECOVERY_FSTAB := device/lenovo/Tab2A710F/recovery/recovery.pix.fstab
#RECOVERY_FSTAB_VERSION := 1


# -- removes the reboot bootloader button from the recovery reboot menu
TW_NO_REBOOT_BOOTLOADER := true         # fonctionne ? 
TW_INCLUDE_CRYPTO := true       # A tester
#TW_EXCLUDE_MTP := true         # A tester ?
#TW_EXCLUDE_SUPERSU := true     # A tester ?
#TWHAVE_SELINUX := true         # A tester ?

#TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"  # A tester
#TW_MAX_BRIGHTNESS := 255
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone1/temp"	# Pas sur que ce soit la temperature du CPU... mais ca donne une idee de la temperature


############################## End of Recovery parameters(TWRP)


# GFX - inspire de https://github.com/shutt1e/android_device_phonepad/blob/master/BoardConfig.mk )
MTK_HWC_CHIP := mt8127
MTK_HWC_SUPPORT := true
MTK_WFD_SUPPORT := true
MTK_PQ_SUPPORT := true
MTK_ION_SUPPORT := true

# EGL settings
BOARD_EGL_CFG := device/lenovo/Tab2A710F/prebuilt/etc/egl.cfg
USE_OPENGL_RENDERER := true
BUILD_EMULATOR_OPENGL := false
BUILD_EMULATOR_OPENGL_DRIVER := false

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file

# audio
#TARGET_PROVIDES_LIBAUDIO := true	# A tester
BOARD_USES_MTK_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true        # A tester
#BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true    # A tester
#BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/micromax/a106/bluetooth	# A tester

# From Lenovo's KitKat OSC package
TARGET_NO_FACTORYIMAGE := true
TARGET_KMODULES := true
