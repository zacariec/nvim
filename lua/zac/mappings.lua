local action = require("lspsaga.codeaction");

-- Open Code action
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga code_action<CR>", { silent = true, noremap = true })
-- Jump to next diagnostic error.
vim.keymap.set("n", "<leader>]", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true, noremap = true })
-- Jump to previous diagnostic error
vim.keymap.set("n", "<leader>[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true, noremap = true })
-- Open float terminal from LSP Saga
vim.keymap.set("n", "<leader>te", "<cmd>Lspsaga open_floaterm<CR>", { silent = true, noremap = true })
-- Close foat terminal from LSP Saga
vim.keymap.set("t", "<leader>te", "<C-\\><C-n><cmd>Lspsaga close_floaterm<CR>", { silent = true, noremap = true })

vim.keymap.set("n", "<leader>E", "<cmd>Explore<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ww", "<cmd>write<CR>", { silent = true, noremap = true })

for i = 10, 1, -1
  do
    vim.keymap.set("n", "<C-1>", "<cmd>buffer"..i.."<CR>", { silent = true, noremap = true })
  end
