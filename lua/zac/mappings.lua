local builtin = require("telescope.builtin")
local keymap = vim.keymap

-- UndoTree keymaps
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- NvimTree Keymaps
keymap.set(
	"n",
	"<leader>ee",
	"<cmd>NvimTreeToggle<CR>",
	{ desc = "Toggles the file tree", silent = true, noremap = true }
)
keymap.set(
	"n",
	"<leader>ef",
	"<cmd>NvimTreeFindFileToggle<CR>",
	{ desc = "Open the current file in the file tree", silent = true, noremap = true }
)
keymap.set(
	"n",
	"<leader>ec",
	"<cmd>NvimTreeCollapse<CR>",
	{ desc = "Collapse the current file tree folder", silent = true, noremap = true }
)
keymap.set(
	"n",
	"<leader>er",
	"<cmd>NvimTreeRefresh<CR>",
	{ desc = "Refresh the file tree", silent = true, noremap = true }
)

-- Autosession keymaps
keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session" })

-- Telescope Keymaps
keymap.set("n", "<leader>ts", "<cmd>Telescope<CR>", { desc = "Opens telescope", silent = true, noremap = true })
keymap.set(
	"n",
	"<leader>ff",
	"<cmd>Telescope find_files<CR>",
	{ desc = "Telescope fuzzy find files", silent = true, noremap = true }
)
keymap.set(
	"n",
	"<leader>fs",
	"<cmd>Telescope live_grep<CR>",
	{ desc = "Telescope fuzzy find recent files", silent = true, noremap = true }
)
keymap.set(
	"n",
	"<leader>fc",
	"<cmd>Telescope grep_string<CR>",
	{ desc = "Telescope find string under cursor", silent = true, noremap = true }
)
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todos", silent = true, noremap = true })

-- Format Keymaps
keymap.set("n", "<C-p>", builtin.git_files, { desc = "Opens the current git files" })
keymap.set("n", "<leader>ww", "<cmd>write<CR>", { desc = "Write the current buffer", silent = true, noremap = true })
keymap.set("n", "<leader>F", "<cmd>FormatWrite<CR>", { desc = "Format & write", silent = true, noremap = true })
keymap.set(
	"n",
	"<leader>p",
	"<cmd>Prettier<CR>",
	{ desc = "Prettfy's the current buffer", silent = true, noremap = true }
)
keymap.set(
	"n",
	"<leader>ca",
	"<cmd>Lspsaga code_action<CR>",
	{ desc = "Opens code action for the current line", silent = true, noremap = true }
)

-- GIT Keymaps
keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Opens git fugitive", silent = true, noremap = true })
keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Opens lazy git in nvim", silent = true, noremap = true })
keymap.set(
	"n",
	"<leader>GA",
	"<cmd>Git add<CR>",
	{ desc = "Adds the current file for git staging", silent = true, noremap = true }
)
keymap.set("n", "<leader>GC", "<cmd>Git commit<CR>", { desc = "Opens a git commit", silent = true, noremap = true })
keymap.set(
	"n",
	"<leader>GDD",
	"<cmd>GDelete <CR>",
	{ desc = "Deletes the current file from git", silent = true, noremap = true }
)
keymap.set("n", "<leader>GD", "<cmd>Git diff<CR>", { desc = "Shows the current diff", silent = true, noremap = true })

-- Window Management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Split equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>cb", "<cmd>bd<CR>", { desc = "Close current buffer" })

-- Buffer management
keymap.set("n", "[b", "<cmd>bnext<CR>", { desc = "Next Buffer", silent = true, noremap = true })
keymap.set("n", "]b", "<cmd>bprev<CR>", { desc = "Previous Buffer", silent = true, noremap = true })

-- Tab Management
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Previous tab" })
