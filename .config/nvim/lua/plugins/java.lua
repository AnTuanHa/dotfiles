return {
  {
    "mfussenegger/nvim-jdtls",
    lazy = true,
    ft = { "java" },
    opts = function(_, opts)
      -- Since we're overriding the command, we need to copy whatever LazyVim
      -- passed in originally
      --
      -- https://github.com/LazyVim/LazyVim/blob/v14.14.0/lua/lazyvim/plugins/extras/lang/java.lua#L88-L93
      local cmd = { vim.fn.exepath("jdtls") }
      if LazyVim.has("mason.nvim") then
        local lombok_jar = vim.fn.expand("$MASON/share/jdtls/lombok.jar")
        table.insert(cmd, string.format("--jvm-arg=-javaagent:%s", lombok_jar))
      end

      -- Resolve dependenices in parallel using breadth first search instead
      -- of depth first search
      --
      -- https://github.com/apache/maven-resolver/blob/maven-resolver-1.9.7/src/site/markdown/configuration.md
      table.insert(cmd, "-Daether.dependencyCollector.impl=bf")

      -- nvim-dap doesn't provide a way to override the java debug server such
      -- as .vscode/settings.json.
      --
      -- 1. java.debug.settings.showLogicalStructure=false
      -- 2. java.debug.settings.showToString=false
      --
      -- These settings help improve performance when remote debugging
      -- https://stackoverflow.com/questions/46292095/intelliji-idea-is-very-slow-in-debug-mode-and-it-is-running-perfectly-in-normal
      --
      -- A custom JAR file should be built with the default settings changed
      -- https://github.com/microsoft/java-debug
      --
      -- https://github.com/microsoft/vscode-java-debug

      return vim.tbl_extend("force", opts, {
        cmd = cmd,
        -- Disable main class scan for performance
        -- https://github.com/LazyVim/LazyVim/pull/5391
        dap_main = false,
        -- https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line
        jdtls = {
          settings = {
            java = {
              codeGeneration = {
                hashCodeEquals = {
                  useInstanceof = true,
                  useJava7Objects = true,
                },
                useBlocks = true,
              },
              format = {
                settings = {
                  profile = "Default",
                  url = vim.fn.stdpath("config") .. "/javaFormat.xml",
                },
              },
              inlayHints = {
                parameterNames = {
                  enabled = "all",
                },
              },
              maxConcurrentBuilds = 16,
              saveActions = {
                organizeImports = true,
              },
              signatureHelp = { enabled = true, description = true },
              sources = {
                organizeImports = {
                  starThreshold = 9999,
                  staticStarThreshold = 9999,
                },
              },
              symbols = {
                includeSourceMethodDeclarations = true,
              },
            },
          },
        },
      })
    end,
  },
}
