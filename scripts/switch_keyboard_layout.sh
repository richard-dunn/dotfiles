#!/bin/bash

if [ "$1" == "colemak" ]; then
  ln -sf ~/dotfiles/tmux/colemak_keybindings.conf ~/.tmux_keybindings.conf
  echo "Switched to Colemak-DH keybindings"
elif [ "$1" == "qwerty" ]; then
  ln -sf ~/dotfiles/tmux/qwerty_keybindings.conf ~/.tmux_keybindings.conf
  echo "Switched to QWERTY keybindings"
else
  echo "Usage: switch_tmux_layout.sh [colemak|qwerty]"
fi

tmux source-file ~/.tmux.conf
