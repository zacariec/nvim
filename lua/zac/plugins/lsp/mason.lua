return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✔",
					package_pending = "➜",
					package_uninstalled = "✘",
				},
			},
		})

		mason_lspconfig.setup({
			automatic_installation = true,
			ensure_installed = {
				"denols",
				"tsserver",
				"lua_ls",
				"tailwindcss",
				"html",
				"astro",
				"rust_analyzer",
				"graphql",
				"cssls",
				"jsonls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua",
			},
		})
	end,
}
