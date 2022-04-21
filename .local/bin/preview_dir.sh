#!/usr/bin/env bash

KATALOG=$(readlink -f "$1")
/usr/bin/tree -L 1 $KATALOG
