#!/bin/bash

check_prereq_exists() {
  # Test to see git is installed
  if ! command -v $1 &> /dev/null
  then
    echo "$1 is not installed. Installing it now..."
    sudo apt install -y $1
  fi
}

# define our list of prepreqs
prereqs=("git" "vim" "tmux" "tree" "stow" "zsh")

# loop through the prereqs and install them if needed
for prereq in ${prereqs[@]}; do
  check_prereq_exists $prereq
done



# Scipt Logic
# Install Prereqs
# change shell to zsh
chsh -s /usr/bin/zsh

# install some fonts
FONTDIR=$HOME/.local/share/fonts
mkdir -p $FONTDIR
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O $FONTDIR/MesloLGSNFRegular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O $FONTDIR/MesloLGSNFBold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O $FONTDIR/MesloLGSNFItalic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O $FONTDIR/MesloLGSNFBoldItalic.ttf

# update the font cache
fc-cache -fv

