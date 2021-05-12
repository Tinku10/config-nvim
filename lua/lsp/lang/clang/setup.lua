-- list of names of the language servers used
-- available servers : clangd
local servers = {'clangd'}

for _, server in ipairs(servers) do
  require('lsp.lang.clang.servers.' .. server .. '.setup')
end
