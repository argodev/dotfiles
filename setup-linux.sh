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
current_shell="$(echo $SHELL | sed "s/.*\///")"
if [[ "${current_shell}" != "zsh" ]]
then
  chsh -s $(which zsh)
fi



# install some fonts
FONTDIR=$HOME/.local/share/fonts
REFRESH_FONTS = 0
mkdir -p $FONTDIR
if [ ! -f $FONTDIR/MesloLGSNFRegular.ttf ]; then
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O $FONTDIR/MesloLGSNFRegular.ttf
  REFRESH_FONTS = 1
fi
if [ ! -f $FONTDIR/MesloLGSNFBold.ttf ]; then
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O $FONTDIR/MesloLGSNFBold.ttf
  REFRESH_FONTS = 1
fi
if [ ! -f $FONTDIR/MesloLGSNFItalic.ttf ]; then
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O $FONTDIR/MesloLGSNFItalic.ttf
  REFRESH_FONTS = 1
fi
if [ ! -f $FONTDIR/MesloLGSNFBoldItalic.ttf ]; then
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O $FONTDIR/MesloLGSNFBoldItalic.ttf
  REFRESH_FONTS = 1
fi

# update the font cache
if [ $REFRESH_FONTS -eq 1]; then
  fc-cache -fv
fi

# should we prompt the user to reboot/log-out/back in at this point?


if [ ! -f /tmp/foo.txt ]; then
    echo "File not found!"d
fi


# check if ~/tools is installed or not.
mkdir -p ~/tools

cd ~/tools
git clone https://github.com/nordtheme/gnome-terminal.git
cd gnome-terminal/src
./nord.sh

