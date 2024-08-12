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

# change shell to zsh (only if needed)
current_shell="$(readlink /proc/$$/exe | sed "s/.*\///")"
if [[ "${script_shell}" != "zsh" ]]
then
  chsh -s $(which zsh)
fi



# install some fonts
FONTDIR=$HOME/.local/share/fonts
mkdir -p $FONTDIR
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O $FONTDIR/MesloLGSNFRegular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O $FONTDIR/MesloLGSNFBold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O $FONTDIR/MesloLGSNFItalic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O $FONTDIR/MesloLGSNFBoldItalic.ttf

# update the font cache
fc-cache -fv

# should we prompt the user to reboot/log-out/back in at this point?



# check if ~/tools is installed or not.
mkdir -p ~/tools

cd ~/tools
git clone https://github.com/nordtheme/gnome-terminal.git
cd nord-gnome-terminal/src
./nord.sh

