#!/usr/bin/env bash

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
. $PLUGIN_DIR/colors.sh
DESKTOP=$(defaults read com.apple.finder CreateDesktop)

if [[ $DESKTOP == "true" ]]; then 
    sketchybar -m --set $NAME icon="" icon.color=$FGALT icon.y_offset=0
    defaults write com.apple.finder CreateDesktop false
    killall Finder
else 
    sketchybar -m --set $NAME icon="" icon.color=$FG icon.y_offset=1
    defaults write com.apple.finder CreateDesktop true
    killall Finder
fi
