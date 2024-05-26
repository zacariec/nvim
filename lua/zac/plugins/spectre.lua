return {
  "nvim-pack/nvim-spectre",
  opts = {
    open_cmd = "noswapfile vnew",
  },
  build = false,
  cmd = "Spectre",
  keys = {
    { "<leader>fr", function() require("spectre").open() end, desc = "Find & Replace Spectre" },
  },
}
