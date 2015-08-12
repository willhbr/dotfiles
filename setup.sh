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