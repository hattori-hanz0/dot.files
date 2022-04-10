#!/usr/bin/env bash

# INFO: Skrypt instalacyjny

# pełna ścieżka oraz nazwa pliku
SKRYPT="$PWD/$(basename $0)"
# nazwa pliku
PLIK=${SKRYPT##*/}
# katalog skryptu
KATALOG=${SKRYPT%$PLIK}

BACKUP_DIR="$HOME/.local/backup"
mkdir -p $BACKUP_DIR

DATA=$(date +%F-%T | tr : -)
DATABS=$(date +%F-%T | tr : - | tr -d -)

XZ_T=2  # ilość wątków
XZ_C=5  # stopień kompresji

# wczytuje zawartosc skryptu colors
. $KATALOG/.local/bin/colors

# Tworzy katalogi
mkdir -p $HOME/git

# echo -n "Wykonać kopię zapasową bieżących plików konfiguracyjnych [T/n]: "
# read odp
#
# case $odp in
#     n|N)
#         ;;
#     *|T|t)
#         backup
#         ;;
# esac

$KATALOG/backup.sh

function kopiuj() {
    DATA=$(date +%F-%T | tr : -)
    cd $KATALOG
    while IFS='' read -r LINE || [[ -n "$LINE" ]]; do
        if [ -f "$LINE" ]; then
            cp $LINE $HOME/$LINE
        fi
        if [ -d "$LINE" ]; then
            cp -r $LINE $(dirname $HOME/$LINE)
        fi
    done < "$KATALOG/install_lista_plikow.txt"
    echo
    msg_ok "Instalacja zakonczona."
    echo
}

kopiuj
