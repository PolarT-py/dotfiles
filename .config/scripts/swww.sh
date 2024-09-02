#!/bin/bash

if [ -z "$1" ]; then
  echo "Please provide a directory."
  exit 1
fi

if [ ! -d "$1" ]; then
  echo "The provided argument is not a valid directory."
  exit 1
fi

# get random
random_file=$(ls -p "$1" | grep -v / | shuf -n 1)

if [ -z "$random_file" ]; then
  echo "No files found in the directory."
  exit 1
fi

echo "$1/$random_file"

export SWWW_TRANSITION_FPS=60

swww img --transition-type wipe --transition-pos 0.5,0.98 --transition-step 255 "$1/$random_file"
