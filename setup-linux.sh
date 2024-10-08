#!/bin/bash

#==============================================================================
# HELPER FUNCTIONS
#==============================================================================

check_prereq_exists() {
  # Test to see git is installed
  if ! command -v $1 &> /dev/null
  then
    if [ "$(apt list $1  2>/dev/null | grep -c "installed")" -lt 1 ]; then
      echo "$1 is not installed. Installing it now..."
      sudo apt install -y $1
    fi
  fi
}


#==============================================================================
# CONSTANTS
#==============================================================================

# define our list of prepreqs
prereqs=("git" "vim" "tmux" "tree" "stow" "zsh" "zsh-syntax-highlighting" "autojump" "zsh-autosuggestions")



#==============================================================================
# MAIN SCRIPT LOGIC
#==============================================================================

# Install Prereqs
echo [+] Checking for and installing prerequisites
for prereq in ${prereqs[@]}; do
  check_prereq_exists $prereq
done

# change shell to zsh (only if needed)
echo [+] Ensuring shell is set to zsh
current_shell="$(echo $SHELL | sed "s/.*\///")"
if [[ "${current_shell}" != "zsh" ]]
then
  echo [+] Current shell is $current_shell. Changing to $(which zsh)
  chsh -s $(which zsh)
fi

echo [+] Checking for PowerLevel10K
if [ ! -d "$HOME/tools/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/tools/powerlevel10k
fi



# Install the nerd fonts
echo [+] Ensuring the presence of the nerd fonts
FONTDIR=$HOME/.local/share/fonts
REFRESH_FONTS=0
mkdir -p $FONTDIR
if [ ! -f "$FONTDIR/MesloLGSNFRegular.ttf" ]; then
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O $FONTDIR/MesloLGSNFRegular.ttf
  REFRESH_FONTS=1
fi
if [ ! -f "$FONTDIR/MesloLGSNFBold.ttf" ]; then
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O $FONTDIR/MesloLGSNFBold.ttf
  REFRESH_FONTS=1
fi
if [ ! -f "$FONTDIR/MesloLGSNFItalic.ttf" ]; then
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O $FONTDIR/MesloLGSNFItalic.ttf
  REFRESH_FONTS=1
fi
if [ ! -f "$FONTDIR/MesloLGSNFBoldItalic.ttf" ]; then
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O $FONTDIR/MesloLGSNFBoldItalic.ttf
  REFRESH_FONTS=1
fi

# update the font cache
if [[ $REFRESH_FONTS -eq 1 ]]; then
  fc-cache -fv
fi

# should we prompt the user to reboot/log-out/back in at this point?


# check if ~/tools is installed or not.
mkdir -p ~/tools

#cd ~/tools
#git clone https://github.com/nordtheme/gnome-terminal.git
#cd gnome-terminal/src
#./nord.sh



echo "Change your terminal to nord"
echo "Set nord as the default"
echo " set the font to MesloLGS NF"
echo "set the font size to 14pt"


# let's export our terminal profile so we can just import it later
# NOTE: this didn't work as well as I would have liked...
# dconf list /org/gnome/terminal/legacy/profiles:/
# dconf load /org/gnome/terminal/legacy/profiles:/:6bf254fa-7b6b-4a4a-91a0-c7043a5c1cb3/ < gnome_term_profile.dconf




# let's do the gnu stow magic!
echo [+] Running gnu stow to ensure dotfiles are linked
stow . -t $HOME



