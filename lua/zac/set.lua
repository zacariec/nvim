local set = vim.opt
local bo = vim.bo
local wo = vim.wo
local lsp = vim.lsp

set.tabstop = 2
set.shiftwidth = 2
bo.expandtab = true
wo.number = true
wo.cursorline = true

vim.diagnostic.config({
	update_in_insert = true,
	vim.diagnostic.config({ virtual_lines = { prefix = "🔥" } })

})

lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{
		underline = true,
		virtual_text = {
			spacing = 5,
			severity_limit = 'Warning',
		},
		update_in_insert = true,
	}
)
