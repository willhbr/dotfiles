#!/bin/bash
# Usage of this script:
# mx new_session_name
# mx existing_session_name
# mx (will list existing sessions)

mx() {
  local name="$1"

  if [ -z "$name" ]; then
    tmux ls -F '#S'
    return
  fi

  if [[ "$name" = .* ]]; then
    local prev="$PWD"
    if cd "$name"; then
      name=${PWD##*/}
      cd "$prev"
    else
      name=${PWD##*/}
    fi
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
