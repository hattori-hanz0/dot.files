# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# wczytanie standardowej konfiguracji BASH
[ -f "/etc/bashrc" ] && . "/etc/bashrc"

# wczytanie zmiennych z ~/.config/vars
[ -f "$HOME/.config/vars" ] && . "$HOME/.config/vars"

# wczytanie aliasów z pliku ~/.config/aliases
[ -f "$HOME/.config/aliases" ] && . "$HOME/.config/aliases"

# wyłączenie ctrl-s i ctrl-q
stty -ctlecho

# ustawinie esc na capslocku
if [ $DISPLAY ]; then
    setxkbmap -option caps:escape
    xset r rate 280 40
fi

# włączenie vi mode
set -o vi

# historia poleceń
shopt -s histappend
HISTCONTROL=ignoreboth
HISTFILESIZE=100000
HISTSIZE=100000
HISTTIMEFORMAT='%F %T'
PROMPT_COMMAND='history -a'

eval $(ssh-agent)
eval $(gpg-agent --daemon)
GPG_TTY=$(tty)
export GPG_TTY

# source <(gopass completion bash)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

eval "$(starship init bash)"
