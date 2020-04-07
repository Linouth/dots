#!/usr/bin/zsh

if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] then
    while true; do
        /home/marten/bin/start;
    done
fi
