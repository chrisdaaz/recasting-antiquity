#!/bin/bash

# Set the directory containing the images
#dir="./life-and-the-afterlife/catalog"

# Set the desired maximum length of the longer side
max_length=1800

# Iterate over all files in the directory
for file in *
do
    # Get image dimensions
    dimensions=$(convert "$file" -ping -format '%w %h\n' info:)
    width=$(echo $dimensions | awk '{print $1}')
    height=$(echo $dimensions | awk '{print $2}')

    # Check which side is longer
    if (( width > height )); then
        # Width is longer
        convert "$file" -resize x"$max_length" -strip -quality 80 "$file"
    else
        # Height is longer
        convert "$file" -resize "$max_length"x -strip -quality 80 "$file"
    fi

    # Check if the file is a TIFF
    if [ ${file: -4} == ".tif" ]; then
        # Convert TIFF to JPG
        convert "$file" "${file%.*}.jpg"
    fi
done
