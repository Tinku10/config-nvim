local utils = require('settings/utils')

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
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    -- file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
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
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    },
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

require('telescope').load_extension('fzy_native')

utils.map("n", '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true, silent = true})
utils.map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
utils.map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})
utils.map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {noremap = true})



dotfiles = function()
  require('telescope.builtin').find_files({
      prompt_title = "Neovim Configs",
      cwd = "~/.config/nvim/"
  })
end

utils.map("n", '<leader>go', '<cmd> lua dotfiles()<cr>', {noremap = true})
utils.map('n', '<leader>ps', ':lua require("telescope.builtin").grep_string({search = vim.fn.input("Grep for > ")})<cr>', {noremap = true})

