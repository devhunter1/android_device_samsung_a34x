LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE       := shrink
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/system/bin
LOCAL_SRC_FILES    := shrink.c
LOCAL_CFLAGS       := \
    -O3 \
    -Wall \
    -Werror \
    -g

include $(BUILD_EXECUTABLE)
