#!/bin/bash
alias f="$EDITOR"
alias :e="$EDITOR"
alias :vsp='tmux split-window -h'
alias :sp='tmux split-window -v'

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
  copy() {
    if [ -n "$1" ]; then
      pbcopy < "$1"
    else
      pbcopy
    fi
  }
else
  alias paste='tmux show-buffer'

  copy() {
    # Do this to keep the normal tmux clipboard separate from system clipboard
    [ -n "$TMUX" ] && tmux set set-clipboard on
    if [ -n "$1" ]; then
      printf "\033]52;c;%s\007" "$(base64 < "$1" | tr -d '\n')"
    else
      printf "\033]52;c;%s\007" "$(base64 | tr -d '\n')"
    fi
    [ -n "$TMUX" ] && tmux set set-clipboard external
  }
  alias ls="ls --color=auto"
  alias grep="grep --color=auto"
  eval "$(dircolors -b ~/.dircolors)"
fi

if which eza > /dev/null 2>&1; then
  alias ls=eza
fi

