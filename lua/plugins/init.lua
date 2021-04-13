require "plugins.treesitter"
require "plugins.statusline"
require "plugins.devicons"
require "plugins.lspkind"
require "plugins.floatterm"
require "plugins.telescope"
require "plugins.nvimtree"

-- require "plugins.startify"
-- require "plugins.lspinstall"
vim.cmd('source ~/.config/nvim/lua/plugins/gruvbox.vim')
-- vim.cmd('source ~/.config/nvim/lua/plugins/telescope.vim')
-- vim.cmd('source ~/.config/nvim/lua/plugins/nerdtree.vim')
vim.cmd('source ~/.config/nvim/lua/plugins/undotree.vim')
vim.cmd('source ~/.config/nvim/lua/plugins/goyo.vim')
vim.cmd('source ~/.config/nvim/lua/plugins/completion.vim')
-- vim.cmd('source ~/.config/nvim/lua/plugins/whichkey.vim')

-- general mappings for which I don't have a separate file
-- just because they are not so many to have an individual file for
local utils = require('settings/utils')


