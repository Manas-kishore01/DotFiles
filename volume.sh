#!/bin/bash

VOL=$(pamixer --get-volume)
MUTE=$(pamixer --get-mute)
ICON=""
COLOR="#98971a"  # Gruvbox green

if [ "$MUTE" = "true" ]; then
    ICON=""   # Muted icon
    COLOR="#fb4934"  # Gruvbox red
else
    if [ "$VOL" -ge 70 ]; then
        ICON=""  # Loud
    elif [ "$VOL" -ge 30 ]; then
        ICON=""  # Medium
    else
        ICON=""  # Low
    fi
fi

echo "$ICON ${VOL}%"
