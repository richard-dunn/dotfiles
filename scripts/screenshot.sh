#!/bin/bash

monitorID=$(hyprctl activeworkspace | grep monitorID: | awk '{print $2}')
monitorName=$(hyprctl monitors | grep "ID $monitorID" | awk '{print $2}')

output=~/screenshots/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png

echo $2

if [ "$1" == "screen" ]; then
  grim -c -o $monitorName $output

  if [ "$2" == "annotate" ]; then
    convert "$output" -resize 50% ~/screenshots/annotated_"$(basename $output)"
    ksnip -e ~/screenshots/annotated_"$(basename $output)"
  else
    cat "$output" | wl-copy
  fi

elif [ "$1" == "area" ]; then
  geometry=$(slurp)
  grim -c -g "$geometry" "$output"
  cat "$output" | wl-copy

elif [ "$1" == "window" ]; then
  windowPosition=$(hyprctl activewindow | grep "at:" | awk '{print $2}')
  windowSize=$(hyprctl activewindow | grep "size:" | awk '{print $2}' | sed 's/,/x/g')
  geometry="$windowPosition $windowSize"

  grim -c -g "$geometry" "$output"
  cat "$output" | wl-copy

elif [ "$1" == "last" ]; then
  ls -t ~/screenshots/*.png | head -n 1
fi
