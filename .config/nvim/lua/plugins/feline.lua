return {

  {
    "freddiehaddad/feline.nvim",
    event = "VeryLazy",
    dependencies = { "catppuccin" },
    config = function()
      local feline = require("feline")
      local ctp_feline = require("catppuccin.groups.integrations.feline")

      feline.setup({
        components = ctp_feline.get(),
      })
    end,
  },

}
