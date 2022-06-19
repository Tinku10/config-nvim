-- helper function to be used in several modules

local M = {}

M.trim_white_space = function()
	local current_view = vim.fn.winsaveview()
  vim.cmd[[%s/\s\+$//e]]
  vim.cmd("nohl")
	vim.fn.winrestview(current_view)
end

M.copy_file_content_into_current_buffer = function(path)
  local content = vim.fn.systemlist('cat ' .. path)
  vim.api.nvim_buf_set_lines(0, 0, 0, false, content)
end

M.upper_bound = function(table, x)
  local l = 1
  local r = #table

  local ans = nil

  while l <= r do
    local m = l + math.floor((r - l) / 2)
    if table[m]["lnum"] > x then
      r = m - 1
      ans = table[m]["lnum"]
    else
      l = m + 1
    end
  end

  return ans
end

return M
