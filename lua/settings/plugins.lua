return require('packer').startup(function()

  use 'wbthomason/packer.nvim'

  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'nvim-treesitter/playground'

  use {
    'glepnir/galaxyline.nvim', branch = 'main',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}, {'nvim-telescope/telescope-media-files.nvim'}}
  }

  -- use 'scrooloose/nerdtree'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- use 'vim-scripts/Tabtastic'

  use 'vim-utils/vim-man'

  use 'mbbill/undotree'

  -- use 'sheerun/vim-polyglot'

  use 'jiangmiao/auto-pairs'

  use 'flazz/vim-colorschemes'

  use 'gruvbox-community/gruvbox'
  -- use 'morhetz/gruvbox'

  use 'jremmen/vim-ripgrep'

  use 'tpope/vim-commentary'

  -- use 'airblade/vim-gitgutter'
  use 'mhinz/vim-signify'

  use 'neovim/nvim-lspconfig'

  -- use 'romgrk/barbar.nvim'

  use 'onsails/lspkind-nvim'

  -- use 'kabouzeid/nvim-lspinstall'

  use 'mhinz/vim-startify'

  use 'numtostr/FTerm.nvim'

  -- use 'akinsho/nvim-toggleterm.lua'

  use 'sbdchd/neoformat'

  -- use 'matze/vim-move'

  use 'junegunn/goyo.vim'

  -- use 'kabouzeid/nvim-lspinstall'

  use 'tpope/vim-fugitive'

  use 'tjdevries/nlua.nvim'

  use {
    'liuchengxu/vim-which-key',
    opt = true,
    cmd = {'WhichKey'}
  }

  -- use {
  --   'junegunn/fzf',
  --   run = 'cd ~/.fzf && ./install --all'
  -- }

  -- use 'Tinku10/dsa'

end)
