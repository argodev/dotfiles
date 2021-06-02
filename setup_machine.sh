#! /bin/bash

YELLOW='\033[0;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo 
echo -e "${YELLOW}[+] Installing standard packages...${NC}"
echo

sudo apt install -y htop vim tmux build-essential git oathtool dconf-cli \
    uuid-runtime python3-pip python3-dev python3-gpg p7zip p7zip-rar \
    p7zip-full socat x11-xserver-utils fonts-powerline \
    libssl-dev libffi-dev python3-setuptools


echo 
echo -e "${YELLOW}[+] Installing python packages...${NC}"
echo 

# update pip
sudo pip3 install --upgrade pip

sudo -H pip3 install virtualenv psutil pyuv i3ipc \
    powerline-status capstone filebytes keystone-engine pyvex pwntools

pip3 install virtualenvwrapper


# setup the python update-alternatives if needed
ALTS="$(update-alternatives --query python 2>&1)"
if [[ $ALTS == *"error:"* ]]; then
      
    echo 
    echo -e "${YELLOW}[+] Configuring python alternatives...${NC}"
    echo 

    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 20 
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 10
fi


# setup the workspace/repos
echo 
echo -e "${YELLOW}[+] Setting up workspace...${NC}"
echo 

mkdir -p $HOME/workspace/{argodev,ru7,cpsrt,vsg,vulnerability_science,externals}
cd $HOME/workspace/externals

if [ ! -d "powerline" ]; then
    git clone https://github.com/powerline/powerline.git
fi

if [ ! -d "splitmind" ]; then
    git clone https://github.com/jerdna-regeiz/splitmind
fi

if [ ! -d "Ropper" ]; then
    git clone https://github.com/sashs/Ropper.git
    cd Ropper
    sudo python setup.py install
    cd $HOME/workspace/externals
fi

if [ ! -d "ROPgadget" ]; then
    git clone https://github.com/JonathanSalwan/ROPgadget.git
    cd ROPgadget
    sudo python setup.py install
    cd $HOME/workspace/externals
fi

if [ ! -d "radare2" ]; then
    git clone https://github.com/radareorg/radare2.git
    cd radare2
    sys/install.sh
    cd $HOME/workspace/externals
fi



# setup links
echo
echo -e "${YELLOW}[+] Setting up symlinks...${NC}"
echo


# setup tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo 
echo -e "${GREEN}[*] Operation Complete!${NC}"
echo 
