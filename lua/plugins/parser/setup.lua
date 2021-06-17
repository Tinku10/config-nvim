require 'nvim-treesitter.configs'.setup{
  ensure_installed = 'maintained',
  highlight = {enable = true},
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
  refactor = {
    highlight_definitions = { enable = false },
    highlight_current_scope = { enable = false },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "<leader>tr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  -- indent = {
  --   enable = true
  -- },
  context_commentstring = {
    enable = true,
    -- enable_autocmd = false,
    -- config = {
    --   javascript = {
    --     __default = '// %s',
    --     jsx_element = '{/* %s */}',
    --     jsx_fragment = '{/* %s */}',
    --     jsx_attribute = '// %s',
    --     comment = '// %s'
    --   }
    -- }
  }
}

-------------------------------- Mappings ---------------------------------------

-- local utils = require('settings/utils')

vim.api.nvim_set_keymap('n', '<leader>ts', ':TSPlaygroundToggle<cr>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>lua require("ts_context_commentstring.internal").update_commentstring()<cr>', { noremap = true, silent = true })

-- R: Refreshes the playground view when focused or reloads the query when the query editor is focused.
-- o: Toggles the query editor when the playground is focused.
-- a: Toggles visibility of anonymous nodes.
-- i: Toggles visibility of highlight groups.
-- I: Toggles visibility of the language the node belongs to.
-- t: Toggles visibility of injected languages.
-- f: Focuses the language tree under the cursor in the playground. The query editor will now be using the focused language.
-- F: Unfocuses the currently focused language.
-- <cr>: Go to current node in code buffer
