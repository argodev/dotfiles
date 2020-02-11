#! /bin/bash

PLUGDIR=$HOME/.vim/pack/argodev/start
GITHUB=https://github.com

function LoadPlugin {
    if [ ! -d $PLUGDIR/$1 ]; then
        git clone $GITHUB/$2 $PLUGDIR/$1
    else
        echo [+] $PLUGDIR/$1 Already Installed
    fi
}


if [ ! -d $PLUGDIR ]; then
    mkdir -p $PLUGDIR
fi

# vim airline for goodness
LoadPlugin vim-airline vim-airline/vim-airline
LoadPlugin vim-airline-themes vim-airline/vim-airline-themes

# NERDTree for file exploring
LoadPlugin nerdtree scrooloose/nerdtree

# handy git wrapper
LoadPlugin vim-fugitive tpope/vim-fugitive.git 

# add git markers to the gutter
LoadPlugin vim-gitgutter airblade/vim-gitgutter

# go plugin
LoadPlugin vim-go fatih/vim-go 

# language server
LoadPlugin languageclient-neovim autozimu/LanguageClient-neovim 

# install golang language server
go get -u github.com/sourcegraph/go-langserver

# Install the one syntax tool to rule them all?
LoadPlugin vim-polyglot sheerun/vim-polyglot 

# install simplifold for python
LoadPlugin simpylfold tmhedberg/SimpylFold.git 

# install alternate indention tool
LoadPlugin identpython vim-scripts/indentpython.vim 

# set up class viewer/tagbar
LoadPlugin tagbar majutsushi/tagbar.git 

# setup for linting
LoadPlugin ale w0rp/ale

# setup for code assistance
LoadPlugin jedi-vim davidhalter/jedi-vim
LoadPlugin ropevim python-rope/ropevim
LoadPlugin vim-gutentags ludovicchabant/vim-gutentags

# install/update docs for installed plugins
vim -c Helptags -c -q
