return {
  { "Mofiqul/dracula.nvim" },
  {
    "LazyVim/LazyVim",
    opts = function()
      local dracula = require("dracula")
      local util = require("tokyonight.util")
      dracula.setup({
        colors = {
          comment = "#A0B5FF",
        },
        overrides = function(colors)
          return {
            -- Remove once this is resolved
            -- https://github.com/Mofiqul/dracula.nvim/issues/75
            DiffAdd = { bg = util.darken("#69FF94", 0.15) },
            DiffDelete = { fg = "#FF6E6E" },
            DiffChange = { bg = util.darken(colors.comment, 0.15) },
            DiffText = { bg = util.darken(colors.comment, 0.50) },
          }
        end,
      })
      return {
        colorscheme = "dracula",
      }
    end,
  },
}
