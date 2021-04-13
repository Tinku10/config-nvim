vim.cmd [[ packadd completion-nvim ]]
local lspconfig = require "lspconfig"

DATA_PATH = vim.fn.stdpath('data')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- function to attach completion when setting up lsp
local on_attach = function(client)
      require'completion'.on_attach(client)
  -- print("'" .. client.name .. "' server attached")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = DATA_PATH .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

lspconfig.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        -- Setup your lua path
        path = vim.split(package.path, ';')
      },
      diagnostics = {enable = true, globals = {"vim", "use", "lua"}},
      workspace = {
        library = {[vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true}
      }
    }
  }
}
