
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="jreese"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

COMPLETION_WAITING_DOTS="true"

plugins=(debian pip vagrant command-not-found compleat python tmux)

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  

# Customize all the things! >>>

export ALTERNATE_EDITOR=emacs
export EDITOR=emacsclient
export VISUAL=emacsclient
export SUDO_EDITOR=emacsclient
alias e='emacsclient -nw'

# General aliases
alias down='sudo shutdown -h 0'
alias m='man'
alias nm='ncmpcpp'
alias ra='ranger'

# Vagrant aliases
alias v='vagrant'
alias vs='v ssh'
alias vr='v reload'
alias vu='v up'
alias vp='v suspend'
alias vus='vu; vs'
alias vrs='vr; vs'
alias vh='v halt'

# git aliases
alias gf='git fetch'
alias gl='git log'
alias glp='git log -p'
alias glo='git log --oneline'
alias gls='git log --stat'
alias gp='git push'
alias gms='git merge --squash'
alias gt='git commit --verbose'
alias ga='git add'
alias gdc='git diff --cached'
alias gd='git diff'
alias gs='git status -s'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gcB='chkout_branch_B'
alias gmv='git mv'
alias gsh='git stash'
alias grH='git reset HEAD'
alias gb='git blame'

function chkout_branch_B(){
    # instead of merging from remote
    # just put branch head to origin head
    git checkout -B $1 origin/$1
}

alias please='sudo $(fc -ln -1)'

alias govm="start_and_ssh_vm"

# ~/w as the working directory
function start_and_ssh_vm(){
    cd ~/w/$1
    vus
}

# disable zsh auto correct
DISABLE_CORRECTION="true"
unsetopt correct
unsetopt correct_all

export PATH=~/w/dotfiles/scripts:$PATH
export PATH=$PATH:~/.local/bin/
