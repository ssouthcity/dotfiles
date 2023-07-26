return {
  { 
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      integrations = {
        mason = true,
      },
    },
    init = function()
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
