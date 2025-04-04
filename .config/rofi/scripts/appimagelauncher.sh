#!/bin/bash

# Directory to search
DIR="$HOME/Desktop/appimages/"

# Find all executable files in the directory and subdirectories
mapfile -t FILES < <(find "$DIR" -type f -executable)

# Show only filenames in rofi, preserving spaces
SELECTED_NAME=$(printf "%s\n" "${FILES[@]##*/}" | rofi -dmenu -p "Select app" -i -theme "$HOME/.config/rofi/launchers/type-1/style-7.rasi")

# Find full path corresponding to the selected name
if [ -n "$SELECTED_NAME" ]; then
    for file in "${FILES[@]}"; do
        if [[ "$(basename "$file")" == "$SELECTED_NAME" ]]; then
            "$file" &
            break
        fi
    done
fi
