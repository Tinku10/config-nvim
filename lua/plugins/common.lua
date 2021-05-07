------------------------ Common Mappings & Setup -------------------------------

-- these are plugins related mappings (editor related are placed in mappings.lua)

-- custom telescope commands
vim.api.nvim_set_keymap("n", '<leader>fd', '<cmd> lua require("plugins/essentials/telescope").dotfiles()<cr>', {noremap = true})
vim.api.nvim_set_keymap("n", '<leader>fa', '<cmd> lua require("plugins/essentials/telescope").anyjump()<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ps', ':lua require("telescope.builtin").grep_string({search = vim.fn.input("Grep for > ")})<cr>', {noremap = true})
vim.api.nvim_set_keymap("n", '<leader>fl', '<cmd> lua require("plugins/essentials/telescope").content_selector(vim.api.nvim_get_current_buf(), vim.api.nvim_win_get_cursor(0), "~/.vim/plugged/dsa")<cr>', {noremap = true})

-- format buffer using Neoformat
vim.api.nvim_set_keymap('n', '<leader>n', ":Neoformat<cr>", {noremap = true, silent = true})

