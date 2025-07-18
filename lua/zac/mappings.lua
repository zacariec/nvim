vim.keymap.set("n", "<leader>E", "<cmd>Explore<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ww", "<cmd>write<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>p", "<cmd>Prettier<CR>", { silent = true, noremap = true })

for i = 10, 1, -1
  do
    vim.keymap.set("n", "<C-1>", "<cmd>buffer"..i.."<CR>", { silent = true, noremap = true })
  end
