return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local actions = require("telescope.actions")

      return {
        defaults = {
          layout_strategy = "vertical",
          layout_config = {
            width = 0.99,
            height = 0.99,
            preview_cutoff = 10,
          },
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
