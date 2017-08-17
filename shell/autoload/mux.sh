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

show_sessions() {
  local format='#S #{pane_current_path} #{session_created_string}'
  local resp="$(tmux list-sessions -F "$format" 2> /dev/null)"
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

smux() {
  local hostname="$1"
  local session="$2"
  shift 2
  ssh "$hostname" "$@" -t "bash -lc 'if tmux has-session -t '$session' > /dev/null; then tmux a -t '$session'; else tmux new -s '$session'; fi'"
}
