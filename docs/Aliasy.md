# Aliasy

Aliasy znajdują się w pliku `.config/aliases`, są wczytywane z pliku `.bashrc`

Plik wcześniej wczytują zmienne znajdujące się w pliku `.config/vars`

## Programy

### Alias 'pass'

```
alias pass=gopass
```

### Alias 'sudo'

Ustawia alias `sudo` na zmienną `$SUDO` przechowywaną w pliku `.config/vars`

```
alias sudo=$SUDO
```

## Procesy

### Alias 'pg'

```
alias pg="ps ax|grep"
```

### Alias 'k'

```
alias k="kill"
```

### Alias 'c'

```
alias c=clear
```

### Alias 'q'

```
alias q=exit
```

### Alias 'n'

```
alias n=nvim
```

### Alias 'nvim-qt-local'

```
alias nvim-qt-local=$HOME/.local/bin/nvim-qt-local
```

### Alias 'man'

```
alias man="$HOME/.local/bin/man-nvim.sh"
```

## Git

### Alias 'g'

```
alias g=git
```

### Alias 'ga'

```
alias ga="$HOME/.local/bin/ga.sh"
```

### Alias 'gd'

```
alias gd="$HOME/.local/bin/gd.sh"
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

```
alias .a="$EDITOR $HOME/.config/aliases && source $HOME/.config/aliases"
```

### Alias '.ala'

```
alias .ala="$EDITOR $HOME/.config/alacritty/alacritty.yml"
```

### Alias '.b'

```
alias .b="$EDITOR $HOME/.bashrc"
```

### Alias '.n'

```
alias .n="nvim $HOME/.config/nvim/init.vim"
```

### Alias '.i3'

```
alias .i3="$EDITOR $HOME/.config/i3/config"
```

### Alias '.sx'

```
alias .sx="$EDITOR $HOME/.config/i3/sxhkdrc && pkill -USR1 -x sxhkd"
```

### Alias '.t'

```
alias .t="$EDITOR $HOME/.tmux.conf"
```

### Alias '.df'

```
alias .df="$HOME/.local/bin/dotfiles.sh"
```

### Alias '.co'

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

### Alias '.nv'

```
alias .nv="nvim -c 'e \$MYVIMRC'"
```

### Alias '.s'

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

```
alias cleartemp="$HOME/.local/bin/cleartemp"
```

## Szyfrowanie

### Alias 'dec'

```
alias dec="$HOME/.local/bin/DecryptGPG"
```

### Alias 'enc'

```
alias enc="$HOME/.local/bin/EncryptGPG"
```

### Alias 'DecryptGPG'

```
alias DecryptGPG="$HOME/.local/bin/DecryptGPG"
```

### Alias 'DecryptSSL'

```
alias DecryptSSL="$HOME/.local/bin/DecryptSSL"
```

### Alias 'EncryptGPG'

```
alias EncryptGPG="$HOME/.local/bin/EncryptGPG"
```

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
