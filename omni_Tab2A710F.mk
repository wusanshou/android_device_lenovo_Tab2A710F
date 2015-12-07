# Release name
PRODUCT_RELEASE_NAME := Tab2A710F

# Sign the build (instead 'HOMEMADE' by default)
ROM_BUILDTYPE := PixNDom

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit device configuration (omni specs)
#$(call inherit-product, device/lenovo/Tab2A710F/device_Tab2A710F.mk)
$(call inherit-product, device/lenovo/Tab2A710F/Tab2A710F.mk)

#Set build fingerprint / ID / Product Name etc.
# See this page for BUILD_ID value : 
# https://source.android.com/source/build-numbers.html#source-code-tags-and-builds
# Build_id = LYZ28J for Lollipop 5.1
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=Tab2A710F \
    BUILD_FINGERPRINT="Lenovo/Tab2A710F:5.0.2/LYZ28J/2015000001:user/release-keys" \
    PRIVATE_BUILD_DESC="PixNDom_Tab2A710F 5.0.2 LYZ28J 2015000001 release-keys"
