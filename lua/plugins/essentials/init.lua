------------------------------- Sourcing ----------------------------------------

-- some files are autosourced by neovim when placed in a certain folder
-- but manually sourcing every file here

require "plugins.essentials.treesitter"
require "plugins.essentials.statusline"
require "plugins.essentials.telescope"
require "plugins.essentials.nvimtree"
require "plugins.essentials.autopairs"

vim.cmd('source ~/.config/nvim/lua/plugins/essentials/gruvbox.vim')
-- vim.cmd('source ~/.config/nvim/lua/plugins/essentials/nerdtree.vim')
vim.cmd('source ~/.config/nvim/lua/plugins/essentials/undotree.vim')
vim.cmd('source ~/.config/nvim/lua/plugins/essentials/completion.vim')
