# My dotfile collection

This is a simple collection of dotfiles that I use to configure the environment in which I work. They are posted here for my own uses but anyone else is welcome to use them should they in anyway be helpful.

Like most, the files here are derived from experience, learning, but mostly copying the work of others who were kind enough to share their knowlege online.


## VIM configuration
I am a noob to vim but find myself using it repeatedly and am trying to force myself to get better at it. To that end, the following changes are included in my .vimrc file


```bash
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

$ vim +PluginInstall +qall
```


```bash
$ ln -s ~/workspace/argodev/dotfiles/vimrc ~/.vimrc
```

