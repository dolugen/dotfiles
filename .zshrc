eval "$(starship init zsh)"

export HOMEBREW_NO_AUTO_UPDATE=1

# aliases
alias gitt=git
alias gti=git
alias tig=git
alias got=git

alias cat=bat
alias ls=exa

alias mkdur=mkdir

alias docker=nerdctl
alias tf=terraform
alias k=kubectl

# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
