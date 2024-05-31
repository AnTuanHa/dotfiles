-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Add borders for LSP signature help
-- folke/noice.nvim interferes with the nvim-cmp setting
-- https://github.com/LazyVim/LazyVim/issues/556
local float = { focusable = true, style = "minimal", border = "rounded", }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, float)
