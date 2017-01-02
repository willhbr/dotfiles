#!/bin/bash

set -e

current=$(pwd)

function link() {
  path="$current/$1"
  mkdir -p $(dirname $2)
  echo "$2 -> $path"
  ln -fs $path $2
}

# Fish

link fish/config.fish ~/.config/config.fish

# Vim
link vim/vimrc ~/.vimrc
git submodule init
git submodule update

link vim/vim ~/.vim

# Bash
link bash/bash_profile ~/.bash_profile

# Pry

link pry/irbrc ~/.irbrc
link pry/pryrc ~/.pryrc

# ptpython

link ptpython/config.py ~/.ptpython/config.py

# Tmux

link tmux/tmux.conf ~/.tmux.conf

# Extra commands

link bin ~/.wills-bin
