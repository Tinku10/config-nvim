local lsp = require('feline.providers.lsp')

local colors = require("colors").colors

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

-- properties.force_inactive.bufnames = {
--     'some_buffer_name'
-- }

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
  local mode = vim.fn.mode()
  return "  " .. modes[mode] .. "  ";
end

-- Initialize the components table
local components = {
  active = {},
  inactive = {}
}

-- Insert three sections (left, mid and right) for the active statusline
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

-- Insert a component that will be on the left side of the statusline
-- when the window is active:
table.insert(components.active[1], {
  provider = function()
    return modes[vim.fn.mode()]
  end,
  hl = function()
      local val = {}
      val.fg = mode_color[vim.fn.mode()]
      val.bg = colors['bg']
      val.style = 'bold'

      return val
  end,
  right_sep = {
    str = ' ',
    hl = {
      fg = colors['bg'],
      bg = colors['bg']
    }
  },
  left_sep = {
    str = ' ',
    hl = {
      fg = colors['bg'],
      bg = colors['bg']
    }
  }
  -- hl = {
  --   name = require('feline.providers.vi_mode').get_mode_highlight_name(),
  --   fg = mode_color[require('feline.providers.vi_mode').get_mode_highlight_name()],
  --   style = 'bold'
  -- }
})

table.insert(components.active[1], {
  provider = {
    name = 'file_info',
    opts = {
        type = 'unique',
        file_modified_icon = 'M'
    }
  },
  hl = {
    -- name = colors['yellow'],
    fg = colors['yellow'],
    bg = colors['bg'],
    style = 'bold'
  },
  icon = ''
})
-- Insert a component that will be on the middle of the statusline
-- when the window is active:
-- table.insert(components.mid.active, {
--     -- Component info here
-- })

-- Insert a component that will be on the right side of the statusline
-- when the window is active:
table.insert(components.active[3], {
  -- Component info here
  provider = 'git_branch',
  icon = ' ',
  hl = {
    fg = colors['green'],
    bg = colors['bg'],
    style = 'bold'
  },
  right_sep = {
    str = ' ',
    hl = {
      fg = colors['bg'],
      bg = colors['bg']
    }
  },
  left_sep = {
    str = ' ',
    hl = {
      fg = colors['bg'],
      bg = colors['bg']
    }
  }
})

table.insert(components.active[3], {
  -- Component info here
  provider = 'file_type',
  hl = {
    fg = colors['lightblue'],
    bg = colors['bg'],
    -- style = 'bold'
  },
  right_sep = {
    str = ' ',
    hl = {
      fg = colors['bg'],
      bg = colors['bg']
    }
  },
  left_sep = {
    str = ' ',
    hl = {
      fg = colors['bg'],
      bg = colors['bg']
    }
  }
})

-- table.insert(components.active[3], {
--     -- Component info here
--     provider = 'file_encoding',
--     hl = {
--       fg = colors['blue'],
--       bg = colors['bg'],
--       -- style = 'bold'
--     },
--     left_sep = '  ',
--     right_sep = '  '
-- })

-- table.insert(components.active[3], {
--   provider = 'git_diff_added',
--   hl = {
--     fg = colors['green'],
--     bg = colors['bg']
--   }
-- })

-- table.insert(components.active[3], {
--   provider = 'git_diff_changed',
--   hl = {
--     fg = colors['yellow'],
--     bg = colors['bg']
--   }
-- })

-- table.insert(components.active[3], {
--   provider = 'git_diff_removed',
--   hl = {
--     fg = colors['orange'],
--     bg = colors['bg']
--   }
-- })

-- table.insert(components.active[3], {
--   provider = 'diagnostic_errors',
--   icon = ' ',
--   hl = {
--     fg = colors['orange'],
--     bg = colors['bg']
--   },
--   right_sep = {
--     str = ' ',
--     hl = {
--       fg = colors['bg'],
--       bg = colors['bg']
--     }
--   },
--   left_sep = {
--     str = ' ',
--     hl = {
--       fg = colors['bg'],
--       bg = colors['bg']
--     }
--   }
-- })

-- table.insert(components.active[3], {
--   provider = 'diagnostic_warnings',
--   icon = ' ',
--   hl = {
--     fg = colors['yellow'],
--     bg = colors['bg']
--   },
--   right_sep = {
--     str = ' ',
--     hl = {
--       fg = colors['bg'],
--       bg = colors['bg']
--     }
--   },
--   left_sep = {
--     str = ' ',
--     hl = {
--       fg = colors['bg'],
--       bg = colors['bg']
--     }
--   }
-- })

-- table.insert(components.active[3], {
--   provider = 'diagnostic_hints',
--   icon = ' ',
--   hl = {
--     fg = colors['lightblue'],
--     bg = colors['bg']
--   },
--   right_sep = {
--     str = ' ',
--     hl = {
--       fg = colors['bg'],
--       bg = colors['bg']
--     }
--   },
--   left_sep = {
--     str = ' ',
--     hl = {
--       fg = colors['bg'],
--       bg = colors['bg']
--     }
--   }
-- })


-- table.insert(components.active[3], {
--   provider = 'position',
--   hl = {
--     fg = colors['green'],
--     bg = colors['bg']
--   },
--   left_sep = '  ',
--   right_sep = '  '
-- })

require('feline').setup ({
  colors = colors,
  vi_mode_colors = mode_color,
  components = components,
  properties = properties
})
