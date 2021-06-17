-- html language server
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require"lspconfig".html.setup {
  cmd = { "node", vim.fn.stdpath('data') .. "/lspinstall/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js", "--stdio" },
  filetypes = {'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue'},
  root_dir = require('lspconfig/util').root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  on_attach=require('lsp/common').on_attach,
  capabilities = capabilities
}
