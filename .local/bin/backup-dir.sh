#!/usr/bin/env bash

XZ_OPT=-8
SHRED=$(which shred)
DATA=$(date +%y%m%d-%H%M)
cd $(readlink -f "$PWD")
DIR=$(basename "$PWD")
cd ..
tar -cJf "$DIR"-"$DATA".txz -C . "$DIR"
echo "Zapisano $DIR-$DATA.txz w katalogu: $PWD"

echo -n "Zaszyfrować plik? (t/N): "
read szyfrowanie

case $szyfrowanie in
    t|T)
        gpg -c "$DIR"-"$DATA".txz
        echo "Zapisano "$DIR"-"$DATA".txz.gpg w katalogu "$PWD""
        if [ $SHRED ]; then
            shred "$DIR"-"$DATA".txz
        else
            rm "$DIR"-"$DATA".txz
        fi
        ;;
    *)
        ;;
esac
