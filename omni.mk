# Release name
PRODUCT_RELEASE_NAME := Tab2A710F

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/lenovo/Tab2A710F/device_Tab2A710F.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := Tab2A710F
PRODUCT_NAME := omni_Tab2A710F
PRODUCT_BRAND := lenovo
PRODUCT_MODEL := Tab2A710F
PRODUCT_MANUFACTURER := lenovo

#Set build fingerprint / ID / Product Name etc.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=Tab2A7-10F \
    BUILD_FINGERPRINT="Lenovo/Tab2A710F:5.0.2/KTU84P/2015000001:user/release-keys" \
    PRIVATE_BUILD_DESC="PixNDom_Tab2A710F 5.0.2 KTU84P 2015000001 release-keys"

# Configure as xhdpi device to prevent breaking without mdpi drawables
PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
