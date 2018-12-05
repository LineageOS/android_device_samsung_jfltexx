$(call inherit-product, device/samsung/jfltexx/full_jfltexx.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
  PRODUCT_NAME=jfltexx \
  TARGET_DEVICE=jfltexx

PRODUCT_DEVICE := jfltexx
PRODUCT_NAME := lineage_jfltexx
