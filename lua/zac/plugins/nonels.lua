return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
    "mason.nvim",
	},
  config = function ()
        local null_ls = require("null-ls")
        local code_actions = null_ls.builtins.code_actions
        local completion = null_ls.builtins.completion
        local diagnostics = null_ls.builtins.diagnostics
        local formatting = null_ls.builtins.formatting
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup({
          on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
              vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
              vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format({
                    async = false,
                    bufnr = bufnr,
                    filter = function(client)
                      return client.name == "null-ls"
                    end,
                  })
                end,
              })
            end
          end,
          sources = {
            require("none-ls.code_actions.eslint"),
            require("none-ls.diagnostics.eslint"),
            formatting.prettier,
            null_ls.builtins.hover.printenv,
          },
        })
    
  end
}
