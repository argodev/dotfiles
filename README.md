# My dotfile collection

This is a simple collection of dotfiles that I use to configure the environment 
in which I work. They are posted here for my own uses but anyone else is welcome 
to use them should they in anyway be helpful.

Like most, the files here are derived from experience, learning, but mostly 
copying the work of others who were kind enough to share their knowlege online.


## VIM configuration
I am a noob to vim but find myself using it repeatedly and am trying to force
myself to get better at it. To that end, the following changes are included in
my .vimrc file


```bash
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

$ vim +PluginInstall +qall
```


```bash
$ ln -s ~/workspace/argodev/dotfiles/vimrc ~/.vimrc
$ ln -s ~/workspace/argodev/dotfiles/bash_aliases ~/.bash_aliases
$ ln -s ~/workspace/argodev/dotfiles/bashrc ~/.bashrc

```

Note, for TMUX, I re-mapped my caps lock key to be an additional control-key
I didn't like this, so I ended up using it as my escape key for VIM. I've
provided both remappings below

```bash
# caps lock as control
setxkbmap -option caps:ctrl_modifier

# capslock as escape
setxkbmap -option caps:escape

# set link to tmux.conf
ln -s ~/workspace/argodev/dotfiles/tmux.conf ~/.tmux.conf


```

## Other stuff I need

```bash
mkdir -p ~/workspace/externals
cd ~/workspace/externals

# pwndbg
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh


# setup update alternatives stuff
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 20
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 10

# switch when desired:
update-alternatives --config python


# splitmind
cd ~/workspace/externals
git clone https://github.com/jerdna-regeiz/splitmind


# setup/install ropper
pip install capstone
pip install filebytes
pip install keystone-engine
sudo pip install pyvex


cd ~/workspace/externals
git clone https://github.com/sashs/Ropper.git
cd Ropper
sudo python setup.py install

cd ~/workspace/externals
git clone https://github.com/JonathanSalwan/ROPgadget.git
sudo python setup.py install


# setup pwntools
sudo apt update
sudo apt install python3 python3-pip python3-dev git libssl-dev libffi-dev \
    build-essential
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install --upgrade pwntools


# radare2
cd ~/workspace/externals
git clone https://github.com/radareorg/radare2.git
cd radare2
sys/install.sh
```


# install zsh
sudo apt install zsh

# change shell to zsh
chsh -s /usr/bin/zsh

# setup oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# we need to do this *after* installing oh-my-zsh as it will overwrite this file
# link in zshrc
ln -s ~/workspace/argodev/dotfiles/zshrc ~/.zshrc

# install (double click on each?) the four MesloLGS NF fonts


# setup GnomeTheme for (GooglePlusDar
sudo apt-get install dconf-cli uuid-runtime
bash -c  "$(wget -qO- https://git.io/vQgMr)"

- Select option for Google Dark
- Set default theme
- set custom font to MesloLGS NF Regular 14 pt

# link in p10k config file
ln -s ~/workspace/argodev/dotfiles/p10k.zsh ~/.p10k.zsh


# full reboot to ensure we pick up the new shell

# install golang
wget https://golang.org/dl/go1.15.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.15.linux-amd64.tar.gz
mkdir -p ~/go/src/hello



# install vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Run vim - will get lots of errors
:PlugInstall


# install node version manager and node stuff
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm ls-remote
nvm install lts/eribum


# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm




# setup vimplug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
       
# ~/.config/nvim/init.vim

:PlugInstall




Other misc stuff I'm finding need to be done...


ln -s ~/workspace/argodev/dotfiles/init.vim ~/.config/nvim/init.vim


    
 

 
    
