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

# Tworzy katalog $HOME/tmp
if [ ! -d ~/tmp ]; then
    mkdir -p ~/tmp
fi

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

function instalacja_dodatkowych_pakietow_void_linux() {
    .local/bin/pakiety-void.sh
}

instalacja_dodatkowych_pakietow_void_linux

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
    git clone https://github.com/DMBuce/i3b $HOME/src/i3b
}

function instalacja_clipnotify {
    sudo xbps-install xorgproto libX11-devel libXfixes-devel
    cd $HOME/src/clipnotify
    make clean
    make
    cp clipnotify ~/.local/bin/
    # sudo xbsp-remove xorgproto libX11-devel libXfixes-devel
}

function instalacja_clipmenu() {
    cd $HOME/src/clipmenu
    cp clipctl ~/.local/bin
    cp clipdel ~/.local/bin
    cp clipfsck ~/.local/bin
    cp clipmenu ~/.local/bin
    cp clipmenud ~/.local/bin
}

function instalacja_i3ass() {
    cd ~/src/i3ass
    make
    PREFIX=~/.local make install
}

read -p "Czy zainstalować dodatkowe oprogramowanie: i3ass, clipmenu, clipnotify, i3b? [T/n]: "
case $REPLY in
    t | T)
        instalacja_dodatkowego_oprogramowania
        instalacja_clipnotify
        instalacja_clipmenu
        instalacja_i3ass
        ;;
    n | N)
        continue
        ;;
    *)
        instalacja_dodatkowego_oprogramowania
        instalacja_clipnotify
        instalacja_clipmenu
        instalacja_i3ass
        ;;
esac

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
