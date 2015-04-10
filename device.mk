#
# Copyright (C) 2011 The CyanogenMod Project
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

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/jf-gsm-common/jf-gsm-common-vendor.mk)

# Needed if blobs were extracted with extract-files.sh script
$(call inherit-product-if-exists, vendor/samsung/jfltexx/jfltexx-vendor.mk)

## device overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/jfltexx/overlay

# Inherit from jf-common
$(call inherit-product, device/samsung/jf-common/jf-common.mk)