#!/usr/bin/env bash

DATA=$(date +%F-%T)

if [ $# -eq 1 ]; then
    KATALOG=$(readlink -m $(dirname "$1"))
    cd "$KATALOG"
fi

if [ "$(basename $0)" == "gps" ]; then
    git add -A && git commit -S -m $DATA && git push
else
    git add -A && git commit -m $DATA && git push
fi
