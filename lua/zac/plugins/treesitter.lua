return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	event = { "BufReadPre", "BufNewFile" },
	lazy = vim.fn.argc(-1) == 0,
	init = function(plugin)
		require("nvim-treesitter.query_predicates")
	end,
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")
		local parsers = require("nvim-treesitter.parsers")

		configs.setup({
			ensure_installed = {
				"javascript",
				"typescript",
				"astro",
				"lua",
				"rust",
				"css",
				"diff",
				"dockerfile",
				"dot",
				"git_rebase",
				"gitcommit",
				"gitignore",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"graphql",
				"html",
				"liquid",
				"jsdoc",
				"json",
				"markdown",
				"prisma",
				"regex",
				"ruby",
				"scss",
				"svelte",
				"tsx",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			autotag = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
