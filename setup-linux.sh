#!/bin/bash

check_prereq_exists() {
  # Test to see git is installed
  if ! command -v $1 &> /dev/null
  then
    echo "$1 is not installed. Installing it now..."
    sudo apt install -y $1
  fi
}

prereqs=("git" "vim" "tmux" "tree")


for prereq in ${prereqs[@]}; do
  check_prereq_exists $prereq
done
