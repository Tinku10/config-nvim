------------------------ Common Mappings & Setup -------------------------------

-- general mappings for which I don't have a separate file
-- just because they are not so many to have an individual file for
-- these are plugins related mappings (editor related are placed in mappings.lua)
local utils = require('settings/utils')

-- utils.map('n', '<leader>o', ":JJ<cr>", {noremap = true})

-- custom telescope commands
utils.map("n", '<leader>fd', '<cmd> lua require("plugins/telescope").dotfiles()<cr>', {noremap = true})
utils.map('n', '<leader>ps', ':lua require("telescope.builtin").grep_string({search = vim.fn.input("Grep for > ")})<cr>', {noremap = true})
utils.map("n", '<leader>fl', '<cmd> lua require("plugins/telescope").content_selector(vim.api.nvim_get_current_buf(), vim.api.nvim_win_get_cursor(0), "~/.vim/plugged/dsa")<cr>', {noremap = true})

-- format buffer using Neoformat
utils.map('n', '<leader>n', ":Neoformat", {noremap = true, silent = true})

