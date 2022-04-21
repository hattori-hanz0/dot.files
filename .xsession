#!/usr/bin/env bash

. ~/.config/vars

if [ ! -d ~/tmp ]; then
    mkdir -p ~/tmp
fi

echo "$(date) Startuje interfejs graficzny" >> ~/tmp/logfile
