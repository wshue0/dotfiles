#!/usr/bin/env bash

# Load clock and stuff
alacritty -t vis --class vis -e vis &
alacritty --hold -t arch --class arch -o font.size=9 -e neofetch --logo &
alacritty --hold -t hexblock --class hexblock -e ~/.scripts/hex-block.sh &
alacritty --hold -t star --class star -e starfetch -r &
alacritty -t clock --class clock -e tty-clock -t -c &
alacritty --hold -t fetch --class fetch -o font.size=9 -e neofetch --stdout &
alacritty --hold -t lyrics --class lyrics -o font.size=16 -e sptlrx --current "bold,#F5C2E7" &
sleep 1

i3-msg '[class = "vis" instance = "vis"] floating enable, resize set 1200 700, move position 2303 790'
i3-msg '[class = "fetch" instance = "fetch"] floating enable, resize set 722 391, move position 949 1500'
i3-msg '[class = "arch" instance = "arch"] floating enable, resize set 567 567, move position 326 1406'
i3-msg '[class = "hexblock" instance = "hexblock"] floating enable, resize set 1550 184, move position 2180 1861'
i3-msg '[class = "star" instance = "star"] floating enable, resize set 1270 484, move position 183 631'
i3-msg '[class = "clock" instance = "clock"] floating enable, resize set 800 400, move position 2500 300'
i3-msg '[class = "lyrics" instance = "lyrics"] floating enable, resize set 1000 300, move position 2403 1525'

i3-msg '[class = "vis" instance = "vis"] move to workspace 10'
i3-msg '[class = "fetch" instance = "fetch"] move to workspace 10'
i3-msg '[class = "arch" instance = "arch"] move to workspace 10'
i3-msg '[class = "hexblock" instance = "hexblock"] move to workspace 10'
i3-msg '[class = "star" instance = "star"] move to workspace 10'
i3-msg '[class = "clock" instance = "clock"] move to workspace 10'
i3-msg '[class = "lyrics" instance = "lyrics"] move to workspace 10'

sleep 1

i3-msg "workspace --no-auto-back-and-forth 10"
