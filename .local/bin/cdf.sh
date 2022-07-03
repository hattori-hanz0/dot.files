#!/usr/bin/env bash

GLEBOKOSC=2

if [ ! -z $1 ]; then
    cd "$1"
fi

KATALOG="$(fd -L -t d -d $GLEBOKOSC | fzf --preview="fd --full-path {}")"

# zabezpiecza przed wykonaniem komendy z pustyą zmienną $KATALOG czyli "cd "
if [ ! -z $KATALOG ]; then
    cd "$KATALOG"
fi
