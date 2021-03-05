"==============================================================================
"          GENERAL SETTINGS/CONFIGURATION
"==============================================================================

" Enable syntax highlighting
syntax on

" Flash screen instead of beep sound
set visualbell

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8

" do not create *.<blah>.swp files
set noswapfile
set nobackup

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" long update time (default is 4000 [4 sec]) is crazy and makes the status bar
" seem like it isn't doing its job
set updatetime=50
" change the numbers on lines not current to be relative ot this one
set relativenumber
" prevent from scrolling off the page
set scrolloff=8
" turn off the mode... airline handles this
set noshowmode
" give some more space for displaying messages
set cmdheight=2


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

" Enable filetype detection
" Enable plugin
" Enable indent
"filetype plugin indent on

" Allow backspace to delete indentation and inserted text
" i.e. how it works in most programs
"set backspace=indent,eol,start
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.


"-----------------------------------------------------------------------------
" CODE FOLDING
"
" enable folding based on syntax recognition
"set foldmethod=syntax
" toggle the folding of a block via the spacebar
"nnoremap <space> za
"set foldlevel=99


"-----------------------------------------------------------------------------
" RULER/TEXT WIDTH
"
" set our textwidth stuff
set textwidth=100

" add a colored column to keep me from going too far
set colorcolumn=100
highlight ColorColumn ctermbg=0

" disable wordwrap
set nowrap


"-----------------------------------------------------------------------------
" SPLIT/WINDOWS
"
" tell it where I want the splits to go
"set splitbelow
"set splitright

" control split navigations
" use C-J etc. rather than C-W + C-J
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>



"-----------------------------------------------------------------------------
" MISC SETTINGS
"
set cursorline          " show the cursor line
"highlight CursorLine ctermbg=black
"set hlsearch            " highlight the search
set incsearch           " incremental search
"set mousehide           " hide the mouse when typing
set number              " show line numbers
set smartcase           " ignore case when searching lowercase
set smartindent         " going to do its best to indent for me
"set autoindent

" remove whitespaces on save
"autocmd BufWritePre * :%s/\s\s+$//e

" keep more info in memory to speed things up
"set hidden
"set history=100


"==============================================================================
"          PLUGIN CONFIGURATION
"==============================================================================
" specify a directory for plugins
call plug#begin('~/.vim/plugged')

"This one provides code completion. I don't like that it has
"a dependency on nodejs, but it seems to work quite quickly
"so we'll give it a go
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
" run gofmt on save
Plug 'tweekmonster/gofmt.vim'
" language packs
Plug 'sheerun/vim-polyglot'
" Improved Search (faster than CtrlP)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" this provides the muted theme
"Plug 'freeo/vim-kalisi'
" another theme I'm trying (didn't like this one... too soft)
"Plug 'drewtempelmeyer/palenight.vim'

Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'KeitaNakamura/neodark.vim'

" the file browser plugin
Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'

" This one is supposed to work with the one below to provide syntax
" colored icons. I don't think i care...
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" this gives icons in the gutte/... not sure I need it or not
"Plug 'ryanoasis/vim-devicons'

" provides a good search for files... will need to practice some
"Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files

" this is supposed to help with comments... not sure I need to keep
" it...
Plug 'scrooloose/nerdcommenter'

Plug 'christoomey/vim-tmux-navigator'


" sets up the bar at the bottom with all the info
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" adds class/orgnization specific views on the right-hand
" side of the screen. (try F8)
Plug 'majutsushi/tagbar'

" adds crazy fast grep
Plug 'jremmen/vim-ripgrep'

" provides git tools
Plug 'tpope/vim-fugitive'

" Improved man support
Plug 'vim-utils/vim-man'

" ctags/rtags
Plug 'lyuts/vim-rtags'

" Improved undo
Plug 'mbbill/undotree'

" Initialize plugin system
call plug#end()



"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif



" enable italics for comments
" This doesn't work well within tmux!!!
"let g:onedark_terminal_italics = 1
set background=dark
colorscheme neodark

"colorscheme palenight
"set t_Co=256
" adding to help with tmux?
set term=screen-256color
" NOTE: If we place this earlier, it doesn't have the affect it should
highlight ColorColumn ctermbg=0

" let rg find the root and use .git root and .gitignore
" to help do faster searching
if executable('rg')
    let g:rg_derive_root='true'
endif

" exclude some things from search (git, gitignore, etc)
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-string']

" set *my* leader key (key to switch into my commands) --> spacebar
let mapleader = " "

" configure file tree (where is this?)
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize = 25

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

"==============================================================================
"          LANGUAGE/FILE-TYPE CONFIGURATION
"==============================================================================

"-----------------------------------------------------------------------------
" MARKDOWN Stuff
"
" Word wrap and other settings for markdown files
"au BufNewFile,BufRead *.md
"    \ set formatoptions=tacqw |
"    \ set textwidth=80 |
"    \ set wrapmargin=0 |
"    \ set autoindent

"-----------------------------------------------------------------------------
" GOLANG Stuff
"
" go-vim plugin specific commands
" Also run `goimports` on your current file on every save
" Might be be slow on large codebases, if so, just comment it out
"let g:go_fmt_command = "goimports"

" Status line types/signatures.
"let g:go_auto_type_info = 1

" make sure that the go files open with the folds open
"autocmd Syntax go normal zR

"au filetype go inoremap <buffer> . .<C-x><C-o>

" If you want to disable gofmt on save
" let g:go_fmt_autosave = 0

"-----------------------------------------------------------------------------
" PYTHON Stuff
"
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
"  \ set textwidth=100 |
"  \ set expandtab |
"  \ set autoindent |
"  \ set fileformat=unix |
"  \ set foldmethod=indent

"let python_highlight_all=1
"let g:SimpylFold_docstring_preview=1


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



" air-line plugin specific commands
let g:airline_powerline_fonts = 1

" set airline to match our theme
"let g:airline_theme='onedark'

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
"au filetype go inoremap <buffer> . .<C-x><C-o>


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
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%] [%...code...%]'
"""" Enable completion where available.
"let g:ale_completion_enabled = 1
""" Customize linters that are turned on
"let g:ale_linters = {
"   \   'python': ['flake8'],
"   \}
"let g:ale_set_highlights = 0

" TAGBAR
nmap <F8> :TagbarToggle<CR>
"
" KEY REMAPS
nnoremap <leader>u :UndotreeToggle<cr>

" trying to play nicely with tmux...

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

