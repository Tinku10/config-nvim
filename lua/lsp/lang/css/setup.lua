local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup {
  cmd = { "node", vim.fn.stdpath('data') .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js", "--stdio" },
  filetypes = {'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'},
  on_attach=require('lsp/common').on_attach,
  capabilities = capabilities,
}
