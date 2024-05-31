return {
  {
    "mfussenegger/nvim-jdtls",
    lazy = true,
    opts = {
      jdtls = {
        settings = {
          java = {
            format = {
              settings = {
                profile = "Default",
                url = vim.fn.stdpath("config") .. "/javaFormat.xml",
              }
            }
          }
        }
      }
    }
  }
}
