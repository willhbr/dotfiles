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

  if [ -z "$TMUX" ]; then
    tmux new-session -A -s "$name"
    return
  fi
  local window_count="$(tmux display -p '#{session_windows}')"
  if tmux has -t "$name" 2> /dev/null; then
    if [ "$window_count" = 1 ]; then
      tmux new-window 'sleep 1'
    fi
    tmux move-window -b -t "$name:{start}"
    tmux switch -t "$name"
    echo "switched to: $name"
  else
    if [ "$window_count" = 1 ]; then
      tmux rename-session "$name"
      echo "renamed to: $name"
    else
      tmux new -s "$name" -d 'sleep 1'
      tmux move-window -b -t "$name:{start}"
      tmux switch -t "$name"
      echo "new session: $name"
    fi
  fi
}
