#!/usr/bin/env bash

i3lock --no-unlock-indicator --scale --no-verify -i ~/.wallpapers/wallpaper_blur.png &
sleep 30
pkill i3lock
# Start Wallpaper
#exec ~/.fehbg &
