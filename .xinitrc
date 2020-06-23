#!/bin/sh

userresources=$HOME/.Xresources
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# Configure multihead
xrandr --output DP-1.8 --primary --preferred --auto --pos 0x0 --output HDMI-0 --rotate left --pos -1440x-555

# Run reconfigure script
cm --reconfigure

# Launch WM
exec i3
