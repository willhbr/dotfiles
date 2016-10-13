#!/bin/bash

current=$(pwd)

# Fish
if [ "$(which fish)" != "$SHELL" ]; then
  chsh -s $(which fish)
fi
ln -fs $current/fish/config.fish ~/.config/fish

# Vim
ln -fs $current/vim/vimrc ~/.vimrc
git submodule init
git submodule update

ln -fs $current/vim/vim ~/.vim

# Bash
ln -fs $current/bash/bash_profile ~/.bash_profile

# Pry

ln -fs $current/pry/irbrc ~/.irbrc
ln -fs $current/pry/pryrc ~/.pryrc

# ptpython

mkdir -p ~/.ptpython
ln -fs $current/ptpython/config.py ~/.ptpython/config.py

# Tmux

ln -fs $current/tmux/tmux.conf ~/.tmux.conf

# Extra commands

ln -fs $current/bin ~/.wills-bin
