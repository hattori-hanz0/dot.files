#!/usr/bin/env bash

FD=$(which fd)

if [ ! -z $FD ]; then
    fd -H -I -t f -x chmod 644
else
    find . -type f -exec chmod 644 {} \;
fi
