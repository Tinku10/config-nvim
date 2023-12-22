local group = vim.api.nvim_create_augroup("group", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "startinsert",
  group = group,
})

vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "term://*",
  command = "stopinsert",
  group = group,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    require("keymaps").create_lsp_onattach_keymaps()
  end,
})
