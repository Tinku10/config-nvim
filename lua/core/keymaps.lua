local settings = require"core.user-settings"

-- custom telescope commands
vim.api.nvim_set_keymap("n", '<leader>fd', '<cmd> lua require("configs.telescope").dotfiles()<cr>', {noremap = true})
vim.api.nvim_set_keymap("n", '<leader>fa', '<cmd> lua require("configs.telescope").anyjump()<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ps', ':lua require("telescope.builtin").grep_string({search = vim.fn.input("Grep for > ")})<cr>', {noremap = true})
vim.api.nvim_set_keymap("n", '<leader>fl', '<cmd> lua require("configs.telescope").content_selector(settings.paths.dsa)<cr>', {noremap = true})

-- format buffer using Neoformat
vim.api.nvim_set_keymap('n', '<leader>n', ":Neoformat<cr>", {noremap = true, silent = true})

-- custom floatterms
-- vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd> lua require("plugins/term/floatterm").lazygit()<cr>', {noremap = true, silent = true})

-- Neogit
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>Neogit<cr>', { noremap = true })

-- most important mapping
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true, silent = true})

-- tree toggles
vim.api.nvim_set_keymap('n', '<F3>', ':NvimTreeToggle<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>v', ':NvimTreeFindFileToggle<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<cr>', { noremap = true, silent = true })

-- move selected text up and down
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true, silent = true})

-- go to normal mode in terminal buffer
vim.api.nvim_set_keymap('t', 'jj', "<C-\\><C-N>", {noremap = true})

-- move between windows (splits)
vim.api.nvim_set_keymap('n', 'wl', "<C-w>l", {noremap = true})
vim.api.nvim_set_keymap('n', 'wj', "<C-w>j", {noremap = true})
vim.api.nvim_set_keymap('n', 'wk', "<C-w>k", {noremap = true})
vim.api.nvim_set_keymap('n', 'wh', "<C-w>h", {noremap = true})

-- sourcing init.lua (does not source all files)
vim.api.nvim_set_keymap('n', '<leader>s', ":luafile ~/.config/nvim/init.lua<CR> :w ~/.config/nvim/init.lua<CR> :echo 'Sourced Successfully'<CR>", {noremap = true})

-- quickfix list and location list mappings
-- vim.api.nvim_set_keymap('n', 'co', ":copen<CR>", {noremap = true})
-- vim.api.nvim_set_keymap('n', 'cj', ":cnext<CR>", {noremap = true})
-- vim.api.nvim_set_keymap('n', 'ck', ":cprevious<CR>", {noremap = true})
-- vim.api.nvim_set_keymap('n', 'no', ":lopen<CR>", {noremap = true})
-- vim.api.nvim_set_keymap('n', 'nj', ":lnext<CR>", {noremap = true})
-- vim.api.nvim_set_keymap('n', 'nk', ":lprevious<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', 'tco', ":Telescope quickfix<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', 'tno', ":Telescope loclist<CR>", {noremap = true})

-- treesitter
vim.api.nvim_set_keymap('n', '<leader>ts', ':TSPlaygroundToggle<cr>', { noremap = true, silent = true })

-- trim white space
vim.api.nvim_set_keymap('n', 'tw', ':lua require("settings.editor").trim_white_space()<CR>', { noremap = true, silent = true })

-- codeaction menu
vim.api.nvim_set_keymap('n', '<leader>ca', ":CodeActionMenu", {noremap = true})

-- set keymaps from high level settings
for _, keymap in pairs(settings.keymaps) do
  vim.api.nvim_set_keymap(keymap[1], keymap[2], keymap[3], { noremap = true })
end
