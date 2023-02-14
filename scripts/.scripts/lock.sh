#!/usr/bin/env bash

# when blurring a new image, use command 
# convert file1 -blur 0x40 file2

#koi colors
# taps=FFFFFF
# circ=F5DEB3
# wrong=B53737
#cat colors
taps=FFFFFF
circ=F5C2E7
wrong=F28FAD


i3lock -k -i ~/.wallpapers/gits_blur.png \
    --verif-text="" --wrong-text="" --noinput-text="" \
    --{inside,ring}-color=$circ \
    --{inside,ring}wrong-color=$wrong \
    --{inside,ring}ver-color=$taps \
    --line-uses-inside \
    --{bs,key}hl-color=$taps \
    --ind-pos="w/2:3*h/4" \
    --radius 40 \
    --separator-color=$taps \
    --ring-width 15 \
    --time-pos="w/2:0.4*h"\
    --date-pos="w/2:h/2"\
    --time-color=FFFFFF\
    --time-str="%I:%M"\
    --date-color=FFFFFF\
    --date-str="%A, %B %d"\
    --time-size=200\
    --date-size=50\
    --{verif,wrong,greeter,modif}outline-color=$taps
    
