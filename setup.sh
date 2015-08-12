#!/bin/bash

current=$(pwd)

# Fish
ln -fs $current/fish/config.fish ~/.config/fish

# Vim
ln -fs $current/vim/vimrc ~/.vimrc

# Bash
ln -fs $current/vim/bash_profile ~/.bash_profile