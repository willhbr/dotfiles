#!/bin/bash

duck() {
  message="$1"
  [ -z "$message" ] && message="Duck!"
  local text=""
  local yellow="\033[38;5;220m"
  local orange="\033[38;5;202m"
  local green="\033[38;5;83m"
  local blue="\033[38;5;33m"
read -r -d '' text <<- EOF
\033[38;5;220m     ___
 ___( o )$orange>  $green$(echo "$message" | xargs) $yellow
 \ <_. )
$blue~~$yellow\`---'$blue~~~~~~~~
@@@@@@@@@@@@@@@\033[0m
EOF
  echo -e "$text"
}
