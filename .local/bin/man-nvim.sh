#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    /usr/bin/man
else
    if man -w $* >/dev/null 2>/dev/null; then
        # /usr/bin/man $* | col -b | VIMRUNTIME=$HOME/.local/nvim/share/nvim/runtime ~/.local/nvim/bin/nvim -u $HOME/.config/nvim/man.vim -
        /usr/bin/man $* | col -b | /usr/bin/nvim -u $HOME/.config/nvim/man.vim -
    else
        echo "Brak strony: $*"
    fi
fi
