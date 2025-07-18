M = require "zac.globals"

require("nvim-lsp-installer").setup({
	ensure_installed = M.servers,
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
})


