#!/bin/bash

# Expected env variables:
# PROJECT_PATH (Path for things to go into)
# GIT_REMOTES (List of places to try and clone from)
# Should have one argument, in format:
# host_shortname/username/project
# project (Will only change to an existing project)

# Exit statuses:
# 1: config error
# 2: argument error
# 3: missing project
# ?: something else

gcd() {
  if [ -z "$BASH" ]; then
    local read_flags="-rA"
  else
    local read_flags="-ra"
  fi

  split_to_arr() {
    local input=$1
    local delimiter=$2
    local output=$3

    IFS="$delimiter" read $read_flags "$output" <<< "$input"
  }

  function split_to_vars() {
    local input="$1"
    local delimiter="$2"
    shift 2

    IFS="$delimiter" read -r $* <<< "$input"
  }

  function echo_cd() {
    echo cd "$@"
    cd "$@"
  }

  if [ -z "$GIT_REMOTES" ]; then
    echo "GIT_REMOTES not set"
    return 1
  fi

  if [ -z "$1" ]; then
    echo "You need to give me a project or something"
    echo "  gcd <project name>"
    echo "  gcd <remote>/<username>/<project>"
    echo "GIT_REMOTES: $GIT_REMOTES"
    echo "PROJECT_PATH: $PROJECT_PATH"
    return 2
  fi

  if [ "$1" = "-" ]; then
    tree -L 3 "$PROJECT_PATH"
    return 0
  fi

  if [ "$1" = -- ]; then
    find "$PROJECT_PATH" -maxdepth 3 -mindepth 3 | grep -o '[^/]*$'
    gcd_extension -- 2> /dev/null || echo -n
    return 0
  fi

  local remote
  local user
  local project
  [ -z "$1" ] || remote="$1.*"
  [ -z "$2" ] || user="/$2.*"
  [ -z "$3" ] || project="/$3.*"

  if gcd_extension "$@"; then
    return 0
  fi

  local matching
  if matching="$(find "$PROJECT_PATH" -maxdepth 3 -mindepth 3 -printf '%P\n' | grep "$remote$user$project")"; then
    count=$(echo "$matching" | wc -l)
    if [ "$count" -gt 1 ]; then
      echo "Too many matches:"
      echo "$matching"
      return 3
    fi
    echo_cd "$PROJECT_PATH/$matching"
    return
  elif [ $# -ne 3 ]; then
    echo "No existing projects named '$remote' in $PROJECT_PATH"
    return 3
  fi

  remote="$1"
  user="$2"
  project="$3"

  _path="$PROJECT_PATH/$remote/$user/$project" 
  if [ -d "$_path" ]; then
    echo_cd "$_path"
    return
  fi

  split_to_arr "$GIT_REMOTES" ";" remote_list
  for rem in "${remote_list[@]}"; do
    split_to_vars "$rem" "|" short full
    if [ -z "$short" ] || [ -z "$full" ]; then
      echo "Invalid remote in GIT_REMOTES: $rem"
      return 1
    fi
    if [ "$short" = "$remote" ]; then
      full_remote="$full"
      break
    fi
  done

  if [ -z "$full_remote" ]; then
    echo "Invalid remote ($remote) given"
    echo "GIT_REMOTES: $GIT_REMOTES"
    return 1
  fi

  if git clone "$full_remote$user/$project.git" "$_path"; then
    echo_cd "$_path"
  fi
}

alias g=gcd
