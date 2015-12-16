#!/bin/bash

current=$(pwd)

# Fish
if [ "$(which fish)" != "$SHELL" ]; then
  chsh -s $(which fish)
fi
ln -fs $current/fish/config.fish ~/.config/fish

# Vim
ln -fs $current/vim/vimrc ~/.vimrc

# Bash
ln -fs $current/vim/bash_profile ~/.bash_profile

# Pry

ln -fs $current/pry/irbrc ~/.irbrc
ln -fs $current/pry/pryrc ~/.pryrc

# ptpython

mkdir -p ~/.ptpython
ln -fs $current/ptpython/config.py ~/.ptpython/config.py

# Tmux

ln -fs $current/tmux/tmux.conf ~/.tmux.conf

# Emacs

rm -r ~/.emacs.d
ln -fs $current/emacs.d ~/.emacs.d
