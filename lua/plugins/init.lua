------------------------------- Sourcing ----------------------------------------

-- some files are autosourced by neovim when placed in a certain folder
-- but manually sourcing every file here

require "plugins.treesitter"
require "plugins.statusline"
require "plugins.devicons"
require "plugins.lspkind"
require "plugins.floatterm"
-- require "plugins.toogleterm"
require "plugins.telescope"
require "plugins.nvimtree"
require "plugins.whichkey"
require "plugins.autopairs"
-- require "plugins.startify"
-- require "plugins.lspinstall"
-- require "lsp.lspinstall"

vim.cmd('source ~/.config/nvim/lua/plugins/gruvbox.vim')
-- vim.cmd('source ~/.config/nvim/lua/plugins/nerdtree.vim')
vim.cmd('source ~/.config/nvim/lua/plugins/undotree.vim')
-- vim.cmd('source ~/.config/nvim/lua/plugins/barber_tabline.vim')
vim.cmd('source ~/.config/nvim/lua/plugins/goyo.vim')
vim.cmd('source ~/.config/nvim/lua/plugins/completion.vim')


-------------------------------- Mappings ---------------------------------------

-- general mappings for which I don't have a separate file
-- just because they are not so many to have an individual file for
-- these are plugins related mappings (editor related are placed in mappings.lua)
local utils = require('settings/utils')

-- utils.map('n', '<leader>o', ":JJ<cr>", {noremap = true})

-- custom telescope commands
-- utils.map("n", '<leader>go', '<cmd> lua require("plugins/telescope").dotfiles()<cr>', {noremap = true})
-- utils.map('n', '<leader>ps', ':lua require("telescope.builtin").grep_string({search = vim.fn.input("Grep for > ")})<cr>', {noremap = true})
-- utils.map("n", '<leader>l', '<cmd> lua require("plugins/telescope").content_selector(vim.api.nvim_get_current_buf(), vim.api.nvim_win_get_cursor(0), "~/.vim/plugged/dsa")<cr>', {noremap = true})
