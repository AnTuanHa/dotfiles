" --------------------
" Initialize Plug
" --------------------
call plug#begin('~/.config/nvim/plugged')

Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'dracula/vim'

Plug 'Vimjas/vim-python-pep8-indent'

Plug 'posva/vim-vue'

call plug#end()

" -----------------
" Personal Settings
" -----------------

filetype plugin indent on
syntax on

setglobal fileencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis
set termencoding=utf-8

" Remap leader key from default backslash(\) to spacebar
let mapleader=" "

" Disable sounds
set noerrorbells
set novisualbell
set t_vb=

" Improves redrawing
set ttyfast

" Don't update screen while executing a macro, register or
" other commands that not have been typed
set lazyredraw

" Mouse
set mouse=a   " Enable Mouse
set mousehide " Hide mouse when typing

" Allows you to edit other files without saving current file
set hidden

" No backup files
set nobackup
set noswapfile

" Number of command lines to remember
set history=1000

" Allow to use backspace in insert mode
set backspace=indent,eol,start

" Adds line numbers to the left side of the editor
set number

" Adds column numbers to the bottom right of the editor
set ruler

" Highlight the line you are on
set cursorline

" Specific tabs, spaces and textwidth for certain file types
autocmd FileType html,css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType java setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType vue setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType c setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab textwidth=80 equalprg=indent\ -kr\ -i8\ -l80
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=120
autocmd FileType xml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Show tabs and end of line characters
set list
set listchars=tab:▸\ ,eol:¬

" Add a visual vertical line 1 column after textwidth
if exists('+colorcolumn')
	set colorcolumn=+1
endif

" Searching
set hlsearch   " Highlight search terms
set incsearch  " Show search matches as you type
set ignorecase " Case-Insensitive when searching
set smartcase  " Except if there's a capital letter

" Time it takes to update gui while not doing anything (milliseconds)
set updatetime=200

" Fixes delay after pressing ESC and then O
set timeout timeoutlen=1000 ttimeoutlen=100

" Fixes lag/delay when inserting parentheses and brackets in large files
let g:matchparen_insert_timeout=5

" Color Scheme
set termguicolors
colorscheme dracula

" Enable command-line completion
set wildmenu
set wildignore+=*.swp,*.bak,*.pyc,*.class,*/.git/**/*,*/.hg/**/*,*/.svn/**/*,*/tmp/*,*.so
set wildignorecase
set wildmode=list:full

" Automatically remove trailing whitespace
" autocmd FileType c,cpp,java,python,lua,vim,html,css autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType c,cpp,python,lua,vim autocmd BufWritePre <buffer> :%s/\s\+$//e

" Detect markdown files and set the correct filetype
au BufRead,BufNewFile *.md set filetype=markdown

" Map CTRL + L to clear highlighting and then clear/redraw screen.
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" -------
" Plugins
" -------

" FZF
nnoremap <silent> <c-p> :FZF<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>; :BLines<CR>
