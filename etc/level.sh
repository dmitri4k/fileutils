#!/bin/bash

# Loop through all folders on the first level
for dir in */; do
    # Check if the item is a directory
    if [ -d "$dir" ]; then
        # Loop through all files in folders on the second level
        for file in "$dir"*/**/*; do
            # Check if the item is a file
            if [ -f "$file" ]; then
                # Move the file to the folder on the first level
                mv "$file" "$dir"
            fi
        done
    fi
done