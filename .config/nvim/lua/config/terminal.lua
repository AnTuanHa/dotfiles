-- Minimal per-tab floating terminal using core Neovim APIs.
-- Required from config/keymaps.lua to ensure correct load order.

local M = {}

-- Per-tab state: { buf = <bufnr>, win = <winnr> }
-- Keyed by tabpage handle.
local tabs = {}

local function win_opts()
  local width = math.floor(vim.o.columns * 0.9)
  local height = math.floor(vim.o.lines * 0.9)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)
  return {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  }
end

function M.toggle()
  local tab = vim.api.nvim_get_current_tabpage()
  local state = tabs[tab]

  -- If window is open, close it (hide)
  if state and state.win and vim.api.nvim_win_is_valid(state.win) then
    vim.api.nvim_win_hide(state.win)
    return
  end

  -- Create buffer if needed (or if the old one was wiped)
  if not state or not state.buf or not vim.api.nvim_buf_is_valid(state.buf) then
    local buf = vim.api.nvim_create_buf(false, true)
    -- Start a shell in the buffer
    vim.api.nvim_buf_call(buf, function()
      vim.fn.termopen(vim.o.shell, {
        on_exit = function()
          -- Clean up state when the shell process exits
          tabs[tab] = nil
        end,
      })
    end)
    state = { buf = buf }
    tabs[tab] = state
  end

  -- Open floating window
  local win = vim.api.nvim_open_win(state.buf, true, win_opts())
  state.win = win

  -- Enter terminal mode immediately
  vim.cmd.startinsert()
end

return M
