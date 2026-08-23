#!/bin/bash

cd ~

read -p "Enter a message: " msg

git add .config/hypr .config/rofi .config/quickshell .config/kitty .config/nvim .config/yazi .zshrc install.sh push.sh

git commit -m "$msg"

git push -u origin main
