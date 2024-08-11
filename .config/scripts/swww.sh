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

swww img --transition-type grow --transition-pos 0.854,0.977 --transition-step 90 "$1/$random_file"
