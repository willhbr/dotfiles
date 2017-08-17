#!/bin/bash

gp() {
  local remote="$1"
  local branch="$2"
  if [ -z "$remote" ] || [ -z "$branch" ]; then
    echo 'Must give remote and branch'
    return 1
  fi
  [ "$remote" = 'o' ] && remote=origin
  [ "$branch" = 'm' ] && branch=master

  git push "$remote" "$branch"
}
