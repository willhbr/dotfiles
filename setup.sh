#!/bin/bash

set -e

current=$(pwd)

link() {
  local path="$current/$1"
  local dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -L "$dest" ]; then
    rm "$dest"
  fi
  echo "$dest -> $path"
  ln -fs "$path" "$dest"
}

# Pug
pug load deps.pug

# Vim
link vim ~/.vim
link vim/vimrc ~/.vimrc

# Generic shell
link shell ~/.shell
link shell/env ~/.zshenv
link shell/env ~/.bashenv

# Bash
link bash/bash_profile ~/.bash_profile

# Zsh
link zsh ~/.zsh
link zsh/zshrc ~/.zshrc

# Pry
link pry/irbrc ~/.irbrc
link pry/pryrc ~/.pryrc

# Tmux
link tmux/tmux.conf ~/.tmux.conf
