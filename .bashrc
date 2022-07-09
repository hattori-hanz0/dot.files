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

# inne opcje dla setxkbmap
# caps:none - wyłączenie
# caps:escape - dodatkowy escape
# caps:super - dodatkowy windows key
# setxkbmap -option - zresetowanie ustawień
# setxkbmap -query - sprawdzenie ustawień


# włączenie vi mode
set -o vi

# historia poleceń
shopt -s histappend
HISTCONTROL=ignoreboth
HISTFILESIZE=100000
HISTSIZE=100000
HISTTIMEFORMAT='%F %T'
PROMPT_COMMAND='history -a'

# W przypadku kiedy zmienna $KEYCHAIN nie istnieje lub jest pusta uruchamia agenta ssh-agent
if [ -z $KEYCHAIN ]; then
    echo "Uruchamiam ssh-agent"
    export SSH_AUTH_ENV=$HOME/.ssh/ssh-agent-$HOSTNAME.env
	export SSH_AUTH_SOCK=~/.ssh/ssh-agent-$HOSTNAME.sock

	ssh-add -l 2>/dev/null >/dev/null
	if [ $? -ge 2 ]; then
		ssh-agent -a "$SSH_AUTH_SOCK" | tee $SSH_AUTH_ENV >/dev/null
	fi
    # ssh-add $HOME/.ssh/id_rsa
else
        /usr/bin/keychain -q $HOME/.ssh/id_rsa
        source $HOME/.keychain/$HOSTNAME-sh
fi

# zastąpienie ssh-agent przez gpg-agent
# unset SSH_AGENT_PID
# pgrep gpg-agent > /dev/null
# if [ $? == 1 ]; then
#    eval $(gpg-agent --daemon --enable-ssh-support)
#    # gpg-connect-agent /bye
# fi


eval $(gpg-agent --daemon)
GPG_TTY=$(tty)
export GPG_TTY

# Dodanie klucza do keychain
# /usr/bin/keychain $HOME/.ssh/id_dsa
# source $HOME/.keychain/$HOSTNAME-sh

# Usunięcie klucza z keychain
# keychain --clear
# keychain --clear $HOME/.ssh/id_dsa


# source <(gopass completion bash)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

eval "$(starship init bash)"
