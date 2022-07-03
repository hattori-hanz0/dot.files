#!/usr/bin/env bash

PROCESY=$(ps -hxo pid,cmd | fzf -m --reverse --height=100% --header='[kill:process]' --prompt "Wyszukaj: " | awk '{print $1}')

PROCESY_ARRAY=($PROCESY)

for ITEM in "${PROCESY_ARRAY[@]}"; do
    echo "Zabijam proces $ITEM :("
    kill -9 $ITEM
done
