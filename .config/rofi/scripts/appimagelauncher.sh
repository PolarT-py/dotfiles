#!/bin/bash

# Directory to list
DIR="$HOME/Desktop/appimages/"

# Show all
SELECTED=$(ls "$DIR" | rofi -dmenu -p "Select app" -i)

# Select and run file
if [ -n "$SELECTED" ]; then
    ~/Desktop/appimages/"$SELECTED"
    #notify-send e ~/"$SELECTED"
fi
