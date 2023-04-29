#!/bin/bash

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
. $PLUGIN_DIR/colors.sh

# customize these!
# work duration (in minutes)
work_min=25

# short rest duration (in minutes)
short_rest_min=5

# long rest duration (in minutes, only needed for when forever=true)
long_rest_min=30

# maximum number of work sessions before long rest
max_sessions=4

# forever repeat pomodoro (if you dare)
forever=false

# fancy icons
pomo_clock () {
  local percent=$1

  if (( 11*100/12 <= $percent && $percent < 100  )); then
    icon="󱑉"
  elif (( 10*100/12 <= $percent && $percent < 11*100/12  )); then
    icon="󱑈"
  elif (( 9*100/12 <= $percent && $percent < 10*100/12  )); then
    icon="󱑇"
  elif (( 8*100/12 <= $percent && $percent < 9*100/12  )); then
    icon="󱑆"
  elif (( 7*100/12 <= $percent && $percent < 8*100/12  )); then
    icon="󱑅"
  elif (( 6*100/12 <= $percent && $percent < 7*100/12  )); then
    icon="󱑄"
  elif (( 5*100/12 <= $percent && $percent < 6*100/12  )); then
    icon="󱑃"
  elif (( 4*100/12 <= $percent && $percent < 5*100/12  )); then
    icon="󱑂"
  elif (( 3*100/12 <= $percent && $percent < 4*100/12  )); then
    icon="󱑁"
  elif (( 2*100/12 <= $percent && $percent < 3*100/12  )); then
    icon="󱑀"
  elif (( 1*100/12 <= $percent && $percent < 2*100/12  )); then
    icon="󱐿"
  else
    icon="󱑊"
  fi
  echo $icon
}

function update_slider {
  local percent=$1

  sketchybar --set pomo slider.percentage=$percent
}

function update_color {
  local color=$1
  local color_alt=$2

  sketchybar --set pomo slider.highlight_color=$color \
                 slider.background.color=$color_alt       \
                 icon.color=$color
}

function update_icon {
  local icon=$1

  sketchybar --set pomo icon=$icon
}

function timer {
  local duration=$(($1*60))

  for ((i=1; i<=$duration;i++)); do
    local percent=$((i*100/$duration))
    # local rev_percent=$((100-$percent))

    update_slider $percent
    update_icon $(pomo_clock $percent)

    sleep 1
  done
}

function do_pomo {
  while true; do
    for ((s=1; s<=$max_sessions;s++)); do

      if (($s != $max_sessions)); then
        rest_min=$short_rest_min
        update_color $RED $REDALT
      else
        rest_min=$long_rest_min
        update_color $YELLOW $YELLOWALT
      fi

      # start work timer
      timer $work_min
      
      # break if this is last session
      if [[ $s == $max_sessions && $forever != true ]]; then
        break 2
      fi

      # start rest timer
      update_color $BLUE $BLUEALT
      update_slider 0
      update_icon $(pomo_clock 0)

      timer $rest_min 
    done
  done
}

# check if another istance is running
if [[ $(pgrep -f $0) != "" ]]; then
  pkill -f $0

else
  # do 1 pomodoro session
  do_pomo
fi

# reset colors and icon to default
update_color $FGALT $FGALT
update_slider 0
update_icon $(pomo_clock 0)
