-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Set <space> as the leader key
vim.g.mapleader = ' '
-- Set <backslash> as the local leader key
vim.g.maplocalleader = '\\'

-- Disable LazyVim ALT key binds for moving lines up and down
vim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.del("i", "<A-j>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("v", "<A-j>")
vim.keymap.del("v", "<A-k>")

-- Disable LazyVim's default terminal keymaps (we use our own floating terminal)
vim.keymap.del({ "n", "t" }, "<C-/>")
vim.keymap.del({ "n", "t" }, "<C-_>")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")

-- Custom floating terminal (per-tab, full key passthrough)
local terminal = require("config.terminal")
vim.keymap.set({ "n", "t" }, "<C-/>", terminal.toggle, { desc = "Toggle floating terminal" })
vim.keymap.set({ "n", "t" }, "<C-_>", terminal.toggle, { desc = "Toggle floating terminal" })

vim.keymap.set("n", "<leader>se",
  function()
    -- Create flag file so nvim-switch loops back to picker
    io.open("/tmp/nvim-switch-flag", "w"):close()
    vim.cmd("detach")
  end,
  { desc = "Switch Neovim session" }
)
