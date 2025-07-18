return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {},
	version = "^1.0.0",
	keys = {
		{ "<leader>,", "<cmd>BufferPrevious<CR>", desc = "Previous Buffer" },
		{ "<leader>.", "<cmd>BufferNext<CR>", desc = "Next Buffer" },
		{ "C-1", "<cmd>BufferGoto 1<CR>", desc = "Goto the first Buffer" },
		{ "C-2", "<cmd>BufferGoto 2<CR>", desc = "Goto the second Buffer" },
		{ "C-3", "<cmd>BufferGoto 3<CR>", desc = "Goto the third Buffer" },
		{ "C-4", "<cmd>BufferGoto 4<CR>", desc = "Goto the fourth Buffer" },
		{ "C-5", "<cmd>BufferGoto 5<CR>", desc = "Goto the fifth Buffer" },
		{ "C-6", "<cmd>BufferGoto 6<CR>", desc = "Goto the sixth Buffer" },
		{ "C-7", "<cmd>BufferGoto 7<CR>", desc = "Goto the seventh Buffer" },
		{ "C-8", "<cmd>BufferGoto 8<CR>", desc = "Goto the eighth Buffer" },
		{ "C-9", "<cmd>BufferGoto 9<CR>", desc = "Goto the ninth Buffer" },
	},
}
