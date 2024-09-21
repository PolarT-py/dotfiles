#!/bin/bash

killall mpvpaper ; \
killall swww-daemon ; \
mpvpaper -o "input-ipc-server=/tmp/mpv-socket --loop shuffle" '*' ~/Videos/video_wallpapers ; \
sleep 3 ; \
~/.config/scripts/pywal_mpvpaper.sh
