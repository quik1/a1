#!/bin/bash

FIXER_DIR="$HOME/Downloads/Fixer"
DIRTY_DIR="$FIXER_DIR/Dirty"
CLEAN_DIR="$FIXER_DIR/Clean"

# Ensure the existence of Fixer directory and its subdirectories
mkdir -p "$FIXER_DIR" "$DIRTY_DIR" "$CLEAN_DIR"

# Function to fix and move .sh files
fix_and_move() {
    echo "Fixing and moving files..."
    for file in "$DIRTY_DIR"/*.sh; do
        if [ -f "$file" ]; then
            echo "Processing file: $file"
            chmod 777 "$file"
            mv -v "$file" "$CLEAN_DIR/"
        fi
    done
}

# Watch for changes in the Dirty directory
while true; do
    # Fix and move files only if there are .sh files in the Dirty directory
    if [ "$(find "$DIRTY_DIR" -maxdepth 1 -type f -name "*.sh" | wc -l)" -gt 0 ]; then
        # Fix and move files
        fix_and_move
    else
        # No .sh files in the Dirty directory, wait for changes
        sleep 5
    fi
done
