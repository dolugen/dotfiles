
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="jreese"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

COMPLETION_WAITING_DOTS="true"

plugins=(debian pip vagrant command-not-found compleat python tmux)

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  

# Customize all the things! >>>

export EDITOR=emacs
export ALTERNATE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export SUDO_EDITOR=$EDITOR
alias e='emacs -nw'

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
alias glp='git log --patch'
alias glo='git log --oneline'
alias gls='git log --stat'
alias glps='git log --patch --stat'
alias gp='git push'
alias gms='git merge --squash'
alias gt='git commit --verbose'
alias ga='git add'
alias gdc='git diff --cached'
alias gd='git diff'
alias gs='git status -s'
alias gst='git status'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gcB='chkout_branch_B'
alias gmv='git mv'
alias grm='git rm'
alias gsh='git stash'
alias grH='git reset HEAD'
alias gb='git blame'
alias grbi='git rebase --interactive'
alias grbc='git rebase --continue'

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
