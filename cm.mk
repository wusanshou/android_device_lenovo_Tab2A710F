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
