#!/bin/bash

print_welcome() {
  _hostname_color
  echo -ne "\033[38;5;${HOST_COLOR}m"
  local message
  message="$(whoami) / $(hostname)"
  if command -v figlet > /dev/null; then
    figlet "$message"
  else
    echo "$message"
  fi
  echo -ne "\033[0m"
  mux
}

if [ -z "$TMUX" ]; then
  case "$-" in
  *i*) print_welcome ;;
  *) ;;
  esac
fi
