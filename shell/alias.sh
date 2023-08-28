#!/bin/bash
alias f="$EDITOR"
alias :e="$EDITOR"
alias paste='tmux show-buffer'
alias copyf='tmux load-buffer'
alias copy='tmux set-buffer'

# Python
alias python="python3"
alias py="python3"

alias :q="exit"

# Git
chpwd() {
  if [ -e .jj ]; then
    alias git=jj
    return
  fi
  if [ -e .git ]; then
    alias git=/usr/bin/git
    return
  fi
}
chpwd
alias g="git"
alias gs=" git status"
alias gd=" git diff"
alias gcm=" git commit -m"
alias gc=" git commit"
alias gl=" git log"
alias gch=" git checkout"
alias gb=" git branch"
alias gaa=" git add --all"
alias gap=" git add --patch"
alias gp=" git push"

alias docker=podman

# Global utilities

if [ "$(uname)" = "Darwin" ]; then
  alias ls="ls -G"
  alias finder="open ."
else
  alias ls="ls --color=auto"
  alias grep="grep --color=auto"
fi

if which exa > /dev/null 2>&1; then
  alias ls=exa
fi
