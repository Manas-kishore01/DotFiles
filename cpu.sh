#!/bin/bash
export LANG=en_US.UTF-8

# Read CPU fields twice, 1 second apart
read cpu user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat
sleep 1
read cpu2 user2 nice2 system2 idle2 iowait2 irq2 softirq2 steal2 guest2 guest_nice2 < /proc/stat

# Calculate deltas
idle_diff=$((idle2 - idle))
total_diff=$(( (user2+nice2+system2+idle2+iowait2+irq2+softirq2+steal2) - (user+nice+system+idle+iowait+irq+softirq+steal) ))

usage=$(( (100 * (total_diff - idle_diff)) / total_diff ))

echo "<span color='#b8bb26'></span> ${usage}%"
