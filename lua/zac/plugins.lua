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
		"tpope/vim-fugitive",
		"f-person/git-blame.nvim",
		"airblade/vim-gitgutter"
	}

	-- LSP plugins
	use {
		"williamboman/nvim-lsp-installer",
		"neovim/nvim-lspconfig", -- Configurations for Nvim LSP
		"onsails/lspkind.nvim",
		"ray-x/lsp_signature.nvim",
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

	-- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

