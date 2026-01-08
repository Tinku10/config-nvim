local M = {}

function split(s, pattern)
  local parts = {}

  for part in string.gmatch(s, "([^" .. "/" .. "]+)") do
    table.insert(parts, part)
  end

  return parts
end

M.create_default_keymaps = (function()
  -- most important mapping
  vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
  -- vim.keymap.set("i", "<leader>i", "<Esc>", { noremap = true, silent = true })

  -- move selected text up and down
  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
  vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

  -- go to normal mode in terminal buffer
  vim.keymap.set("t", "jj", "<C-\\><C-N>", { noremap = true })
  -- vim.keymap.set("t", "<leader>i", "<C-\\><C-N>", { noremap = true })

  -- move between windows (splits)
  vim.keymap.set("n", "wl", "<C-w>l", { noremap = true })
  vim.keymap.set("n", "wj", "<C-w>j", { noremap = true })
  vim.keymap.set("n", "wk", "<C-w>k", { noremap = true })
  vim.keymap.set("n", "wh", "<C-w>h", { noremap = true })

  -- resize windows width
  vim.keymap.set("n", "<C-,>", ":vert resize -10<CR>", { noremap = true, desc = "Narrow Window" })
  vim.keymap.set("n", "<C-.>", ":vert resize +10<CR>", { noremap = true, desc = "Widen Window" })

  -- maximize the current window
  vim.keymap.set("n", "wf", ":vert resize<CR> :resize<CR>", { noremap = true, desc = "Maximize the window" })
  -- vim.keymap.set("n", "<C-v>", ":resize -10<CR>", { noremap = true, desc = "Narrow Window" })
  -- vim.keymap.set("n", "<C-k>", ":resize +10<CR>", { noremap = true, desc = "Widen Window" })

  vim.keymap.set("n", "<leader>dw", "<Cmd>%s/\\s\\+$//<CR>", { noremap = true, desc = "Remove trailing whitespace" })

  vim.keymap.set('n', '<leader>h', vim.cmd.UndotreeToggle)

  -- quickfix list and location list mappings
  -- vim.keymap.set('n', 'co', ":copen<CR>", {noremap = true})
  -- vim.keymap.set('n', 'cj', ":cnext<CR>", {noremap = true})
  -- vim.keymap.set('n', 'ck', ":cprevious<CR>", {noremap = true})
  -- vim.keymap.set('n', 'no', ":lopen<CR>", {noremap = true})
  -- vim.keymap.set('n', 'nj', ":lnext<CR>", {noremap = true})
  -- vim.keymap.set('n', 'nk', ":lprevious<CR>", {noremap = true})
  -- trim white space
  -- vim.keymap.set('n', 'tw', ':lua require("core.helpers").trim_white_space()<CR>', { noremap = true, silent = true })

  -- execute the command under cursor on shell and paste the stdout
  vim.keymap.set("n", "<leader>se",
    -- type !! in normal mode is equivalent to :.!
    function()
      local user_input = vim.fn.input("Shell Command: ")
      local shell = os.getenv("SHELL")
      if shell == nil then
        return
      end

      if user_input ~= nil then
        vim.api.nvim_command(".!" .. user_input)
      end
    end,
    { noremap = true, desc = "Paste shell output at the current cursor position" }
  )

  vim.keymap.set("n", "<leader>sc",
    function()
      local user_input = vim.fn.input("Shell Command: ")
      vim.print(user_input)
      if user_input ~= nil then
        vim.api.nvim_command("!" .. user_input)
      end
    end,
    { noremap = true, desc = "Execute any non-prompting shell command" }
  )

  vim.keymap.set("n", "q", ":q<CR>")
  vim.keymap.set("n", "<leader>t", function()
    vim.cmd.vnew()
    vim.cmd.terminal()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 10)
    -- vim.api.nvim_command("sp | wincmd j | resize 10 | term")
    -- vim.api.nvim_command("sp <CR> <C-w>j <CR> resize 10 <CR> term <CR> i")
  end)
end)()

M.create_lsp_keymaps = function()
  -- lsp keymaps
  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
  vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
end

M.create_lsp_onattach_keymaps = function()
  vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>",
    { noremap = true, silent = true, buffer = true, desc = "Go to Declaration" })
  vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>",
    { noremap = true, silent = true, buffer = true, desc = "Go to Definition" })
  vim.keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>",
    { noremap = true, silent = true, buffer = true, desc = "Quick Hover" })
  vim.keymap.set("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>",
    { noremap = true, silent = true, buffer = true, desc = "Go to Implementation" })
  vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>",
    { noremap = true, silent = true, buffer = true, desc = "LSP" })
  vim.keymap.set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
    { noremap = true, silent = true, buffer = true, desc = "Add folder to Workspace" })
  vim.keymap.set("n", "<space>wd", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
    { noremap = true, silent = true, buffer = true, desc = "Remove folder from Workspace" })
  vim.keymap.set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    { noremap = true, silent = true, buffer = true, desc = "List Workspace folders" })
  vim.keymap.set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>",
    { noremap = true, silent = true, buffer = true, desc = "LSP" })
  vim.keymap.set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>",
    { noremap = true, silent = true, buffer = true, desc = "Rename Symbol" })
  vim.keymap.set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>",
    { noremap = true, silent = true, buffer = true, desc = "Code Action" })
  vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>",
    { noremap = true, silent = true, buffer = true, desc = "LSP" })
  vim.keymap.set("n", "<leader>l", '<cmd>lua vim.cmd("e"..vim.lsp.get_log_path())<CR>',
    { noremap = true, silent = true, buffer = true, desc = "Get LSP log path" })
  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format({ async = true })
  end, { noremap = true, silent = true, buffer = true, desc = "Format with LSP" })
end

M.create_telescope_keymaps = function()
  -- custom telescope commands
  -- vim.keymap.set("n", '<leader>fd', '<cmd> lua require("configs.telescope").dotfiles()<cr>', {noremap = true, desc = "list dotfiles"})
  -- vim.keymap.set("n", '<leader>fa', '<cmd> lua require("configs.telescope").anyjump()<cr>', {noremap = true, desc = "anyjump"})
  vim.keymap.set(
    "n",
    "<leader>ps",
    ':lua require("telescope.builtin").grep_string({search = vim.fn.input("Grep for > ")})<cr>',
    { noremap = true }
  )
  -- vim.keymap.set("n", '<leader>fl', '<cmd> lua require("configs.telescope").content_selector(settings.paths.dsa)<cr>', {noremap = true})
  vim.keymap.set("n", "tco", ":Telescope quickfix<CR>", { noremap = true })
  vim.keymap.set("n", "tno", ":Telescope loclist<CR>", { noremap = true })
  vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search Git Files" })
  vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Search Files" })
  vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "Search Help" })
  vim.keymap.set("n", "<leader>gs", require("telescope.builtin").grep_string, { desc = "Grep String" })
  vim.keymap.set("n", "<leader>lg", require("telescope.builtin").live_grep, { desc = "Live Grep" })
  vim.keymap.set("n", "<leader>ch", require("telescope.builtin").command_history, { desc = "Command History" })
end

M.create_nvimtree_keymaps = function()
  -- nvim tree
  vim.keymap.set("n", "<F3>", ":NvimTreeToggle<cr>", { noremap = true, silent = true, desc = "Tree Toggle" })
  vim.keymap.set("n", "<leader>v", ":NvimTreeFindFileToggle<cr>",
    { noremap = true, silent = true, desc = "File tree toggle" })
  vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<cr>", { noremap = true, silent = true })
end

M.create_neoformat_keymaps = function()
  -- format buffer using Neoformat
  vim.keymap.set("n", "<leader>n", ":Neoformat<cr>", { noremap = true, silent = true, desc = "Format Buffer" })
end

M.create_neogit_keymaps = function()
  -- Neogit
  vim.keymap.set("n", "<leader>g", "<cmd>Neogit<cr>", { noremap = true, desc = "Neogit Window" })
end

M.create_treesitter_keymaps = function()
  -- treesitter
  vim.keymap.set(
    "n",
    "<leader>ts",
    ":TSPlaygroundToggle<cr>",
    { noremap = true, silent = true, desc = "Treesitter Toggle" }
  )
end

M.create_gitsigns_keymaps = function()
  local gs = package.loaded.gitsigns

  vim.keymap.set("n", "]c", function()
    if vim.wo.diff then return "]c" end
    vim.schedule(function() gs.next_hunk() end)
    return "<Ignore>"
  end, { expr = true, desc = "Next Hunk" })

  vim.keymap.set("n", "[c", function()
    if vim.wo.diff then return "[c" end
    vim.schedule(function() gs.prev_hunk() end)
    return "<Ignore>"
  end, { expr = true, desc = "Previous Hunk" })

  vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage Hunk" })
  vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" })
  vim.keymap.set("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
    { desc = "Stage Hunk" })
  vim.keymap.set("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
    { desc = "Unstage Hunk" })
  vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { desc = "Stage Buffer" })
  vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Unstage Hunk" })
  vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { desc = "Reset Buffer" })
  vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" })
  vim.keymap.set("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { desc = "Blame Hunk" })
  vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle Blame" })
  vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = "" })
  vim.keymap.set("n", "<leader>hD", function() gs.diffthis("~") end)
  vim.keymap.set("n", "<leader>td", gs.toggle_deleted)
  vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
end

return M
