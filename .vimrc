set nocompatible    " required
filetype off        " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead
" of Plugin)

" All of your Plugins must be added before teh following line
call vundle#end()   " required
filetype plugin indent on     " required

" show existing tab with 2 spaces width
set tabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" On pressing tab, insert 2 spaces
set expandtab

