#!/bin/sh

userresources=$HOME/.Xresources
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -d "$HOME/bin" ]; then
    PATH="$PATH:$HOME/bin"
fi

# Prepare optimus-manger
prime-offload

# Run reconfigure script
# rtk reconfigure
cm --reconfigure

# Launch WM
case "$2" in
	awesome|aw) exec awesome;;
    custom)     exec "~/src/TinyWM/a.out";;
    test)       exec "~/src/TinyWM/test";;
    dwm)        exec "~/src/dwm/dwm";;
	*)          exec i3;;
esac
