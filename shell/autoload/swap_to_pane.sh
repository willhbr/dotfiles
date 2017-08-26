#!/bin/bash

swap_to_pane() {
  local search="$1"
  for line in $(tmux list-panes -s -F '#{pane_id}<<>>#{window_id}<<>>#{pane_current_path}'); do
    echo "$line"
    local pane
    local window
    local currpath
    IFS='<<>>' read -r pane window currpath <<< "$line"
    if ( tmux capture-pane -J -p -t "$pane"; echo "$currpath" ) | grep -q "$search"; then
      echo "$pane $window"
      tmux select-window -t "$window"
      tmux select-pane -t "$pane"
      return 0
    fi
  done
  return 1
}
