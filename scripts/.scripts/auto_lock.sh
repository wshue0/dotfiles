#!/usr/bin/env bash

xset s off -dpms
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
