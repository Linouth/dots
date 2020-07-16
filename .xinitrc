#!/bin/sh

userresources=$HOME/.Xresources
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# Configure multihead
automon

# Run reconfigure script
cm --reconfigure

# Launch WM
exec i3
