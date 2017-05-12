#!/bin/bash

init() {
  if [ -z "$1" ]; then
    echo "No template given"
    return 2
  fi
  local file="$HOME/.shell/templates/$1"
  if [ ! -e "$file" ]; then
    echo "Template doesn't exist: $1"
    return 1
  fi

  echo "Copying from $1"
  cp -R "$file/" .
  shift 1
  if [ -f "init.sh" ]; then
    if bash init.sh $@; then
      rm init.sh
    else
      echo "Init script failed!"
      return 1
    fi
  fi
}
