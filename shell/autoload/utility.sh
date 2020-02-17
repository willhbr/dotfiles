#!/bin/bash

source_refresh() {
  if [ "$BASH" ]; then
    source ~/.bash_profile
  else
    source ~/.zshrc
  fi
}

# Check the alias in alias.sh
# Useage:
# some_command :: "Message"
send_tmux_message() {
  local message="$*"
  if [ -z "$TMUX" ]; then
    echo "I'm not in tmux. But I meant to say: $message"
    return 1
  fi
  tmux set-option display-time 3000
  tmux display-message "$message"
  tmux set-option display-time 750
}

do_runner() {
  clear
  tmux clear-history
  if fc -e -; then
    echo "Success."
    send_tmux_message "Runner succeeded"
  else
    echo "Failed: $?"
    send_tmux_message "Runner failed: $?"
  fi
}

mcd() {
  mkdir -p "$1"
  cd "$1"
}

rn() {
  local src_path="$1"
  local name="$2"
  local dest_path
  dest_path="$(dirname "$src_path")"
  if [ -z "$src_path" ] || [ -z "$dest_path" ] || [ -z "$name" ]; then
    echo "Usage: rn <file path> <new name>"
    echo "Rename a file keeping it in the same folder"
    return 1
  fi
  echo mv "$src_path" "$dest_path/$name"
  mv "$src_path" "$dest_path/$name"
}

dup() {
  local src_path="$1"
  local name="$2"
  local dest_path
  dest_path=$(dirname "$src_path")
  if [ -z "$src_path" ] || [ -z "$dest_path" ] || [ -z "$name" ]; then
    echo "Usage: dup <file path> <new name>"
    echo "Duplicate a file with a new name"
    return 1
  fi
  echo cp "$src_path" "$dest_path/$name"
  cp "$src_path" "$dest_path/$name"
}

whereami() {
  pwd
  whoami
  uname -a
  date
}

duck() {
  message="$1"
  [ -z "$message" ] && message="Duck!"
  local text=""
  local yellow="\033[38;5;220m"
  local orange="\033[38;5;202m"
  local green="\033[38;5;83m"
  local blue="\033[38;5;33m"
read -r -d '' text <<- EOF
\033[38;5;220m     ___
 ___( o )$orange>  $green$(echo "$message" | xargs) $yellow
 \ <_. )
$blue~~$yellow\`---'$blue~~~~~~~~
@@@@@@@@@@@@@@@\033[0m
EOF
  echo -e "$text"
}
