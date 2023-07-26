return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
    end,
    opts = {},
  },
  {
    "freddiehaddad/feline.nvim",
    dependencies = { "catppuccin" },
    config = function()
      local feline = require("feline")
      local ctp_feline = require('catppuccin.groups.integrations.feline')

      feline.setup({
        components = ctp_feline.get(),
      })
    end,
  },
}
