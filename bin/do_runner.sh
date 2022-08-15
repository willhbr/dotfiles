#!/bin/bash

cmd="$(tmux show-environment RUNNER_COMMAND)"
dir="$(tmux show-environment RUNNER_PWD)"
session="$(tmux display -p '#S')"

cd "${dir#RUNNER_PWD=}"
cmd="${cmd#RUNNER_COMMAND=}"

echo "> $cmd"
"$SHELL" -lc "$cmd"
echo "Exit: $?"

pane="$TMUX_PANE"
tmux display-popup -E "tmux capture-pane -p -t '$pane' | less"
