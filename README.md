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
