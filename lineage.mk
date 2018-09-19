$(call inherit-product, device/samsung/jfltexx/full_jfltexx.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_jfltexx
PRODUCT_DEVICE := jfltexx
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_MODEL=GT-I9505 \
    PRODUCT_NAME=jfltexx \
    PRODUCT_DEVICE=jflte \
    TARGET_DEVICE=jflte \
    PRIVATE_BUILD_DESC="jfltexx-user 5.0.1 LRX22C I9505XXUHPF4 release-keys"

BUILD_FINGERPRINT := "samsung/jfltexx/jflte:5.0.1/LRX22C/I9505XXUHPF4:user/release-keys"
