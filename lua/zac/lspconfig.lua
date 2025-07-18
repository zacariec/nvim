-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

require'lsp_signature'.setup()

local lsp = vim.lsp
local handlers = lsp.handlers

-- Hover doc popup
local pop_opts = { border = "rounded", max_width = 80 }
handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	require'lsp_signature'.on_attach({
		bind = true,
		handler_opts = {
			border = "rounded"
		}
	}, bufnr)-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 50,
}

-- Setup nvim-cmp.
local cmp = require'cmp'
cmp.setup({
	formatting = {
		format = require'lspkind'.cmp_format({
			mode = "symbol",
			maxwidth = 50
		})
	},
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'ultisnips' }, -- For ultisnips users.
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


M = require "zac.globals"

require'lspconfig'.sumneko_lua.setup{
  on_attach = on_attach,
  root_dir = require'lspconfig'.util.root_pattern(".luarc.json"),
  flags = lsp_flags,
  autostart = true,
  capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					'vim',
					'use'
				}
			}
		}
	}
}

require'lspconfig'.denols.setup{
  on_attach = on_attach,
  root_dir = require'lspconfig'.util.root_pattern("deno.json"),
  flags = lsp_flags,
  autostart = true,
  capabilities = capabilities,
  single_file_support = false,
}

require'lspconfig'.tsserver.setup {
  on_attach = on_attach,
  root_dir = require'lspconfig'.util.root_pattern("package.json"),
  flags = lsp_flags,
  autostart = true,
  capabilities = capabilities,
}

require'lspconfig'.tailwindcss.setup {
  on_attach = on_attach,
  root_dir = require'lspconfig'.util.root_pattern("tailwind.config.*", "package.json"),
  flags = lsp_flags,
  autostart = true,
  capabilities = capabilities
}

require'lspconfig'.html.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  autostart = true,
  filetypes = { "html", "liquid" },
  capabilities = capabilities,
  init_options = {
    configurationSection = { "html", "css", "javascript", "liquid" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    provideFormatter = true
  },
}

for _,server in pairs(M.autoservers) do
  require('lspconfig')[server].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
  }
end

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
