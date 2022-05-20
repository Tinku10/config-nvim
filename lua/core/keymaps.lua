local settings = require"core.user"

-- custom telescope commands
vim.keymap.set("n", '<leader>fd', '<cmd> lua require("configs.telescope").dotfiles()<cr>', {noremap = true, desc = "list dotfiles"})
vim.keymap.set("n", '<leader>fa', '<cmd> lua require("configs.telescope").anyjump()<cr>', {noremap = true, desc = "anyjump"})
vim.keymap.set('n', '<leader>ps', ':lua require("telescope.builtin").grep_string({search = vim.fn.input("Grep for > ")})<cr>', {noremap = true})
vim.keymap.set("n", '<leader>fl', '<cmd> lua require("configs.telescope").content_selector(settings.paths.dsa)<cr>', {noremap = true})

-- format buffer using Neoformat
vim.keymap.set('n', '<leader>n', ":Neoformat<cr>", {noremap = true, silent = true})

-- custom floatterms
-- vim.keymap.set('n', '<leader>lg', '<cmd> lua require("plugins/term/floatterm").lazygit()<cr>', {noremap = true, silent = true})

-- Neogit
vim.keymap.set('n', '<leader>g', '<cmd>Neogit<cr>', { noremap = true })

-- most important mapping
vim.keymap.set('i', 'jj', '<Esc>', {noremap = true, silent = true})

-- tree toggles
vim.keymap.set('n', '<F3>', ':NvimTreeToggle<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>v', ':NvimTreeFindFileToggle<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>r', ':NvimTreeRefresh<cr>', { noremap = true, silent = true })

-- move selected text up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true, silent = true})
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true, silent = true})

-- go to normal mode in terminal buffer
vim.keymap.set('t', 'jj', "<C-\\><C-N>", {noremap = true})

-- move between windows (splits)
vim.keymap.set('n', 'wl', "<C-w>l", {noremap = true})
vim.keymap.set('n', 'wj', "<C-w>j", {noremap = true})
vim.keymap.set('n', 'wk', "<C-w>k", {noremap = true})
vim.keymap.set('n', 'wh', "<C-w>h", {noremap = true})

-- resize windows width
vim.keymap.set("n", "w,", "<C-w><k<CR>", { noremap = true })
vim.keymap.set("n", "w.", "<C-w>>k<CR>", { noremap = true })

-- sourcing init.lua (does not source all files)
vim.keymap.set('n', '<leader>s', ":luafile ~/.config/nvim/init.lua<CR> :w ~/.config/nvim/init.lua<CR> :echo 'Sourced Successfully'<CR>", {noremap = true})

-- quickfix list and location list mappings
-- vim.keymap.set('n', 'co', ":copen<CR>", {noremap = true})
-- vim.keymap.set('n', 'cj', ":cnext<CR>", {noremap = true})
-- vim.keymap.set('n', 'ck', ":cprevious<CR>", {noremap = true})
-- vim.keymap.set('n', 'no', ":lopen<CR>", {noremap = true})
-- vim.keymap.set('n', 'nj', ":lnext<CR>", {noremap = true})
-- vim.keymap.set('n', 'nk', ":lprevious<CR>", {noremap = true})
vim.keymap.set('n', 'tco', ":Telescope quickfix<CR>", {noremap = true})
vim.keymap.set('n', 'tno', ":Telescope loclist<CR>", {noremap = true})

-- treesitter
vim.keymap.set('n', '<leader>ts', ':TSPlaygroundToggle<cr>', { noremap = true, silent = true })

-- trim white space
vim.keymap.set('n', 'tw', ':lua require("core.helpers").trim_white_space()<CR>', { noremap = true, silent = true })

-- codeaction menu
vim.keymap.set('n', '<leader>ca', ":CodeActionMenu", {noremap = true})

-- set keymaps from high level settings
for _, keymap in pairs(settings.keymaps) do
  vim.keymap.set(keymap[1], keymap[2], keymap[3], { noremap = true })
end
