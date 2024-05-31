return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp_window = require("cmp.config.window")
      return vim.tbl_deep_extend("force", opts, {
        window = {
          completion = cmp_window.bordered(),
          documentation = cmp_window.bordered(),
        },
        enabled = function()
          -- disable completion in comments
          local context = require 'cmp.config.context'
          -- keep command mode completion enabled when cursor is in a comment
          if vim.api.nvim_get_mode().mode == 'c' then
            return true
          else
            return not context.in_treesitter_capture("comment")
              and not context.in_syntax_group("Comment")
          end
        end
      })
    end,
  }
}
