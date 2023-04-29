#!/bin/bash

yabai_mode=$(yabai -m query --spaces --display | jq -r 'map(select(."has-focus" == true))[-1].type')

case "$yabai_mode" in
    bsp)
    sketchybar -m --set $NAME icon=""
    ;;
    stack)
    sketchybar -m --set $NAME icon="﯅"
    ;;
    float)
    sketchybar -m --set $NAME icon=""
    ;;
esac
