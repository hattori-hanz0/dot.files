#!/usr/bin/env bash

cd $HOME
KATALOG="$(fd -L -t d -d 3 | fzf --preview="fd --full-path {}")"

if [ ! -z $KATALOG ]; then
    cd "$KATALOG"
else
    cd - > /dev/null
fi
