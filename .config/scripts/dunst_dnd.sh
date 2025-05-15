#!/bin/bash

if dunstctl is-paused | grep -q true; then
	# Don't send anything because not like its gonna show
    dunstctl set-paused toggle
else
    notify-send -u low "Dunst" "🔔 Do Not Disturb is OFF"
    dunstctl set-paused toggle
fi
