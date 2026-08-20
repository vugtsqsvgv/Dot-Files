#!/bin/bash

git add .config/hypr .config/rofi .config/quickshell .config/kitty .config/nvim/lua .zshrc install.sh push.sh

git commit -m "$1"

git push -u origin main
