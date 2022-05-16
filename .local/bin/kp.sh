#!/usr/bin/env bash

PROCES=$(ps -hxo pid,cmd | fzf -m --height=100% --header='[kill:process]' --prompt "Wyszukaj: " | awk '{print $1}')
[ -z $PROCES ] || kill -9 $PROCES
