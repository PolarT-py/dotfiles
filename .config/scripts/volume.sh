#!/bin/bash

# Get the action
action=$1

if [ "$action" == "up" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
elif [ "$action" == "down" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
elif [ "$action" == "mute" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
fi

volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]*%' | head -n 1)
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o 'yes\|no')

if [ "$mute" == "yes" ]; then
    dunstify -u low -i ~/.local/share/icons/hicolor/32x32/apps/CustomIcons/volume_mute.svg -h string:x-dunst-stack-tag:volume "Muted" "${volume%?}%" 
else
    if [ "${action}" == "up" ]; then
        dunstify -u low -h string:category:volume -i ~/.local/share/icons/hicolor/32x32/apps/CustomIcons/volume_plus.svg -h string:x-dunst-stack-tag:volume "Volume" "${volume%?}%"
    else
        dunstify -u low -h string:category:volume -i ~/.local/share/icons/hicolor/32x32/apps/CustomIcons/volume_minus.svg -h string:x-dunst-stack-tag:volume "Volume" "${volume%?}%"
    fi
fi
