#!/bin/bash
export LANG=en_US.UTF-8

BAT_PATH=""
for BAT in /sys/class/power_supply/BAT*; do
    if [ -f "$BAT/capacity" ]; then
        BAT_PATH=$BAT
        break
    fi
done

if [ -z "$BAT_PATH" ]; then
    echo "<span color='#fb4934'>No Battery</span>"
    echo "<span color='#fb4934'>No Battery</span>"
    exit 0
fi

PERCENT=$(cat "$BAT_PATH/capacity")
STATUS=$(cat "$BAT_PATH/status" | tr '[:upper:]' '[:lower:]')

# Choose icon
if [[ "$STATUS" == "charging" ]] || [[ "$STATUS" == "full" ]]; then
    ICON=""
else
    if [ "$PERCENT" -ge 90 ]; then ICON=""
    elif [ "$PERCENT" -ge 70 ]; then ICON=""
    elif [ "$PERCENT" -ge 50 ]; then ICON=""
    elif [ "$PERCENT" -ge 20 ]; then ICON=""
    else ICON=""
    fi
fi

# Try to get time from acpi
ACPI_OUT=$(acpi -b 2>/dev/null)
TIME_REMAIN=$(echo "$ACPI_OUT" | grep -oP '\d{2}:\d{2}' | head -n1)

if [[ "$STATUS" == "charging" ]]; then
    HOVER="Charging – $TIME_REMAIN until full"
elif [[ "$STATUS" == "discharging" ]]; then
    HOVER="$TIME_REMAIN remaining"
else
    HOVER="Fully charged"
fi

# Line 1 = full_text (on hover), Line 2 = short_text (in bar)
echo "<span color='#d79921'>$ICON</span> ${PERCENT}% – $HOVER"
echo "<span color='#d79921'>$ICON</span> ${PERCENT}%"

