return {
	"nvim-pack/nvim-spectre",
	opts = {
		open_cmd = "noswapfile vnew",
	},
	build = false,
	cmd = "Spectre",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>fr",
			function()
				require("spectre").open()
			end,
			desc = "Find & Replace Spectre",
		},
	},
}
