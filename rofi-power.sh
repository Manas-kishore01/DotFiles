#!/bin/bash

options="<span foreground='#fb4934'>⏻</span> Shutdown
<span foreground='#d79921'>🔄</span> Reboot
<span foreground='#b8bb26'>🚪</span> Logout
<span foreground='#83a598'>🔒</span> Lock
<span foreground='#d3869b'>🌙</span> Suspend"

chosen=$(echo -e "$options" | rofi -dmenu -markup-rows -p "Power Menu" -theme ~/.config/rofi/powermenu.rasi)

clean_choice=$(echo "$chosen" | sed -E 's/<[^>]+>//g')

case "$clean_choice" in
    *Shutdown) systemctl poweroff ;;
    *Reboot) systemctl reboot ;;
    *Logout) i3-msg exit ;;
    *Lock) i3lock ;;
    *Suspend) systemctl suspend ;;
    *) exit 0 ;;
esac
