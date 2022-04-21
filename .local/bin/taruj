#!/usr/bin/env bash

KATALOG=$(basename "$PWD")
KATALOG=$(echo $KATALOG | tr ' ' -)
PLIK_TAR=$(echo $KATALOG | tr -d '.' )

tar -cvf "$PLIK_TAR.tar" ../"$KATALOG"

find . -not -name "$PLIK_TAR.tar" -delete
