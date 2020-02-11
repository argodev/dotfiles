"==============================================================================
"          GENERAL SETTINGS/CONFIGURATION
"==============================================================================

" Enable syntax highlighting
syntax on

" Set the color scheme to pablo
" :colo <C-d> will list the installed/available schemes
set background=dark
colo pablo

" Flash screen instead of beep sound
set visualbell

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8


"-----------------------------------------------------------------------------
" TABS/SPACES
"
" Example of how to adjust settings based on file type
" autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
" autocmd Filetype go setlocal tabstop=2 shiftwidth=2 softtabstop=2
" ts - show existing tab with 4 spaces width
" sw - when indenting with '>', use 4 spaces width
" sts - control <tab> and <bs> keys to match tabstop

" Control tab settings for all files
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Enable filetype detection
" Enable plugin
" Enable indent
filetype plugin indent on

" Allow backspace to delete indentation and inserted text
" i.e. how it works in most programs
set backspace=indent,eol,start
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.


"-----------------------------------------------------------------------------
" CODE FOLDING
"
" enable folding based on syntax recognition
set foldmethod=syntax
" toggle the folding of a block via the spacebar
nnoremap <space> za
set foldlevel=99


"-----------------------------------------------------------------------------
" RULER/TEXT WIDTH
"
" set our textwidth stuff
set textwidth=80

" add a colored column to keep me from going too far
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

" disable wordwrap
set nowrap


"-----------------------------------------------------------------------------
" SPLIT/WINDOWS
"
" tell it where I want the splits to go
set splitbelow
set splitright

" control split navigations
" use C-J etc. rather than C-W + C-J
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>



"-----------------------------------------------------------------------------
" MISC SETTINGS
"
"set cursorline          " show the cursor line
"highlight CursorLine ctermbg=black
set hlsearch            " highlight the search
set incsearch           " incremental search
set mousehide           " hide the mouse when typing
set number              " show line numbers
set smartcase           " ignore case when searching lowercase
set smartindent
set autoindent

" remove whitespaces on save
autocmd BufWritePre * :%s/\s\s+$//e

" keep more info in memory to speed things up
set hidden
set history=100




"==============================================================================
"          LANGUAGE/FILE-TYPE CONFIGURATION
"==============================================================================

"-----------------------------------------------------------------------------
" MARKDOWN Stuff
"
" Word wrap and other settings for markdown files
au BufNewFile,BufRead *.md
    \ set formatoptions=tacqw |
    \ set textwidth=80 |
    \ set wrapmargin=0 |
    \ set autoindent

"-----------------------------------------------------------------------------
" GOLANG Stuff
"
" go-vim plugin specific commands
" Also run `goimports` on your current file on every save
" Might be be slow on large codebases, if so, just comment it out
let g:go_fmt_command = "goimports"

" Status line types/signatures.
let g:go_auto_type_info = 1

" make sure that the go files open with the folds open
autocmd Syntax go normal zR

"au filetype go inoremap <buffer> . .<C-x><C-o>

" If you want to disable gofmt on save
" let g:go_fmt_autosave = 0

"-----------------------------------------------------------------------------
" PYTHON Stuff
"
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
  \ set textwidth=100 |
  \ set expandtab |
  \ set autoindent |
  \ set fileformat=unix |
  \ set foldmethod=indent

let python_highlight_all=1
let g:SimpylFold_docstring_preview=1


"==============================================================================
"          PLUGIN CONFIGURATION
"==============================================================================

"-----------------------------------------------------------------------------
" NERDTREE
"
" git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/dist/start/nerdtree
"
" NERDTree plugin specific commands
:nnoremap <C-n> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" make nerdtree open automatically with vim starts up but only if no file was
" specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_n") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


"-----------------------------------------------------------------------------
" AIRLINE CONFIGURATION
"
" git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
"
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


"-----------------------------------------------------------------------------
" VIM-FUGITIVE CONFIGURATION
"
" git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/dist/start/vim-fugitive
"


"-----------------------------------------------------------------------------
" VIM-GO CONFIGURATION
"
" git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
"
au filetype go inoremap <buffer> . .<C-x><C-o>


"-----------------------------------------------------------------------------
" SYNTASTIC CONFIGURATION
"
"let g:syntastic_python_checkers = ['flake8']


"-----------------------------------------------------------------------------
" SIMPLYFOLD CONFIGURATION
"
"let g:SimpylFold_dockstring_preview=1


"
" Language server configuration
"
"" Required for operations modifying multiple buffers like rename.
"set hidden

"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"    \ 'python': ['/usr/local/bin/pyls'],
"    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"    \ 'go': ['~/go/bin/go-langserver'],
"    \ }

"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>



" Ale Configuration
"""" Better formatting fo worp/ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%] [%...code...%]'
"""" Enable completion where available.
let g:ale_completion_enabled = 1
""" Customize linters that are turned on
let g:ale_linters = {
   \   'python': ['flake8'],
   \}
let g:ale_set_highlights = 0

" TAGBAR
nmap <F8> :TagbarToggle<CR>
