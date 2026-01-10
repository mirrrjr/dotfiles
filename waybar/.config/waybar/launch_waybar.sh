#!/bin/bash

# Eski waybar jarayonlarini to'xtatish
killall -q waybar

# Waybar to'liq to'xtatilguncha kutish
while pgrep -x waybar >/dev/null; do sleep 0.1; done

# Waybar ni ishga tushirish
waybar &

echo "Waybar launched..."
