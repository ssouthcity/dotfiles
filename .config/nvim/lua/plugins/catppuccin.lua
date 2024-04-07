return {

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        harpoon = true,
        mason = true,
        noice = true,
        notify = true,
        lsp_trouble = true,
      },
    },
    init = function()
      vim.cmd.colorscheme "catppuccin"
    end,
  },

}
