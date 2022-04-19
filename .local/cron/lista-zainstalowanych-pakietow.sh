#!/usr/bin/env bash

xbps-query -l|cut -f 2 -d ' '|sed -E 's/(.+)-[^-]+/\1/'|sort > lista-zainstalowanych-pakietow.txt
