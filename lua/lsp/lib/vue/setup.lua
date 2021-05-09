
require'lspconfig'.vuels.setup {
  cmd = {vim.fn.stdpath('data') .. "/lspinstall/vue/node_modules/.bin/vls", "--stdio"},
  on_attach=require('lsp/common').on_attach,
  root_pattern = require('lspconfig/util').root_pattern('.git')
}
