# Aliasy

Aliasy znajdują się w pliku `.config/aliases`, są wczytywane z pliku `.bashrc`

Plik wcześniej wczytują zmienne znajdujące się w pliku `.config/vars`

## Programy

### Alias 'pass'

Prowadzi do programu `gopass`, dodatkowa spacja pomija komendę w historii komend BASH

```
alias pass=" gopass"
```

### Alias 'b'

Prowadzi do programu `bat`

```bash
alias b=bat
```

### Alias 'sudo'

Ustawia alias `sudo` na zmienną `$SUDO` przechowywaną w pliku `.config/vars`

```
alias sudo=$SUDO
```

## Procesy

### Alias 'pg'

Wyszukuje procesu przekazanego jako argument

```
alias pg="ps ax|grep"
```

### Alias 'k'

Zabija proces

```
alias k=kp
```

### Alias 'kp'

Prowadzi do skryptu `~/.local/bin/kp`, który wyświetla listę procesów, a następnie przekazuje do
wyszukiwarki FZF. Po wybraniu procesu jest on zabijany za pomocą polecenia `kill`.

```bash
#!/usr/bin/env bash

PROCES=$(ps -hxo pid,cmd | fzf -m --height=100% --header='[kill:process]' --prompt "Wyszukaj: " | awk '{print $1}')
[ -z $PROCES ] || kill -9 $PROCES
```

## Inne

### Alias 'c'

Czyści ekran

```
alias c=clear
```

### Alias 'q'

Zamyka powłokę za pomocą komendy `exit`

```
alias q=exit
```

### Alias 'n'

Uruchamia edytor Neovim

```
alias n=nvim
```

### Alias 'nvim-qt-local'

Uruchamia edytor Neovim ze ścieżki `.local/nvim` w środowisku graficznym

```
alias nvim-qt-local=$HOME/.local/bin/nvim-qt-local
```

### Alias 'man'

Uruchamia strony podręcznika man w edytorze Neovim

```
alias man="$HOME/.local/bin/man-nvim.sh"
```

## Git

### Alias 'g'

Alias do polecenia `git`

```
alias g=git
```

### Alias 'ga'

Uruchamia polecenie `git add -A` a następnie `git commit`

```
alias ga="$HOME/.local/bin/ga.sh"
```

Skrypt `ga.sh`

```bash
#!/usr/bin/env bash

DATA=$(date +%F-%T)

cd "$1"

git add -A && git commit -m $DATA
```

### Alias 'gd'

Uruchamia polecenie `git diff`

```
alias gd="$HOME/.local/bin/gd.sh"
```

Skrypt `gd.sh`

```bash
#!/usr/bin/env bash

git diff
```

### Alias 'gp'

```
alias gp="$HOME/.local/bin/gp.sh"
```

### Alias 'gps'

```
alias gps="$HOME/.local/bin/gps.sh"
```

### Alias 'gs'

```
alias gs="$HOME/.local/bin/gs.sh"
```

### Alias 'gl'

```
alias gl="$HOME/.local/bin/gl.sh"
```

Skrypt `gl.sh`

```bash
#!/usr/bin/env bash

git log --graph --abbrev --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''        %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
```

### Alias 'pu'

```
alias pu="$HOME/.local/bin/pu.sh"
```

### Alias 'push'

```
alias push="$HOME/.local/bin/push.sh"
```

## Pliki konfiguracyjne

### Alias '.a'

Edytuje plik `~/.config/aliases`

```
alias .a="$EDITOR $HOME/.config/aliases && source $HOME/.config/aliases"
```

### Alias '.ala'

Edytuje plik konfiguracyjny terminala Alacritty

```
alias .ala="$EDITOR $HOME/.config/alacritty/alacritty.yml"
```

### Alias '.b'

Edytuje konfigurację powłoki systemowej BASH

```
alias .b="$EDITOR $HOME/.bashrc"
```

### Alias '.n'

```
alias .n="nvim $HOME/.config/nvim/init.vim"
```

### Alias '.nv'

```
alias .nv="nvim -c 'e \$MYVIMRC'"
```

### Alias '.i3'

Edytuje konfiguracje i3 WM

```
alias .i3="$EDITOR $HOME/.config/i3/config"
```

### Alias '.sx'

Edytuje konfigurację sxhkd dla i3 WM

```
alias .sx="$EDITOR $HOME/.config/i3/sxhkdrc && pkill -USR1 -x sxhkd"
```

### Alias '.t'

Edytuje konfigurację TMUX

```
alias .t="$EDITOR $HOME/.tmux.conf"
```

### Alias '.df'

```
alias .df="$HOME/.local/bin/dotfiles.sh"
```

Skrypt `dotfiles.sh`

```bash
#!/usr/bin/env bash

# alias do edycji skryptu to: .df

. ~/.config/vars

ARR=(
    ~/.bashrc
    ~/.config/alacritty/alacritty.yml
    ~/.config/aliases
    ~/.config/awesome/autorun.sh
    ~/.config/awesome/rc.lua
    ~/.config/bmdirs
    ~/.config/bspwm/autostart.sh
    ~/.config/bspwm/bspwmrc
    ~/.config/conky/conky.conf
    ~/.config/nvim/init.vim
    ~/.config/sxhkd/sxhkdrc
    ~/.config/vars
    ~/.gitconfig
    ~/.ssh/config
    ~/.tmux.conf
    ~/.vim/vimrc
    ~/.Xresources
    ~/.zshrc
    )

PLIK=$(printf '%s\n' "${ARR[@]}"|fzf)

if [ "$PLIK" ]; then
   $EDITOR "$PLIK"
fi
```

### Alias '.co'

Edytuje konfigurację `conky.conf`

```
alias .co="$EDITOR ~/.config/conky/conky.conf"
```

### Alias '.g'

```
alias .g="$EDITOR $HOME/.gitconfig"
```

### Alias '.kh'

```
alias .kh="$EDITOR $HOME/.ssh/known_hosts"
```

### Alias '.s'

Edytuje konfigurację klienta SSH

```
alias .s="$EDITOR $HOME/.ssh/config"
```

### Alias '.vars'

```
alias .vars="$EDITOR $HOME/.config/vars && source $HOME/.config/vars"
```

### Alias '.xr'

```
alias .xr="$EDITOR ~/.Xresources && xrdb ~/.Xresources"
```

### Alias '.z'

```
alias .z="$EDITOR $HOME/.zshrc"
```

## Pliki i katalogi

### Alias '...'

```
alias ...="cd ../.."
```

### Alias '..'

```
alias ..="cd .."
```

### Alias '.d'

```
alias .d="cd $HOME/git/dot.files"
```

### Alias '.git'

```
alias .git="cd $HOME/git"
```

### Alias '.src'

```
alias .src="cd $HOME/src"
```

### Alias .w

```
alias .w="cd $HOME/workspace"
```

### Alias 'cdb'

```
alias cdb="source ~/.local/bin/cdb"
```

### Alias 'cdba' / 'cda'

```
alias cda="source ~/.local/bin/cdba"
alias cdba="source ~/.local/bin/cdba"
```

### Alias 'cdbd' / 'cdd'

```
alias cdd="source ~/.local/bin/cdbd"
alias cdbd="source ~/.local/bin/cdbd"
```

### Alias 'cdbe' / 'cde'

```
alias cde="$EDITOR ~/.config/bmdirs"
alias cdbe="$EDITOR ~/.config/bmdirs"
```

### Alias 'cdf'

```
alias cdf="source $HOME/.local/bin/cdf"
```

### Alias 'path'

```
alias path="echo $PATH|tr \":\" \"\n\""
```

### Funkcja 'cd'

```
function cd() {
    builtin cd "$@" && cd_func;
}
```

### Funkcja 'cd_func'

```
function cd_func() {
    [ -e $PWD/run_dir.sh ] && source $PWD/run_dir.sh
}
```

### Alias 'dchmod'

```
alias dchmod="$HOME/.local/bin/dchmod"
```

### Alias 'fchmod'

```
alias fchmod="$HOME/.local/bin/fchmod"
```

### Alias 'll'

```
alias ll="$HOME/.local/bin/ll"
```

### Alias 'l'

```
alias l="ll"
```

### Alias 'lm'

Wyświetla pliki posortowane po dacie modyfikacji

```bash
alias lm="$HOME/.local/bin/lm.sh" # exa pliki posortowane po dacie modyfikacji
```

### Alias 'f'

```
alias f="ls -A|wc -l"
```

### Alias 'md' / 'mkcdir'

```
alias md="mkcdir"
alias mkcdir="source $HOME/.local/bin/mkcdir $1"
```

### Alias 'mkdir'

```
alias mkdir="mkdir -p"
```

### Alias 'lsx'

```
alias lsx="ls -F | grep '\*$'" # pokazuje pliki wykonywalne w lokalizacji
```

### Alias 'exa-tree'

```
alias exa-tree="$HOME/.local/bin/exa-tree"
```

### Alias 'cleartemp'

Czyści katalog z plikami tymczasowymi `~/tmp` starsze niż 7 dni

```
alias cleartemp="$HOME/.local/bin/cleartemp"
```

Skrypt `cleartemp`

```bash
#!/usr/bin/env bash

find -L ~/tmp -type f -mtime +7 -print -exec rm {} \;
find -L ~/tmp -type d -mtime +7 -exec rmdir --ignore-fail-on-non-empty {} \;
```

## Szyfrowanie

### Alias 'dec'

Alias do skryptu `DecryptGPG`

```
alias dec="$HOME/.local/bin/DecryptGPG"
```

### Alias 'enc'

Alias do skryptu `EncryptGPG`

```
alias enc="$HOME/.local/bin/EncryptGPG"
```

### Alias 'DecryptGPG'

```
alias DecryptGPG="$HOME/.local/bin/DecryptGPG"
```

Skrypt `DecryptGPG`

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

### Alias 'DecryptSSL'

```
alias DecryptSSL="$HOME/.local/bin/DecryptSSL"
```

Skrypt `DecryptSSL`

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

### Alias 'EncryptGPG'

```
alias EncryptGPG="$HOME/.local/bin/EncryptGPG"
```

Skrypt `EncryptGPG`

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

### Alias 'EncryptSSL'

```
alias EncryptSSL="$HOME/.local/bin/EncryptSSL"
```

Skrypt `EncryptSSL`

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

## Wyszukiwanie i przeszukiwanie

### Alias 'rgvi'

```
alias rgvi="$HOME/.local/bin/rgvi"
```

Skrypt `rgvi`

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

### Alias 'se'

```
alias se="$HOME/.local/bin/se"
```

Skrypt `se`

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

### Alias 'sedi'

```
alias sedi="$HOME/.local/bin/sedi"
```

Skrypt `sedi`

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

### Alias 'sefi'

```
alias sefi="$HOME/.local/bin/sefi"
```

Skrypt `sefi`

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

### Alias 'vf'

```
alias vf="$HOME/.local/bin/vf"
```

Skrypt `vf`

```bash
#!/usr/bin/env bash

. ~/.config/vars

sk | xargs -r -I % $EDITOR %
```

### Alias 'vs'

```
alias vs="$HOME/.local/bin/vs"
```

Skrypt `vs`

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

### Alias 'last-edit'

```
alias last-edit="$HOME/.local/bin/last-edit"
```

Skrypt `last-edit`

```bash
#!/usr/bin/env bash

find $HOME -type f -mtime -3 -mtime +4
find $HOME -type f -mtime -3
```

### Alias 'last-edit-local'

```
alias last-edit-local="$HOME/.local/bin/last-edit-local"
```

Skrypt `last-edit-local`

```bash
#!/usr/bin/env bash

find . -type f -mtime -3 -mtime +4
find . -type f -mtime -3
```

### Alias 'fdh'

```
alias fdh="fd --hidden"
```

### Alias 'rgh'

```
alias rgh="rg --hidden"
```
