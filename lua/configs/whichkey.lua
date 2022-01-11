vim.cmd [[ packadd which-key.nvim ]]

settings = require("user-settings")

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
    border = settings.ui.border, -- none, single, double, shadow
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
      d = {'<cmd>lua require("configs.telescope").dotfiles()<cr>', 'dot files'},
      l = {'<cmd>lua require("configs.telescope").content_selector(settings.paths.dsa)<cr>', 'dsa'},
      a = {'<cmd>lua require("configs.telescope").anyjump()<cr>', 'anyjump'},
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
    q = {'<cmd>lua vim.lsp.set_loclist()<cr>', 'locallist diagnostic'},
    n = {':Neoformat<cr>', 'format buffer'},
    ['w'] = {
      name = '+workspace',
      a = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'add workspace folder'},
      d = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'delete workspace folder'},
      l = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'list workspace folder'},
    },
    t = {
      name = '+treesitter | +typedef',
      d = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', 'typedef'}
    },
    r = {
      name = '+rename',
      n = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'rename'}
    },
    c = {
      name = '+codeaction',
      a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', 'codeaction'}
    },
    e = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 'show line diagnostics'},
    ['x'] = {
      name = '+lsptrouble',
      x = {'<cmd>TroubleToggle<cr>', 'toggle trouble'},
      l = {'<cmd>TroubleToggle loclist<cr>', 'toggle location list'},
      q = {'<cmd>TroubleToggle quickfix<cr>', 'toggle quickfix list'},
      w = {'<cmd>TroubleToggle lsp_workspace_diagnostics<cr>', 'toggle ws diagnostics'},
      d = {'<cmd>TroubleToggle lsp_document_diagnostics<cr>', 'toggle doc diagnostics'},
    },
    ['s'] = {
      name = '+session',
      s = {':<C-u>SessionSave<CR>', 'save'},
      l = {':<C-u>SessionLoad<CR>', 'load'},
    },
    z = {':ZenMode<cr>', 'toggle zenmode'},
    g = {
      name = '+git',
      g = {':Neogit<cr>', 'neogit panel'}
    }
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
  ['g'] = {
    name = '+goto',
    d = {'<Cmd>lua vim.lsp.buf.definition()<CR>', 'definition'},
    D = {'<Cmd>lua vim.lsp.buf.declaration()<CR>', 'declaration'},
    r = {'<cmd>lua vim.lsp.buf.references()<CR>', 'references'},
    I = {'<cmd>lua vim.lsp.buf.implementation()<CR>', 'implementation'},
  },
  ['K'] = {'<Cmd>lua vim.lsp.buf.hover()<CR>', 'hover'},
  -- s = {'<cmd>lua vim.lsp.buf.signature_help()<CR>', 'signature'},
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- p = {'<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', 'prev diagnostic'},
  -- n = {'<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', 'next diagnostic'},
  -- ll = {'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', 'set local list'}
})
