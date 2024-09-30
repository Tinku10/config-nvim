vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	command = "startinsert",
	group = vim.api.nvim_create_augroup("group", { clear = true }),
})

vim.api.nvim_create_autocmd("BufLeave", {
	pattern = "term://*",
	command = "stopinsert",
	group = vim.api.nvim_create_augroup("group", { clear = true }),
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		require("keymaps").create_lsp_onattach_keymaps()
	end,
})

vim.api.nvim_create_augroup("HexMode", { clear = true })

vim.api.nvim_create_autocmd("BufReadPre", {
	group = "HexMode",
	pattern = "*.bin",
	callback = function()
		vim.bo.binary = true
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = "HexMode",
	pattern = "*.bin",
	callback = function()
		if vim.bo.binary then
			vim.cmd("%!xxd")
			vim.bo.filetype = "xxd"
		end
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = "HexMode",
	pattern = "*.bin",
	callback = function()
		if vim.bo.binary then
			vim.cmd("%!xxd -r")
		end
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = "HexMode",
	pattern = "*.bin",
	callback = function()
		if vim.bo.binary then
			vim.cmd("%!xxd")
			vim.bo.modified = false
		end
	end,
})
