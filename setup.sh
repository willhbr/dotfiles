#!/bin/bash

set -e

current=$(pwd)

function link() {
  local path="$current/$1"
  local dest="$2"
  mkdir -p $(dirname $dest)
  if [ -L "$dest" ]; then
    rm "$dest"
  fi
  echo "$dest -> $path"
  ln -fs "$path" "$dest"
}

# Submodules!
pug use zsh https://github.com/zsh-users/zsh-autosuggestions.git
pug use zsh https://github.com/zsh-users/zsh-syntax-highlighting.git
pug use vim https://github.com/ctrlpvim/ctrlp.vim.git
pug use vim https://github.com/tpope/vim-fireplace.git
pug use vim https://github.com/guns/vim-sexp.git

# Fish
link fish/config.fish ~/.config/fish/config.fish

# Vim
link vim ~/.vim
link vim/vimrc ~/.vimrc

# Generic shell
link shell ~/.shell

# Bash
link bash/bash_profile ~/.bash_profile

# Zsh
link zsh ~/.zsh
link zsh/zshrc ~/.zshrc

# Pry
link pry/irbrc ~/.irbrc
link pry/pryrc ~/.pryrc

# ptpython
link ptpython/config.py ~/.ptpython/config.py

# Tmux
link tmux/tmux.conf ~/.tmux.conf
