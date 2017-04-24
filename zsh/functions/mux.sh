#!/bin/bash
# Usage of this script:
# mux new_session_name
# mux existing_session_name
# mux (will list existing sessions)

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
    tmux new -s "$name"
  fi
}

gmux() {
  mux - "$1"
}
