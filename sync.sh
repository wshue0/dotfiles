#!/usr/bin/env bash

#for now only works for linux
# backup package list
cd ~/.dotfiles/
pacman -Qe > ~/.dotfiles/arch/pkglist.txt
programs=(alacritty albert dunst flameshot git gtk i3 i3-resurrect picom pistol polybar ranger rofi scripts spicetify thunar vim vis X-Settings zathura zsh lvim redshift sptlrx)
notify-send "Syncing dotfiles"
for program in "${programs[@]}"; do
  stow "$program"
done
notify-send "Dotfiles updated"
