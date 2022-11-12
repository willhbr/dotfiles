#!/bin/bash
alias f="$EDITOR"
alias :e="$EDITOR"
alias paste='tmux show-buffer'
alias copyf='tmux load-buffer'
alias copy='tmux set-buffer'

# Python
alias python="python3"
alias py="python3"
# alias pip="pip3"

alias :q="exit"

# Git
alias g=git
alias gs=" git status"
alias gd=" git diff --cached"
alias gdn=" git diff"
alias gcm=" git commit -m"
alias gc=" git commit"
alias gl=" git xl"
alias gch=" git checkout"
alias gb=" git branch"
alias gaa=" git add --all"
alias gap=" git add --patch"
alias gp=" git push"

# Global utilities

if [ "$(uname)" = "Darwin" ]; then
  alias ls="ls -G"
  alias finder="open ."
else
  alias ls="ls --color=auto"
  alias grep="grep --color=auto"
fi
