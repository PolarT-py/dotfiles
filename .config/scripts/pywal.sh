#!/bin/bash

# Get current wallpaper
WALLPAPER=$(grep 'preload' ~/.config/hypr/hyprpaper.conf | sed 's/preload = //')
echo "Wallpaper path: $WALLPAPER"

# Pywal stuff
wal -i "$WALLPAPER"

# Update colors
cat > ~/.config/waybar/colors <<EOL
{
    "background": "${background}",
    "foreground": "${foreground}",
    "color1": "${color1}",
    "color2": "${color2}",
    "color3": "${color3}"
}
EOL

killall waybar && waybar &
