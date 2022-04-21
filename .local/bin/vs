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
