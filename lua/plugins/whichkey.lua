require("which-key").setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specifiy a list manually
}
local wk = require("which-key")

local opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

wk.register({
  ["<leader>"] = {
    f = { -- set a nested structure
      name = '+find',
      f = {'<cmd>Telescope find_files<cr>', 'files'},
      b = {'<cmd>Telescope buffers<cr>', 'buffers'},
      h = {'<cmd>Telescope help_tags<cr>', 'help tags'},
      d = {'<cmd>lua require("plugins/telescope").dotfiles()<cr>', 'dot files'},
      l = {'<cmd>lua require("plugins/telescope").content_selector()<cr>', 'dsa'},
      a = {'<cmd>lua require("plugins/telescope").anyjump()<cr>', 'anyjump'},
      c = {
        name = '+commands',
        c = {'<cmd>Telescope commands<cr>', 'commands'},
        h = {'<cmd>Telescope command_history<cr>', 'history'},
      },
      q = {'<cmd>Telescope quickfix<cr>', 'quickfix'},
      g = {
        name = '+git',
        g = {'<cmd>Telescope git_commits<cr>', 'commits'},
        c = {'<cmd>Telescope git_bcommits<CR>', 'bcommits'},
        b = {'<cmd>Telescope git_branches<CR>', 'branches'},
        s = {'<cmd>Telescope git_status<CR>', 'status'},
      }
    },
    q = {'<cmd>lua vim.lsp.set_loclist()<cr>', 'locallist diagnostic'}
  },
  ['w'] = {
    name = '+split-movements',
    h = {"<C-w>h", 'focus left window'},
    j = {"<C-w>j", 'focus down window'},
    k = {"<C-w>k", 'focus up window'},
    l = {"<C-w>l", 'focus right window'},
  },
  ['t'] = {
    name = '+tree-sitter',
    p = {":TSPlaygroundToggle<cr>", 'toggle playground'},
    t = {":TSHighlightCapturesUnderCursor<cr>", 'type of'},
  },
  -- d = {'<Cmd>lua vim.lsp.buf.definition()<CR>', 'definition'},
  -- D = {'<Cmd>lua vim.lsp.buf.declaration()<CR>', 'declaration'},
  -- r = {'<cmd>lua vim.lsp.buf.references()<CR>', 'references'},
  -- K = {'<Cmd>lua vim.lsp.buf.hover()<CR>', 'hover'},
  -- i = {'<cmd>lua vim.lsp.buf.implementation()<CR>', 'implementation'},
  -- s = {'<cmd>lua vim.lsp.buf.signature_help()<CR>', 'signature'},
  -- wa = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'add workspace folder'},
  -- wd = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'delete workspace folder'},
  -- wl = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'list workspace folder'},
  -- td = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', 'type definition'},
  -- rn = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'rename'},
  -- ld = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 'show line diagnostics'},
  -- p = {'<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', 'prev diagnostic'},
  -- n = {'<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', 'next diagnostic'},
  -- ll = {'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', 'set local list'}
})

-- wk.register(mappings, opts)




------------------------ different which key plugin ----------------------------
-- local wk = require('whichkey_setup')
-- wk.config{
--   hide_statusline = false,
--     default_keymap_settings = {
--         silent=true,
--         noremap=true,
--     },
--     default_mode = 'n',
-- }

-- local keymap = {

--     -- w = {':w!<CR>', 'save file'}, -- set a single command and text
--     -- j = 'split args', -- only set a text for an already configured keymap
--     -- ['<CR>'] = {'@q', 'macro q'}, -- setting a special key
--     n = {':Neoformat<CR>', 'format buffer'},
--     z = {':Goyo<CR>', 'goyo toggle'},
--     s = {':luafile ~/.config/nvim/init.lua<CR>: echo "Sourced Successfully"<CR>', 'source'},
--     f = { -- set a nested structure
--         name = '+find',
--         f = {'<cmd>Telescope find_files<cr>', 'files'},
--         b = {'<cmd>Telescope buffers<cr>', 'buffers'},
--         h = {'<cmd>Telescope help_tags<cr>', 'help tags'},
--         d = {'<cmd>lua require("plugins/telescope").dotfiles()<cr>', 'dot files'},
--         l = {'<cmd>lua require("plugins/telescope").content_selector()<cr>', 'dsa'},
--         c = {
--             name = '+commands',
--             c = {'<cmd>Telescope commands<cr>', 'commands'},
--             h = {'<cmd>Telescope command_history<cr>', 'history'},
--         },
--         q = {'<cmd>Telescope quickfix<cr>', 'quickfix'},
--         g = {
--             name = '+git',
--             g = {'<cmd>Telescope git_commits<cr>', 'commits'},
--             c = {'<cmd>Telescope git_bcommits<CR>', 'bcommits'},
--             b = {'<cmd>Telescope git_branches<CR>', 'branches'},
--             s = {'<cmd>Telescope git_status<CR>', 'status'},
--         },
--     },
--     w = {
--       name = '+split-movements',
--       h = {"<C-w>h", 'focus left window'},
--       j = {"<C-w>j", 'focus down window'},
--       k = {"<C-w>k", 'focus up window'},
--       l = {"<C-w>l", 'focus right window'},
--     },
--     t = {
--       name = '+tree-sitter',
--       p = {":TSPlaygroundToggle<cr>", 'toggle playground'},
--       t = {":TSHighlightCapturesUnderCursor<cr>", 'type of'},
--     },
-- }

-- -- Local leader and visual
-- local visual_keymap = {
--   K = {":move '<-2<CR>gv=gv", 'move lines up'},
--   J = {":move '>+1<CR>gv=gv", 'move lines down'},
-- }
-- local local_keymap = {
--     r = {':!python %', 'run python'},
-- }

-- -- Map options and buffer local keymaps
-- -- local keymap = {l = {name = '+lsp'}}
-- -- if client.resolved_capabilities.document_formatting then
-- --     keymap.l.f = {"<Cmd>lua vim.lsp.buf.formatting()<CR>", 'format'}
-- -- elseif client.resolved_capabilities.document_range_formatting then
-- --     keymap.l.f = {"<Cmd>lua vim.lsp.buf.range_formatting()<CR>", 'format'}
-- -- end

-- -- Arbitrary keys
-- -- local keymap_goto = {
-- --     name = "+goto",
-- --     h = { "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", "References" },
-- --     d = { "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", "Peek Definition" },
-- --     D = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
-- --     s = { "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", "Signature Help" },
-- --     i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" }
-- --   }
-- local keymap_lsp = {
--   name = '+lsp',
--   d = {'<Cmd>lua vim.lsp.buf.definition()<CR>', 'definition'},
--   D = {'<Cmd>lua vim.lsp.buf.declaration()<CR>', 'declaration'},
--   r = {'<cmd>lua vim.lsp.buf.references()<CR>', 'references'},
--   K = {'<Cmd>lua vim.lsp.buf.hover()<CR>', 'hover'},
--   i = {'<cmd>lua vim.lsp.buf.implementation()<CR>', 'implementation'},
--   s = {'<cmd>lua vim.lsp.buf.signature_help()<CR>', 'signature'},
--   wa = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'add workspace folder'},
--   wd = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'delete workspace folder'},
--   wl = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'list workspace folder'},
--   td = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', 'type definition'},
--   rn = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'rename'},
--   ld = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 'show line diagnostics'},
--   p = {'<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', 'prev diagnostic'},
--   n = {'<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', 'next diagnostic'},
--   ll = {'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', 'set local list'}
-- }


-- -- wk.register_keymap('leader', keymap, {noremap=true, silent=true, bufnr=bufnr})
-- -- wk.register_keymap("g", keymap_goto, { noremap = true, silent = true, bufnr = bufnr })
-- wk.register_keymap("localleader", keymap_lsp, { noremap = true, silent = true, bufnr = bufnr })
-- wk.register_keymap('leader', keymap)
-- wk.register_keymap('leader', visual_keymap, {mode = 'v'})
-- wk.register_keymap('localleader', local_keymap)
--
