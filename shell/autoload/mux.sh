#!/bin/bash
# Usage of this script:
# mux new_session_name
# mux existing_session_name
# mux (will list existing sessions)

show_sessions() {
  local format='#S #{pane_current_path} #{session_created_string}'
  local resp
  resp="$(tmux list-sessions -F "$format" 2> /dev/null)"
  if [ -z "$resp" ]; then
    echo "No sessions"
    return
  fi
  echo "Sessions:"
  while read -r line; do
    read -r name folder time <<< $line
    echo -e "  \033[0m$name: \033[38;5;240m$folder ($time)"
  done <<< "$resp"
  echo -ne "\033[0m"
}

mux() {
  local name="$1"

  if [ -z "$name" ]; then
    show_sessions
    return
  fi

  if [ "$name" = "-" ]; then
    [ -z "$2" ] && echo "Session name required" && return 1
    if gcd "$2"; then
      name="."
    else
      return 1
    fi
  fi

  if [ "$name" = "." ]; then
    name=${PWD##*/}
  fi

  name="${name//./}"

  if tmux has -t "$name" 2> /dev/null; then
    tmux attach -t "$name"
  else
    tmux new -s "$name"
  fi
}

alias gmux="mux -"

smux() {
  local hostname="$1"
  local session="$2"
  shift 2
  ssh "$hostname" "$@" -t "bash -lc 'mux \'$session\''"
}

sgmux() {
  local hostname="$1"
  local session="$2"
  shift 2
  ssh "$hostname" "$@" -t "bash -lc 'gmux \'$session\''"
}
