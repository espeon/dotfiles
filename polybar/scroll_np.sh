#!/usr/bin/env bash

# see man zscroll for documentation of the following parameters
zscroll -l 50 \
        --delay 0.3 \
        --scroll-padding "  " \
        --match-command "/home/natalie/.config/worm/polybar/get_np.sh --status" \
        --match-text "Playing" "--scroll 1 --before-text 'ﱘ 契 '" \
        --match-text "Paused" "--scroll 0 --before-text 'ﱘ  '" \
        --match-text "Stopped" "--scroll 0 --before-text '卑 '"\
        --update-interval=5 \
        --update-check true "/home/natalie/.config/worm/polybar/get_np.sh" &

wait
