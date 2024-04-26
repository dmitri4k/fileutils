#!/bin/bash

# Loop through all .zip files in the current directory and subdirectories
find . -type f -name "*.zip" | while read file; do
    # Get the parent folder name using dirname
    parent_folder=$(basename "$(dirname "$file")")

    # Get the parent of the parent folder name
    grandparent_folder=$(basename "$(dirname "$(dirname "$file")")")

    # Rename the .zip file to include parent and grandparent folder names
    mv "$file" "$(dirname "$file")/${grandparent_folder}.${parent_folder}.zip"
done