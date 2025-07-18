return {
  "folke/which-key.nvim",
  event = "BufNewFile",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {},
}
