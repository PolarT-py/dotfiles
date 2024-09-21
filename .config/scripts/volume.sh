#!/bin/bash

# Get the action
action=$1

volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]*%' | head -n 1)
echo "${volume%?}"

if [ "$action" == "up" -a "${volume%?}" -le "95" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
elif [ "$action" == "down" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
elif [ "$action" == "mute" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
fi

# IDK HOW TO SUBTRACT 5 FROM vOLUME
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]*%' | head -n 1)
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o 'yes\|no')

if [ "$mute" == "yes" ]; then
    dunstify -u low -i ~/.config/dunst/images/shootmyself.png -h string:x-dunst-stack-tag:volume "Volume Muted" "${volume%?}%" -h int:value:${volume} 
else
    if [ "${action}" == "up" ]; then
        dunstify -u low -h string:category:volume -i ~/.config/dunst/images/shootmyself.png -h string:x-dunst-stack-tag:volume "Volume" "${volume%?}%" -h int:value:${volume}
    else
        dunstify -u low -h string:category:volume -i ~/.config/dunst/images/shootmyself.png -h string:x-dunst-stack-tag:volume "Volume" "${volume%?}%" -h int:value:${volume}
    fi
fi
