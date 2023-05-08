-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Semantic highlighting is not supported yet
  --  https://github.com/Mofiqul/dracula.nvim/issues/84
  use 'Mofiqul/dracula.nvim'

  -- Syntax tree source code parser for highlighting and navigating code
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter',
  }

  -- Adds gcc (normal mode) and gc (visual mode) to comment out lines
  use 'numToStr/Comment.nvim'

  -- Automatically detect shiftwidth and expandtab
  use 'tpope/vim-sleuth'

  -- All about surroundings (parentheses, brackets, quotes, XML tags, etc
  -- Provides mappings to delete, change, and add such surroundings in pairs
  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  }

end)
