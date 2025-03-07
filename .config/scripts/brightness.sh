#!/bin/bash

action=$1

if [ "$action" == "up" ]; then
    brightnessctl set +10%
elif [ "$action" == "down" ]; then
    brightnessctl set 10-%
fi

output=$(brightnessctl -m)
current=$(echo $output | awk -F, '{print $4}')
max=$(echo $output | awk -F, '{print $5}')

percentage=$(( 100 * current / max ))

if [ "$action" == "up" ]; then
    dunstify -u low -h string:category:volume -h string:x-dunst-stack-tag:volume "Brightness" "${current}" -i ~/.config/dunst/images/shootmyself_.png -h int:value:${current}
elif [ "$action" == "down" ]; then
    dunstify -u low -h string:category:volume -h string:x-dunst-stack-tag:volume "Brightness" "${current}" -i ~/.config/dunst/images/shootmyself_.png -h int:value:${current}
fi
