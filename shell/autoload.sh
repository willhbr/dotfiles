#!/bin/bash

for file in ~/.shell/autoload/*; do
  source "$file"
done
