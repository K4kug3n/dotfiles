#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

declare -A SYMLINKS=(
    [".bash_aliases"]=".bash_aliases"
    [".zshrc"]=".zshrc"

    ["tmux"]=".config/tmux"
    ["nvim"]=".config/nvim"
    ["sway"]=".config/sway"
    ["waybar"]=".config/waybar"

    ["themes"]=".config/themes"
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

    # Removing step
    if [ -e "$TARGET_PATH" ] || [ -L "$TARGET_PATH" ]; then
        echo "  Removing existing config at: $TARGET_PATH"
        rm -rf "$TARGET_PATH" || { echo "  ERROR: Failed to remove $TARGET_PATH"; continue; }
    fi

    if [ ! -d "$TARGET_PARENT_DIR" ]; then
        echo "  Creating parent directory: $TARGET_PARENT_DIR"
        mkdir -p "$TARGET_PARENT_DIR" || { echo "  ERROR: Failed to create directory $TARGET_PARENT_DIR"; continue; }
    fi

    echo "  Creating symlink: $SOURCE_PATH -> $TARGET_PATH"
    ln -sf "$SOURCE_PATH" "$TARGET_PATH" || { echo "  ERROR: Failed to create symlink $TARGET_PATH"; continue; }

done

# Setup themectl
THEMECTL_SOURCE="$DOTFILES_DIR/themes/themectl"
THEMECTL_TARGET="$HOME/.local/bin/themectl"

if [ -f "$THEMECTL_SOURCE" ]; then
    chmod +x "$THEMECTL_SOURCE"
    ln -sf "$THEMECTL_SOURCE" "$THEMECTL_TARGET"
    echo "Themectl installed to $THEMECTL_TARGET"
else
    echo "WARNING: themectl script not found in $THEMECTL_SOURCE"
fi

echo "Dotfiles setup complete!"
