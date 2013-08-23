" -----------------
" Initialize Vundle
" -----------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle managing Vundle
Bundle 'gmarik/vundle'

" Repositories on GitHub
" ----------------------
" Bundle 'name/repoName'
Bundle 'tomasr/molokai'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'milkypostman/vim-togglelist'
Bundle 'octol/vim-cpp-enhanced-highlight'

" Repositories on Vim-Scripts
" ---------------------------
" Bundle 'repoName'


" Repositories NOT on GitHub
" --------------------------
" Bundle 'git://git.website.com/repoName.git'


" ----------------------------------
"
"
"         Personal Settings
"
"
" ----------------------------------
filetype plugin indent on
syntax on

" Remap leader key from default backslash(\) to spacebar
let mapleader=" "

" Fuzzy file search
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :Unite -no-split -buffer-name=files -start-insert file_rec/async<cr>

" ---------------------------
" Content searching using Ack
" ---------------------------
let g:unite_source_grep_command = 'ack'
let g:unite_source_grep_default_opts = '--column --no-color --nogroup --with-filename'
let g:unite_source_grep_recursive_opt = ''

" Find file with pattern
nnoremap <leader>a :Unite grep<cr>

" Find every file with the pattern on cursor
nnoremap <leader>A :execute 'Unite grep:.::' . expand("<cword>") . ' '<cr>

" Go to Definition/Declaration on cursor
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<cr>

" Time it takes to update gui while not doing anything (milliseconds)
set updatetime=500

" Fixes delay after pressing ESC and then O
set timeout timeoutlen=1000 ttimeoutlen=100

" Adds line numbers to the left side of the editor
set number

" Insert spaces instead of tabs
set expandtab
set tabstop=4
set shiftwidth=4

" Rewrap lines to the 120th column
set textwidth=120

" Color Scheme
colorscheme molokai
let g:molokai_original = 0

" No toolbar, menu bar, and scroll bar in GVim
if has('gui_running')
    set guifont=Consolas\ 10
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=m
    set guioptions-=M
    set guioptions-=r
    set guioptions-=R
endif

" Autoclose the preview window after you get out of insert mode
let g:ycm_autoclose_preview_window_after_insertion = 1

" --------------------
" Cscope abbreviations
" --------------------
if has('cscope')
    " Where cscope is located
    set csprg=/usr/bin/cscope

    " These commands will be put in the quickfix window
    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif

    " Checks for a cscope.out in the current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif

    cnoreabbrev csa cs add
    cnoreabbrev csf cs find
    cnoreabbrev csk cs kill
    cnoreabbrev csr cs reset
    cnoreabbrev css cs show
    cnoreabbrev csh cs help
    
    " Build cscope database in current directory
    nnoremap <leader>cs :!find . -name '*.c' -o -name '*.cpp' -o -name '*.h' -o -name '*.hpp' > cscope.files<cr>
                \:!cscope -b -i cscope.files -f cscope.out -q<cr>
                \:cs kill -1<cr>
                \:cs add cscope.out<cr>
    " Instead of killing and adding, you can just do cs reset
    " But this assumes that you already have and existing
    " connection to cscope, if you haven't made a cscope.out
    " and added it before, it will not work if you do a cs reset
endif
