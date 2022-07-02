#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "Podaj nazwę katalogu."
    exit
fi

KAT="$1"
mkdir -p "$KAT"
cd "$KAT"
