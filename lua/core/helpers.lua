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

return M
