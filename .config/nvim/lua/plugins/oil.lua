return {

  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    keys = {
      { "-", "<CMD>Oil<CR>", desc = "Open File Explorer" },
    },
    opts = {
      keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
      },
      view_options = {
        show_hidden = true,
      },
    },
  },

}
