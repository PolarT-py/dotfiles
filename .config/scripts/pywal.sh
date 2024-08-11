#!/bin/bash

# Get current wallpaper
WALLPAPER=$(grep 'preload' ~/.config/hypr/hyprpaper.conf | sed 's/preload = //')
echo "Wallpaper path: $WALLPAPER"

# Pywal stuff
wal -i "$WALLPAPER"

killall waybar && waybar &
