return {

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        fidget = true,
        harpoon = true,
        lsp_trouble = true,
        mason = true,
        noice = true,
        notify = true,
      },
    },
    init = function()
      vim.cmd.colorscheme "catppuccin"
    end,
  },

}
