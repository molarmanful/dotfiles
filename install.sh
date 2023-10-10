#!/bin/bash

create_symlinks() {
  # Get the directory in which this script lives.
  script_dir=$(dirname "$(readlink -f "$0")")

  # Get a list of all files in this directory that start with a dot.
  files=$(find . -maxdepth 1 -type f -name ".*")

  # Create a symbolic link to each file in the home directory.
  for file in $files; do
    name=$(basename "$file")
    echo "Creating symlink to $name in home directory."
    rm -rf ~/"$name"
    ln -s "$script_dir/$name" ~/"$name"
  done
}

create_symlinks

git clone --depth=1 https://github.com/romkatv/gitstatus.git ~/gitstatus
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/z-shell/F-Sy-H.git ~/.oh-my-zsh/custom/plugins/F-Sy-H

curl https://get.volta.sh | bash
curl -s "https://get.sdkman.io" | bash
