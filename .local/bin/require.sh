#!/usr/bin/env bash

. ~/.config/vars
. ~/.local/bin/colors

# lista wymaganych programów
declare -a LISTA_KOMEND=(
    "alacritty"
    "bat"
    "cpupower"
    "cryptsetup"
    "curl"
    "exa"
    "fd"
    "fzf"
    "gh"
    "git"
    "gopass"
    "gpg2"
    "lf"
    "maim"
    "notify-send"
    "nvim"
    "oathtool"
    "pacmd"
    "pactl"
    "pulseaudio"
    "pwgen"
    "rg"
    "rofi"
    "sd"
    "shred"
    "sk"
    "tmux"
    "upower"
    "xclip"
    "xdotool"
    "xinput"
    "xrandr"
    "xsel"
    "xset"
    "xz"
    "zathura"
)

declare BRAK
declare ZNALAZLEM

# funkcja sprawdzająca czy są wszystkie wymagane komendy z listy LISTA_KOMEND
function komendy() {
    for ((i = 0; i < ${#LISTA_KOMEND[@]}; i++)); do
        command -v ${LISTA_KOMEND[$i]} >/dev/null 2>&1
        if [[ ! $? -eq 0 ]]; then
            # msg_error "Brak komendy ${LISTA_KOMEND[$i]}"
            BRAK+=("${LISTA_KOMEND[$i]} ")
        else
            # msg_info "Znalazłem komendę ${LISTA_KOMEND[$i]}"
            ZNALAZLEM+=("${LISTA_KOMEND[$i]} ")
        fi
    done
}

komendy

for ((i = 0; i < ${#ZNALAZLEM[@]}; i++)); do
    msg_ok "Znalazłem komendę ${ZNALAZLEM[$i]}"
done

for ((i = 0; i < ${#BRAK[@]}; i++)); do
    msg_error "Brak komendy ${BRAK[$i]}"
done
