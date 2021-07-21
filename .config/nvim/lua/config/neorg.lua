require("neorg").setup {
  -- tell Neorg what modules to load
  load = {
    ["core.defaults"] = {}, -- load all the default modules
    ["core.norg.concealer"] = {}, -- allows for use of icons
    ["core.norg.dirman"] = {
      -- Manage your directories with Neorg
      config = {
        workspaces = {
          personal = "~/neorg/personal",
          linos = "~/neorg/linos"
        },
        autodetect = true,
        autochdir = true
      }
    }
  }
}
