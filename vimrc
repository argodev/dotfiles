syntax on
colo pablo

" Flash screen instead of beep sound
set visualbell

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8


autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
" ts - show existing tab with 4 spaces width
" sw - when indenting with '>', use 4 spaces width
" sts - control <tab> and <bs> keys to match tabstop

" Control all other files
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Hardcore mode, disable arrow keys.
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

filetype plugin indent on

" Allow backspace to delete indentation and inserted text
" i.e. how it works in most programs
set backspace=indent,eol,start
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.


" go-vim plugin specific commands
" Also run `goimports` on your current file on every save
" Might be be slow on large codebases, if so, just comment it out
let g:go_fmt_command = "goimports"

" Status line types/signatures.
let g:go_auto_type_info = 1

"au filetype go inoremap <buffer> . .<C-x><C-o>

" If you want to disable gofmt on save
" let g:go_fmt_autosave = 0


" NERDTree plugin specific commands
:nnoremap <C-g> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree


" air-line plugin specific commands
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"set nocompatible    " be iMproved, required
"filetype off        " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
"Plugin 'chriskempson/base16-vim'
"Plugin 'tmhedberg/SimpylFold'
"Plugin 'vim-scripts/indentpython.vim'
"Plugin 'scrooloose/syntastic'
"Plugin 'nvie/vim-flake8'
"Plugin 'scrooloose/nerdtree'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
"call vundle#end()   " required
"filetype plugin indent on     " required

" disable wordwrap
"set nowrap


"set smartindent
"set autoindent

" tell it where I want the splits to go
"set splitbelow
"set splitright

" control split navigations
" use C-J etc. rather than C-W + C-J
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" move escape to caps lock
" TBD

" Enable folding
"set foldmethod=indent
"set foldlevel=99

" enable folding with the spacebar
nnoremap <space> za


" set our textwidth stuff
set textwidth=80



" setup for python virtualenv support
"py3 << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUA_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  sys.path.insert(0, project_base_dir)
"  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF


" Add proper PEP8 indentation for python
"au BufNewFile,BufRead *.py
"  \ set tabstop=4 | 
"  \ set softtabstop=4 |
"  \ set shiftwidth=4 |
"  \ set textwidth=120 |
"  \ set expandtab |
"  \ set autoindent |
"  \ set fileformat=unix

" remove whitespaces on save
autocmd BufWritePre * :%s/\s\s+$//e

" use the below highlight group when displaying bad whitespace is desired
"highlight BadWhitespace ctermbg=red guibg=red

" display tabs at the beginning of a line in Python mode as bad
"au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" mark trailing whitespace as bad
"au BufRead,BufNewFile *.py,*pyw,*.c,*.h match BadWhitespace /\s\+$/

"set encoding=utf-8

"let python_highlight_all=1
"syntax on

" set our color scheme
"colorscheme base16-tomorrow-night
"let base16colorspace=256
"set termguicolors

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" keep more info in memory to speed things up
"set hidden
"set history=100

" enable line numbers
set nu

" add a colored column to keep me from going too far
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

" configure powerline a bit...
"set laststatus=2 " always show statusline
"set t_Co=256 " enable 256 colors for status line

" make nerdtree open automatically with vim starts up but only if no file was
" specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_n") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" shortcut key to nerdtree
"map <C-n> :NERDTreeToggle<CR>

" Configure syntastic
"let g:syntastic_python_checkers = ['flake8']

" configure simplyfold
"let g:SimpylFold_dockstring_preview=1

" Word wrap for markdown files
"au BufNewFile,BufRead *.md set wrap

