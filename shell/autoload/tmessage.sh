#!/bin/bash

# Check the alias in alias.sh
# Useage:
# some_command :: "Message"
send_tmux_message() {
  local message="$@"
  if [ -z "$TMUX" ]; then
    echo "I'm not in tmux. But I meant to say: $message"
    return 1
  fi
  tmux set-option display-time 3000
  tmux display-message "$message"
  tmux set-option display-time 750
}
