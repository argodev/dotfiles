" General.
set nocompatible
set number
set autoindent " Copy indent from last line when starting new line
set autoread " Set to auto read when a file is changed from the outside
set backspace=indent,eol,start
set cursorline " Highlight current line
set expandtab " Expand tabs to spaces
set foldcolumn=0 " Column to show folds
set foldenable " Enable folding
set foldlevel=0 " Close all folds by default
set foldmethod=syntax " Syntax are used to specify folds
set foldminlines=0 " Allow folding single lines
set foldnestmax=5 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle
set guicursor= " Disable cursor style changes in Neovim
set hidden " When a buffer is brought to foreground, remember undo history and marks
set history=500 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set lazyredraw " Don't redraw when we don't have to
"set lispwords+=defroutes " Compojure
"set lispwords+=defpartial,defpage " Noir core
"set lispwords+=defaction,deffilter,defview,defsection " Ciste core
"set lispwords+=describe,it " Speclj TDD/BDD
set magic " Enable extended regexes
set mouse=a " Enable mouse in all in all modes
set noerrorbells " Disable error bells
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set nowrap " Do not wrap lines
set ofu=syntaxcomplete#Complete " Set omni-completion method
set regexpengine=1 " Use the old regular expression engine (it's faster for certain language syntaxes)
set report=0 " Show all changes
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window
set shell=/bin/sh " Use /bin/sh for executing shell commands
set shiftwidth=4 " The # of spaces for indenting
set softtabstop=4
set shortmess=atI " Don't show the intro message when starting vim
"set showtabline=2 " Always show tab bar
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set switchbuf=""
set ttyfast " Send more characters at a given time
set undofile " Persistent Undo
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest " Complete only until point of ambiguity
set winminheight=0 " Allow splits to be reduced to a single line
set wrapscan " Searches wrap around end of file


" Flash screen instead of beep sound
set visualbell

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8


" specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

"This one provides code completion. I don't like that it has
"a dependency on nodejs, but it seems to work quite quickly
"so we'll give it a go
Plug 'neoclide/coc.nvim', {'branch': 'release'} 

" language client needed for code completion
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" this provides the muted theme
Plug 'freeo/vim-kalisi'

" the file browser plugin
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" This one is supposed to work with the one below to provide syntax
" colored icons. I don't think i care...
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" this gives icons in the gutter... not sure I need it or not
"Plug 'ryanoasis/vim-devicons'

" provides gutter support for git status
Plug 'airblade/vim-gitgutter'

" provides a good search for files... will need to practice some
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files

" this is supposed to help with comments... not sure I need to keep
" it...
Plug 'scrooloose/nerdcommenter'
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'christoomey/vim-tmux-navigator'


" sets up the bar at the bottom with all the info
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" adds class/orgnization specific views on the right-hand
" side of the screen. (try F8)
Plug 'majutsushi/tagbar'



" Initialize plugin system
call plug#end()

" configure the main settings of the color scheme
" color scheme
"colorscheme kalisi
colorscheme argonaut
set background=dark
set t_Co=256

" in case t_Co alone doesn't work, add this as well:
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
            
let g:airline_theme='kalisi'


" Launch gopls when Go files are in use
let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls']
       \ }
" Run gofmt on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

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


" TAGBAR
nmap <F8> :TagbarToggle<CR>

