#!/usr/bin/env bash

PLAYER="spotifyd"

FORMAT="{{ title }} - {{ artist }}"

PSTATUS=$(playerctl status 2>/dev/null)
EXIT_CODE=$?

FILE=/tmp/now_playing_polybar_3x9bl.txt
if [ ! -f "$FILE" ]; then
    $(touch $FILE)
fi

FILE_CONTENTS=$(<$FILE)

if [ $EXIT_CODE -eq 0 ]; then
    STATUS=$PSTATUS
else
    STATUS="No player is running"
fi

TIMESTAMP=$(($(date +%s%N | cut -b1-13 ) - 30000))

if [ "$1" == "--status" ]; then
    if [ $FILE_CONTENTS -lt $TIMESTAMP -a "$STATUS" = "Paused" ]; then
            echo "Stopped"
        else
            echo "$STATUS"
        fi;
else
    if [ "$STATUS" = "Stopped" ]; then
        echo $(whoami)@$(hostname)
    elif [ "$STATUS" = "Paused"  ]; then
        if [ $FILE_CONTENTS -lt $TIMESTAMP ]; then
            echo $(whoami)@$(hostname)
        else
            playerctl metadata --format "$FORMAT"
        fi;
    elif [ "$STATUS" = "No"  ]; then
        echo "Nothing playing"
    else
        $(date +%s%N | cut -b1-13 > $FILE)
        playerctl metadata --format "$FORMAT"
    fi
fi
