#!/usr/bin/env bash

i3-resurrect restore -w 1 --layout-only
i3-resurrect restore -w 2 --layout-only
i3-resurrect restore -w 3 --layout-only
i3-resurrect restore -w 4 --layout-only
i3-resurrect restore -w 5 --layout-only
i3-resurrect restore -w 6 
i3-resurrect restore -w 7 --layout-only
i3-resurrect restore -w 8 --layout-only
i3-resurrect restore -w 9 
#i3-resurrect restore -w 10
i3-resurrect restore -w __i3_scratch --layout-only
sleep 5
brave &
sleep 5
caprine &
sleep 5
i3-msg "[floating] move scratchpad" 
picom -b --experimental-backends &
~/.scripts/widgets.sh
