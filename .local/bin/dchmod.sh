#!/usr/bin/env bash

FD=$(which fd)

if [ ! -z $FD ]; then
    fd -H -I -t d -x chmod 755
else
    find . -type d -exec chmod 755 {} \;
fi
