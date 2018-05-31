set nocompatible    " be iMproved, required
filetype off        " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'chriskempson/base16-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()   " required
filetype plugin indent on     " required

" disable wordwrap
set nowrap

" show existing tab with 2 spaces width
set tabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" On pressing tab, insert 2 spaces
set expandtab

set smartindent
set autoindent

" tell it where I want the splits to go
set splitbelow
set splitright

" control split navigations
" use C-J etc. rather than C-W + C-J
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" enable folding with the spacebar
nnoremap <space> za



" setup for python virtualenv support
py3 << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


" Add proper PEP8 indentation for python
au BufNewFile,BufRead *.py
  \ set tabstop=4 | 
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set textwidth=120 |
  \ set expandtab |
  \ set autoindent |
  \ set fileformat=unix

" remove whitespaces on save
autocmd BufWritePre * :%s/\s\s+$//e

" use the below highlight group when displaying bad whitespace is desired
highlight BadWhitespace ctermbg=red guibg=red

" display tabs at the beginning of a line in Python mode as bad
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" mark trailing whitespace as bad
au BufRead,BufNewFile *.py,*pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

"let python_highlight_all=1
syntax on

" set our color scheme
colorscheme base16-tomorrow-night
let base16colorspace=256
set termguicolors

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" keep more info in memory to speed things up
set hidden
set history=100

" enable line numbers
set nu

" add a colored column to keep me from going too far
set colorcolumn=120

" configure powerline a bit...
set laststatus=2 " always show statusline
set t_Co=256 " enable 256 colors for status line

" make nerdtree open automatically with vim starts up but only if no file was
" specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_n") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" shortcut key to nerdtree
map <C-n> :NERDTreeToggle<CR>

" Configure syntastic
let g:syntastic_python_checkers = ['flake8']

" configure simplyfold
let g:SimpylFold_dockstring_preview=1

