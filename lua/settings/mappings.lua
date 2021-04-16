-- these are mappings related to the editor and not plugins
-- settings.vim and mappings.lua will be combined to one file to have editor only settings

local utils = require('settings/utils')

-- most important mapping
utils.map('i', 'jj', '<Esc>')

-- move selected text up and down
utils.map('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true})
utils.map('v', 'K', ":m '>-2<CR>gv=gv", {noremap = true})

-- go to normal mode in terminal buffer
utils.map('t', 'jj', "<C-\\><C-N>", {noremap = true})

-- move between windows
utils.map('n', '<A-j>', "<C-w>j", {noremap = true})
utils.map('n', '<A-k>', "<C-w>k", {noremap = true})
utils.map('n', '<A-h>', "<C-w>h", {noremap = true})
utils.map('n', '<A-l>', "<C-w>l", {noremap = true})

-- utils.map('n', '<leader>o', ":JJ<cr>", {noremap = true})

-- custom telescope commands
utils.map("n", '<leader>go', '<cmd> lua require("plugins/telescope").dotfiles()<cr>', {noremap = true})
utils.map('n', '<leader>ps', ':lua require("telescope.builtin").grep_string({search = vim.fn.input("Grep for > ")})<cr>', {noremap = true})
utils.map("n", '<leader>l', '<cmd> lua require("plugins/telescope").content_selector(vim.api.nvim_get_current_buf(), vim.api.nvim_win_get_cursor(0), "~/.vim/plugged/dsa")<cr>', {noremap = true})
