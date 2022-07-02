#!/usr/bin/env bash

vim $(ls ~/.vim/vimrc ~/.vim/\*.vim|fzf -m --tac --prompt="Wybierz plik do edycji: ")
