return require('packer').startup({function()

  use {
    'wbthomason/packer.nvim',
  }

	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'neovim/nvim-lspconfig',
			'onsails/lspkind-nvim'
		}
	}

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      {'nvim-treesitter/nvim-treesitter-refactor'},
      {'nvim-treesitter/playground'},
      'JoosepAlviste/nvim-ts-context-commentstring'
    },
    run = ':TSUpdate'
  }

  use {
    'glepnir/galaxyline.nvim', branch = 'main',
    requires = {
      {'kyazdani42/nvim-web-devicons'}
    }
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzy-native.nvim'},
    }
  }

  use {
    'kyazdani42/nvim-tree.lua',
    -- opt = true,
    requires = {
      {'kyazdani42/nvim-web-devicons'}
    }
  }

  use {
    'vim-utils/vim-man',
    -- opt = true
  }

  use {
    'mbbill/undotree',
  }

  use 'windwp/nvim-autopairs'

  use 'gruvbox-community/gruvbox'

  use {
    'tpope/vim-surround',
  }

  use {
    'tpope/vim-commentary'
  }

  use {
    'mhinz/vim-signify',
  }

  use 'neovim/nvim-lspconfig'


  use {
    'kabouzeid/nvim-lspinstall',
    -- opt = true
  }

  use {
    'glepnir/dashboard-nvim',
    opt = true
  }

  use {
    'sbdchd/neoformat',
  }

  use {
    'folke/zen-mode.nvim',
    opt = true
  }

  use {
    'tpope/vim-fugitive',
    -- opt = true
  }

  use {
    'TimUntersberger/neogit',
    opt = true,
    requires = 'nvim-lua/plenary.nvim'
  }

  use {
    'folke/which-key.nvim',
    opt = true
  }

  use {
    'folke/lsp-trouble.nvim',
    opt = true,
    requires = "kyazdani42/nvim-web-devicons"
  }

  use {
    'folke/twilight.nvim',
    opt = true
  }

  use {
    'sindrets/diffview.nvim',
    opt = true,
  }

  use {
    'norcalli/nvim-colorizer.lua',
    opt = true,
    -- load on specific filetypes
    ft = {'html', 'css', 'javascript', 'javascriptreact', 'typescriptreact'}
  }
  
	end 
})
