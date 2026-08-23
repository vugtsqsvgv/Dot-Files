#!/bin/bash

selected=$(find ~/.config/kitty/sessions/ -type f | fzf)
kitty @ action goto_session "$selected"
