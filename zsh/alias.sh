# Python
alias python="python3"
alias py="python3"
# alias pip="pip3"

alias wget="curl -O"
alias ":q"="exit"

alias redis="redis-cli"

# Git
alias gs="git status"
alias gd="git diff --cached"
alias gcm="git commit -m"
alias gc="git commit"
alias gl="git log"
alias gch="git checkout"
alias gb="git branch"
alias gaa="git add --all"

# Platform specific
if [ $(uname) = "Darwin" ]; then
  alias ls="ls -G"
  alias finder="open ."
  alias tower="gittower"
else
  alias ls="ls --color=auto"
fi
