#!/usr/bin/env bash

# lista plikow

if [ $# -eq 0 ]; then
    ARG="."
else
    ARG="$@"
fi

exa $ARG -al --group-directories-first --git --header
