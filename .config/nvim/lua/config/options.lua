-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ===========
-- Vim options
-- ===========

-- Better colors
vim.opt.termguicolors = true

-- Improves redrawing
vim.opt.ttyfast = true

-- Don't update screen while executing a macro, register or other commands that
-- not have been typed
vim.opt.lazyredraw = true

-- Enable mouse
vim.opt.mouse = 'a'

-- Hide mouse while typing
vim.opt.mousehide = true

-- Allows you to edit other files without saving current file
vim.opt.hidden = true

-- No backup files
vim.opt.backup = false
vim.opt.swapfile = false

-- Number of command lines to remember
vim.opt.history = 1000

-- Adds line numbers to the left side of the editor
vim.opt.number = true

-- Adds column numbers to the bottom right of the editor
vim.opt.ruler = true

-- Highlight the line you are on
vim.opt.cursorline = true

-- Show tabs and end of line characters
vim.opt.list = true
vim.opt.listchars = { tab = '>~' }

-- Add a visual vertical line 1 column after textwidth
vim.opt.colorcolumn = '+1'

-- Searching
vim.opt.hlsearch = true   -- Highlight search terms
vim.opt.incsearch = true  -- Show search matches as you type
vim.opt.ignorecase = true -- Case-insensitive when searching
vim.opt.smartcase = true  -- Except if there's a capital letter

-- Time it takes to update gui while not doing anything (milliseconds)
vim.opt.updatetime = 50

-- Fixes delay after pressing ESC and then O
vim.opt.timeout = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 100

-- Fixes lag/delay when inserting parentheses and brackets in large files
-- matchparen is a plugin provided by default by vim which highlights matching
-- parens
vim.cmd('let g:matchparen_insert_timeout=5')

-- Enable command-line completion
-- set wildmenu
-- set wildignore+=*.swp,*.bak,*.pyc,*.class,*/.git/**/*,*/.hg/**/*,*/.svn/**/*,*/tmp/*,*.so
-- set wildignorecase
-- set wildmode=list:full

-- =================
-- LazyVim overrides
-- =================

-- Disable relative numbers
vim.opt.relativenumber = false

-- Disable LazyVim auto format
vim.g.autoformat = false

-- Disable persistent undo
vim.opt.undofile = false

-- Prevent always writing to the system clipboard
-- vim default is ""
vim.opt.clipboard = ""

-- Turn on wrapping
-- vim default is true
vim.opt.wrap = true
