settings = require('core.user')

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    -- prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.90,
      preview_cutoff = 120,
      preview_width = 0.55
    },
    -- file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_ignore_patterns = {'node_modules', '.git', 'undodir'},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {
      "shorten"
    },
    -- shorten_path = true,
    winblend = 1,
    -- width = 0.75,
    -- preview_cutoff = 120,
    -- results_height = 1,
    -- results_width = 0.8,
    border = {},
    -- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    utils = {
      i = {
        -- ["<leader>s"] = actions.send_to_qflist
      }
    },

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
  extensions = {
    -- media_files = {
    --   -- filetypes whitelist
    --   -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
    --   filetypes = {"png", "webp", "jpg", "jpeg"},
    --   find_cmd = "rg" -- find command (defaults to `fd`)
    -- },
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

require('telescope').load_extension('fzy_native')
-- require('telescope').load_extension('media_files')

vim.api.nvim_set_keymap("n", '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })

----------------------------- custom functions ----------------------------------

local M = {  }

-- list all the neovim config files in a telescope buffer
M.dotfiles = function()
  require('telescope.builtin').find_files({
      prompt_title = "Neovim Configs",
      cwd = vim.fn.stdpath('config')
  })
end

M.anyjump = function()
  local dir = vim.fn.input("Folder Path > ")
  if dir == '' then
    dir = vim.fn.stdpath('config')
  end
  require('telescope.builtin').find_files({
      prompt_title = "Files",
      cwd = dir
  })
end

local function get_file_contents(path_to_file, buff, line)
  -- Path comes from plenary.path
  local content = vim.fn.systemlist('cat ' .. require('plenary/path'):new(path_to_file):absolute())
  vim.api.nvim_buf_set_lines(buff, line[1], line[1], false, content)
end

local function select_file(prompt_bufnr, map, buff, line)
  local function choices(close)
    local content = require('telescope.actions.state').get_selected_entry(prompt_bufnr)
    get_file_contents(content.cwd .. "/" .. content.value, buff, line)
    if close then
      require('telescope.actions').close(prompt_bufnr)
    end
  end

  map('i', '<CR>', function()
    choices(true)
  end)
  map('n', '<CR>', function()
    choices(true)
  end)
end

local function listing(prompt, cwd, buff, line)
  require("telescope.builtin").find_files({
    prompt_title = prompt,
    cwd = cwd,
    attach_mappings = function(prompt_bufnr, map)
      select_file(prompt_bufnr, map, buff, line)
      return true
    end
  })
end

-- list all the files in a telescope buffer and copies the content of the file
-- selected into the currsor cursor position
M.content_selector = function(path)
  listing("DSA", settings.paths.dsa, vim.api.nvim_get_current_buf(),  vim.api.nvim_win_get_cursor(0))
end

return M
