/*
   Copyright (C) 2012 The Android Open-Source Project
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>
#include <android-base/properties.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"
#include <string>

void gsm_properties();

using android::base::GetProperty;

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void property_override_dual(char const system_prop[], char const vendor_prop[], char const value[])
{
    property_override(system_prop, value);
    property_override(vendor_prop, value);
}

void vendor_load_properties()
{
    std::string platform;
    std::string bootloader;

    platform = GetProperty("ro.board.platform", "");

    if (platform == "")
        return;

    bootloader = GetProperty("ro.bootloader", "");

    if (bootloader.find("I337M") != std::string::npos) {
        /* jfltecan */
        gsm_properties();
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint","samsung/jfltevl/jfltecan:5.0.1/LRX22C/I337MVLSGQB1:user/release-keys");
        property_override("ro.build.description", "jfltevl-user 5.0.1 LRX22C I337MVLSGQB1 release-keys");
        property_override_dual("ro.product.model","ro.vendor.product.model","SGH-I337M");
        property_override_dual("ro.product.device","ro.vendor.product.device", "jfltecan");
    } else if (bootloader.find("M919") != std::string::npos) {
        /* jfltetmo */
        gsm_properties();
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint", "samsung/jfltetmo/jfltetmo:4.4.4/KTU84P/M919UVSFQA1:user/release-keys");
        property_override("ro.build.description", "jfltetmo-user 4.4.4 KTU84P M919UVSFQA1 release-keys");
        property_override_dual("ro.product.model","ro.vendor.product.model", "SGH-M919");
        property_override_dual("ro.product.device","ro.vendor.product.device", "jfltetmo");
    } else if (bootloader.find("I9505G") != std::string::npos) {
        /* jgedlte */
        gsm_properties();
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint", "samsung/jgedlteue/jgedlte:5.1/LMY47O.S008/150802:user/release-keys");
        property_override("ro.build.description", "jgedlteue-user 5.1 LMY47O.S008 150802 release-keys");
        property_override_dual("ro.product.model","ro.vendor.product.model", "GT-I9505G");
        property_override_dual("ro.product.device","ro.vendor.product.device", "jgedlte");
        android::init::property_set("ril.subscription.types", "NV,RUIM");
        android::init::property_set("DEVICE_PROVISIONED", "1");
    } else if (bootloader.find("I9505") != std::string::npos) {
        /* jfltexx */
        gsm_properties();
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint", "samsung/jfltexx/jflte:5.0.1/LRX22C/I9505XXUHQK1:user/release-keys");
        property_override("ro.build.description", "jfltexx-user 5.0.1 LRX22C I9505XXUHQK1 release-keys");
        property_override_dual("ro.product.model","ro.vendor.product.model", "GT-I9505");
        property_override_dual("ro.product.device","ro.vendor.product.device", "jfltexx");
    } else {
        property_override("ro.build.fingerprint","ERROR.INIT FAILED");
    }
}

void gsm_properties()
{
    android::init::property_set("telephony.lteOnGsmDevice", "1");
    android::init::property_set("ro.telephony.default_network", "9");
    android::init::property_set("telephony.radioAccessFamily", "gsm");
}
