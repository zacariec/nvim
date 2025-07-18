local saga = require 'lspsaga'


-- use custom config
saga.init_lsp_saga({
	-- "single" | "double" | "rounded" | "bold" | "plus"
	border_style = "single",
	--the range of 0 for fully opaque window (disabled) to 100 for fully
	saga_winblend = 0,
	-- when cursor in saga window you config these to move
	move_in_saga = { prev = '<C-p>',next = '<C-n>'},
	-- Error, Warn, Info, Hint
 	--[[ { " ", " ", " ", "ﴞ " }, ]]
	diagnostic_header =  { "😡", "😥", "😤", "😐" },
	-- show diagnostic source
	show_diagnostic_source = true,
	-- add bracket or something with diagnostic source, just have 2 elements
	diagnostic_source_bracket = {},
	-- preview lines of lsp_finder and definition preview
	max_preview_lines = 10,
	-- use emoji lightbulb in default
	code_action_icon = "💡",
	-- if true can press number to execute the codeaction in codeaction window
	code_action_num_shortcut = true,
	-- same as nvim-lightbulb but async
	code_action_lightbulb = {
		enable = true,
		sign = true,
		sign_priority = 20,
		virtual_text = true,
	},
	-- finder icons
	finder_icons = {
		def = '  ',
		ref = '諭 ',
		link = '  ',
	},
	finder_action_keys = {
		open = "o",
		vsplit = "s",
		split = "i",
		tabe = "t",
		quit = "q",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>", -- quit can be a table
	},
	code_action_keys = {
		quit = "q",
		exec = "<CR>",
	},
	rename_action_quit = "<C-c>",
	definition_preview_icon = "  ",
	-- show symbols in winbar must nightly
	symbol_in_winbar = {
		in_custom = false,
		enable = false,
		separator = ' ',
		show_file = true,
		click_support = false,
	},
	-- show outline
	show_outline = {
		win_position = 'right',
		-- set the special filetype in there which in left like nvimtree neotree defx
		left_with = '',
		win_width = 30,
		auto_enter = true,
		auto_preview = true,
		virt_text = '┃',
		jump_key = 'o',
		-- auto refresh when change buffer
		auto_refresh = true,
	},
})

