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

XZ_T=2 # ilość wątków
XZ_C=5 # stopień kompresji

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
    done <"$KATALOG/install_lista_plikow.txt"
    echo
    msg_ok "Instalacja zakonczona."
    echo
}

kopiuj

function instalacja_dodatkowego_oprogramowania() {
    mkdir -p $HOME/src
    if [ -d $HOME/src/i3ass ]; then
        rm -rf $HOME/src/i3ass
    fi
    if [ -d $HOME/src/clipmenu ]; then
        rm -rf $HOME/src/clipmenu
    fi
    if [ -d $HOME/src/clipnotify ]; then
        rm -rf $HOME/src/clipnotify
    fi
    git clone https://github.com/budlabs/i3ass $HOME/src/i3ass
    git clone https://github.com/cdown/clipmenu $HOME/src/clipmenu
    git clone https://github.com/cdown/clipnotify $HOME/src/clipnotify
}

instalacja_dodatkowego_oprogramowania

function instalacja_clipnotify {
    sudo xbps-install xorgproto libX11-devel libXfixes-devel
    cd $HOME/src/clipnotify
    make clean
    make
    cp clipnotify ~/.local/bin/
    # sudo xbsp-remove xorgproto libX11-devel libXfixes-devel
}

instalacja_clipnotify

function instalacja_clipmenu() {
    cd $HOME/src/clipmenu
    cp clipctl ~/.local/bin
    cp clipdel ~/.local/bin
    cp clipfsck ~/.local/bin
    cp clipmenu ~/.local/bin
    cp clipmenud ~/.local/bin
}

instalacja_clipmenu

function instalacja_i3ass() {
    cd ~/src/i3ass
    make
    PREFIX=~/.local make install
}

instalacja_i3ass

function edycja_vars() {
    nvim $HOME/.config/vars
}

echo
read -p "Czy chcesz zmienić parametry $HOME/.config/vars [t/N]: "
case $REPLY in
    t | T | y | Y)
        edycja_vars
        ;;
    n | N) ;;
    *) ;;
esac
