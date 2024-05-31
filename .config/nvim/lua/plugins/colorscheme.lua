return {
  { "Mofiqul/dracula.nvim" },
  {
    "LazyVim/LazyVim",
    opts = function()
      local dracula = require("dracula")
      dracula.setup({
        colors = {
          comment = "#A0B5FF",
        },
      })
      return {
        colorscheme = "dracula",
      }
    end
  }
}
