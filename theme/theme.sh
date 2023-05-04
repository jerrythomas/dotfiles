#!/bin/zsh

./hardware.zsh
open "Dark Clarity.terminal"
osascript -e "tell application \"Terminal\" to set default settings to settings set \"Dark Clarity\""
