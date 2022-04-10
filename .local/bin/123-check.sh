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

declare -a PAKIETY_FEDORA=(
    "nvim"
    "git"
    "rg"
    "fd"
    "fzf"
    "picom"
    "xclip"
)

declare -a PAKIETY_UBUNTU=(
    "nvim"
    "git"
    "rg"
    "fd"
    "fzf"
    "picom"
    "xclip"
)

declare -a PAKIETY_ARCH=(
    "nvim"
    "git"
    "rg"
    "fd"
    "fzf"
    "picom"
    "xclip"
)

declare -a PAKIETY_VOID=(
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
    for i in ${PAKIETY_FEDORA[@]}; do
        check "$i"
    done

    echo
    msg_info "Jeśli brakuje jakiegoś pakietu uruchom polecenie:"
    echo
    echo "sudo dnf install neovim git ripgrep fzf fd-find starship xclip"
    echo
fi

if [[ $UBUNTU ]]; then
    for i in ${PAKIETY_UBUNTU[@]}; do
        check "$i"
    done

    echo
    msg_info "Jeśli brakuje jakiegoś pakietu uruchom polecenie:"
    echo
    echo "sudo apt install neovim git ripgrep fzf fd-find starship xclip"
fi

if [[ $ARCH ]]; then
    for i in ${PAKIETY_ARCH[@]}; do
        check "$i"
    done

    echo
    msg_info "Jeśli brakuje jakiegoś pakietu uruchom polecenie:"
    echo
    echo "sudo pacman -S neovim git ripgrep fzf fd-find starship xclip"
fi

if [[ $VOID ]]; then
    for i in ${PAKIETY_VOID[@]}; do
        check "$i"
    done

    echo
    msg_info "Jeśli brakuje jakiegoś pakietu uruchom polecenie:"
    echo
    echo "sudo xbps-install -S neovim git ripgrep fzf fd i3 i3status-rust starship picom xclip \\"
    echo "psmisc"
fi
