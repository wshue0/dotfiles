#!/usr/bin/env bash

#for now only works for linux
programs=(alacritty albert arch dunst flameshot git gtk i3 i3-resurrect picom pistol polybar ranger rofi scripts spicetify thunar vim vis X-Settings zathura zsh)
notify-send "Syncing dotfiles"
for program in "${programs[@]}"; do
  stow "$program"
done
notify-send "Dotfiles updated"
