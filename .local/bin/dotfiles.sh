#!/usr/bin/env bash

# alias do edycji skryptu to: .df

. ~/.config/vars

ARR=(
    ~/.bashrc
    ~/.config/alacritty/alacritty.yml
    ~/.config/aliases
    ~/.config/bmdirs
    ~/.config/conky/conky.conf
    ~/.config/i3/config
    ~/.config/i3/sxhkdrc
    ~/.config/nvim/init.vim
    ~/.config/sxhkd/sxhkdrc
    ~/.config/vars
    ~/.gitconfig
    ~/.ssh/config
    ~/.tmux.conf
    ~/.tmux-lff.conf
    ~/.vim/vimrc
    ~/.Xresources
    ~/.zshrc
    )

PLIK=$(printf '%s\n' "${ARR[@]}"|fzf)

if [ "$PLIK" ]; then
   $EDITOR "$PLIK"
fi
