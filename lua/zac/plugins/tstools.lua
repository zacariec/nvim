return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		settings = {
			tsserver_plugins = {},
			expose_as_code_action = "all", -- organize imports, remove unused, etc
		},
	},
}
