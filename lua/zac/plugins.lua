local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- =====================================
	-- Start General plugins
	-- =====================================
	use "wbthomason/packer.nvim"
  use 'tpope/vim-eunuch'
  use 'editorconfig/editorconfig-vim'
  use {
    'fgheng/winbar.nvim',
    config = function()
      require('winbar').setup({
        enabled = true,
        show_file_path = true,
        show_symbols = true,
      })
    end
  }
  use "theprimeagen/harpoon"
  use "mbbill/undotree"
  use {
    'jonsmithers/vim-html-template-literals',
    'leafgarland/typescript-vim',
    requires = 'leafgarland/typescript-vim',
  }
	-- =====================================
	-- End General plugins
	-- =====================================

	-- =====================================
	-- Start Comment plugins
	-- =====================================
	use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
	}

	use {
  	"folke/todo-comments.nvim",
  	requires = "nvim-lua/plenary.nvim",
  	config = function()
    	require("todo-comments").setup {}
  	end
	}
	-- =====================================
	-- End Comment Plugins
	-- =====================================

	-- =====================================
	-- Start Theme plugins
	-- =====================================
	use 'folke/tokyonight.nvim'
	-- =====================================
	-- End Theme plugins
	-- =====================================

	-- =====================================
	-- Start GIT plugins
	-- =====================================
	use "tpope/vim-fugitive"
	use "f-person/git-blame.nvim"
	use "airblade/vim-gitgutter"

	use {
  	'lewis6991/gitsigns.nvim',
  	config = function()
    	require('gitsigns').setup()
  	end
	}
	-- =====================================
	-- End GIT Plugins
	-- =====================================

	-- =====================================
	-- Start LSP plugins
	-- =====================================
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  use "prettier/vim-prettier"

	-- =====================================
	-- End LSP plugins
	-- =====================================


	-- =====================================
	-- Start Diagnostics plugins
	-- =====================================
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })

	-- =====================================
	-- End Diagnostics plugins
	-- =====================================

	-- =====================================
	-- Start Autocompletion plugins
	-- =====================================
  use {
    "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp"
  }

	-- =====================================
	-- End Autcompletetion plugins
	-- =====================================

	-- =====================================
	-- Start Autopairs plugins
	-- =====================================
	use {
		"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
	}
	-- =====================================
	-- End autpairs plugins
	-- =====================================

	-- =====================================
	-- Start Status bar plugins
	-- =====================================
  use { "nvim-lualine/lualine.nvim", requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }
	-- =====================================
	-- End Status bar plugins
	-- =====================================

	-- =====================================
	-- Telescope plugins
	-- =====================================
  use { "nvim-telescope/telescope.nvim", tag = '0.1.0', }
	-- =====================================
	-- End Telescope plugins
	-- =====================================

	-- =====================================
	-- Treesitter plugins
	-- =====================================
  use "virchau13/tree-sitter-astro"
  use { "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' }
  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = function ()
      require'treesitter-context'.setup{
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
          'class',
          'function',
          'method',
          -- 'for', -- These won't appear in the context
          -- 'while',
          -- 'if',
          -- 'switch',
          -- 'case',
        },
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
      },
      exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
      },

      -- [!] The options below are exposed but shouldn't require your attention,
      --     you can safely ignore them.

      zindex = 20, -- The Z-index of the context window
      mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
      separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
      }
    end
  }

	-- =====================================
	-- End Treesitter plugins
	-- =====================================

	-- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

