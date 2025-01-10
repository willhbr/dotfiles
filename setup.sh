#!/bin/bash

set -e

current="$PWD"

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

# Terminals

link terminal/kitty.conf ~/.config/kitty/kitty.conf
link terminal/wezterm.lua ~/.wezterm.lua
if [ -d ~/Library ]; then
  link terminal/ghostty ~/Library/Application\ Support/com.mitchellh.ghostty/config
fi

# Vim
link vim ~/.vim
link vim/vimrc ~/.vimrc
link editorconfig ~/.editorconfig

# Generic shell
link shell ~/.shell
link bin ~/.local/df-bin
link shell/env ~/.zshenv
link shell/env ~/.bashenv

# Bash
link bash/bash_profile ~/.bash_profile

# Zsh
link zsh ~/.zsh
link zsh/zshrc ~/.zshrc

# Tmux
link tmux/tmux.conf ~/.tmux.conf

# Git
link git/gitconfig ~/.gitconfig
link git/global-gitignore ~/.global-gitignore
link git/jjconfig.toml ~/.jjconfig.toml

# Pod

link pod/script.yaml ~/.config/pod/script.yaml

# No login motd
touch ~/.hushlogin

link dircolors ~/.dircolors

# Common directories
mkdir -p ~/Projects
mkdir -p ~/tmp
