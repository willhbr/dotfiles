#!/bin/bash

set -e

if ! command -v brew &> /dev/null
then
  echo "Brew not installed. Installing it..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

deps=(
  # Obvious.
  tmux
  vim
  zsh
  git
  jj
  # Fast fuzzy search.
  fzf
  # Traverse, query, filter and process json files.
  jq
  # Ls but better. ls gets auto mapped to this in alias.sh
  eza
  # Ls but print a tree.
  tree
  # Grep but recursively searched all files. Use with rr.
  ripgrep
  # Smarter cd
  zoxide
  # Sexy prompt
  starship
  # Neovim + chad neovim for code editing.
  neovim
)

for dep in ${deps[@]}; do
  brew install $dep
done

if ! [[ "$SHELL" = *zsh ]]; then
  chsh -s "$(which zsh)"
fi

# ZSH
pug get zsh github: zsh-users/zsh-autosuggestions
pug get zsh github: zsh-users/zsh-syntax-highlighting

# Tmux
pug get tmux github: catppuccin/tmux

echo "Reccomended Terminal: https://wezfurlong.org/wezterm/index.html"
echo "Reccomended Tiler: https://github.com/koekeishiya/yabai"