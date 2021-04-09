local mappings = {  }

function mappings.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

mappings.map('i', 'jj', '<Esc>')

return mappings 
-- General purpose mappings (provide a third parameter as true to impose noremap)
