#!/bin/bash

symdir="/path/to/symdir"
txt_dir="/path/to/txt_files"

# Create the directory for .txt files if it doesn't exist
mkdir -p "$txt_dir"

# Iterate through symbolic links in the specified directory
for link in $(find "$symdir" -type l)
do
    loc="$(dirname "$link")"
    target="$(readlink "$link")"
    
    # Check if the target is a Git website
    if [[ "$target" == *"git"* ]]; then
        # Create a .txt file with link information
        echo "Symbolic link pointing to Git website: $link -> $target" > "$txt_dir/$(basename $link).txt"
        # Disable the link
        rm "$link"
    else
        # Replace the symbolic link with a real copy
        mv "$target" "$loc"
        rm "$link"
    fi
done
q