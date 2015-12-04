USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/lenovo/Tab2A710F/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
#TARGET_BOARD_PLATFORM := unknown
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := Tab2A710F

BOARD_KERNEL_CMDLINE := 		# pas teste. d'apres la config du boot
BOARD_KERNEL_BASE := 0x80000000		# teste. d'apres la config du boot. pas de boot...
#BOARD_KERNEL_BASE := 0x01D80000	# teste, reboot auto au bout de qqes secondes. d'apres le scatter
BOARD_KERNEL_PAGESIZE := 0x00000800	# pas teste. d'apres la config du boot
BOARD_KERNEL_OFFSET := 0x00008000	# pas teste. d'apres la config du boot
BOARD_RAMDISK_OFFSET := 0x04000000	# pas teste. d'apres la config du boot
BOARD_TAGS_OFFSET := 0x00000100		# pas teste. d'apres la config du boot

# fix this up by examining /proc/mtd on a running device
#BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216 #0x1000000
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216 #0x1000000
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736 #0x60000000
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 3221225472 #0xc0000000
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3221225472


BOARD_FLASH_BLOCK_SIZE := 131072	# BOARD_KERNEL_PAGESIZE * 64 trouve sur un forum, valeur generee par CM
BOARD_USES_UBOOT := true		# pas sur mais probable
#BOARD_KERNEL_IMAGE_NAME := uImage	# not usable with Omnirom

BOARD_HAS_LARGE_FILESYSTEM := true	# pas sur, utile ?
TARGET_USERIMAGES_USE_EXT4 := true
GET_USERIMAGES_SPARSE_EXT_DISABLED := false

TARGET_BOARD_PLATFORM := mt8127
TARGET_BOARD_PLATFORM_GPU := mali-450
#TARGET_PREBUILT_KERNEL := device/lenovo/Tab2A710F/prebuilt/kernel  # Use this to reuse a pre-built kernel
TARGET_KERNEL_CONFIG := bitland8127_tb_l_defconfig		  # config file located in kernel/lenovo/a710f/arch/arm/configs
#TARGET_KERNEL_CONFIG := bitland8127_tb_l_debug_defconfig  #the same in debug mode, if needed

# Recovery
TARGET_RECOVERY_FSTAB := device/lenovo/Tab2A710F/recovery/recovery.fstab
RECOVERY_FSTAB_VERSION := 2
#TARGET_PREBUILT_RECOVERY_KERNEL := device/lenovo/Tab2A710F/recovery/kernel
RECOVERY_SDCARD_ON_DATA := true		# xda TWRP
#TARGET_PREBUILT_RECOVERY_KERNEL := path/to/kernel


# Ajouts divers...
BOARD_HAS_NO_SELECT_BUTTON := true
USE_OPENGL_RENDERER := true
DEVICE_RESOLUTION := 1024x600
BOARD_HAVE_BLUETOOTH := true

# depuis le pack Lenovo KitKat
#USE_CAMERA_STUB := true
TARGET_NO_FACTORYIMAGE := true
TARGET_KMODULES := true
BOARD_USES_MTK_AUDIO := true
BOARD_EGL_CFG := device/lenovo/Tab2A710F/prebuilt/etc/egl.cfg
BUILD_EMULATOR_OPENGL := true
BUILD_EMULATOR_OPENGL_DRIVER := true


