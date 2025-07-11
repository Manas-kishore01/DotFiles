#!/bin/bash

FILE="/sys/devices/pci0000:00/0000:00:1f.0/PNP0C09:00/VPC2004:00/conservation_mode"

if [[ ! -f "$FILE" ]]; then
    # No conservation mode interface found
    echo "<span foreground='#fb4934'>❌ C.M: N/A</span>"
    echo "Conservation Mode control not found"
    echo "#fb4934"
    exit 0
fi

STATUS=$(cat "$FILE")

if [[ "$STATUS" == "1" ]]; then
    # Conservation mode ON (charge limited)
    echo "<span font='FiraCode Nerd Font' size='11000' foreground='#fabd2f'></span> <span weight='bold' foreground='#fabd2f'>C.M ON</span>"
    echo "Battery charge limited to ~60% to preserve health"
    echo "#fabd2f"   # Amber/yellow
else
    # Conservation mode OFF (full charge)
    echo "<span font='FiraCode Nerd Font' size='11000' foreground='#b8bb26'></span> <span weight='bold' foreground='#b8bb26'>C.M OFF</span>"
    echo "Battery can charge to 100%"
    echo "#b8bb26"   # Green
fi

