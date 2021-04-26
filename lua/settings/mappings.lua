-- these are mappings related to the editor and not plugins
-- settings.vim and mappings.lua will be combined to one file to have editor only settings

local utils = require('settings/utils')

-- most important mapping
utils.map('i', 'jj', '<Esc>')

-- move selected text up and down
utils.map('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true, silent = true})
utils.map('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true, silent = true})

-- go to normal mode in terminal buffer
utils.map('t', 'jj', "<C-\\><C-N>", {noremap = true})

-- move between windows
utils.map('n', '<leader>wl', "<C-w>l", {noremap = true})
utils.map('n', '<leader>wj', "<C-w>j", {noremap = true})
utils.map('n', '<leader>wk', "<C-w>k", {noremap = true})
utils.map('n', '<leader>wh', "<C-w>h", {noremap = true})

-- sourcing init.lua
utils.map('n', '<leader>s', ":luafile ~/.config/nvim/init.lua<CR> :echo 'Sourced Successfully'<CR>", {noremap = true})

-- utils.map("n", '<leader>go', '<cmd> lua dotfiles()<cr>', {noremap = true})
-- utils.map('n', '<leader>ps', ':lua require("telescope.builtin").grep_string({search = vim.fn.input("Grep for > ")})<cr>', {noremap = true})
-- utils.map("n", '<leader>o', '<cmd> lua content_selector()<cr>', {noremap = true})
