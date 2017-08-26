#!/bin/bash


source_refresh() {
  if [ "$BASH" ]; then
    source ~/.bash_profile
  else
    source ~/.zshrc
  fi
}
