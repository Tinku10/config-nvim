-- clangd server

-- vim.cmd [[ packadd completion-nvim ]]
-- local completion = require('completion')

require'lspconfig'.clangd.setup {
    -- on_attach=completion.on_attach
    on_attach=require('lsp/common').on_attach
}
