#!/usr/bin/env bash

PROCES=$(ps ax | fzf -m --height=100% | awk '{print $1}')
[ -z $PROCES ] || kill -9 $PROCES
