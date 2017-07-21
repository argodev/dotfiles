set nocompatible    " required
filetype off        " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead
" of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'



" All of your Plugins must be added before teh following line
call vundle#end()   " required
filetype plugin indent on     " required

" show existing tab with 2 spaces width
set tabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" On pressing tab, insert 2 spaces
set expandtab

" tell it where I want the splits to go
set splitbelow
set splitright

" control split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" enable folding with the spacebar
nnoremap <space> za

" Add proper PEP8 indentation for python
au BufNewFile,BufRead *.py
  \ set tabstop=4
  \ set softtabstop=4
  \ set shiftwidth=4
  \ set textwidth=125
  \ set expandtab
  \ set autoindent
  \ set fileformat=unix

" flag unnecessary whitespace
au BufRead,BufNewFile *.py, *pyw, *.c, *.h match BadWhitespace /\s\+$/

set encoding=utf-8

let python_highlight_all=1
syntax on

colorscheme zenburn

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

