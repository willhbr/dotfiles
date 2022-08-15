precmd() {
  if [ -z "$TMUX" ]; then return; fi
  local session="$(tmux display -p '#S')"
  tmux set-environment -h -t "$session" "START_TIME_$TMUX_PANE" "$(date +%s)"
}

cmd-times() {
  local now="$(date +%s)"
  tmux list-panes -F '#{pane_id}' | while read -r pane_id; do
    local cmd="$(tmux display -t "$pane_id" -p '#{pane_current_command}')"
    local start="$(tmux show-environment "START_TIME_$pane_id")"
    local t="${start#"START_TIME_$pane_id="}"
    local diff=$(( now - t ))
    echo "$cmd: $(date -u -d @"$diff" +'%-Mm %-Ss')"
  done
}

