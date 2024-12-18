return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = vim.split("\n\n\n\n\n\n\n\n\n\n", "\n"),
        },
      },
      indent = { enabled = false },
      notifier = { enabled = false },
    },
  },
}
