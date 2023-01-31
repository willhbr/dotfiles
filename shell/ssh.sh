#!/bin/bash

# Print the hostname when exiting from an ssh connection
ssh() {
  if [ -n "$TMUX" ]; then
    local prefix="$(tmux display -p '#{prefix}')"
    local status_mode="$(tmux display -p '#{status}')"
    tmux set status off
    tmux set key-table nested
    tmux set prefix None
  fi
  command ssh "$@"
  local res=$?
  echo
  echo -e "Back on \033[38;5;${HOST_COLOR}m$(hostname -s)\033[0m as $(whoami)"
  if [ -n "$TMUX" ]; then
    tmux set status "$status_mode"
    tmux set key-table root
    tmux set prefix "$prefix"
  fi
  return $res
}
