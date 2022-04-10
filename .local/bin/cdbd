#!/usr/bin/env bash

KATALOG=$(echo $PWD | sed "s|$HOME|~|")
sed -i "s|^$KATALOG$||" ~/.config/bmdirs
sed -i '/^$/d'  ~/.config/bmdirs
