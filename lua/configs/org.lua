require("neorg").setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {},
    ["core.norg.completion"] = {},
    ["core.integrations.nvim-cmp"] = {
      config = { -- Note that this table is optional and doesn't need to be provided
          -- Configuration here
      }
    }
    -- ["core.norg.dirman"] = {
    --   config = {
    --   workspaces = {
    --       work = "~/notes/work",
    --       home = "~/notes/home",
    --     }
    --   }
    -- }
  }
}
