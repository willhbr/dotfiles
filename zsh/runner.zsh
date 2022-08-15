#!/bin/zsh

set-runner-command() {
  tmux setenv RUNNER_COMMAND "$BUFFER"
  tmux setenv RUNNER_PWD "$PWD"
  BUFFER=""
  CURSOR=0
}

zle -N set-runner-command
bindkey "^[R" set-runner-command
