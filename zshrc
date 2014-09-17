
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="jreese"

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

# General aliases
alias na='nautilus'
alias down='sudo shutdown -h 0'
alias m='man'
alias dic='sdcv'
alias ff='firefox'

# Vagrant aliases
alias v='vagrant'
alias vs='v ssh'
alias vr='v reload'
alias vu='v up'

# disable zsh auto correct
DISABLE_CORRECTION="true"
unsetopt correct
unsetopt correct_all

export PATH=~/bin/:$PATH
export PATH=$PATH:~/.local/bin/