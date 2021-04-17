-- uses pyright server for python

vim.cmd [[ packadd completion-nvim ]]
local completion = require('completion')

require'lspconfig'.pyright.setup{
    on_attach=completion.on_attach,
}
