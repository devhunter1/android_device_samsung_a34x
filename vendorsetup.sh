
#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2021-2022 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="a34x"
export FOX_BUILD_DEVICE="a34x"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w \"$FDEVICE\")
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w \"$FDEVICE\")
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   echo "** WARNING **: Always set FOX_BUILD_DEVICE to the device codename before starting to build for any device!"
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
        export ALLOW_MISSING_DEPENDENCIES="true"
        export OF_DISABLE_MIUI_SPECIFIC_FEATURES="1"
        export FOX_ENABLE_APP_MANAGER="1"
        export FOX_USE_LZ4_BINARY="1"
        export FOX_USE_ZSTD_BINARY="1"
        export OF_NO_TREBLE_COMPATIBILITY_CHECK="1"
        export OF_SCREEN_H="2340"
        export FOX_DELETE_AROMAFM="1"
        export LC_ALL="C"
        export FOX_USE_NANO_EDITOR="1"
        export FOX_USE_TAR_BINARY="1"
        export FOX_USE_SED_BINARY="1"
        export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER="1"
        export FOX_USE_XZ_UTILS="1"
        export FOX_VARIANT="A14"
        export OF_MAINTAINER="xnnnsets"
        export FOX_BUILD_TYPE="Dick Yeah"
        export FOX_VERSION="R12.1"
        export OF_FL_PATH1="/tmp/flashlight" # See /*.rc for more information
fi
