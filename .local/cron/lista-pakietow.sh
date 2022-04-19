#!/usr/bin/env bash

xbps-query -Rsl|cut -f 2 -d ' '|sed -E 's/(.+)-[^-]+/\1/'|sort > lista-pakietow.txt
