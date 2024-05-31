return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local actions = require("telescope.actions")

      return {
        defaults = {
          mappings = {
            i = {
              ["<C-a>"] = actions.results_scrolling_left,
              ["<C-e>"] = actions.results_scrolling_right,
            }
          }
        }
      }
    end,
  },
}
