" -----------------
" Initialize NeoBundle
" -----------------
set nocompatible

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'milkypostman/vim-togglelist'
NeoBundle 'Raimondi/delimitMate'

NeoBundleLazy 'Valloric/YouCompleteMe'
NeoBundleLazy 'scrooloose/syntastic'
NeoBundleLazy 'majutsushi/tagbar'
NeoBundleLazy 'xolox/vim-easytags'
NeoBundleLazy 'rmartinho/vim-cpp11'
NeoBundleLazy 'beyondmarc/opengl.vim'

" ----------------------------------
"
"
"      Plugin Specific Settings
"
"
" ----------------------------------

" Don't autoclose in vim files
autocmd FileType vim let b:delimitMate_autoclose = 0

" Use Ack instead of Grep when using Unite's search feature
let g:unite_source_grep_command = 'ack'
let g:unite_source_grep_default_opts = '--column --no-color --nogroup --with-filename'
let g:unite_source_grep_recursive_opt = ''

" Only load these plugins in c++ files.
autocmd FileType c,cpp,java,python NeoBundleSource YouCompleteMe
autocmd FileType c,cpp,java,python NeoBundleSource syntastic
autocmd FileType c,cpp,java,python NeoBundleSource tagbar
autocmd FileType c,cpp,java,python NeoBundleSource vim-easytags
autocmd FileType c,cpp NeoBundleSource vim-cpp11
autocmd FileType c,cpp NeoBundleSource opengl.vim

" Stop YouCompleteMe from constantly asking us whether or not to load the config file
let g:ycm_confirm_extra_conf = 0

" Autoclose the preview window after you get out of insert mode
let g:ycm_autoclose_preview_window_after_insertion = 1

" Stop EasyTags from warning us every time it sees that the UpdateTime is low
let g:easytags_updatetime_warn = 0

" Cause EasyTags to generate project specific tags on :UpdateTags (In current directory)
let g:easytags_dynamic_files = 2

" When running :UpdateTags, this will recursively update the tags instead of the current file
let g:easytags_autorecurse = 1

" Set global tags file if EasyTags can't generate the project specific tag
let g:easytags_file = '~/.vim/tags/tags'

" Faster syntax highlighting using Python
let g:easytags_python_enabled = 1
let g:easytags_python_script = "~/.vim/bundle/vim-easytags/misc/easytags/highlight.py"

" Disable Easy Tag's auto highlight for now, it's too slow to handle more than 1 MB worth of tags
let g:easytags_auto_highlight = 0

NeoBundleCheck

" ----------------------------------
"
"
"         Personal Settings
"
"
" ----------------------------------
filetype plugin indent on
syntax on

set tags+=~/.vim/tags/sdl2
set tags+=~/.vim/tags/glm

" Remap leader key from default backslash(\) to spacebar
let mapleader=" "

" Automatically remove trailing whitespace
autocmd FileType c,cpp,java,python autocmd BufWritePre <buffer> :%s/\s\+$//e

" Fuzzy file search
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :Unite -no-split -buffer-name=files -start-insert file_rec/async<cr>

" Find file with pattern
nnoremap <leader>a :Unite grep<cr>

" Find every file with the pattern on cursor
nnoremap <leader>A :execute 'Unite grep:.::' . expand("<cword>") . ' '<cr>

" Toggle Tagbar
nnoremap <Leader>w :TagbarToggle<cr>

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

" Minimum window width
set winwidth=80

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

" --------------------
" Cscope abbreviations
" --------------------
if has('cscope')
    " Where cscope is located
    set csprg=/usr/bin/cscope

    " Search using CScope and Tags
    set cst

    " Search through cscope first, then tags
    set csto=0

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
