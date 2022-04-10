#!/usr/bin/env bash

read -p "Podaj opis wklejki: "
OPIS="$REPLY"

echo "Wybierz plik"
PLIK=$(ls | fzf)

echo $OPIS

echo $PLIK

read -p "Czy gist ma być publiczny? [T/n]: "
case $REPLY in
    t | T) gh gist create "$PLIK" -d "$OPIS" -p -w ;;
    n | N) gh gist create "$PLIK" -d "$OPIS" -w ;;
    *) gh gist create "$PLIK" -d "$OPIS" -p -w ;;
esac
