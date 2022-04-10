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
mkdir -p $BACKUP_DIR

function backup() {
    DATA=$(date +%F-%T | tr : -)
    mkdir -p $BACKUP_DIR/$DATA
    cd $HOME
    while IFS='' read -r LINE || [[ -n "$LINE" ]]; do
        if [ -e $LINE ]; then
            PLIK_BKP=${LINE#$HOME/}  # usuwa katalog domowy $HOME ze sciezki pliku
            cp -Lr --parents $PLIK_BKP $BACKUP_DIR/$DATA/
        fi
    done < "$KATALOG/install_lista_plikow.txt"
    # archiwizacja
    tar -cf $BACKUP_DIR/$DATA.tar -C $BACKUP_DIR/$DATA .
    xz --threads=$XZ_T -$XZ_C $BACKUP_DIR/$DATA.tar
    rm -rf $BACKUP_DIR/$DATA
    echo
    msg_info "Kopia zapasowa plikow konfiguracyjnych: $BACKUP_DIR/$DATA.tar.xz"
    echo
}

backup
