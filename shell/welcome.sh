#!/bin/bash

uptime_seconds() {
  cut -d' ' -f1 < /proc/uptime | cut -d. -f1
}

from_seconds() {
  local t="$1"
  local single="$2"

  local d=$((t/60/60/24))
  local h=$((t/60/60%24))
  local m=$((t/60%60))
  local s=$((t%60))

  if [ $d -gt 0 ]; then
    if [ $d = 1 ]; then printf "%d day " $d; else printf "%d days " $d; fi
    if [ ! -z "$single" ]; then return; fi
  fi
  if [ $h -gt 0 ]; then
    if [ $h = 1 ]; then printf "%d hour " $h; else printf "%d hours " $h; fi
    if [ ! -z "$single" ]; then return; fi
  fi
  if [ $m -gt 0 ]; then
    if [ $m = 1 ]; then printf "%d minute " $m; else printf "%d minutes " $m; fi
    if [ ! -z "$single" ]; then return; fi
  fi
  if [ $d = 0 ] && [ $h = 0 ] && [ $m = 0 ]; then
    if [ $s = 1 ]; then printf "%d second" $s; else printf "%d seconds" $s; fi
    if [ ! -z "$single" ]; then return; fi
  fi
}

pretty_uptime() {
  local upt
  upt="$(uptime_seconds)"
  from_seconds "$upt" "$1"
}

print_welcome() {
  _hostname_color
  echo -ne "\033[38;5;${HOST_COLOR}m"
  local message
  if [ -f ~/.welcome ]; then
    message="$(cat ~/.welcome)"
  else
    message="$(whoami) / $(hostname -s)"
  fi
  if command -v figlet > /dev/null; then
    figlet "$message"
  else
    echo "$message"
  fi
  if [ -e /proc/uptime ]; then pretty_uptime --single; fi
  echo -e "\033[0m"
  mx
}

if [ -z "$TMUX" ]; then
  case "$-" in
  *i*) print_welcome ;;
  *) ;;
  esac
fi
