#!/usr/bin/env bash

. ~/.config/vars

SEARCH=$(sk --ansi -i -c 'rg --color=always --hidden --line-number "{}"' \
    --bind "ctrl-p:toggle-preview" --preview "preview.sh {}" \
    --preview-window=down:50%:hidden)

readarray -td: array <<<"$SEARCH"

FILE=${array[0]}
LINE=${array[1]}
ARRAY_NOE=${#array[@]}

if [ $ARRAY_NOE -gt 1 ]; then
    $EDITOR $FILE +$LINE
fi
