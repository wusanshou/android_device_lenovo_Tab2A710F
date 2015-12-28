#
# Copyright (C) 2012 The CyanogenMod Project
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

# prebuilt kernel 
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/kernel:kernel

# Set wifi-only before it's set by generic_no_telephony.mk
WIFI_BAND := 802_11_ABG

# ToDo To be checked for Tab2 A7-10F.....
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.locale.language=en \
    ro.product.locale.region=US \
    ro.zygote=zygote32 

#    ro.opengles.surface.rgb565=true \
#    ro.opengles.version=131072 \
#    ro.carrier=wifi-only \
#    wifi.interface=wlan0 \
#    wifi.supplicant_scan_interval=30 \
#    ro.dinfo.radio=Wifi \
#    ro.wifi.country=EU \
#    ro.boot.selinux=disabled \
#    ro.build.selinux=0 \
#    debug.hwui.render_dirty_regions=false \
#    ro.hwui.use_gpu_pixel_buffers=false \
#    ro.bq.gpu_to_cpu_unsupported=1 \
#    ro.opengles.version=196608 \

PRODUCT_PACKAGES += \
    libnetcmdiface \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant 

# inherit proprietary files
$(call inherit-product, build/target/product/full_base.mk)
$(call inherit-product-if-exists, vendor/lenovo/Tab2A710F/Tab2A710F-vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product-if-exists, framework/base/data/videos/VideoPackage2.mk)

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory \
    audio.a2dp.default \
    audio.usb.default \
    libaudioutils \
    libtinyalsa \
    l2ping \
    hciconfig \
    hcitool \
    librs_jni \
    setup_fs \
    liba2dp \
    tinymix \
    tinyplay \
    tinycap \
    tinyrec 

# ramdisk : populate .rc files
# copied from Stock Rom 5.0
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
    $(LOCAL_PATH)/ramdisk/init.environ.rc:root/init.environ.rc \
    $(LOCAL_PATH)/ramdisk/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.mt8127.rc:root/ueventd.mt8127.rc \
    $(LOCAL_PATH)/ramdisk/init.mt8127.rc:root/init.mt8127.rc \
    $(LOCAL_PATH)/ramdisk/init.project.rc:root/init.project.rc \
    $(LOCAL_PATH)/ramdisk/init.charging.rc:root/init.charging.rc \
    $(LOCAL_PATH)/ramdisk/init.mt8127usb.rc:root/init.mt8127usb.rc \
    $(LOCAL_PATH)/ramdisk/init.ssd.rc:root/init.ssd.rc \
    $(LOCAL_PATH)/ramdisk/init.aee.rc:root/init.aee.rc \
    $(LOCAL_PATH)/ramdisk/init.zygote32.rc:root/init.zygote32.rc \
    $(LOCAL_PATH)/ramdisk/init.trace.rc:root/init.trace.rc \
    $(LOCAL_PATH)/ramdisk/factory_init.project.rc:root/factory_init.project.rc \
    $(LOCAL_PATH)/ramdisk/factory_init.rc:root/factory_init.rc \
    $(LOCAL_PATH)/ramdisk/meta_init.rc:root/meta_init.rc \
    $(LOCAL_PATH)/ramdisk/meta_init.project.rc:root/meta_init.project.rc

# Put standard fstab file (not used by TWRP : It uses /etc/twrp.fstab instead)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/fstab:root/fstab \
    $(LOCAL_PATH)/ramdisk/fstab.mt8127:root/fstab.mt8127

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/sbin/libhardware.so:recovery/root/sbin/libhardware.so

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata

# NTFS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/sbin/mkntfs:recovery/root/sbin/mkntfs \
    $(LOCAL_PATH)/recovery/sbin/ntfs-3g:recovery/root/sbin/ntfs-3g \
    $(LOCAL_PATH)/recovery/sbin/ntfsfix:recovery/root/sbin/ntfsfix \

# /bin/sh
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/sh:ramdisk/root/system/bin/sh
 
# Try to fix problem about recovery fstab (TWRP with Omnirom 5.1)
# Note that TWRP does not currently support the "fstab 2" version of fstab files seen in 4.3 or higher. 
# You will still need to use the "old" format of fstab for TWRP (example of that format is below). 
# To maximize TWRP's compatibility with your build tree, you can create a twrp.fstab and 
#    use PRODUCT_COPY_FILES to place the file in /etc/twrp.fstab 
# When TWRP boots, if it finds a twrp.fstab in the ramdisk it will rename 
#    /etc/recovery.fstab to /etc/recovery.fstab.bak 
#    and then rename /etc/twrp.fstab to /etc/recovery.fstab. 
# Effectively this will "replace" the fstab 2 file that your device files are providing 
#   with the TWRP fstab allowing you to maintain compatibility within your device files and with other recoveries.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/recovery.pix.fstab:recovery/root/etc/twrp.fstab \
    $(LOCAL_PATH)/recovery/recovery.pix.fstab:recovery/root/etc/recovery.fstab
        
# firmware : is firmware to be loaded for A7-10F ????
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/prebuilt/etc/bcmdhd.cal:system/vendor/firmware/bcmdhd.cal \
#    $(LOCAL_PATH)/prebuilt/vendor/firmware/fw_bcmdhd_p2p.bin:system/vendor/firmware/fw_bcmdhd_p2p.bin \
#    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
#    $(LOCAL_PATH)/prebuilt/bin/gps-update:system/bin/gps-update

# hw permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \

# prebuilt configs
# ToDo : check for A7-10F
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
#    $(LOCAL_PATH)/prebuilt/etc/audio_effects.conf:system/etc/audio_effects.conf \
#    $(LOCAL_PATH)/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
#    $(LOCAL_PATH)/prebuilt/etc/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
#    $(LOCAL_PATH)/prebuilt/etc/gps.conf:system/etc/gps.conf \
#    $(LOCAL_PATH)/prebuilt/etc/nvcamera.conf:system/etc/nvcamera.conf \
#    $(LOCAL_PATH)/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
#    $(LOCAL_PATH)/prebuilt/data/srs_processing.cfg:system/data/srs_processing.cfg \
#    $(LOCAL_PATH)/prebuilt/etc/mixer_paths.xml:system/etc/mixer_paths.xml

# keychars/layout
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/prebuilt/usr/idc/acer-touch.idc:system/usr/idc/acer-touch.idc \
#    $(LOCAL_PATH)/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
#    $(LOCAL_PATH)/prebuilt/usr/keychars/Acer-AK00LB.kcm:system/usr/keychars/Acer-AK00LB.kcm \
#    $(LOCAL_PATH)/prebuilt/usr/keylayout/Acer-AK00LB.kl:system/usr/keylayout/Acer-AK00LB.kl \
#    $(LOCAL_PATH)/prebuilt/usr/keylayout/Bluetooth_00_06_66_42.kl:system/usr/keylayout/Bluetooth_00_06_66_42.kl \
#    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_044f_Product_d007.kl:system/usr/keylayout/Vendor_044f_Product_d007.kl \
#    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
#    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_045e_Product_0719.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl \
#    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
#    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c21d.kl:system/usr/keylayout/Vendor_046d_Product_c21d.kl \
#    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c21e.kl:system/usr/keylayout/Vendor_046d_Product_c21e.kl \
#    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c21f.kl:system/usr/keylayout/Vendor_046d_Product_c21f.kl \
#    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
#    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
#    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
#    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
#    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_057e_Product_0306.kl:system/usr/keylayout/Vendor_057e_Product_0306.kl \
#    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
#    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl



# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    persist.sys.strictmode.visual=0

ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.strictmode.visual=0

# To allow adb during boot sequence
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.debuggable=1


PRODUCT_CHARACTERISTICS := tablet

# prefer mdpi drawables where available
PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Bluetooth config file (IconiaHD project)
#PRODUCT_COPY_FILES += \
#    device/acer/a200/bluetooth/main.nonsmartphone.conf:system/etc/bluetooth/main.conf \

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.heapstartsize=5m \
	dalvik.vm.heapgrowthlimit=128m \
	dalvik.vm.heapsize=256m \
	dalvik.vm.heaptargetutilization=0.75 \
	dalvik.vm.heapminfree=512k \
	dalvik.vm.heapmaxfree=2m

## Device identifier. This must come after all inclusions
PRODUCT_NAME := omni_Tab2A710F
PRODUCT_DEVICE := Tab2A710F
PRODUCT_BRAND := lenovo
PRODUCT_MODEL := Tab2A7-10F
PRODUCT_MANUFACTURER := lenovo

