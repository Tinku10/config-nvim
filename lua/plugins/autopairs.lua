local npairs = require('nvim-autopairs')

npairs.setup({
  -- defaults
-- local disable_filetype = { "TelescopePrompt" }
-- local ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", "")
-- local enable_moveright = true
-- local check_ts = false,
  disable_filetype = { "TelescopePrompt" },
})

_G.calls= {}

vim.g.completion_confirm_key = ""

calls.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      require'completion'.confirmCompletion()
      return npairs.esc("<c-y>")
    else
      vim.api.nvim_select_popupmenu_item(0, false, false, {})
      require'completion'.confirmCompletion()
      return npairs.esc("<c-n><c-y>")
    end
  else
    return npairs.autopairs_cr()
  end
end

local utils = require('settings/utils')

utils.map('i', '<CR>', 'v:lua.calls.completion_confirm()', {expr = true , noremap = true})
