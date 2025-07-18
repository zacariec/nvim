vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- General plugins
	use {
  	"wbthomason/packer.nvim",
		"nvim-lua/plenary.nvim",
	}

	-- Theme plugins
	use {
  	"Mofiqul/dracula.nvim",
	}

	-- GIT plugins
	use {
		"f-person/git-blame.nvim",
	}

	-- LSP plugins
	use {
		"williamboman/nvim-lsp-installer",
		"neovim/nvim-lspconfig", -- Configurations for Nvim LSP
	}

	-- Diagnostic plugins
	use {
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end
	}

	--Autocompletion plugins
	use {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"windwp/nvim-ts-autotag",
	}

	-- Autopairs plugins
	use {
		"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
	}

	-- Snippet plugins
	use {
    'SirVer/ultisnips',
    'quangnguyen30192/cmp-nvim-ultisnips'
	}

	-- Status bar plugins
  use { "nvim-lualine/lualine.nvim", requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }

	-- Telescope plugins
  use { "nvim-telescope/telescope.nvim", tag = '0.1.0', }
	
	-- Treesitter plugins
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate'
  }
end)

