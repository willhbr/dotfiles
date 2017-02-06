function join_by { local IFS="$1"; shift; echo "$*";  }

_path=(
  "$HOME/.wills-bin"
)
export PATH="$(join_by ":" ${_path[@]}):$PATH"

export PROJECT_PATH="$HOME/projects"
export GIT_REMOTES="glp|https://gitlab.com/;gh|git@github.com:;ghp|https://github.com/;gl|git@gitlab.com:;eng|git@eng-git.canterbury.ac.nz:"
