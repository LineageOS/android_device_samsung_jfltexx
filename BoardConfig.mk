# Copyright (C) 2013-2016 The CyanogenMod Project
# Copyright (C) 2017-2019 The LineageOS Project
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

# inherit from common jf
include device/samsung/jf-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/samsung/jf-gsm-common/BoardConfigVendor.mk

# Manifest
DEVICE_MANIFEST_FILE += device/samsung/jfltexx/manifest.xml

# Assert
TARGET_OTA_ASSERT_DEVICE := GT-I9505,GT-I9505G,i9505,i9505g,jflte,jfltetmo,jfltexx,jgedlte

# Kernel
TARGET_KERNEL_VARIANT_CONFIG := jf_eur_defconfig
