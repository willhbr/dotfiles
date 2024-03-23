#!/bin/bash
alias f="$EDITOR"
alias :e="$EDITOR"
alias :vsp='tmux split-window -h'
alias :sp='tmux split-window -v'
alias paste='tmux show-buffer'
alias copyf='tmux load-buffer'
alias copy='tmux set-buffer'

# Python
alias python="python3"
alias py="python3"

alias :q="exit"

# Git
alias g="jj"
alias gs=" g status"
alias gd=" g diff"
alias gcm=" g commit -m"
alias gc=" g commit"
alias gl=" g log"
alias gp=" g push"

alias docker=podman

# Global utilities

if [ -d /Users ]; then
  export CLICOLOR=1
  alias ls="ls -G"
  alias finder="open ."
else
  alias ls="ls --color=auto"
  alias grep="grep --color=auto"
  eval "$(dircolors -b ~/.dircolors)"
fi

if which exa > /dev/null 2>&1; then
  alias ls=exa
fi

