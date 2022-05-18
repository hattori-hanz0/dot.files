#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    mount | column -t
else
    sudo mount "$@"
fi
