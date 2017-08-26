#!/bin/bash
setup() {
  join_by() { local IFS="$1"; shift; echo "$*";  }

  local _path=(
  )
  export PATH="$(join_by ":" "${_path[@]}"):$PATH"

  export PROJECT_PATH="$HOME/projects"

  local remotes
  remotes=(
    "glp|https://gitlab.com/"
    "gh|git@github.com:"
    "ghp|https://github.com/"
    "gl|git@gitlab.com:"
    "eng|git@eng-git.canterbury.ac.nz:"
  )
  export GIT_REMOTES
  GIT_REMOTES="$(join_by ";" "${remotes[@]}")"
}
setup "$@"
