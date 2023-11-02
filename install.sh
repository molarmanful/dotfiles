#!/bin/bash

script_dir=$(dirname "$(readlink -f "$0")")
files=$(find . -maxdepth 1 -type f -name ".*")

for file in $files; do
  name=$(basename "$file")
  echo "Creating symlink to $name in home directory."
  rm -rf ~/"$name"
  ln -s "$script_dir/$name" ~/"$name"
done
