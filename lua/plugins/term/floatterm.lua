vim.cmd [[ packadd FTerm.nvim ]]

-- local utils = require('settings/utils')

require'FTerm'.setup({
    dimensions  = {
        height = 0.8,
        width = 0.8,
        row = 0.5,
        col = 0.5
    },
    border = 'single' -- or 'double'
})

-- Keybinding
local opts = { noremap = true, silent = true }

-- Closer to the metal
vim.api.nvim_set_keymap('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
vim.api.nvim_set_keymap('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
vim.g.floaterm_keymap_next   = '<A-j>'
vim.g.floaterm_keymap_prev   = '<A-k>'
vim.g.floaterm_keymap_new    = '<A-n>'
vim.g.floaterm_title=''

vim.g.floaterm_gitcommit='floaterm'
-- vim.g.floaterm_shell=O.shell
vim.g.floaterm_autoinsert=1
-- vim.g.floaterm_width=0.8
-- vim.g.floaterm_height=0.8
-- vim.g.floaterm_wintitle=0
-- vim.g.floaterm_autoclose=1

local floatterm = { }

local term = require("FTerm.terminal")

local lazygit = term:new():setup({
    cmd = "lazygit",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

 -- Use this to toggle gitui in a floating terminal
floatterm.lazygit = function()
    lazygit:toggle()
end

return floatterm
