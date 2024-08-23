LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

# Jika file Anda tidak berupa kode C++, jangan gunakan LOCAL_SRC_FILES
# LOCAL_SRC_FILES := $(call all-cpp-files-under, $(LOCAL_PATH))

# Definisikan module Anda jika diperlukan
LOCAL_MODULE := flashlight
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_RECOVERY)

# Tambahkan rules build jika diperlukan
include $(BUILD_PREBUILT)
