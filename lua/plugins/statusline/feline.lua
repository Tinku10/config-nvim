local lsp = require('feline.providers.lsp')

local colors = {
  bg = "#3c3836",
  fg = "#81A1C1",
  line_bg = "#3c3836",
  lbg = "#3c3836",
  fg_green = "#8FBCBB",
  yellow = "#fabd2f",
  cyan = "#A3BE8C",
  darkblue = "#81A1C1",
  green = "#689d6a",
  orange = "#fe8019",
  purple = "#d3869b",
  magenta = "#BF616A",
  gray = "#616E88",
  blue = "#83a598",
  red = "#cc241d",
  white = "#d5a4c1",
  black = "#282828"
}

-- colors for different vim modes
local mode_color = {
  n = colors.green,
  i = colors.yellow,
  v = colors.white,
  [''] = colors.white,
  [''] = colors.white,
  V = colors.white,
  c = colors.orange,
  no = colors.magenta,
  s = colors.orange,
  S = colors.orange,
  -- [""] = colors.orange,
  ic = colors.yellow,
  R = colors.purple,
  Rv = colors.purple,
  cv = colors.orange,
  ce = colors.orange,
  r = colors.cyan,
  rm = colors.cyan,
  ['r?'] = colors.cyan,
  ['!'] = colors.cyan,
  t = colors.cyan
}

local modes = {
   ['__'] = '------',
   ['c']  = 'COMMAND',
   ['i']  = 'INSERT',
   ['ic'] = 'INSERT COMPL',
   ['ix'] = 'INSERT COMPL',
   ['multi'] = 'MULTI',
   ['n']  = 'NORMAL',
   ['ni'] = '(INSERT)',
   ['no'] = 'OP PENDING',
   ['R']  = 'REPLACE',
   ['Rv'] = 'V REPLACE',
   ['s']  = 'SELECT',
   ['S']  = 'S-LINE',
   [''] = 'S-BLOCK',
   ['t']  = 'TERMINAL',
   ['v']  = 'VISUAL',
   ['V']  = 'V-LINE',
   [''] = 'V-BLOCK',
}

-- Initialize the properties table
local properties = {
    force_inactive = {
        filetypes = {},
        buftypes = {},
        bufnames = {}
    }
}

properties.force_inactive.filetypes = {
    'NvimTree',
    'dbui',
    'packer',
    'startify',
    'fugitive',
    'fugitiveblame'
}

properties.force_inactive.buftypes = {
    'terminal'
}

properties.force_inactive.bufnames = {
    'some_buffer_name'
}

local buffer_not_empty = function()
  if fn.empty(fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

local checkwidth = function()
  local squeeze_width = fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

local whichmode = function()
  local mode = fn.mode()
  return "  " .. modes[mode] .. "  ";
end

-- Initialize the components table
local components = {
  left = {active = {}, inactive = {}},
  mid = {active = {}, inactive = {}},
  right = {active = {}, inactive = {}}
}
-- Insert a component that will be on the left side of the statusline
-- when the window is active:
table.insert(components.left.active, {
  provider = function()
    return modes[vim.fn.mode()]
  end,
  hl = function()
    local val = {}
    val.fg = mode_color[vim.fn.mode()]
    val.style = 'bold'

    return val
  end,
  right_sep = '  ',
  left_sep = '  '
  -- hl = {
  --   name = require('feline.providers.vi_mode').get_mode_highlight_name(),
  --   fg = mode_color[require('feline.providers.vi_mode').get_mode_highlight_name()],
  --   style = 'bold'
  -- }
})

table.insert(components.left.active, {
  provider = 'file_info',
  hl = {
    -- name = colors['yellow'],
    fg = colors['yellow'],
    bg = colors['line_bg'],
    style = 'bold'
  }
})
-- Insert a component that will be on the middle of the statusline
-- when the window is active:
-- table.insert(components.mid.active, {
--     -- Component info here
-- })

-- Insert a component that will be on the right side of the statusline
-- when the window is active:
table.insert(components.right.active, {
    -- Component info here
    provider = 'git_branch',
    icon = '',
    hl = {
      fg = colors['green'],
      bg = colors['line_bg'],
      style = 'bold'
    }
})

table.insert(components.right.active, {
    -- Component info here
    provider = 'file_type',
    hl = {
      fg = colors['blue'],
      bg = colors['line_bg'],
      -- style = 'bold'
    },
    left_sep = '  ',
    right_sep = '  '
})

table.insert(components.right.active, {
    -- Component info here
    provider = 'file_encoding',
    hl = {
      fg = colors['blue'],
      bg = colors['line_bg'],
      -- style = 'bold'
    },
    left_sep = '  ',
    right_sep = '  '
})

table.insert(components.right.active, {
  provider = 'git_diff_added',
  hl = {
    fg = colors['green'],
    bg = colors['line_bg']
  }
})

table.insert(components.right.active, {
  provider = 'git_diff_changed',
  hl = {
    fg = colors['yellow'],
    bg = colors['line_bg']
  }
})

table.insert(components.right.active, {
  provider = 'git_diff_removed',
  hl = {
    fg = colors['orange'],
    bg = colors['line_bg']
  }
})

table.insert(components.right.active, {
  provider = function()
    return ' ' ..  lsp.get_diagnostics_count('Error')
  end,
  enabled = function() return lsp.diagnostics_exist('Error') end,
  hl = {
    fg = colors['orange'],
    bg = colors['line_bg']
  },
  left_sep = ' ',
  right_sep = ' '
})

table.insert(components.right.active, {
  provider = function()
    return ' ' ..  lsp.get_diagnostics_count('Warning')
  end,
  enabled = function() return lsp.diagnostics_exist('Warning') end,
  hl = {
    fg = colors['yellow'],
    bg = colors['line_bg']
  },
  left_sep = ' ',
  right_sep = ' '
})

table.insert(components.right.active, {
  provider = function()
    return ' ' ..  lsp.get_diagnostics_count('Hint')
  end,
  enabled = function() return lsp.diagnostics_exist('Hint') end,
  hl = {
    fg = colors['blue'],
    bg = colors['line_bg']
  },
  left_sep = ' ',
  right_sep = ' '
})


table.insert(components.right.active, {
  provider = 'position',
  hl = {
    fg = colors['green'],
    bg = colors['line_bg']
  },
  left_sep = '  ',
  right_sep = '  '
})
-- Insert a component that will be on the left side of the statusline
-- when the window is inactive:
-- table.insert(components.left.inactive, {
--     -- Component info here
-- })

--- Insert a component that will be on the middle of the statusline
-- when the window is inactive:
-- table.insert(components.mid.inactive, {
--     -- Component info here
-- })

-- Insert a component that will be on the right side of the statusline
-- when the window is inactive:
-- table.insert(components.right.inactive, {
--     -- Component info here
-- })

require('feline').setup ({
  colors = colors,
  vi_mode_colors = mode_color,
  components = components,
  properties = properties
})
