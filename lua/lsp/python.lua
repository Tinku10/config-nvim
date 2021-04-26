-- uses pyright server for python

require'lspconfig'.pyright.setup{
  on_attach=require('lsp/common').on_attach,
}
