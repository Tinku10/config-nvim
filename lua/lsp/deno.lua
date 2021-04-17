-- this uses builtin deno server for javascript as well as typescript
-- this server can be omitted for tsserver

vim.cmd [[ packadd completion-nvim ]]
local completion = require('completion')

require'lspconfig'.denols.setup{
    on_attach=completion.on_attach,
    cmd = { "deno", "lsp" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    handlers = {
      -- ["textDocument/definition"] = <function 1>,
      -- ["textDocument/references"] = <function 1>
    },
    init_options = {
      enable = true,
      lint = false,
      unstable = false
    },
    -- root_dir = root_pattern("package.json", "tsconfig.json", ".git")
}
