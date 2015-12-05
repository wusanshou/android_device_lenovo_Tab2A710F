# BoardConfig.mk for Lenovo Tab2 A7-10F (Omnirom)

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

################################# Define Flash topography 

# ToDo : see if this parameter can be changed to match the Lenovo's name of Board
TARGET_BOOTLOADER_BOARD_NAME := Tab2A710F

BOARD_KERNEL_CMDLINE :=               # pas teste. d'apres la config du boot
BOARD_KERNEL_BASE := 0x80000000			  # teste. d'apres la config du boot...
BOARD_KERNEL_PAGESIZE := 0x00000800		# = 2048
BOARD_KERNEL_OFFSET := 0x00008000		  # pas teste. d'apres la config du boot
BOARD_RAMDISK_OFFSET := 0x04000000	  # pas teste. d'apres la config du boot
BOARD_TAGS_OFFSET := 0x00000100		    # pas teste. d'apres la config du boot

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3221225472
BOARD_FLASH_BLOCK_SIZE := 131072	# BOARD_KERNEL_PAGESIZE * 64 trouve sur un forum, valeur generee par CM

BOARD_USES_UBOOT := true		# pas sur mais probable

BOARD_HAS_LARGE_FILESYSTEM := true	# pas sur, utile ?
TARGET_USERIMAGES_USE_EXT4 := true
GET_USERIMAGES_SPARSE_EXT_DISABLED := false

############################## Kernel parameters to use ##########
# activate following parameter to use a prebuilt kernel
#TARGET_PREBUILT_KERNEL := device/lenovo/Tab2A710F/prebuilt/kernel  

# activate following parameter to build the normal kernel
# config file located in kernel/lenovo/Tab2A710F/arch/arm/configs/
TARGET_KERNEL_CONFIG := bitland8127_tb_l_defconfig		  

# activate following parameter to build a debug kernel
#TARGET_KERNEL_CONFIG := bitland8127_tb_l_debug_defconfig
###################################################################

# Recovery (TWRP)
TARGET_RECOVERY_FSTAB := device/lenovo/Tab2A710F/recovery/recovery.fstab
RECOVERY_FSTAB_VERSION := 2
#TARGET_PREBUILT_RECOVERY_KERNEL := device/lenovo/Tab2A710F/recovery/kernel
RECOVERY_SDCARD_ON_DATA := true		# xda TWRP

# Some additional features...
USE_CAMERA_STUB := true
BOARD_HAS_NO_SELECT_BUTTON := true
USE_OPENGL_RENDERER := true
DEVICE_RESOLUTION := 1024x600
BOARD_HAVE_BLUETOOTH := true

# From Lenovo's KitKat OSC package
TARGET_NO_FACTORYIMAGE := true
TARGET_KMODULES := true
BOARD_USES_MTK_AUDIO := true
BOARD_EGL_CFG := device/lenovo/Tab2A710F/prebuilt/etc/egl.cfg
BUILD_EMULATOR_OPENGL := true
BUILD_EMULATOR_OPENGL_DRIVER := true
