return {

  {
    "freddiehaddad/feline.nvim",
    event = "VeryLazy",
    dependencies = {
      "catppuccin",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local feline = require("feline")
      local catppuccin_feline = require("catppuccin.groups.integrations.feline")

      feline.setup({
        components = catppuccin_feline.get(),
      })
    end,
  },

}
