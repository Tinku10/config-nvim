-- uses tailwindcss intellisense

local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Check if it's already defined for when reloading this file.
if not lspconfig.tailwindls then
  configs.tailwindls = {
    default_config = {
      -- -- cmd = { "node", vim.fn.stdpath('data') .. "/lspinstall/tailwindcss/tailwindcss-intellisense/extension/dist/server/index.js", "--stdio" };
      -- filetypes = {'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue'};
      -- root_dir = function(fname)
      --   return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
      -- end;
      -- settings = {};
    }
  }
end

require"lspconfig".tailwindls.setup {
  cmd = { "node", vim.fn.stdpath('data') .. "/lspinstall/tailwindcss/tailwindcss-intellisense/extension/dist/server/tailwindServer.js", "--stdio" },
  filetypes = {'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue'},
  root_dir = require('lspconfig/util').root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  handlers = {
    ["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
      -- tailwindcss lang server waits for this repsonse before providing hover
      vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", {_id = params._id})
    end
  },
  -- settings = {
  --   tailwindCSS = {
  --     experimental = {
  --       classRegex = {
  --         "tw`([^`]*)", -- tw`...`
  --         "tw=\"([^\"]*)", -- <div tw="..." />
  --         "tw={\"([^\"}]*)", -- <div tw={"..."} />
  --         "tw\\.\\w+`([^`]*)", -- tw.xxx`...`
  --         "tw\\(.*?\\)`([^`]*)"
  --       }
  --     }
  --   }
  -- },
  on_attach=require('lsp/common').on_attach,
  capabilities = capabilities
}
