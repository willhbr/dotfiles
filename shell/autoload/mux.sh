#!/bin/bash
# Usage of this script:
# mx new_session_name
# mx existing_session_name
# mx (will list existing sessions)

mx() {
  local name="$1"

  if [ -z "$name" ]; then
    local sessions
    sessions="$(tmux ls)"
    echo "${sessions//: /:		}"
    return
  fi

  if [ "$name" = "-" ]; then
    [ -z "$2" ] && echo "Session name required" && return 1
    local previous_path="$PWD"
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

  if [ -z "$TMUX" ]; then
    if tmux has -t "$name" 2> /dev/null; then
      tmux attach -t "$name"
    else
      tmux new -s "$name"
    fi
  else
    if tmux has -t "$name" 2> /dev/null; then
      tmux switch -t "$name"
    else
      tmux new -s "$name" -d
      tmux switch -t "$name"
    fi
  fi
  if [ ! -z "$previous_path" ]; then
    cd "$previous_path"
  fi
}

alias gmx="mx -"
