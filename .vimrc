" --------------------
" Initialize NeoBundle
" --------------------
set nocompatible

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
    if executable('ag')
        " Use Ag (Silver Searcher) instead of Ack when using Unite's search feature
        let g:unite_source_grep_command='ag'
        let g:unite_source_grep_default_opts =
        \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
        \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
        let g:unite_source_grep_recursive_opt=''
    elseif executable('ack')
        " Use Ack instead of Grep when using Unite's search feature
        let g:unite_source_grep_command = 'ack'
        let g:unite_source_grep_default_opts = '--column --no-color --nogroup --with-filename'
        let g:unite_source_grep_recursive_opt = ''
    endif

    " Enable fuzzy matching
    call unite#filters#matcher_default#use(['matcher_fuzzy'])

NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \     'windows' : 'make -f make_mingw32.mak',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }

NeoBundleLazy 'Shougo/neocomplete.vim'
    " NeoComplete requires vim to be compiled with lua support
    if has('lua')
        NeoBundleSource neocomplete
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_smart_case = 1
        let g:neocomplete#sources#syntax#min_keyword_length = 3

        let g:neocomplete#sources#dictionary#dictionaries = { 'default' : '' }
        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif

        " Allow only words to be in the keyword
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'

        " Maps <TAB> as <C-n> for completion
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    endif

NeoBundle 'Raimondi/delimitMate'
    autocmd FileType vim let b:loaded_delimitMate = 1

NeoBundleLazy 'scrooloose/syntastic'
    autocmd FileType c,cpp,java,python,lua NeoBundleSource syntastic

NeoBundleLazy 'rmartinho/vim-cpp11'
    autocmd FileType c,cpp NeoBundleSource vim-cpp11

NeoBundle 'jnurmine/Zenburn'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tomtom/tcomment_vim'

" Check Bundles
NeoBundleCheck

" ----------------------------------
"
"
"         Personal Settings
"
"
" ----------------------------------

" Get user's operating system
let os = substitute(system('uname'), "\n", "", "")

filetype plugin indent on
syntax on

set encoding=utf-8

" Remap leader key from default backslash(\) to spacebar
let mapleader=" "

" Disable sounds
set noerrorbells
set novisualbell
set t_vb=

" Don't update screen unless executing a macro, register or other commands
set lazyredraw

" Mouse
set mouse=a     " Enable Mouse
set mousehide   " Hide mouse when typing

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

" Insert spaces instead of tabs
set expandtab
set tabstop=4
set shiftwidth=4

" Rewrap lines to the 120th column
set textwidth=120

" Add a visual vertical line 1 column after textwidth
if exists('+colorcolumn')
    set colorcolumn=+1
endif

" Searching
set hlsearch    " Highlight search terms
set incsearch   " Show search matches as you type
set ignorecase  " Case-Insensitive when searching
set smartcase   " Except if there's a capital letter

" Time it takes to update gui while not doing anything (milliseconds)
set updatetime=500

" Fixes delay after pressing ESC and then O
set timeout timeoutlen=1000 ttimeoutlen=100

" Fixes lag/delay when inserting parentheses and brackets in large files
let g:matchparen_insert_timeout=5

" Color Scheme
colorscheme zenburn

" No toolbar, menu bar, and scroll bar in GVim
if has('gui_running')
    if os == "Linux"
        set guifont=Consolas\ 9
    elseif == "Windows"
        set guifont=Consolas:h9
    endif

    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=m
    set guioptions-=M
    set guioptions-=r
    set guioptions-=R
endif

" Automatically remove trailing whitespace
autocmd FileType c,cpp,java,python,lua,vim autocmd BufWritePre <buffer> :%s/\s\+$//e

" Fuzzy file search (Leader + t, from Command T)
if os == "Windows"
    nnoremap <leader>t :<C-u>Unite -start-insert -toggle -auto-resize -buffer-name=files file_rec buffer file_mru<cr>
else
    nnoremap <leader>t :<C-u>Unite -start-insert -toggle -auto-resize -buffer-name=files file_rec/async buffer file_mru<cr>
endif

" Find file with pattern (Leader + (a)ck, or (a)g)
nnoremap <leader>a :<C-u>Unite grep:.<cr>

" Find every file with the pattern on cursor (Leader + (a)ck or (a)g)
nnoremap <leader>A :<C-u>execute 'Unite grep:.::' . expand("<cword>") . ' '<cr>

" Switch buffers fast (Leader + (b)uffer)
nnoremap <leader>b :<C-u>Unite -quick-match buffer<cr>
