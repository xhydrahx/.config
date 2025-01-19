#!/bin/bash

SYNC_DIR=$(find "$HOME" -type d -name dotfiles -print -quit)

if [ -z "$SYNC_DIR" ]; then
    echo "No dotfiles directory found in $HOME."
    exit 1
fi

# Check if the directory is a Git repository and matches the remote URL
if [ -d "$SYNC_DIR/.git" ] && git -C "$SYNC_DIR" remote get-url origin | grep -qE "git@github.com:a-cream/dotfiles(\.git)?"; then
    mkdir -p "$SYNC_DIR/.config"

    if [ -d "$HOME/.config" ]; then
        rsync -av --delete "$HOME/.config/" "$SYNC_DIR/.config/"
        echo "Synced ~/.config contents to $SYNC_DIR/.config."
    else
        echo "No ~/.config directory exists. Nothing to sync."
    fi
else
    echo "The directory is not a valid Git repository or does not match the specified remote URL."
    exit 1
fi
