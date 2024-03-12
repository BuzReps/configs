#!/bin/sh

# Host-specific display layout. Better be in separate script
xrandr --output VGA-1 --off \
	--output DVI-D-1 --off \
	--output DVI-D-2 --off \
	--output DisplayPort-1-1 --off \
	--output HDMI-2          --mode 1920x1080 --rate 75 --pos 0x420    --rotate normal \
	--output HDMI-A-1-0      --mode 1920x1080 --rate 75 --pos 1920x420 --rotate normal \
	--output DisplayPort-1-0 --mode 1920x1080 --rate 75 --pos 3840x0   --rotate right

# Disable screensaver
xset -dpms
xset s off

setxkbmap -layout us,ru
setxkbmap -option 'grp:ctrl_space_toggle'
# 'CAPS' key duplicates 'Win'
setxkbmap -option 'caps:super'

# Keyboard key repeat delay in ms and repeats per second
xset r rate 200 30

