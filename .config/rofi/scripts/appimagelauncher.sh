#!/bin/bash

# Directory to list
DIR="$HOME/Desktop/appimages/"

# Show all
SELECTED=$(ls "$DIR" | rofi -dmenu -p "Select app" -i -theme $HOME/.config/rofi/launchers/type-1/style-7.rasi)

# Select and run file
if [ -n "$SELECTED" ]; then
    ~/Desktop/appimages/"$SELECTED"
    #notify-send e ~/"$SELECTED"
fi
