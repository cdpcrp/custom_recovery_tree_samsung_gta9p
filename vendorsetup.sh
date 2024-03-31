#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2021-2023 The OrangeFox Recovery Project
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

FDEVICE="gta9p"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

# Initial Info
    export ALLOW_MISSING_DEPENDENCIES=true
    export LC_ALL="C"
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER="1"
# Maintaining Info
    export OF_MAINTAINER=Crypton
    export FOX_VERSION="R11.1"
    export FOX_BUILD_TYPE=beta
  	
# Device Info
    export FOX_ARCH=arm64
    export FOX_VARIANT="12.1"
    export TARGET_DEVICE_ALT="gta9p"
  
# Funtions
    export FOX_REPLACE_BUSYBOX_PS=1
    export FOX_REPLACE_TOOLBOX_GETPROP=1
    export FOX_USE_TAR_BINARY=1
    export FOX_USE_SED_BINARY=1
    export FOX_USE_BASH_SHELL=1
    export FOX_ASH_IS_BASH=1
    export FOX_USE_GREP_BINARY=1
    export FOX_USE_XZ_UTILS=1
    export FOX_USE_NANO_EDITOR=1
    export OF_ENABLE_LPTOOLS=1
    export FOX_DELETE_AROMAFM=1
  
# Display Settings
    export OF_HIDE_NOTCH=1
    export OF_CLOCK_POS=1
    export OF_ALLOW_DISABLE_NAVBAR=0
    export OF_USE_GREEN_LED=0
    export OF_SCREEN_H=2400
  
# Other Patches
    export OF_NO_RELOAD_AFTER_DECRYPTION=1
    export OF_FBE_METADATA_MOUNT_IGNORE=1
    export OF_PATCH_AVB20=1
    export OF_NO_SPLASH_CHANGE=1
    export OF_FIX_DECRYPTION_ON_DATA_MEDIA=1
    export FOX_BUGGED_AOSP_ARB_WORKAROUND="1616300800"; # Sun 21 Mar 04:26:40 GMT 2021

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
		export | grep "FOX" >> $FOX_BUILD_LOG_FILE
		export | grep "OF_" >> $FOX_BUILD_LOG_FILE
		export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
		export | grep "TW_" >> $FOX_BUILD_LOG_FILE
	fi
fi
#
