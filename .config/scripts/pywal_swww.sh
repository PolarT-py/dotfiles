#!/bin/bash

# Get current wallpaper
WALLPAPER=$(swww query | grep 'currently displaying:' | awk -F'image: ' '{print $2}' | awk '{print $1}')

if [ -z "$WALLPAPER" ]; then
    echo "Error: Could not retrieve wallpaper path."
    exit 1
fi

echo "Wallpaper path: $WALLPAPER"

# Pywal stuff
wal -i "$WALLPAPER"

killall waybar && waybar &
