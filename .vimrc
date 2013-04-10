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
Bundle 'Rip-Rip/clang_complete'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'tomtom/tcomment_vim'

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

set number

" Insert spaces instead of tabs
set expandtab
set tabstop=4
set shiftwidth=4

" Rewrap lines to the 80th column
set textwidth=80

" Molokai (Color scheme)
colorscheme molokai
let g:molokai_original = 0

" No toolbar, menu bar, and scroll bar in GVim
if has('gui_running')
    set guifont=Consolas\ 10
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
endif
