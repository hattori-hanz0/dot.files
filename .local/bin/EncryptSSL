#!/usr/bin/env bash

if [[ $# < 1 ]]; then
    echo Podaj nazwę pliku do zaszyfrowania.
    echo $ enc plik.txt
    return 1
else
    if [ ! -e $1 ]; then
        echo Podany plik nie istnieje
    else
        openssl aes-256-cbc -a -salt -in "$1" -out "$1.enc";
    fi
fi
