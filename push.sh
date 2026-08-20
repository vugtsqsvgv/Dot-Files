#!/bin/bash

git add -f .config/hypr .config/rofi .config/quickshell .config/kitty .config/nvim .zshrc install.sh push.sh

git commit -m "$1"

git push -u origin main
