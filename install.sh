#!/bin/bash

set -e

if ! which pug; then
  curl https://raw.githubusercontent.com/willhbr/pug/master/install.sh > /tmp/pug-install
  bash /tmp/pug-install
fi

# ZSH
pug get zsh github: zsh-users/zsh-autosuggestions
pug get zsh github: zsh-users/zsh-syntax-highlighting

# Vim Plugins
pug get vim github: ctrlpvim/ctrlp.vim
pug get vim github: ervandew/supertab
pug get vim github: jiangmiao/auto-pairs
pug get vim github: vim-syntastic/syntastic
pug get vim github: rhysd/vim-crystal
pug get vim github: itchyny/lightline.vim
pug get vim github: mgee/lightline-bufferline
pug get vim github: lfv89/vim-interestingwords
pug get vim github: rust-lang/rust.vim

# Vim Syntax files

pug get vim github: udalov/kotlin-vim
pug get vim github: keith/swift.vim
pug get vim github: elixir-editors/vim-elixir

# Vim/ tmux navigation

pug get vim github: willhbr/vim-tmux-navigator
pug get tmux github: willhbr/vim-tmux-navigator
