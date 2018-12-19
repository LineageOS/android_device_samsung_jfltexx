# Copyright (C) 2009 The CyanogenMod Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from common jf
include device/samsung/jf-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := GT-I9505,GT-I9505G,SGH-I337M,SGH-M919,I9505,I9505G,I337M,M919,i9505,i9505g,i337m,m919,jflte,jfltecan,jfltetmo,jfltexx,jgedlte

# Properties
TARGET_SYSTEM_PROP += device/samsung/jfltexx/system.prop

# Vendor Init
TARGET_INIT_VENDOR_LIB := libinit_jfltexx
TARGET_LIBINIT_DEFINES_FILE := device/samsung/jfltexx/init/init_jfltexx.cpp
