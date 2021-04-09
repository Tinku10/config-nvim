return require('packer').startup(function()

  use 'wbthomason/packer.nvim'

  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {
    'glepnir/galaxyline.nvim', branch = 'main',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use 'scrooloose/nerdtree'

  use 'vim-scripts/Tabtastic'

  use 'vim-utils/vim-man'

  use 'mbbill/undotree'

  use 'sheerun/vim-polyglot'

  use 'jiangmiao/auto-pairs'

  use 'flazz/vim-colorschemes'

  use 'morhetz/gruvbox'

  use 'jremmen/vim-ripgrep'

  use 'tpope/vim-commentary'

  use 'airblade/vim-gitgutter'

  use 'neovim/nvim-lspconfig'

  -- use 'romgrk/barbar.nvim'

  use 'onsails/lspkind-nvim'

  -- use 'kabouzeid/nvim-lspinstall'

end)
