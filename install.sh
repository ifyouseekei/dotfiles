#!/usr/bin/env bash
DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

declare -a config=(
  "sway"
  "solaar"
  "rofi"
  "kanshi"
  "waybar"
  "foot"
)

for i in "${config[@]}"; do
  rm -rf $HOME/.config/$i
  ln -s $DOTFILES/$i $HOME/.config/$i
  echo "Symlinked" $i
done
