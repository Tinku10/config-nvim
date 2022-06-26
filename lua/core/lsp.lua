local M = {}

M.on_attach = function(client, bufnr)

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- vim.api.nvim_set_current_dir(client.config.root_dir)

  vim.fn.sign_define("DiagnosticSignError", {texthl = "DiagnosticSignError", text = "", numhl = "DiagnosticSignError"})
  vim.fn.sign_define("DiagnosticSignWarn", {texthl = "DiagnosticSignWarn", text = "", numhl = "DiagnosticSignWarn"})
  vim.fn.sign_define("DiagnosticSignHint", {texthl = "DiagnosticSignHint", text = "", numhl = "DiagnosticSignHint"})
  vim.fn.sign_define("DiagnosticSignInfo", {texthl = "DiagnosticSignInfo", text = "", numhl = "DiagnosticSignInfo"})

  -- Mappings.
  local opts = { noremap=true, silent=true, buffer=true }
  vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.keymap.set('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.keymap.set('n', '<space>wd', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.keymap.set('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.keymap.set('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.keymap.set('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.keymap.set('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.keymap.set('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  vim.keymap.set('n', '<leader>l', '<cmd>lua vim.cmd("e"..vim.lsp.get_log_path())<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.document_formatting then
    vim.keymap.set("n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.server_capabilities.document_range_formatting then
    vim.keymap.set("n", "<space>fm", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, { focusable = false }
  )

  vim.lsp.set_log_level("debug")

  vim.diagnostic.config({
    virtual_text = true,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      -- border = "rounded",
      source = "always",
      -- header = "",
      -- prefix = "",
    },
  })

end

-- vim.g.code_action_menu_show_details = false
-- vim.g.code_action_menu_show_diff = false
--
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- local servers = {'clangd', 'bashls', 'cssls', 'html', 'sumneko_lua', 'pyright', 'tsserver', 'vimls', 'tailwindcss', 'vuels'}

-- for _, server in ipairs(servers) do
-- 	require'lspconfig'[server].setup {
-- 		on_attach = on_attach,
-- 		capabilities = capabilities
-- 	}
-- end

return M
