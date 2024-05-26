return {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>tt", "<cmd>Lspsaga term_toggle<CR>", desc = { "Open floating terminal" } },
		{ "<leader>CA", "<cmd>Lspsaga code_action<CR>", desc = { "Open Code Action for LSPSaga" } },
		{ "<leader>pd", "<cmd>Lspsaga peek_definition<CR>", desc = { "Peek definition LSPSaga" } },
		{ "<leader>pd", "<cmd>Lspsaga peek_type_definition<CR>", desc = { "Peek type definition LSPSaga" } },
		{ "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = { "Next diagnostic" } },
		{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = { "Previous diagnostic" } },
		{ "<leader>LF", "<cmd>Lspsaga finder<CR>", desc = { "Open LSPSaga finder" } },
	},
}
