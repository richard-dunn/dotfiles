#!/bin/bash

if [ "$1" == "colemak" ]; then
  echo "colemak" > ~/.keyboard_layout
  echo "Remember to restart neovim"
elif [ "$1" == "qwerty" ]; then
  echo "qwerty" > ~/.keyboard_layout
  echo "Remember to restart neovim"
else
  cat ~/.keyboard_layout
fi

tmux source-file ~/.tmux.conf
