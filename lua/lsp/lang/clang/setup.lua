-- clangd server

require'lspconfig'.clangd.setup {
    on_attach=require('lsp/common').on_attach
}
