local mappings = require('settings/mappings')

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
mappings.map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
mappings.map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
