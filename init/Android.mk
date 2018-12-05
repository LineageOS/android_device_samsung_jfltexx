LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := \
    system/core/init \
    system/core/base/include

LOCAL_CFLAGS := -Wall -DANDROID_TARGET=\"$(TARGET_BOARD_PLATFORM)\"
LOCAL_SRC_FILES := init_jfltexx.cpp
LOCAL_MODULE := libinit_jfltexx
LOCAL_STATIC_LIBRARIES := libbase libselinux
include $(BUILD_STATIC_LIBRARY)
