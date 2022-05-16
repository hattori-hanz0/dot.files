#!/usr/bin/env bash

PROCES=$(ps ax|fzf|awk '{print $1}')
[ -z $PROCES ] || kill -9 $PROCES
