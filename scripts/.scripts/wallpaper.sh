#!/usr/bin/env bash

PIC=$1

notify-send "Setting Wallpaper"

#check if argument is file first
#error out if not
if [ ! -f "${PIC}" ]

then 
  notify-send "Input must be a file!"
else

  #need to copy the pic over first
  cp ${PIC} ~/.wallpapers
  sudo cp ${PIC} /usr/share/backgrounds

  #need to override current wallpaper file with this one
  #convert to proper fileextension too
  filename=$(basename ${PIC})
  convert ~/.wallpapers/${filename} ~/.wallpapers/wallpaper.png
  
  #need to override blurred wallpaper file with this one
  #resize first
  convert ~/.wallpapers/wallpaper.png -resize 3840x2160^ ~/.wallpapers/wallpaper_blur.png
  convert ~/.wallpapers/wallpaper_blur.png -blur 0x40 ~/.wallpapers/wallpaper_blur.png
  
  #somehow set the greeter too? need sudo priv forsure
  #
  #reload fehbg right now
  ~/.config/i3/.fehbg
  notify-send "Set Wallpaper Successfully"
fi
