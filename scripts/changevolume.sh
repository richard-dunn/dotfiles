#!/bin/bash

function send_notification() {
  volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
  
  if echo "$volume" | grep -q "\[MUTED\]"; then
    dunstify -a "changevolume" -u low -r 3000 -t 2000 "Muted"
  else
    # Extract the volume value as a percentage
    volume_level=$(echo "$volume" | grep -oP '(?<=Volume: )\d+\.\d+')
    # Multiply by 100 to get the percentage
    volume_percentage=$(echo "$volume_level * 100" | bc | awk '{printf "%d", $1}')
    dunstify -a "changevolume" -u low -r 3000 -h int:value:"$volume_percentage" -i "volume-$1" "${volume_percentage}%" -t 2000
  fi
}

case $1 in
  up)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    send_notification $1
    ;;
  down)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    send_notification $1
    ;;
  mute)
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    send_notification up
    ;;
esac
