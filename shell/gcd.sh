#!/bin/bash

gcd() {
  IFS=':' read -Ar project_paths <<< "$PROJECT_PATHS"

  if [ "$1" = -- ]; then
    for project_path in "$project_paths[@]"; do
      ls "$project_path"
    done
    return 0
  fi

  for project_path in "$project_paths[@]"; do
    if [ -d "$project_path/$1" ]; then
      echo cd "$project_path/$1"
      return 0
    fi
    local project="$(ls "$project_path" | grep "^$1")"
    if [ -n "$project" ] && [ -d "$project_path/$project" ]; then
      echo cd "$project_path/$project"
      cd "$project_path/$project"
      printf "\033k${PWD##*/}\033\\"
      which gcd_callback 2>&1 > /dev/null && gcd_callback "$project"
      return 0
    fi
  done
  echo "No such project: $project"
  return 1
}
