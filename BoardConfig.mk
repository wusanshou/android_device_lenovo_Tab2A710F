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
#ARCH_ARM_HAVE_NEON := true		# A tester


################################# Define Flash topography 

# ToDo : see if this parameter can be changed to match the Lenovo's name of Board
TARGET_BOOTLOADER_BOARD_NAME := Tab2A710F

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

BOARD_HAS_LARGE_FILESYSTEM := true	# pas sur, utile ?
TARGET_USERIMAGES_USE_EXT4 := true
GET_USERIMAGES_SPARSE_EXT_DISABLED := false

## Boot
BOARD_USES_UBOOT := true                # pas sur mais probable
# init
#TARGET_PROVIDES_INIT_RC := true                        # A tester
#HAVE_AEE_FEATURE := yes                                # A tester
#BUILD_MTK_INIT := true                                 # A tester
#MTK_KERNEL_POWER_OFF_CHARGING := true                  # A tester
#BOARD_CUSTOM_BOOTIMG_MK := device/lenovo/Tab2A710F/boot.mk    # A tester


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
#TARGET_RECOVERY_FSTAB := device/lenovo/Tab2A710F/recovery/recovery.fstab
TARGET_RECOVERY_FSTAB := device/lenovo/Tab2A710F/recovery/recovery.pix.fstab
RECOVERY_FSTAB_VERSION := 1
#TARGET_PREBUILT_RECOVERY_KERNEL := device/lenovo/Tab2A710F/recovery/kernel
RECOVERY_SDCARD_ON_DATA := true		# xda TWRP
TW_THEME=portrait_hdpi		# le theme du TWRP existant qui fonctionne est en 720x1280


# GFX - inspire de https://github.com/shutt1e/android_device_phonepad/blob/master/BoardConfig.mk )
#MTK_HWC_CHIP := mt8127		# A tester
#MTK_HWC_SUPPORT := true	# A tester
#MTK_WFD_SUPPORT := true	# A tester
#MTK_PQ_SUPPORT := true         # A tester
#MTK_ION_SUPPORT := true	# A tester

# EGL settings
BOARD_EGL_CFG := device/lenovo/Tab2A710F/prebuilt/etc/egl.cfg
USE_OPENGL_RENDERER := true
BUILD_EMULATOR_OPENGL := true
BUILD_EMULATOR_OPENGL_DRIVER := true

DEVICE_RESOLUTION := 1024x600		# A tester, d'apres http://forum.xda-developers.com/showthread.php?t=1943625, il faut 600x1024 pour TWRP

# audio
#TARGET_PROVIDES_LIBAUDIO := true	# A tester
BOARD_USES_MTK_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true


# Some additional features...
BOARD_HAS_NO_SELECT_BUTTON := true

# From Lenovo's KitKat OSC package
TARGET_NO_FACTORYIMAGE := true
TARGET_KMODULES := true


