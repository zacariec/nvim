return {
	"stevearc/conform.nvim",
	event = { "LspAttach", "BufReadPre", "BufNewFile" },
	dependencies = { "mason.nvim" },
	lazy = true,
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>cF",
			function()
				require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
			end,
			mode = { "n", "v" },
			desc = "Format Injected Langs",
		},
	},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				liquid = { "prettier" },
				astro = { "prettier" },
				yaml = { "prettier" },
				json = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
			},
			format = {
				async = true,
				lsp_fallback = true,
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 2500,
			},
		})
	end,
}
