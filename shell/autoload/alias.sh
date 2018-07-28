#!/bin/bash
if type nvim > /dev/null; then
  EDITOR=nvim
else
  EDITOR=vim
fi
alias vim="$EDITOR"
alias f="$EDITOR"
alias :e="$EDITOR"

# Python
alias python="python3"
alias py="python3"
# alias pip="pip3"

alias :q="exit"

alias redis="redis-cli"

# Git
alias gs=" git status"
alias gd=" git diff --cached"
alias gdn=" git diff"
alias gcm=" git commit -m"
alias gc=" git commit"
alias gl=" git log"
alias gch=" git checkout"
alias gb=" git branch"
alias gaa=" git add --all"
alias gap=" git add --patch"
alias gp=" git push"

# Global utilities

if [ ! -z "$ZSH_NAME" ]; then
  for mode in +x -x +r -r +w -r 777 755; do
    eval "$mode() { chmod $mode \"\$@\" }"
  done
  alias -g CL=" | wc -l"
  alias -g CC=" | wc -c"
  alias -g LESS=" | less"
  alias -g ::=" ; send_tmux_message "
  alias -g '??'=" | grep"

  local short='...'
  local long='../..'
  for dots in {1..10}; do
    alias -g $short=$long
    short="${short}."
    long="$long/.."
  done
fi

if [ "$(uname)" = "Darwin" ]; then
  alias ls="ls -G"
  alias finder="open ."
  alias tower="gittower"
else
  alias ls="ls --color=auto"
  alias grep="grep --color=auto"
fi
