return {
  "https://gitlab.com/schrieveslaach/sonarlint.nvim.git",
  -- Prevent JDTLS from accidentally starting if it's not a Java file
  -- https://github.com/LazyVim/LazyVim/discussions/3449
  -- https://gitlab.com/schrieveslaach/sonarlint.nvim/-/issues/17
  lazy = true,
  ft = { "java" },
  config = function()
    require("sonarlint").setup({
      server = {
        cmd = {
          vim.fn.expand("$MASON/bin/sonarlint-language-server"),
          "-stdio",
          "-analyzers",
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
        },
        -- Fix Java not working. workspace/configuration is receiving incorrect
        -- parameters
        --
        -- https://gitlab.com/schrieveslaach/sonarlint.nvim/-/issues/14
        settings = {
          sonarlint = {
            test = "test",
          },
        }
      },
      filetypes = {
        "java",
      },
    })
  end
}
