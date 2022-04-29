# Skrypty

Skrypty znajdują się w katalogu `$HOME/.local/bin`.

| Skrypt          | Opis                                                                        |
| --------------- | --------------------------------------------------------------------------- |
| 123-check.sh    | Sprawdza czy wymagane programy są dostępne w systemie                       |
| DecryptGPG      | Deszyfrowanie plików za pmocą GPG                                           |
| DecryptSSL      | Deszyfrowanie plików za pomocą OpenSSL                                      |
| EncryptGPG      | Szyfrowanie plików za pomocą GPG                                            |
| EncryptSSL      | Szyfrowanie plików za pomocą OpenSSL                                        |
| backup-dir      | Tworzy archiwum katalogu w którym został uruchomiony skrypt                 |
| cdb             | Przechodzi do wybranego katalogu z pliku `$HOME/.config/bmdirs`             |
| cdba            | Dodaje bieżący katalog do pliku `$HOME/.config/bmdirs`                      |
| cdbd            | Usuwa bieżący katalog z pliku `$HOME/.config/bmdirs`                        |
| cdf             | Szybkie poruszanie się po katalogach za pomocą FZF                          |
| cleartemp       | Czyszczenie katalogu z plikami tymczasowymi                                 |
| clipdelete      | Usuwanie wpisów ze schowka systemowego                                      |
| colors          | Skrypt wyświetlający komunikaty w kolorach                                  |
| dchmod          | Skrypt wyszukuje katalogów a następnie nadaje im uprawnienia                |
| detect-os       | Skrypt wykrywający system operacyjny                                        |
| dotfiles.sh     | Przechodzi do edycji wybranego pliku konfiguracyjnego z interaktywnej listy |
| exa-tree        | Zastępuje polecenie `tree`                                                  |
| fchmod          | Skrypt wyszukuje pliki a następnie nadaje im uprawnienia                    |
| ga.sh           | Wykonuje polecenie `git add` ; `git commit`                                 |
| gd.sh           | Wykonuje polecenie `git diff`                                               |
| gist-create.sh  | Tworzy wklejkę na gist.github.com                                           |
| gist-delete.sh  | Usuwa wybraną wklejkę                                                       |
| gist-edit.sh    | Edytuje wybraną wklejkę                                                     |
| gist-view.sh    | Pobiera wybraną wklejkę do wglądu                                           |
| gl.sh           | Wykonuje polecenie `git log`                                                |
| gp.sh           | Wykonuje polecenie `git add` ; `git commit` ; `git push`                    |
| gs.sh           | Wykonuje polecenie `git diff` ; `git status`                                |
| last-edit       | Wyświetla ostatnio edytowane pliki w `$HOME`                                |
| last-edit-local | Wyświetla ostatnio edytowane pliki w bieżącej lokalizacji                   |
| lff             | LF w dwóch kolumnach TMUX                                                   |
| lff-atta        | Podłączenie do `lff` (TMUX)                                                 |
| lff-kill        | Zabija sesję `lff`                                                          |
| lff-single      | Uruchamia `lff` w trybie jednej kolumny                                     |
| ll              | Wyświetla listę plików za pomocą polecenia `exa`                            |
| man-nvim.sh     | Wyświetla strony pomocy systemowej w edytorze Neovim                        |
| menu            | Podręczne menu w Rofi                                                       |
| mkcdir          | Tworzy katalog a następnie przechodzi do niego                              |
| nvim-qt-local   | Uruchamia Neovim QT z lokalnej kompilacji `.local/nvim`                     |
| otp             | Kody jednorazowe generowane za pomocą `oathtool`                            |
| otp-add         | Dodaje nowy kod jednorazowy                                                 |
| pakiety-void.sh | Instaluje przydatne pakiety w dystrybucji Void Linux                        |
| preview.sh      | Skrypt wyświetlający zawartość plików                                       |
| preview_dir.sh  | Skrypt wyświetlający zawartość katalogów                                    |
| pu.sh           | Wykonuje polecenie `git pull`                                               |
| push.sh         | Wykonuje polecenie `git push`                                               |
| pwgen.sh        | Skrypt generuje bezpieczne hasła                                            |
| rgvi            | Interaktywne przeszukiwanie plików                                          |
| scope.sh        | Skrypt podglądu plików dla `lf`                                             |
| screenkey.sh    | Włącza i wyłącza podgląd naciskanych klawiszy                               |
| se              |                                                                             |
| sedi            |                                                                             |
| sefi            |                                                                             |
| taruj           |                                                                             |
| update          | Skrypt wykonuje aktualizację pakietów dla różnych dystrybucji systemu Linux |
| vf              |                                                                             |
| vs              |                                                                             |

## 123-check.sh

```bash
#!/usr/bin/env bash

. ~/.local/bin/colors

echo

case $(~/.local/bin/detect-os sys) in
    Fedora)
        msg_info "Wykryłem system Fedora"
        FEDORA=1
        ;;
    Ubuntu)
        msg_info "Wykryłem system Ubuntu"
        UBUNTU=1
        ;;
    Arch)
        msg_info "Wykryłem system Arch"
        ARCH=1
        ;;
    Void)
        msg_info "Wykryłem system Void"
        VOID=1
        ;;
esac

echo

function check() {
    if [[ $(command -v "$1") ]]; then
        msg_ok "$1"
    else
        msg_warn "$1"
    fi
}

declare -a KOMENDY_FEDORA=(
    "nvim"
    "git"
    "rg"
    "fd"
    "fzf"
    "picom"
    "xclip"
)

declare -a KOMENDY_UBUNTU=(
    "nvim"
    "git"
    "rg"
    "fd"
    "fzf"
    "picom"
    "xclip"
)

declare -a KOMENDY_ARCH=(
    "nvim"
    "git"
    "rg"
    "fd"
    "fzf"
    "picom"
    "xclip"
)

declare -a KOMENDY_VOID=(
    "nvim"
    "git"
    "rg"
    "fd"
    "fzf"
    "i3"
    "i3status-rs"
    "starship"
    "picom"
    "xclip"
    "pstree"
)

if [[ $FEDORA ]]; then
    for i in ${KOMENDY_FEDORA[@]}; do
        check "$i"
    done

    echo
    msg_info "Jeśli brakuje jakiegoś pakietu uruchom polecenie:"
    echo
    echo "sudo dnf install neovim git ripgrep fzf fd-find starship xclip"
    echo
fi

if [[ $UBUNTU ]]; then
    for i in ${KOMENDY_UBUNTU[@]}; do
        check "$i"
    done

    echo
    msg_info "Jeśli brakuje jakiegoś pakietu uruchom polecenie:"
    echo
    echo "sudo apt install neovim git ripgrep fzf fd-find starship xclip"
fi

if [[ $ARCH ]]; then
    for i in ${KOMENDY_ARCH[@]}; do
        check "$i"
    done

    echo
    msg_info "Jeśli brakuje jakiegoś pakietu uruchom polecenie:"
    echo
    echo "sudo pacman -S neovim git ripgrep fzf fd-find starship xclip"
fi

if [[ $VOID ]]; then
    for i in ${KOMENDY_VOID[@]}; do
        check "$i"
    done

    echo
    msg_info "Jeśli brakuje jakiegoś pakietu uruchom polecenie:"
    echo
    echo "sudo xbps-install -S neovim git ripgrep fzf fd i3 i3status-rust starship picom xclip \\"
    echo "psmisc"
fi
```

## backup-dir

```bash
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
```

## cdb

```bash
#!/usr/bin/env bash

KATALOG="$(cat ~/.config/bmdirs|fzf --prompt "PWD: $PWD> "|sed "s|~|$HOME|")"
[ ! -z $KATALOG ] && cd -P -- "$KATALOG"
```

## cdba

```bash
#!/usr/bin/env bash

echo $PWD | sed "s|$HOME|~|" >> ~/.config/bmdirs
sort -o ~/.config/bmdirs ~/.config/bmdirs
```

## cdbd

```bash
#!/usr/bin/env bash

KATALOG=$(echo $PWD | sed "s|$HOME|~|")
sed -i "s|^$KATALOG$||" ~/.config/bmdirs
sed -i '/^$/d'  ~/.config/bmdirs
```

## cdf

```bash
#!/usr/bin/env bash

cd $HOME
KATALOG="$(fd -L -t d -d 3 | fzf --preview="fd --full-path {}")"

if [ ! -z $KATALOG ]; then
    cd "$KATALOG"
else
    cd - > /dev/null
fi
```

## cleartemp

```bash
#!/usr/bin/env bash

find -L ~/tmp -type f -mtime +7 -print -exec rm {} \;
find -L ~/tmp -type d -mtime +7 -exec rmdir --ignore-fail-on-non-empty {} \;
```

## clipdelete

```bash
#!/bin/bash

# skrypt do wyświetlania wpisów w dzienniku schowka, a następnie uruchamia
# na wybranym wpisie clipdel -d czyli usuwa wpis

# wymaga clipmenu i clipnotify
# https://github.com/cdown/clipmenu
# https://github.com/cdown/clipnotify

: "${CM_LAUNCHER=rofi}"
: "${CM_DIR="${XDG_RUNTIME_DIR-"${TMPDIR-/tmp}"}"}"
: "${CM_HISTLENGTH=12}"

# major_version to przeważnie liczba w nazwie pliku
# /var/run/[USER_ID]/clipmenu.$major_version.[NAZWA_UŻYTKOWNIKA]
major_version=$(ls $CM_DIR|grep clipmenu|cut -f 2 -d '.')

shopt -s nullglob

cache_dir=$CM_DIR/clipmenu.$major_version.$USER
cache_file_prefix=$cache_dir/line_cache

list_clips() {
    cat "$cache_file_prefix" /dev/null | LC_ALL=C sort -rnk 1 | cut -d' ' -f2- | awk '!seen[$0]++'
}

list_clips | rofi -dmenu | xargs -ICLIP clipdel -d "CLIP"
```

## colors

```bash
#!/usr/bin/env bash

      NC='\033[0m'
   BLACK='\033[0;30m'
  D_GREY='\033[1;30m'
     RED='\033[0;31m'
   L_RED='\033[1;31m'
   GREEN='\033[0;32m'
 L_GREEN='\033[1;32m'
  ORANGE='\033[0;33m'
  YELLOW='\033[1;33m'
    BLUE='\033[0;34m'
  L_BLUE='\033[1;34m'
  PURPLE='\033[0;35m'
L_PURPLE='\033[1;35m'
    CYAN='\033[0;36m'
  L_CYAN='\033[1;36m'
  L_GRAY='\033[0;37m'
   WHITE='\033[1;37m'

msg() {
    printf '%b\n' "$1" >&2
}

function msg_ok() {
    msg "${GREEN}[OK]${NC} ${1}${2}"
}

function msg_error() {
    msg "${RED}[ERROR]${NC} ${1}${2}"
}

function msg_warn () {
    msg "${YELLOW}[WARN]${NC} ${1}${2}"
}

function msg_info() {
    msg "${L_BLUE}[INFO]${NC} ${1}${2}"
}
```

## dchmod

```bash
#!/usr/bin/env bash

FD=$(which fd)

if [ ! -z $FD ]; then
    fd -H -I -t d -x chmod 755
else
    find . -type d -exec chmod 755 {} \;
fi
```

## DecryptGPG

```bash
#!/usr/bin/env bash

if [[ $# < 1 ]]; then
    echo Podaj nazwę pliku do odszyfrowania.
    echo $ enc plik.txt
    return 1
fi
if [ ! -e "$1" ]; then
    echo Podany plik nie istnieje
else
    nazwa_pliku=$(basename "$1" .gpg)
    gpg2 -o "$nazwa_pliku" -d "$1"
fi
```

## DecryptSSL

```bash
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
```

## detect-os

```bash
#!/usr/bin/env bash

# Skrypt wykrywa następujące systemy:
#
#   - Fedora,  CentOS, Ubuntu, Arch, Void, PopOS
#
# Parametry:
#
# detect-os sys zwraca nazwę systemu np. Fedora
# detect-os sys-full zwraca pełną nazwę systemu np. Fedora release 33 (Thirty Three)
# detect-os ver zwraca numer wydania systemu np. 33
# detect-os kernel zwraca wersję kernela np. Linux fredka.lan 5.11.9-200.fc33.x86_64

shopt -s nocasematch

kernel=$(uname -srn)

# Wykrywanie systemu Fedora
if [ -f /etc/fedora-release ]; then
    read -r fedora < /etc/fedora-release
    fedora_ver=$(echo "$fedora" | tr -cd '[:digit:][:cntrl:]')
    system="Fedora"
    system_full=$fedora
    system_ver=$fedora_ver
fi

# Wykrywanie systemu CentOS
if [ -f /etc/centos-release ]; then
    read -r centos < /etc/centos-release
    grep . /etc/centos-release > /dev/null
    if [ $? -eq 0 ]; then
        centos_ver=$(echo "$centos" | cut -d. -f1 | tr -cd '[:digit:][:cntrl:]')
    else
        centos_ver=$(echo "$centos" | tr -cd '[:digit:][:cntrl:]')
    fi
    system="CentOS"
    system_full=$centos
    system_ver=$centos_ver
fi

# Wykruwanie systemu Ubuntu
if [ -f /etc/lsb-release ]; then
    source /etc/lsb-release
    ubuntu=$DISTRIB_ID
    ubuntu_ver=$DISTRIB_RELEASE
    system="Ubuntu"
    system_full=$ubuntu
    system_ver=$ubuntu_ver
fi

# Wykrywanie systemu Arch
if [ -f /etc/os-release ]; then
    source /etc/os-release
    if [ $ID == "arch" ]; then
        system="Arch"
        system_full="$NAME"
        system_ver="$BUILD_ID"
    fi
fi

# Wykrywanie systemu Void
if [ -f /etc/os-release ]; then
    source /etc/os-release
    if [ $ID == "void" ]; then
        system="Void"
        system_full="$NAME $(uname -a)"
        system_ver="Void $kernel"
    fi
fi

# Wykrywanei systemu Pop OS
if [ -f /etc/pop-os/os-release ]; then
    source /etc/pop-os/os-release
    system="$NAME"
    system_full="$PRETTY_NAME"
    system_ver="$VERSION"
fi

case $1 in
    sys)
        echo $system
        ;;
    sys-full)
        echo $system_full
        ;;
    ver)
        echo $system_ver
        ;;
    kernel)
        echo $kernel
        ;;
    *)
        echo
        echo "############################## POMOC #################################"
        echo
        echo Dostępne parametry:
        echo
        echo "$(basename $0) sys      - wyświetla nazwę dystrybucji"
        echo "$(basename $0) sys-full - wyśweitla nazwę dystrybucji i wersję systemu"
        echo "$(basename $0) ver      - wyświetla wersję systemu"
        echo "$(basename $0) kernel   - wyświetla wersję kernela"
        echo
        echo "######################################################################"
        echo
esac
```

## dotfiles.sh

```bash
#!/usr/bin/env bash

# alias do edycji skryptu to: .df

. ~/.config/vars

ARR=(
    ~/.bashrc
    ~/.config/alacritty/alacritty.yml
    ~/.config/aliases
    ~/.config/bmdirs
    ~/.config/conky/conky.conf
    ~/.config/i3/config
    ~/.config/i3/sxhkdrc
    ~/.config/nvim/init.lua
    ~/.config/nvim/init.vim
    ~/.config/sxhkd/sxhkdrc
    ~/.config/vars
    ~/.gitconfig
    ~/.ssh/config
    ~/.tmux-lff.conf
    ~/.tmux.conf
    ~/.vim/vimrc
    ~/.Xresources
    ~/.zshrc
)

PLIK=$(printf '%s\n' "${ARR[@]}" | fzf)

if [ "$PLIK" ]; then
    $EDITOR "$PLIK"
fi
```

## EncryptGPG

```bash
#!/usr/bin/env bash

if [[ $# < 1 ]]; then
    echo Podaj nazwę pliku do zaszyfrowania.
    echo $ enc plik.txt
    return 1
fi
if [ ! -e "$1" ]; then
    echo Podany plik nie istnieje
else
    gpg2 -c "$1"
fi

echo -n "Usunąć plik źródłowy? (t/N): "
read USUNAC

case $USUNAC in
    t)
        rm "$1"
        ;;
    *)
        ;;
esac
```

## EncryptSSL

```bash
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
```

## exa-tree

```bash
#!/usr/bin/env bash

exa -l -a -h -g --git --tree
```

## fchmod

```bash
#!/usr/bin/env bash

FD=$(which fd)

if [ ! -z $FD ]; then
    fd -H -I -t f -x chmod 644
else
    find . -type f -exec chmod 644 {} \;
fi
```

## ga.sh

```bash
#!/usr/bin/env bash

DATA=$(date +%F-%T)

cd "$1"

git add -A && git commit -m $DATA
```

## gd.sh

```bash
#!/usr/bin/env bash

git diff
```

## gist-create.sh

```bash
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
```

## gist-delete.sh

```bash
#!/usr/bin/env bash

gh gist list -L 1000 | fzf | cut -f 1 | xargs gh gist delete
```

## gist-edit.sh

```bash
#!/usr/bin/env bash

gh gist list -L 1000 | fzf | cut -f 1 | xargs gh gist edit
```

## gist-view.sh

```bash
#!/usr/bin/env bash

gh gist list -L 1000 | fzf | cut -f 1 | xargs gh gist view
```

## gl.sh

```bash
#!/usr/bin/env bash

git log --graph --abbrev --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''        %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
```

## gp.sh

```bash
#!/usr/bin/env bash

DATA=$(date +%F-%T)

if [ $# -eq 1 ]; then
    KATALOG=$(readlink -m $(dirname "$1"))
    cd "$KATALOG"
fi

if [ "$(basename $0)" == "gps" ]; then
    git add -A && git commit -S -m $DATA && git push
else
    git add -A && git commit -m $DATA && git push
fi
```

## gs.sh

```bash
#!/usr/bin/env bash

git diff -p

git status
```

## last-edit

```bash
#!/usr/bin/env bash

find $HOME -type f -mtime -3 -mtime +4
find $HOME -type f -mtime -3
```

## last-edit-local

```bash
#!/usr/bin/env bash

find . -type f -mtime -3 -mtime +4
find . -type f -mtime -3
```

## lff

```bash
#!/usr/bin/env bash

tmux -S ~/temp/tmux.sock -f ~/.tmux-lff.conf new-session -s lff \; send-keys 'lf -config ~/.config/lf/mc-lfrc' C-m \; split-window -h \; send-keys 'lf -config ~/.config/lf/mc-lfrc' C-m \;
```

## lff-atta

```bash
#!/usr/bin/env bash

tmux -S ~/temp/tmux.sock atta
```

## lff-kill

```bash
#!/usr/bin/env bash

tmux -S ~/temp/tmux.sock kill-session -t lff
```

## lff-single

```bash
#!/usr/bin/env bash

lf -config ~/.config/lf/mc-lfrc
```

## ll

```bash
#!/usr/bin/env bash

# lista plikow

if [ $# -eq 0 ]; then
    ARG="."
else
    ARG="$@"
fi

exa $ARG -al --group-directories-first --git --header
```

## man-nvim.sh

```bash
#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    /usr/bin/man
else
    if man -w $* >/dev/null 2>/dev/null; then
        # /usr/bin/man $* | col -b | VIMRUNTIME=$HOME/.local/nvim/share/nvim/runtime ~/.local/nvim/bin/nvim -u $HOME/.config/nvim/man.vim -
        /usr/bin/man $* | col -b | /usr/bin/nvim -u $HOME/.config/nvim/man.vim -
    else
        echo "Brak strony: $*"
    fi
fi
```

## menu

```bash
#!/usr/bin/env bash

. ~/.config/vars

declare -a menu_list=(
    "Suspend"
    "Reboot"
    "sxhkd restart"
    "Monitor Off"
    "Books"
    "Wyczyść hasło do agenta GPG"
    "Pass ROFI"
    "Wyczyść historię schowka"
    "CPU GHz"
    "Stan baterii"
    "SS ScreenShot"
    "Wł/Wył touchpad"
    "Edit Menu"
)

menu=$(printf '%s\n' "${menu_list[@]}" | rofi -lines 28 -dmenu -i -p "Wybierz coś" "${@}")

[ "$menu" == "Suspend" ] && sudo zzz

[ "$menu" == "Reboot" ] && sudo reboot

screenshot() {
    declare -a screenshot_list=(
        "SS Full Screen"
        "SS Area & Copy to Clipboard"
        "SS Active Window"
        "SS Selected Area"
        "SS Active Window & Send to 0x0.st"
        "SS Full Screen & Send to 0x0.st"
        "SS Selected Area & Send to 0x0.st"
    )

    screenshot=$(printf '%s\n' "${screenshot_list[@]}" | rofi -lines 7 -dmenu -i -p "Wybierz coś" "${@}")

    if [ "$screenshot" == "SS Area & Copy to Clipboard" ]; then
        maim -s | xclip -selection clipboard -t image/png
    fi

    if [ "$screenshot" == "SS Full Screen" ]; then
        NUMER=$RANDOM
        maim ~/Pictures/SS/$(date +%F)-$NUMER.jpg
        notify-send "SS został zapisany w pliku ~/Pictures/SS/$(date +%F)-$NUMER.jpg"
    fi

    if [ "$screenshot" == "SS Active Window" ]; then
        NUMER=$RANDOM
        maim -i $(xdotool getactivewindow) ~/Pictures/SS/$(date +%F)-$NUMER.jpg
        notify-send "SS został zapisany w pliku ~/Pictures/SS/$(date +%F)-$NUMER.jpg"
    fi

    if [ "$screenshot" == "SS Selected Area" ]; then
        NUMER=$RANDOM
        maim -s ~/Pictures/SS/$(date +%F)-$NUMER.jpg
        notify-send "SS został zapisany w pliku ~/Pictures/SS/$(date +%F)-$NUMER.jpg"
    fi

    if [ "$screenshot" == "SS Active Window & Send to 0x0.st" ]; then
        NUMER=$RANDOM
        maim -i $(xdotool getactivewindow) ~/tmp/$NUMER.jpg
        curl -F"file=@$HOME/tmp/$NUMER.jpg" https://0x0.st | tr -d '\n' | xclip -selection clipboard
        notify-send "SS został wysłany $(xclip -o)"
        rm $HOME/tmp/$NUMER.jpg
    fi

    if [ "$screenshot" == "SS Full Screen & Send to 0x0.st" ]; then
        NUMER=$RANDOM
        maim ~/tmp/$NUMER.jpg
        curl -F"file=@$HOME/tmp/$NUMER.jpg" https://0x0.st | tr -d '\n' | xclip -selection clipboard
        notify-send "SS został wysłany $(xclip -o)"
        rm $HOME/tmp/$NUMER.jpg
    fi

    if [ "$screenshot" == "SS Selected Area & Send to 0x0.st" ]; then
        NUMER=$RANDOM
        maim -s ~/tmp/$NUMER.jpg
        curl -F"file=@$HOME/tmp/$NUMER.jpg" https://0x0.st | tr -d '\n' | xclip -selection clipboard
        notify-send "SS został wysłany $(xclip -o)"
        rm $HOME/tmp/$NUMER.jpg
    fi
}

if [ "$menu" == "SS ScreenShot" ]; then
    screenshot
fi

if [ "$menu" == "Stan baterii" ]; then
    batt=$(upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage")
    rofi -e "$batt"
fi

if [ "$menu" == "Monitor Off" ]; then
    notify-send "Za kilka chwil wyłączę monitor..."
    sleep 1
    xset dpms force off
fi

if [ "$menu" == "sxhkd restart" ]; then
    pkill -USR1 -x sxhkd
    if [ $? == 0 ]; then
        rofi -e "Ustawienia sxhkd zostały przeładowane"
    fi
fi

[ "$menu" == "Wyczyść hasło do agenta GPG" ] && gpg-connect-agent reloadagent /bye

[ "$menu" == "Wyczyść historię schowka" ] && $HOME/bin/clipdel -d ".*"

[ "$menu" == "Pass ROFI" ] && $HOME/bin/passr

[ "$menu" == "Books" ] && $HOME/bin/books

check_cpu_exit_status() {
    if [ $? == 0 ]; then
        notify-send "Ustawiłem maksymalną częstotliwość na $1"
    else
        rofi -e "Ustawienie częstotliwości ($1) NIE powiodło się (zmień ustawienia sudo)."
    fi
}

cpu() {
    declare -a cpu_hz=(
        "Max 400"
        "Max 800"
        "Max 1.4"
        "Max 1.8"
        "Max 2.4"
        "Max 3.3"
        "Max 4.0"
    )

    GHZ=$(cpupower frequency-info -f -m|tail -n 1|cut -f 6,7 -d ' ')

    cpu=$(printf '%s\n' "${cpu_hz[@]}" | rofi -dmenu -i -p "Ustaw częstotliwość (teraz: $GHZ)" "${@}")

    if [ "$cpu" == "Max 400" ]; then
        /usr/bin/sudo cpupower frequency-set -u 400000 -g powersave
        check_cpu_exit_status "0.4 GHz"
    fi

    if [ "$cpu" == "Max 800" ]; then
        /usr/bin/sudo cpupower frequency-set -u 800000 -g powersave
        check_cpu_exit_status "0.8 GHz"
    fi

    if [ "$cpu" == "Max 1.4" ]; then
        /usr/bin/sudo cpupower frequency-set -u 1400000 -g powersave
        check_cpu_exit_status "1.4 GHz"
    fi

    if [ "$cpu" == "Max 1.8" ]; then
        /usr/bin/sudo cpupower frequency-set -u 1800000 -g powersave
        check_cpu_exit_status "1.8 GHz"
    fi

    if [ "$cpu" == "Max 2.4" ]; then
        /usr/bin/sudo cpupower frequency-set -u 2400000 -g powersave
        check_cpu_exit_status "2.4 GHz"
    fi

    if [ "$cpu" == "Max 3.3" ]; then
        /usr/bin/sudo cpupower frequency-set -u 3300000 -g powersave
        check_cpu_exit_status "3.3 GHz"
    fi

    if [ "$cpu" == "Max 4.0" ]; then
        /usr/bin/sudo cpupower frequency-set -u 4000000 -g powersave
        check_cpu_exit_status "4.0 GHz"
    fi
}

if [ "$menu" == "CPU GHz" ]; then
    cpu
fi

if [ "$menu" == "Wł/Wył touchpad" ]; then
    TOUCHPAD=$(xinput|grep Synaptics|cut -f 2|cut -f 2 -d '=')
    TOUCHPAD_STATE=$(xinput list-props $TOUCHPAD|grep "Device Enabled"|cut -f 3)
    if [ "$TOUCHPAD_STATE" -eq 0 ]; then
        xinput enable $TOUCHPAD
    else
        xinput disable $TOUCHPAD
    fi
fi

if [ "$menu" == "Edit Menu" ]; then
    alacritty -e "$EDITOR $PWD/$(basename $0)"
fi
```

## mkcdir

```bash
#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "Podaj nazwę katalogu."
    exit
fi

KAT="$1"
mkdir -p "$KAT"
cd "$KAT"
```

## nvim-qt-local

```bash
#!/usr/bin/env bash

nvim-qt --nvim $HOME/.local/nvim/bin/nvim
```

## otp

```bash
#!/usr/bin/env bash

oathtool --base32 --totp "$(gopass "otp/$(find ~/.local/share/gopass/stores/root/otp/* -exec basename {} .gpg \; | fzf)")"
```

## otp-add

```bash
#!/usr/bin/env bash

if [ -z $1 ]; then
    echo
    read -p "Podaj nazwę hosta: " NAZWA
    NAZWA=$(echo "$NAZWA" | tr ' ' '-')
    gopass edit otp/$NAZWA
else
    NAZWA=$(echo "$@" | tr ' ' '-')
    gopass edit otp/$NAZWA
fi
```

## pakiety-void.sh

```bash
#!/usr/bin/env bash

# Skrypt sprawdza czy są zainstalowane potrzebne pakiety

KATALOG=$(readlink -m $(dirname "$0"))

. ~/.local/bin/colors

shopt -s nocasematch

declare BRAK
declare ZNALAZLEM
declare LISTA_PAKIETOW
mapfile -t WYMAGANE_PAKIETY < <(cat $KATALOG/pakiety-void-i3.txt)

# Tworzy tablicę LISTA_PAKIETOW zawierającą wszystkie zainstalowane pakiety w systemie
msg_info "Tworzę listę zainstalowanych pakietów."

for i in $(xbps-query -l|cut -f 2 -d ' '|sed -E 's/(.+)-[^-]+/\1/')
do
    LISTA_PAKIETOW+=("$i")
done

# Dodaje do tablicy ZNALAZLEM znaleziony pakiet
function znalazlem() {
    ZNALAZLEM+=("$1")
}

# Dodaje do tablicy BRAK pakiet, który nie jest zainstalowany
function brak() {
    BRAK+=("$1")
}

# Wyszukuje w tablicy LISTA_PAKIETOW elementu podanego jako parametr funkcji find_in_array
function find_in_array() {
    local PAKIET="$1"
    for ITEM in "${LISTA_PAKIETOW[@]}"; do
        if [[ "${ITEM}" == "$PAKIET" ]]; then
            znalazlem "$PAKIET"
            return 0
        fi
    done
    brak "$PAKIET"
    return 1
}

# Przechodzi po tablicy WYMAGANE_PAKIETY i szuka pakietu w zainstalowanych pakietach - tablica LISTA_PAKIETOW
for ((i = 0; i < ${#WYMAGANE_PAKIETY[@]}; i++)); do
    find_in_array "${WYMAGANE_PAKIETY[$i]}"
done

# Przechodzi po tablicy ZNALAZLEM i wyświetla komunikat
for ((i = 0; i < ${#ZNALAZLEM[@]}; i++)); do
    msg_ok "${ZNALAZLEM[$i]}"
done

# Przechodzi po tablicy BRAK i wyświetla komunikat
for ((i = 0; i < ${#BRAK[@]}; i++)); do
    msg_error "${BRAK[$i]}"
done

# Instalacja brakujących pakietów
function instaluj() {
    sudo xbps-install -S ${BRAK[@]}
}

# Sprawdza czy tablica BRAK jest pusta i wyświetla odpowiedni komunikat
if [ ${#BRAK[@]} -ne 0 ]; then
    echo
    msg_info "Instalacja:"
    echo
    echo "sudo xbps-install -S ${BRAK[@]}"
    echo
    read -p "Czy chcesz zainstalować brakujące pakiety: [T/n]: "
    case $REPLY in
        "t|y") instaluj ;;
        "n") ;;
        *) instaluj ;;
    esac
else
    echo
    msg_ok "Wszystkie wymagane pakiety są zainstalowane."
    echo
fi
```

## preview.sh

```bash
#!/usr/bin/env bash

# https://raw.githubusercontent.com/junegunn/fzf.vim/master/bin/preview.sh

REVERSE="\x1b[7m"
RESET="\x1b[m"

if [ -z "$1" ]; then
    echo "usage: $0 [--tag] FILENAME[:LINENO][:IGNORED]"
    exit 1
fi

if [ "$1" = --tag ]; then
    shift
    "$(dirname "${BASH_SOURCE[0]}")/tagpreview.sh" "$@"
    exit $?
fi

IFS=':' read -r -a INPUT <<<"$1"
FILE=${INPUT[0]}
CENTER=${INPUT[1]}

if [[ "$1" =~ ^[A-Za-z]:\\ ]]; then
    FILE=$FILE:${INPUT[1]}
    CENTER=${INPUT[2]}
fi

if [[ -n "$CENTER" && ! "$CENTER" =~ ^[0-9] ]]; then
    exit 1
fi
CENTER=${CENTER/[^0-9]*/}

# MS Win support
if [[ "$FILE" =~ '\' ]]; then
    if [ -z "$MSWINHOME" ]; then
        MSWINHOME="$HOMEDRIVE$HOMEPATH"
    fi
    if grep -qEi "(Microsoft|WSL)" /proc/version &>/dev/null; then
        MSWINHOME="${MSWINHOME//\\/\\\\}"
        FILE="${FILE/#\~\\/$MSWINHOME\\}"
        FILE=$(wslpath -u "$FILE")
    elif [ -n "$MSWINHOME" ]; then
        FILE="${FILE/#\~\\/$MSWINHOME\\}"
    fi
fi

FILE="${FILE/#\~\//$HOME/}"
if [ ! -r "$FILE" ]; then
    echo "File not found ${FILE}"
    exit 1
fi

if [ -z "$CENTER" ]; then
    CENTER=0
fi

# Sometimes bat is installed as batcat.
if command -v batcat >/dev/null; then
    BATNAME="batcat"
elif command -v bat >/dev/null; then
    BATNAME="bat"
fi

if [ -z "$FZF_PREVIEW_COMMAND" ] && [ "${BATNAME:+x}" ]; then
    ${BATNAME} --style="${BAT_STYLE:-numbers}" --color=always --pager=never \
        --highlight-line=$CENTER -- "$FILE"
    exit $?
fi

FILE_LENGTH=${#FILE}
MIME=$(file --dereference --mime -- "$FILE")
if [[ "${MIME:FILE_LENGTH}" =~ binary ]]; then
    echo "$MIME"
    exit 0
fi

DEFAULT_COMMAND="highlight -O ansi -l {} || coderay {} || rougify {} || cat {}"
CMD=${FZF_PREVIEW_COMMAND:-$DEFAULT_COMMAND}
CMD=${CMD//{\}/$(printf %q "$FILE")}

eval "$CMD" 2>/dev/null | awk "{ \
    if (NR == $CENTER) \
        { gsub(/\x1b[[0-9;]*m/, \"&$REVERSE\"); printf(\"$REVERSE%s\n$RESET\", \$0); } \
    else printf(\"$RESET%s\n\", \$0); \
    }"
```

## preview_dir.sh

```bash
#!/usr/bin/env bash

KATALOG=$(readlink -f "$1")
/usr/bin/tree -L 1 $KATALOG
```

## pu.sh

```bash
#!/usr/bin/env bash

git pull
```

## push.sh

```bash
#!/usr/bin/env bash

git push
```

## pwgen.sh

```bash
#!/usr/bin/env bash

 . ~/.local/bin/colors

if [[ ! $(command -v pwgen) ]]; then
    msg_error "Brak programu pwgen."
    exit
fi

if [ $DISPLAY ]; then
    pwgen -c -s -n -B -1 32 | xclip -sel clip && xclip -sel clip -o
else
    pwgen -c -s -n -B -1 32
fi
```

## rgvi

```bash
#!/usr/bin/env bash

. ~/.config/vars

SEARCH=$(sk --ansi -i -c 'rg --color=always --hidden --line-number "{}"' \
    --bind "ctrl-p:toggle-preview" --preview "preview.sh {}" \
    --preview-window=down:50%:hidden)

readarray -td: array <<<"$SEARCH"

FILE=${array[0]}
LINE=${array[1]}
ARRAY_NOE=${#array[@]}

if [ $ARRAY_NOE -gt 1 ]; then
    $EDITOR $FILE +$LINE
fi
```

## scope.sh

```bash
#!/usr/bin/env bash

# https://raw.githubusercontent.com/ranger/ranger/master/ranger/data/scope.sh

set -o noclobber -o noglob -o nounset -o pipefail
IFS=$'\n'

## If the option `use_preview_script` is set to `true`,
## then this script will be called and its output will be displayed in ranger.
## ANSI color codes are supported.
## STDIN is disabled, so interactive scripts won't work properly

## This script is considered a configuration file and must be updated manually.
## It will be left untouched if you upgrade ranger.

## Because of some automated testing we do on the script #'s for comments need
## to be doubled up. Code that is commented out, because it's an alternative for
## example, gets only one #.

## Meanings of exit codes:
## code | meaning    | action of ranger
## -----+------------+-------------------------------------------
## 0    | success    | Display stdout as preview
## 1    | no preview | Display no preview at all
## 2    | plain text | Display the plain content of the file
## 3    | fix width  | Don't reload when width changes
## 4    | fix height | Don't reload when height changes
## 5    | fix both   | Don't ever reload
## 6    | image      | Display the image `$IMAGE_CACHE_PATH` points to as an image preview
## 7    | image      | Display the file directly as an image

## Script arguments
FILE_PATH="${1}" # Full path of the highlighted file
PV_WIDTH="${2}"  # Width of the preview pane (number of fitting characters)
## shellcheck disable=SC2034 # PV_HEIGHT is provided for convenience and unused
PV_HEIGHT="${3}"        # Height of the preview pane (number of fitting characters)
IMAGE_CACHE_PATH="${4}" # Full path that should be used to cache image preview
PV_IMAGE_ENABLED="${5}" # 'True' if image previews are enabled, 'False' otherwise.

FILE_EXTENSION="${FILE_PATH##*.}"
FILE_EXTENSION_LOWER="$(printf "%s" "${FILE_EXTENSION}" | tr '[:upper:]' '[:lower:]')"

## Settings
HIGHLIGHT_SIZE_MAX=262143 # 256KiB
HIGHLIGHT_TABWIDTH="${HIGHLIGHT_TABWIDTH:-8}"
HIGHLIGHT_STYLE="${HIGHLIGHT_STYLE:-pablo}"
HIGHLIGHT_OPTIONS="--replace-tabs=${HIGHLIGHT_TABWIDTH} --style=${HIGHLIGHT_STYLE} ${HIGHLIGHT_OPTIONS:-}"
PYGMENTIZE_STYLE="${PYGMENTIZE_STYLE:-autumn}"
OPENSCAD_IMGSIZE="${RNGR_OPENSCAD_IMGSIZE:-1000,1000}"
OPENSCAD_COLORSCHEME="${RNGR_OPENSCAD_COLORSCHEME:-Tomorrow Night}"

handle_extension() {
    case "${FILE_EXTENSION_LOWER}" in
        ## Archive
        a | ace | alz | arc | arj | bz | bz2 | cab | cpio | deb | gz | jar | lha | lz | lzh | lzma | lzo | \
            rpm | rz | t7z | tar | tbz | tbz2 | tgz | tlz | txz | tZ | tzo | war | xpi | xz | Z | zip)
            atool --list -- "${FILE_PATH}" && exit 5
            bsdtar --list --file "${FILE_PATH}" && exit 5
            exit 1
            ;;
        rar)
            ## Avoid password prompt by providing empty password
            unrar lt -p- -- "${FILE_PATH}" && exit 5
            exit 1
            ;;
        7z)
            ## Avoid password prompt by providing empty password
            7z l -p -- "${FILE_PATH}" && exit 5
            exit 1
            ;;

        ## PDF
        pdf)
            ## Preview as text conversion
            pdftotext -l 10 -nopgbrk -q -- "${FILE_PATH}" - |
                fmt -w "${PV_WIDTH}" && exit 5
            mutool draw -F txt -i -- "${FILE_PATH}" 1-10 |
                fmt -w "${PV_WIDTH}" && exit 5
            exiftool "${FILE_PATH}" && exit 5
            exit 1
            ;;

        ## BitTorrent
        torrent)
            transmission-show -- "${FILE_PATH}" && exit 5
            exit 1
            ;;

        ## OpenDocument
        odt | ods | odp | sxw)
            ## Preview as text conversion
            odt2txt "${FILE_PATH}" && exit 5
            ## Preview as markdown conversion
            pandoc -s -t markdown -- "${FILE_PATH}" && exit 5
            exit 1
            ;;

        ## XLSX
        xlsx)
            ## Preview as csv conversion
            ## Uses: https://github.com/dilshod/xlsx2csv
            xlsx2csv -- "${FILE_PATH}" && exit 5
            exit 1
            ;;

        ## HTML
        htm | html | xhtml)
            ## Preview as text conversion
            w3m -dump "${FILE_PATH}" && exit 5
            lynx -dump -- "${FILE_PATH}" && exit 5
            elinks -dump "${FILE_PATH}" && exit 5
            pandoc -s -t markdown -- "${FILE_PATH}" && exit 5
            ;;

        ## JSON
        json | ipynb)
            jq --color-output . "${FILE_PATH}" && exit 5
            python -m json.tool -- "${FILE_PATH}" && exit 5
            ;;

        ## Direct Stream Digital/Transfer (DSDIFF) and wavpack aren't detected
        ## by file(1).
        dff | dsf | wv | wvc)
            mediainfo "${FILE_PATH}" && exit 5
            exiftool "${FILE_PATH}" && exit 5
            ;; # Continue with next handler on failure
    esac
}

handle_image() {
    ## Size of the preview if there are multiple options or it has to be
    ## rendered from vector graphics. If the conversion program allows
    ## specifying only one dimension while keeping the aspect ratio, the width
    ## will be used.
    local DEFAULT_SIZE="1920x1080"

    local mimetype="${1}"
    case "${mimetype}" in
        ## SVG
        # image/svg+xml|image/svg)
        #     convert -- "${FILE_PATH}" "${IMAGE_CACHE_PATH}" && exit 6
        #     exit 1;;

        ## DjVu
        # image/vnd.djvu)
        #     ddjvu -format=tiff -quality=90 -page=1 -size="${DEFAULT_SIZE}" \
        #           - "${IMAGE_CACHE_PATH}" < "${FILE_PATH}" \
        #           && exit 6 || exit 1;;

        ## Image
        image/*)
            local orientation
            orientation="$(identify -format '%[EXIF:Orientation]\n' -- "${FILE_PATH}")"
            ## If orientation data is present and the image actually
            ## needs rotating ("1" means no rotation)...
            if [[ -n "$orientation" && "$orientation" != 1 ]]; then
                ## ...auto-rotate the image according to the EXIF data.
                convert -- "${FILE_PATH}" -auto-orient "${IMAGE_CACHE_PATH}" && exit 6
            fi

            ## `w3mimgdisplay` will be called for all images (unless overridden
            ## as above), but might fail for unsupported types.
            exit 7
            ;;

        ## Video
        # video/*)
        #     # Get embedded thumbnail
        #     ffmpeg -i "${FILE_PATH}" -map 0:v -map -0:V -c copy "${IMAGE_CACHE_PATH}" && exit 6
        #     # Get frame 10% into video
        #     ffmpegthumbnailer -i "${FILE_PATH}" -o "${IMAGE_CACHE_PATH}" -s 0 && exit 6
        #     exit 1;;

        ## PDF
        # application/pdf)
        #     pdftoppm -f 1 -l 1 \
        #              -scale-to-x "${DEFAULT_SIZE%x*}" \
        #              -scale-to-y -1 \
        #              -singlefile \
        #              -jpeg -tiffcompression jpeg \
        #              -- "${FILE_PATH}" "${IMAGE_CACHE_PATH%.*}" \
        #         && exit 6 || exit 1;;

        ## ePub, MOBI, FB2 (using Calibre)
        # application/epub+zip|application/x-mobipocket-ebook|\
        # application/x-fictionbook+xml)
        #     # ePub (using https://github.com/marianosimone/epub-thumbnailer)
        #     epub-thumbnailer "${FILE_PATH}" "${IMAGE_CACHE_PATH}" \
        #         "${DEFAULT_SIZE%x*}" && exit 6
        #     ebook-meta --get-cover="${IMAGE_CACHE_PATH}" -- "${FILE_PATH}" \
        #         >/dev/null && exit 6
        #     exit 1;;

        ## Font
        application/font* | application/*opentype)
            preview_png="/tmp/$(basename "${IMAGE_CACHE_PATH%.*}").png"
            if fontimage -o "${preview_png}" \
                --pixelsize "120" \
                --fontname \
                --pixelsize "80" \
                --text "  ABCDEFGHIJKLMNOPQRSTUVWXYZ  " \
                --text "  abcdefghijklmnopqrstuvwxyz  " \
                --text "  0123456789.:,;(*!?') ff fl fi ffi ffl  " \
                --text "  The quick brown fox jumps over the lazy dog.  " \
                "${FILE_PATH}"; then
                convert -- "${preview_png}" "${IMAGE_CACHE_PATH}" &&
                    rm "${preview_png}" &&
                    exit 6
            else
                exit 1
            fi
            ;;

            ## Preview archives using the first image inside.
            ## (Very useful for comic book collections for example.)
            # application/zip|application/x-rar|application/x-7z-compressed|\
            #     application/x-xz|application/x-bzip2|application/x-gzip|application/x-tar)
            #     local fn=""; local fe=""
            #     local zip=""; local rar=""; local tar=""; local bsd=""
            #     case "${mimetype}" in
            #         application/zip) zip=1 ;;
            #         application/x-rar) rar=1 ;;
            #         application/x-7z-compressed) ;;
            #         *) tar=1 ;;
            #     esac
            #     { [ "$tar" ] && fn=$(tar --list --file "${FILE_PATH}"); } || \
            #     { fn=$(bsdtar --list --file "${FILE_PATH}") && bsd=1 && tar=""; } || \
            #     { [ "$rar" ] && fn=$(unrar lb -p- -- "${FILE_PATH}"); } || \
            #     { [ "$zip" ] && fn=$(zipinfo -1 -- "${FILE_PATH}"); } || return
            #
            #     fn=$(echo "$fn" | python -c "from __future__ import print_function; \
            #             import sys; import mimetypes as m; \
            #             [ print(l, end='') for l in sys.stdin if \
            #               (m.guess_type(l[:-1])[0] or '').startswith('image/') ]" |\
            #         sort -V | head -n 1)
            #     [ "$fn" = "" ] && return
            #     [ "$bsd" ] && fn=$(printf '%b' "$fn")
            #
            #     [ "$tar" ] && tar --extract --to-stdout \
            #         --file "${FILE_PATH}" -- "$fn" > "${IMAGE_CACHE_PATH}" && exit 6
            #     fe=$(echo -n "$fn" | sed 's/[][*?\]/\\\0/g')
            #     [ "$bsd" ] && bsdtar --extract --to-stdout \
            #         --file "${FILE_PATH}" -- "$fe" > "${IMAGE_CACHE_PATH}" && exit 6
            #     [ "$bsd" ] || [ "$tar" ] && rm -- "${IMAGE_CACHE_PATH}"
            #     [ "$rar" ] && unrar p -p- -inul -- "${FILE_PATH}" "$fn" > \
            #         "${IMAGE_CACHE_PATH}" && exit 6
            #     [ "$zip" ] && unzip -pP "" -- "${FILE_PATH}" "$fe" > \
            #         "${IMAGE_CACHE_PATH}" && exit 6
            #     [ "$rar" ] || [ "$zip" ] && rm -- "${IMAGE_CACHE_PATH}"
            #     ;;
    esac

    # openscad_image() {
    #     TMPPNG="$(mktemp -t XXXXXX.png)"
    #     openscad --colorscheme="${OPENSCAD_COLORSCHEME}" \
    #         --imgsize="${OPENSCAD_IMGSIZE/x/,}" \
    #         -o "${TMPPNG}" "${1}"
    #     mv "${TMPPNG}" "${IMAGE_CACHE_PATH}"
    # }

    # case "${FILE_EXTENSION_LOWER}" in
    #     ## 3D models
    #     ## OpenSCAD only supports png image output, and ${IMAGE_CACHE_PATH}
    #     ## is hardcoded as jpeg. So we make a tempfile.png and just
    #     ## move/rename it to jpg. This works because image libraries are
    #     ## smart enough to handle it.
    #     csg|scad)
    #         openscad_image "${FILE_PATH}" && exit 6
    #         ;;
    #     3mf|amf|dxf|off|stl)
    #         openscad_image <(echo "import(\"${FILE_PATH}\");") && exit 6
    #         ;;
    # esac
}

handle_mime() {
    local mimetype="${1}"
    case "${mimetype}" in
        ## RTF and DOC
        text/rtf | *msword)
            ## Preview as text conversion
            ## note: catdoc does not always work for .doc files
            ## catdoc: http://www.wagner.pp.ru/~vitus/software/catdoc/
            catdoc -- "${FILE_PATH}" && exit 5
            exit 1
            ;;

        ## DOCX, ePub, FB2 (using markdown)
        ## You might want to remove "|epub" and/or "|fb2" below if you have
        ## uncommented other methods to preview those formats
        *wordprocessingml.document | */epub+zip | */x-fictionbook+xml)
            ## Preview as markdown conversion
            pandoc -s -t markdown -- "${FILE_PATH}" && exit 5
            exit 1
            ;;

        ## E-mails
        message/rfc822)
            ## Parsing performed by mu: https://github.com/djcb/mu
            mu view -- "${FILE_PATH}" && exit 5
            exit 1
            ;;

        ## XLS
        *ms-excel)
            ## Preview as csv conversion
            ## xls2csv comes with catdoc:
            ##   http://www.wagner.pp.ru/~vitus/software/catdoc/
            xls2csv -- "${FILE_PATH}" && exit 5
            exit 1
            ;;

        ## Text
        text/* | */xml)
            ## Syntax highlight
            if [[ "$(stat --printf='%s' -- "${FILE_PATH}")" -gt "${HIGHLIGHT_SIZE_MAX}" ]]; then
                exit 2
            fi
            if [[ "$(tput colors)" -ge 256 ]]; then
                local pygmentize_format='terminal256'
                local highlight_format='xterm256'
            else
                local pygmentize_format='terminal'
                local highlight_format='ansi'
            fi
            env HIGHLIGHT_OPTIONS="${HIGHLIGHT_OPTIONS}" highlight \
                --out-format="${highlight_format}" \
                --force -- "${FILE_PATH}" && exit 5
            env COLORTERM=8bit bat --color=always --style="plain" \
                -- "${FILE_PATH}" && exit 5
            pygmentize -f "${pygmentize_format}" -O "style=${PYGMENTIZE_STYLE}" \
                -- "${FILE_PATH}" && exit 5
            exit 2
            ;;

        ## DjVu
        image/vnd.djvu)
            ## Preview as text conversion (requires djvulibre)
            djvutxt "${FILE_PATH}" | fmt -w "${PV_WIDTH}" && exit 5
            exiftool "${FILE_PATH}" && exit 5
            exit 1
            ;;

        ## Image
        image/*)
            ## Preview as text conversion
            # img2txt --gamma=0.6 --width="${PV_WIDTH}" -- "${FILE_PATH}" && exit 4
            exiftool "${FILE_PATH}" && exit 5
            exit 1
            ;;

        ## Video and audio
        video/* | audio/*)
            mediainfo "${FILE_PATH}" && exit 5
            exiftool "${FILE_PATH}" && exit 5
            exit 1
            ;;

        ## ELF files (executables and shared objects)
        application/x-executable | application/x-pie-executable | application/x-sharedlib)
            readelf -WCa "${FILE_PATH}" && exit 5
            exit 1
            ;;
    esac
}

handle_fallback() {
    echo '----- File Type Classification -----' && file --dereference --brief -- "${FILE_PATH}" && exit 5
    exit 1
}

MIMETYPE="$(file --dereference --brief --mime-type -- "${FILE_PATH}")"
if [[ "${PV_IMAGE_ENABLED}" == 'True' ]]; then
    handle_image "${MIMETYPE}"
fi
handle_extension
handle_mime "${MIMETYPE}"
handle_fallback

exit 1
```

## screenkey.sh

```bash
#!/usr/bin/env bash

ps ax | grep /usr/bin/screenkey | grep -v grep

if [ "$?" -eq 0 ]; then
    pkill -9 screenkey
else
    /usr/bin/screenkey
fi
```

## se

```bash
#!/usr/bin/env bash

. ~/.config/vars

BAT=$(which bat)
PREVIEW_SH=$(which preview.sh)

if [ ! -z $BAT ]; then
    PREVIEW="bat --style=numbers --color=always {}"
elif [ ! -z $PREVIEW_SH ]; then
    PREVIEW="preview.sh {}"
else
    echo "Brak programu 'bat' i skryptu 'preview.sh', należy doinstalować jeden z nich"
    exit
fi

SEARCH=$(fd . --ignore-file .gitignore | sk --exact --tac --prompt="Wyszukaj: " \
    --ansi --bind "ctrl-p:toggle-preview" --preview "$PREVIEW" \
    --preview-window=right:70%)
[[ $SEARCH ]] && $EDITOR $SEARCH
```

## sedi

```bash
#!/usr/bin/env bash

. ~/.config/vars

PREVIEW=$(which preview_dir.sh)

if [ ! -z $PREVIEW ]; then
    PREVIEW="preview_dir.sh {}"
else
    echo "Brak skryptu 'preview_dir.sh', należy doinstalować jeden z nich"
    exit
fi

SEARCH=$(fd . -t d --ignore-file .gitignore | sk --exact --tac --prompt="Wyszukaj: " \
    --ansi --bind "ctrl-p:toggle-preview" --preview "$PREVIEW" \
    --preview-window=down:50%)

[[ $SEARCH ]] && $EDITOR $SEARCH
```

## sefi

```bash
#!/usr/bin/env bash

. ~/.config/vars

BAT=$(which bat)
PREVIEW_SH=$(which preview.sh)
if [ ! -z $BAT ]; then
    PREVIEW="bat --style=numbers --color=always {}"
 elif [ ! -z $PREVIEW_SH ]; then
    PREVIEW="preview.sh {}"
else
    echo "Brak programu 'bat' i skryptu 'preview.sh', należy doinstalować jeden z nich"
    exit
fi
SEARCH=$(fd . -t f --ignore-file .gitignore | sk --exact --tac --prompt="Wyszukaj: " \
    --ansi --bind "ctrl-p:toggle-preview" --preview "$PREVIEW" \
    --preview-window=down:50%)
[ "$SEARCH" ] && $EDITOR "$SEARCH"
```

## taruj

```bash
#!/usr/bin/env bash

KATALOG=$(basename "$PWD")
KATALOG=$(echo $KATALOG | tr ' ' -)
PLIK_TAR=$(echo $KATALOG | tr -d '.' )

tar -cvf "$PLIK_TAR.tar" ../"$KATALOG"

find . -not -name "$PLIK_TAR.tar" -delete
```

## update

```bash
#!/usr/bin/env bash

shopt -s nocasematch

SYSTEM=$($HOME/.local/bin/detect-os sys)

if [ "$SYSTEM" == "Fedora" ]; then
    UPD_CMD="sudo dnf update"
fi

if [ "$SYSTEM" == "CentOS" ]; then
    UPD_CMD="sudo yum update"
fi

if [ "$SYSTEM" == "Ubuntu" ]; then
    UPD_CMD="sudo apt update"
fi

if [ "$SYSTEM" == "Void" ]; then
    UPD_CMD="sudo xbps-install -Su"
fi

function tmux_update() {
    tmux -2 new -s SysUpdate "$UPD_CMD ; read -r -p 'Naciśnij coś... '"
}

if [ "$SSH_TTY" ]; then
    echo -n "Jesteś połączony przez SSH, chcesz uruchomić aktualizacji w sesji TMUX? [Y/n]: "
    read
    case $REPLY in
        y|t) tmux_update ; exit ;;
        n) $UPD_CMD ; exit ;;
        *) tmux_update ; exit ;;
    esac
fi

if [ "$TMUX" ]; then
    $UPD_CMD
else
    tmux_update
fi
```

## vf

```bash
#!/usr/bin/env bash

. ~/.config/vars

sk | xargs -r -I % $EDITOR %
```

## vs

```bash
#!/usr/bin/env bash

# export FZF_DEFAULT_COMMAND='rg --files --ignore --hidden'
# vim $(rg --files --hidden --follow --glob '!venv'|fzf)

. ~/.config/vars

if [[ $# == 0 ]]; then

    if [ -f $(which bat) ]; then
        $EDITOR "$(fzf -e --preview 'bat --style=numbers --color=always {} | head -500')"
    else
        # vim $(fzf)
        # vim "$(find * | fzf +s --tac)"
        $EDITOR "$(fzf -e --preview 'cat {}')"
    fi
else
    $EDITOR "$@"
fi
```
