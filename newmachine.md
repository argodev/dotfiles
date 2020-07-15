# Setting up a new machine

```
sudo apt update
sudo apt install htop vim tmux build-essential git oathtool dconf-cli 
uuid-runtime python3-pip python3-dev
```


https://google.com/chrome
```
sudo dpkg -i google-chrome-stable_current_amd64.deb
```

Manually create a new "test" or dummy profile for the terminal. This is 
important for the themeing steps to work properly

### generate 2FA codes

```
oathtool --totp -b <code>
```

```
mkdir -p ~/workspace/argodev
cd ~/workspace/argodev
git clone https://github.com/argodev/dotfiles.git

ln -s ~/workspace/argodev/dotfiles/vimrc ~/.vimrc
ln -s ~/workspace/argodev/dotfiles/bash_aliases ~/.bash_aliases
mv ~/.bashrc ~/.bashrc_original
ln -s ~/workspace/argodev/dotfiles/bashrc ~/.bashrc
ln -s ~/workspace/argodev/dotfiles/tmux.conf ~/.tmux.conf

# takes python3 and maps it to $ python
sudo ln `which python3` /usr/bin/python
sudo ln `which pip3` /usr/bin/pip
bash -c  "$(wget -qO- https://git.io/vQgMr)"


# setup python stuff
sudo pip install virtualenv
pip install virtualenvwrapper



```


