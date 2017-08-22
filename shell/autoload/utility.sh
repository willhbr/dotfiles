#!/bin/bash

# utility
mcd() {
  mkdir -p "$1"
  cd "$1"
}

rn() {
  local src_path="$1"
  local name="$2"
  local dest_path
  dest_path="$(dirname "$src_path")"
  if [ -z "$src_path" ] || [ -z "$dest_path" ] || [ -z "$name" ]; then
    echo "Usage: rn <file path> <new name>"
    echo "Rename a file keeping it in the same folder"
    return 1
  fi
  echo mv "$src_path" "$dest_path/$name"
  mv "$src_path" "$dest_path/$name"
}

dup() {
  local src_path="$1"
  local name="$2"
  local dest_path
  dest_path=$(dirname "$src_path")
  if [ -z "$src_path" ] || [ -z "$dest_path" ] || [ -z "$name" ]; then
    echo "Usage: dup <file path> <new name>"
    echo "Duplicate a file with a new name"
    return 1
  fi
  echo cp "$src_path" "$dest_path/$name"
  cp "$src_path" "$dest_path/$name"
}
