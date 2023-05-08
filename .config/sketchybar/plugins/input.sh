#!/bin/bash

SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID)

case ${SOURCE} in
'com.apple.keylayout.ABC') LABEL='us' ;;
'com.apple.keylayout.2SetHangul') LABEL='kr' ;;
esac

sketchybar --set $NAME label="$LABEL"
