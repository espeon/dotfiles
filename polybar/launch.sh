#!/usr/bin/env bash

killall -q polybar

echo "---" | tee -a /tmp/polybar.log
polybar -c /home/natalie/.config/worm/polybar/config.ini main 2>&1 | tee -a /tmp/polybar.log & disown
echo "Bars launched..."

