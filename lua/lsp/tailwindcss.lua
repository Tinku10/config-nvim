-- uses tailwindcss intellisense

vim.cmd [[ packadd completion-nvim ]]
local completion = require('completion')

require"lspconfig".tailwindls.setup {
    cmd = { "node", "~/Downloads/tailwind/extension/dist/server/index.js", "--stdio" },
    -- filetypes = O.tailwindls.filetypes,
    -- root_dir = require('lspconfig/util').root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    handlers = {
        ["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
            -- tailwindcss lang server waits for this repsonse before providing hover
            vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", {_id = params._id})
        end
    },
    on_attach = completion.on_attach
}
