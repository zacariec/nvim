return {
	"hrsh7th/cmp-nvim-lsp",
	config = function()
		require("cmp").setup({
			sources = {
				{ name = "nvim_lsp" },
			},
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.lsp.config("*", {
			capabilities = capabilities,
		})
	end,
}
