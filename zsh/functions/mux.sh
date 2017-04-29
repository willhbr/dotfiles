#!/bin/bash
# Usage of this script:
# mux new_session_name
# mux existing_session_name
# mux (will list existing sessions)

load_muxfile() {
  local file="$1"
  local name="$2"
  if [ -z "$file" ] || [ ! -f "$file" ]; then
    echo "File $file doesn't exist"
    return 1
  fi
  if [ -z "$name" ]; then
    echo "Session name must be given"
    return 2
  fi
  
  echo "Loading $file for $name..."
  tmux new-session -d -s "$name"
  tmux source-file "$(pwd)/$file"
  tmux attach -t "$name"
}

mux() {
  local name="$1"

  if [ -z "$name" ]; then
    tmux ls 2> /dev/null
    if [ $? -ne 0 ]; then
      echo "No sessions"
    fi
    return
  fi

  if [ "$name" = "-" ]; then
    [ -z "$2" ] && echo "Session name required" && return 1
    gcd "$2"
    name="."
  fi

  if [ "$name" = "." ]; then
    name=${PWD##*/}
  fi

  if tmux has -t "$name" 2> /dev/null; then
    tmux attach -t "$name"
  else
    if [ -f ".muxfile" ]; then
      load_muxfile ".muxfile" "$name"
    else
      tmux new -s "$name"
    fi
  fi
}

gmux() {
  mux - "$1"
}
