#!/usr/bin/env bash

INCREASE=$1

if [[ $INCREASE == 1 ]]; then
  ddcutil setvcp 10 + 15
else
  ddcutil setvcp 10 - 15
fi
VAL=$(ddcutil getvcp 10 | awk '{ print $9 }' | rev | cut -c 2- | rev)
notify-send "Screen Brightness: ${VAL}"
