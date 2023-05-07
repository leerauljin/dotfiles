#!/bin/bash

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
. $PLUGIN_DIR/colors.sh

VOLUME=$(osascript -e "get volume settings" | cut -d " " -d ":" -f2 | cut -d "," -f1)
MUTED=$(osascript -e "get volume settings" | grep "muted:true")

if [[ $MUTED != "" ]]; then
ICON="󰖁"
COLOR=$RED
else
ICON="󰕾"
COLOR=$FGALT
fi

sketchybar -m \
--set $NAME icon=$ICON \
--set $NAME icon.color=$COLOR \
