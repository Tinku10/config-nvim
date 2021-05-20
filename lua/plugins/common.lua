------------------------ Common Mappings & Setup -------------------------------

-- these are plugins related mappings (editor related are placed in mappings.lua)

-- custom telescope commands
vim.api.nvim_set_keymap("n", '<leader>fd', '<cmd> lua require("plugins.finder.setup").dotfiles()<cr>', {noremap = true})
vim.api.nvim_set_keymap("n", '<leader>fa', '<cmd> lua require("plugins.finder.setup").anyjump()<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ps', ':lua require("telescope.builtin").grep_string({search = vim.fn.input("Grep for > ")})<cr>', {noremap = true})
vim.api.nvim_set_keymap("n", '<leader>fl', '<cmd> lua require("plugins.finder.setup").content_selector(vim.api.nvim_get_current_buf(), vim.api.nvim_win_get_cursor(0), "~/.vim/plugged/dsa")<cr>', {noremap = true})

-- format buffer using Neoformat
vim.api.nvim_set_keymap('n', '<leader>n', ":Neoformat<cr>", {noremap = true, silent = true})

-- custom floatterms
vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd> lua require("plugins/term/floatterm").lazygit()<cr>', {noremap = true, silent = true})
