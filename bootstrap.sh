#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

declare -A SYMLINKS=(
    [".bash_aliases"]=".bash_aliases"

    ["tmux"]=".config/tmux"
    ["nvim"]=".config/nvim" 
)

# Loop through the SYMLINKS array and create symlinks
for source_relative in "${!SYMLINKS[@]}"; do
    target_relative="${SYMLINKS[$source_relative]}"

    SOURCE_PATH="$DOTFILES_DIR/$source_relative"
    TARGET_PATH="$HOME/$target_relative"
    TARGET_PARENT_DIR=$(dirname "$TARGET_PATH")

    echo "Processing: $SOURCE_PATH -> $TARGET_PATH"

    if [ ! -e "$SOURCE_PATH" ]; then
        echo "  WARNING: Source file/directory not found: $SOURCE_PATH. Skipping."
        continue
    fi

    if [ ! -d "$TARGET_PARENT_DIR" ]; then
        echo "  Creating parent directory: $TARGET_PARENT_DIR"
        mkdir -p "$TARGET_PARENT_DIR" || { echo "  ERROR: Failed to create directory $TARGET_PARENT_DIR"; continue; }
    fi

    echo "  Creating symlink: $SOURCE_PATH -> $TARGET_PATH"
    ln -sf "$SOURCE_PATH" "$TARGET_PATH" || { echo "  ERROR: Failed to create symlink $TARGET_PATH"; continue; }

done

echo "Dotfiles setup complete!"
