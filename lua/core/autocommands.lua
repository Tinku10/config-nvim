local helpers = require("core.helpers")

local group = vim.api.nvim_create_augroup("group", { clear = true })

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.cpp",
	callback = function()
		vim.schedule(function()
			helpers.copy_file_content_into_current_buffer("~/Desktop/codes/dsa/BaseTemplate/template.h")
		end)
	end,
	group = group,
})

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "startinsert",
	group = group,
})

vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "term://*",
  command = "stopinsert",
	group = group,
})
