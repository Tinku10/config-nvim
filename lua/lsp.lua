local servers = {
	clangd = {},
	gopls = {},
	pyright = {},
	rust_analyzer = {},
	lua_ls = {
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        diagnostics = { disable = { "missing-fields" } },
      }
    }
	}
}

for server, config in pairs(servers) do
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end
