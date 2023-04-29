#!/bin/bash

SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID)

case ${SOURCE} in
'com.apple.keylayout.ABC') LABEL='en' ;;
'com.apple.keylayout.2SetHangul') LABEL='ko' ;;
esac

sketchybar --set $NAME label="$LABEL"
