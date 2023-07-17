return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local ls = require("null-ls")

      -- Create an autocommand group for LSP formatting
      local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
      local builtins = ls.builtins

      -- Setup null-ls
      require("null-ls").setup({
        -- Configure the on_attach function when the LSP client attaches to a buffer
        on_attach = function(client, bufnr)
          -- Check if the LSP client supports the "textDocument/formatting" method
          if client.supports_method("textDocument/formatting") then
            -- Clear any existing autocmds in the specified group and buffer
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

            -- Create a new autocmd for BufWritePre event
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                if type(vim.lsp.buf.format) == "function" then
                  vim.lsp.buf.format({
                    timeout_ms = 1000,
                  })
                else
                  vim.lsp.buf.formatting_sync(nil, 1000)
                end
              end,
            })
          end
        end,
        sources = {
          builtins.formatting.deno_fmt,
          builtins.formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }),
          builtins.formatting.stylua,
          builtins.formatting.clang_format,
          builtins.code_actions.refactoring,
        },
      })
    end,
  },
}
