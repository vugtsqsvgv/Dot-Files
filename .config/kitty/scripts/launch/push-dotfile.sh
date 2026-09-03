#!/bin/bash

cd ~

read -p "Enter a message: " msg

git add .config/hypr .config/rofi .config/quickshell .config/kitty .config/nvim .config/yazi .p10k.zsh .zshrc install.sh Pictures/Wallpapers

git commit -m "$msg"

git push -u origin main
