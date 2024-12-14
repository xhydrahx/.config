#!/bin/bash

if [ -d "$HOME/.config" ]; then
  rsync -av --delete .config/ "$HOME/.config/"
else
  mkdir -p "$HOME/.config"
  rsync -av --delete .config/ "$HOME/.config/"
fi
