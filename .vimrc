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
Bundle 'tpope/vim-surround'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'tomtom/tcomment_vim'
Bundle 'wincent/Command-T'

" Repositories on Vim-Scripts
" ---------------------------
" Bundle 'repoName'


" Repositories NOT on GitHub
" --------------------------
" Bundle 'git://git.website.com/repoName.git'


" -----------------
" Personal Settings
" -----------------
filetype plugin indent on
syntax on

set updatetime=1000

" Autosave and auto open text folding
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Fixes delay after pressing ESC and then O
set timeout timeoutlen=1000 ttimeoutlen=100

" Adds line numbers to the left side of the editor
set number

" Insert spaces instead of tabs
set expandtab
set tabstop=4
set shiftwidth=4

" Rewrap lines to the 80th column
set textwidth=80

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

noremap <Leader>r :CommandTFlush<CR>
