#!/bin/bash
# Usage of this script:
# mx new_session_name
# mx existing_session_name
# mx (will list existing sessions)

mx() {
  local name="$1"

  if [ -z "$name" ]; then
    tmux ls -F '#S' -f '#{?#{m:_popup_*,#S},0,1}'
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

  name="${name//./-}"

  if ! tmux has -t "$name" 2> /dev/null; then
    tmux new -s "$name" -d
  fi
  if [ -n "$TMUX" ]; then
    tmux move-window -b -t "$name:{start}"
    tmux switch -t "$name"
  else
    tmux attach -t "$name"
  fi
}
