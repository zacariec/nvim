local set = vim.opt
local bo = vim.bo
local wo = vim.wo
local lsp = vim.lsp
local cmd = vim.cmd

-- Sets
set.backup = false
set.writebackup = false
-- set.tabstop = 2
-- set.shiftwidth = 2
set.autochdir = true
set.autoindent = true
set.endofline = true
set.wrap = false
set.showmatch = true
set.number = true
set.relativenumber = true
set.termguicolors = true
set.background = "dark"
set.signcolumn = "yes"
set.incsearch = true
set.hlsearch = true
set.smartcase = true
set.ignorecase = true
set.backspace = 'indent,start,eol'
set.softtabstop = 0
set.expandtab = true
set.smarttab = true

set.splitright = true
set.splitbelow = true


-- Window Options
wo.number = true
wo.cursorline = true

vim.diagnostic.config({
	update_in_insert = true,
  virtual_lines = { prefix = "🔥" },
  virtual_text = false,
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

vim.opt.termguicolors = true
-- auto source vim
cmd([[
  augroup neovim
		autocmd!
		autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
	augroup end
]])


