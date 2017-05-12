#!/bin/bash

if [ ! -e .git ]; then
  git init
else
  echo "Already a git repo"
fi
