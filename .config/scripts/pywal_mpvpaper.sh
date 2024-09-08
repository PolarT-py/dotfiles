#!/bin/bash

# THIS CODE IS SO POORLY MADE I DECLARE THIS AS NUCLEAR BOBM

echo "HINT: make sure that you currently have mpvpaper up and running!"

# Create image cache folder
mkdir -p ~/.cache/pywal_vid_frames/

# Get video path
file=$(echo '{ "command": ["get_property", "path"] }' | socat - /tmp/mpv-socket | jq -r '.data')

echo "$file"

# Check if success
if [ -z "$file" ]; then
    echo "Error: Could not retrieve video path. (You might need the packages 'jq' and 'socat')"
    exit 1
fi

# get image stuff
output_folder="$HOME/.cache/pywal_vid_frames/"
base_name=$(basename "$file" .mp4)
image=$(basename "$file" .png)

echo "IIIIIIIIIMMMMMMMMMAGEEE ${output_folder}${image}"
echo "${image}.png"
echo "${output_folder}"

# check if theres already another copy
if [ -f "${output_folder}${image}.png" ]; then
    echo "DEBUG: EXISTS"

	# Set colors
	echo "IMAGE PATH:::::: ${output_folder}${image}.png"
	wal -i "${output_folder}${image}.png"
	killall waybar && waybar &
    exit 1
else
    echo "DEBUG: DOESNT EXIST, CREATING ONE"
fi

# get current frame
current_time=$(echo '{ "command": ["get_property", "time-pos"] }' | socat - /tmp/mpv-socket | jq .data)
fps=$(echo '{ "command": ["get_property", "container-fps"] }' | socat - /tmp/mpv-socket | jq .data)
current_frame=$(echo "$current_time * $fps" | bc)

ffmpeg -y -i "$file" -vf "select=eq(n\,${current_frame})" -frames:v 1 "${image}.png"
mv "${image}.png" "$output_folder"

echo "EEEEEE EEEEEEEEEEE EEEEEE ^&(*&*&(*&**(&*(&(*&(*&(* $(ls ~/.cache/pywal_vid_frames/)"

# Check if success x2
if [ -z "$image" ]; then
    echo "Error: Could not retrieve image. (you might need the package 'ffmpeg' and 'bc')"
fi


# Set colors
echo "IMAGE PATH:::::: ${output_folder}${image}.png"
wal -i "${output_folder}${image}.png"

killall waybar && waybar &
