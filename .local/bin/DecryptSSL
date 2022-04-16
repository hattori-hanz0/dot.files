#!/usr/bin/env bash

if [[ $# < 1 ]]; then
    echo Podaj nazwę pliku do odszyfrowania.
    echo $ dec plik.txt.enc
    return 1
fi
if [ ! -e $1 ]; then
    echo "Podany plik ($1) nie istnieje."
    return 1
else
    openssl aes-256-cbc -d -a -in "$1" -out $(basename $1 .enc);
fi
