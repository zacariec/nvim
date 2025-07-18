return {
	"fgheng/winbar.nvim",
	dependencies = {
		"nvimdev/lspsaga.nvim",
	},
	config = function()
		require("winbar").setup({
			enabled = true,
			show_file_path = true,
			show_symbols = true,
		})
		require("lspsaga.symbol.winbar").get_bar()
	end,
}
