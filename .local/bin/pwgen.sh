#!/usr/bin/env bash

 . ~/.local/bin/colors

if [[ ! $(command -v pwgen) ]]; then
    msg_error "Brak programu pwgen."
    exit
fi

if [ $DISPLAY ]; then
    pwgen -c -s -n -B -1 32 | xclip -sel clip && xclip -sel clip -o
else
    pwgen -c -s -n -B -1 32
fi
