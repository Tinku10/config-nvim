-- uses tailwindcss intellisense
--
-- Check if tailwindls server already defined.
if not require('lspconfig').tailwindls then require('lspconfig/configs')['tailwindls'] = {default_config = {}} end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require"lspconfig".tailwindls.setup {
    cmd = { "node", vim.fn.stdpath('data') .. "/lspinstall/tailwindcss/tailwindcss-intellisense/extension/dist/server/index.js", "--stdio" },
    filetypes = {'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'},
    root_dir = require('lspconfig/util').root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    -- handlers = {
    --     ["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
    --         -- tailwindcss lang server waits for this repsonse before providing hover
    --         vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", {_id = params._id})
    --     end
    -- },
  on_attach=require('lsp/common').on_attach,
  capabilities = capabilities
}
