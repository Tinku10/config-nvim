-- vim language server

require'lspconfig'.vimls.setup {
  cmd = {vim.fn.stdpath('data') .. "/lspinstall/vimls/bin/index.js", "--stdio"},
  on_attach=require('lsp/common').on_attach,
}
  -- cmd = { "vim-language-server", "--stdio" },
  -- filetypes = { "vim" },
  -- init_options = {
  --   diagnostic = {
  --     enable = true
  --   },
  --   indexes = {
  --     count = 3,
  --     gap = 100,
  --     projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
  --     runtimepath = true
  --   },
  --   iskeyword = "@,48-57,_,192-255,-#",
  --   runtimepath = "",
  --   suggest = {
  --     fromRuntimepath = true,
  --     fromVimruntime = true
  --   },
  --   vimruntime = ""
  -- },
  -- root_dir = function(fname)
  --   return util.find_git_ancestor(fname) or vim.fn.getcwd()
  -- end,
-- }
