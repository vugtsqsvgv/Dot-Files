#!/bin/bash

selected=$(find ~/.config/kitty/scripts/launch/ -type f | fzf)
"$selected"
