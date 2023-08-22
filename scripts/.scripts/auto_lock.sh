#!/usr/bin/env bash

sleep 1; xset s off -dpms
sleep 1; xset dpms 0 0 0
# --not-when-fullscreen \
xidlehook \
    --not-when-audio \
    --timer 840 \
        'notify-send "Screen Locking In:" "1 Minute"' \
        '' \
    --timer 60 \
        '~/.scripts/lock.sh' \
        '' \
    --timer 60 \
        'systemctl suspend' \
        ''
