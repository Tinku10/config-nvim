------------------------------- Sourcing ----------------------------------------

-- some files are autosourced by neovim when placed in a certain folder
-- but manually sourcing every file here

require "plugins.treesitter"
require "plugins.statusline"
require "plugins.devicons"
require "plugins.lspkind"
require "plugins.floatterm"
-- require "plugins.toggleterm"
require "plugins.telescope"
require "plugins.nvimtree"
require "plugins.whichkey"
require "plugins.autopairs"
require "plugins.common"
-- require "plugins.startify"
-- require "plugins.lspinstall"
-- require "lsp.lspinstall"

vim.cmd('source ~/.config/nvim/lua/plugins/gruvbox.vim')
-- vim.cmd('source ~/.config/nvim/lua/plugins/nerdtree.vim')
vim.cmd('source ~/.config/nvim/lua/plugins/undotree.vim')
-- vim.cmd('source ~/.config/nvim/lua/plugins/barber_tabline.vim')
vim.cmd('source ~/.config/nvim/lua/plugins/goyo.vim')
vim.cmd('source ~/.config/nvim/lua/plugins/completion.vim')
