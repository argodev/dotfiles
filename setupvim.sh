#! /bin/bash

mkdir -p ~/.vim/pack/argodev/start

# vim airline for goodness
git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/argodev/start/vim-airline

# NERDTree for file exploring
git clone https://github.com/scrooloose/nerdtree ~/.vim/pack/argodev/start/nerdtree

# handy git wrapper
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/argodev/start/vim-fugitive

# go plugin
git clone https://github.com/fatih/vim-go ~/.vim/pack/argodev/start/vim-go

# language server
git clone https://github.com/autozimu/LanguageClient-neovim ~/.vim/pack/argodev/start/languageclient-neovim

# install golang language server
go get -u github.com/sourcegraph/go-langserver

