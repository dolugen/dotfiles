
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gallifrey"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

COMPLETION_WAITING_DOTS="true"

plugins=(debian git zsh-syntax-highlighting nyan pip vagrant catimg command-not-found compleat python web-search)

source $ZSH/oh-my-zsh.sh

# Customize all the things! >>>

export ALTERNATE_EDITOR=emacs
export EDITOR=emacsclient
export VISUAL=emacsclient
alias e='emacsclient -nw'

alias dic='sdcv'
alias ff='firefox'
alias v='vagrant'
alias wk='workon'
alias wo='workon'

# disable zsh auto correct
DISABLE_CORRECTION="true"
unsetopt correct
unsetopt correct_all

export PATH=$PATH:/home/bk/.local/bin/
