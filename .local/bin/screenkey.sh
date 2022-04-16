#!/usr/bin/env bash

ps ax | grep /usr/bin/screenkey | grep -v grep

if [ "$?" -eq 0 ]; then
    pkill -9 screenkey
else
    /usr/bin/screenkey
fi
