local set = vim.opt
local bo = vim.bo
local wo = vim.wo
local lsp = vim.lsp
local cmd = vim.cmd

-- Sets
set.backup = false
set.writebackup = false
set.tabstop = 2
set.shiftwidth = 2
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
require("bufferline").setup{}

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})

-- auto source vim
cmd([[
  augroup neovim
		autocmd!
		autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
	augroup end
]])


