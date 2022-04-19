#!/usr/bin/env bash

# Skrypt sprawdza czy są zainstalowane potrzebne pakiety

. ~/.local/bin/colors

shopt -s nocasematch

declare BRAK
declare ZNALAZLEM
declare LISTA_PAKIETOW
mapfile -t WYMAGANE_PAKIETY < <(cat pakiety-void-i3.txt)

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
