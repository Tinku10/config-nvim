local wk = require('whichkey_setup')

wk.config{
  hide_statusline = false,
    default_keymap_settings = {
        silent=true,
        noremap=true,
    },
    default_mode = 'n',
}

local keymap = {

    -- w = {':w!<CR>', 'save file'}, -- set a single command and text
    -- j = 'split args', -- only set a text for an already configured keymap
    -- ['<CR>'] = {'@q', 'macro q'}, -- setting a special key
    n = {':Neoformat<CR>', 'format buffer'},
    z = {':Goyo<CR>', 'goyo toggle'},
    f = { -- set a nested structure
        name = '+find',
        f = {'<cmd>Telescope find_files<cr>', 'files'},
        b = {'<cmd>Telescope buffers<cr>', 'buffers'},
        h = {'<cmd>Telescope help_tags<cr>', 'help tags'},
        d = {'<cmd>lua require("plugins/telescope").dotfiles()<cr>', 'dot files'},
        l = {'<cmd>lua require("plugins/telescope").content_selector()<cr>', 'dsa'},
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
        },
    },
    w = {
      name = '+split-movements',
      h = {"<C-w>h", 'focus left window'},
      j = {"<C-w>j", 'focus down window'},
      k = {"<C-w>k", 'focus up window'},
      l = {"<C-w>l", 'focus right window'},
    },
    t = {
      name = '+tree-sitter',
      p = {":TSPlaygroundToggle<cr>", 'toggle playground'},
      t = {":TSHighlightCapturesUnderCursor<cr>", 'type of'},
    }
}

-- Local leader and visual
local visual_keymap = {
  K = {":move '<-2<CR>gv=gv", 'move lines up'},
  J = {":move '>+1<CR>gv=gv", 'move lines down'},
}
local local_keymap = {
    r = {':!python %', 'run python'},
}

-- Map options and buffer local keymaps
-- local keymap = {l = {name = '+lsp'}}
-- if client.resolved_capabilities.document_formatting then
--     keymap.l.f = {"<Cmd>lua vim.lsp.buf.formatting()<CR>", 'format'}
-- elseif client.resolved_capabilities.document_range_formatting then
--     keymap.l.f = {"<Cmd>lua vim.lsp.buf.range_formatting()<CR>", 'format'}
-- end

-- Arbitrary keys
-- local keymap_goto = {
--     name = "+goto",
--     h = { "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", "References" },
--     d = { "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", "Peek Definition" },
--     D = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
--     s = { "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", "Signature Help" },
--     i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" }
--   }


-- wk.register_keymap('leader', keymap, {noremap=true, silent=true, bufnr=bufnr})
-- wk.register_keymap("g", keymap_goto, { noremap = true, silent = true, bufnr = bufnr })
wk.register_keymap('leader', keymap)
wk.register_keymap('leader', visual_keymap, {mode = 'v'})
wk.register_keymap('localleader', local_keymap)
