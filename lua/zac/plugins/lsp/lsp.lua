return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "nvimtools/none-ls.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = {
      Error = "⨂ ",
      Warn = "⚠ ",
      Hint = "⍟ ",
      Info = "⏼ ",
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["theme_check"] = function()
        lspconfig["theme_check"].setup({
          autostart = true,
          filetypes = { "liquid" },
          single_file_support = true,
          capabilities = capabilities,
        })
      end,
      ["html"] = function()
        lspconfig["html"].setup({
          autostart = true,
          filetypes = { "html" },
          single_file_support = true,
          capabilities = capabilities,
        })
      end,
      ["tsserver"] = function()
        lspconfig["tsserver"].setup({
          autostart = true,
          capabilities = capabilities,
          root_dir = lspconfig.util.root_pattern("package.json"),
        })
      end,
      ["denols"] = function()
        lspconfig["denols"].setup({
          autostart = true,
          capabilities = capabilities,
          root_dir = lspconfig.util.root_pattern("deno.jsonc"),
        })
      end,
      ["null-ls"] = function()
        local null_ls = require("null-ls")
        local code_actions = null_ls.builtins.code_actions
        local completion = null_ls.builtins.completion
        local diagnostics = null_ls.builtins.diagnostics
        local formatting = null_ls.builtins.formatting
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        lspconfig["null-ls"].setup({
          autostart = true,
          capabilities = capabilities,
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
            completion.vsnip,
            require("none-ls.diagnostics.eslint"),
            formatting.prettier,
            null_ls.builtins.hover.printenv,
          },
        })
      end,
    })
  end,
}
