USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/lenovo/Tab2A710F/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := unknown
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
BOARD_KERNEL_PAGESIZE := 2048		# pas teste. d'apres la config du boot
BOARD_KERNEL_OFFSET := 0x00008000		# pas teste. d'apres la config du boot
BOARD_RAMDISK_OFFSET := 0x04000000	# pas teste. d'apres la config du boot
BOARD_TAGS_OFFSET := 0x00000100		# pas teste. d'apres la config du boot

# Values displayed by MTK Droid Tools, from a tablet running KitKat Stock Rom
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216       # = 16MB (OK with MTKDroidTools value)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216   # = 16MB (OK with MTKDroidTools value)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736   # = 1,5 GB  (OK with MTKDroidTools value)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3221225472 # = 3 GB sur 5,5 GB max  (OK with MTKDroidTools value)

BOARD_FLASH_BLOCK_SIZE := 131072	# BOARD_KERNEL_PAGESIZE * 64 trouve sur un forum, valeur generee par CM
BOARD_USES_UBOOT := true		# pas sur mais probable
BOARD_KERNEL_IMAGE_NAME := uImage	# pas sur, utile ?

BOARD_HAS_LARGE_FILESYSTEM := true	# pas sur, utile ?
TARGET_USERIMAGES_USE_EXT4 := true
GET_USERIMAGES_SPARSE_EXT_DISABLED := false


############################## Kernel parameters to use ##########
# activate following parameter to use a prebuilt kernel
TARGET_PREBUILT_KERNEL := device/lenovo/Tab2A710F/prebuilt/kernel

# activate following parameter to build the normal kernel
# config file located in kernel/lenovo/Tab2A710F/arch/arm/configs/
#TARGET_KERNEL_CONFIG := bitland8127_tb_l_defconfig

# activate following parameter to build a debug kernel
#TARGET_KERNEL_CONFIG := bitland8127_tb_l_debug_defconfig
###################################################################


# Recovery
TARGET_RECOVERY_FSTAB := device/lenovo/Tab2A710F/recovery/recovery.fstab
RECOVERY_FSTAB_VERSION := 2
#TARGET_PREBUILT_RECOVERY_KERNEL := device/lenovo/Tab2A710F/recovery/kernel


# Ajouts divers...
BOARD_HAS_NO_SELECT_BUTTON := true
USE_OPENGL_RENDERER := true
DEVICE_RESOLUTION := 600x1024
BOARD_HAVE_BLUETOOTH := true


# depuis le pack Lenovo KitKat
#USE_CAMERA_STUB := true
TARGET_NO_FACTORYIMAGE := true
TARGET_KMODULES := true
BOARD_USES_MTK_AUDIO := true
BOARD_EGL_CFG := vendor/lenovo/Tab2A710F/proprietary/system/lib/egl/egl.cfg
BUILD_EMULATOR_OPENGL := true
BUILD_EMULATOR_OPENGL_DRIVER := true



# pour adb pendant le boot, Doume59249
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    persist.sys.strictmode.visual=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.strictmode.visual=0
# To allow adb during boot sequence
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.debuggable=1

