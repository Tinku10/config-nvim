return require('packer').startup({function()

  use {
    'wbthomason/packer.nvim',
    -- opt = true
  }

  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {
      {'onsails/lspkind-nvim'},
      {'hrsh7th/vim-vsnip', opt = true},
      {'hrsh7th/vim-vsnip-integ', opt = true}
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

  use 'famiu/feline.nvim'


  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzy-native.nvim'},
      -- {'nvim-telescope/telescope-media-files.nvim'}
    }
  }

  -- use 'scrooloose/nerdtree'

  use {
    'kyazdani42/nvim-tree.lua',
    -- opt = true,
    requires = {
      {'kyazdani42/nvim-web-devicons'}
    }
  }

  -- use 'vim-scripts/Tabtastic'

  use {
    'vim-utils/vim-man',
    -- opt = true
  }

  use {
    'mbbill/undotree',
  }

  -- use 'sheerun/vim-polyglot'

  -- use 'jiangmiao/auto-pairs'
  use 'windwp/nvim-autopairs'

  -- use 'flazz/vim-colorschemes'

  use 'gruvbox-community/gruvbox'
  -- use 'morhetz/gruvbox'
  -- use 'arcticicestudio/nord-vim'

  -- use 'jremmen/vim-ripgrep'
  -- use 'mhinz/vim-grepper'

  use {
    'tpope/vim-surround',
  }

  use {
    'tpope/vim-commentary'
  }

  -- use 'airblade/vim-gitgutter'
  use {
    'mhinz/vim-signify',
  }

  -- use {
  --   'lewis6991/gitsigns.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim'
  --   }
  -- }

  use 'neovim/nvim-lspconfig'

  -- use 'romgrk/barbar.nvim'
  -- use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}

  use {
    'kabouzeid/nvim-lspinstall',
    -- opt = true
  }

  -- use 'mhinz/vim-startify'
  use {
    'glepnir/dashboard-nvim',
    opt = true
  }

  -- use {
  --   'numtostr/FTerm.nvim',
  --   opt = true
  -- }

  -- use 'akinsho/nvim-toggleterm.lua'

  use {
    'sbdchd/neoformat',
  }

  -- use 'matze/vim-move'

  -- use 'junegunn/goyo.vim'
  -- use 'kdav5758/TrueZen.nvim'
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

  -- use 'tjdevries/nlua.nvim'

  use {
    'folke/which-key.nvim',
    opt = true
  }

  -- use {
  --   'junegunn/fzf',
  --   run = 'cd ~/.fzf && ./install --all'
  -- }

  -- use 'Tinku10/dsa'

  -- use 'pseewald/vim-anyfold'

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


end,
config = {
  -- display = {
  --   open_fn = function()
  --     return require('packer.util').float({border = 'single'})
  --   end
  -- }
}})
