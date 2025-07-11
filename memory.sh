#!/bin/bash
export LANG=en_US.UTF-8

mem=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')
echo "<span color='#83a598'></span> $mem"
