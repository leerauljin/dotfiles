#!/bin/sh

handle() {
  case $1 in monitoradded*)
    hyprctl dispatch moveworkspacetomonitor "1 DP-1"
    hyprctl dispatch moveworkspacetomonitor "2 DP-1"
    hyprctl dispatch moveworkspacetomonitor "3 DP-1"
    hyprctl dispatch moveworkspacetomonitor "4 DP-1"
    hyprctl dispatch moveworkspacetomonitor "5 DP-1"
  esac
}

socat - "UNIX-CONNECT:/tmp/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock" | while read -r line; do handle "$line"; done
