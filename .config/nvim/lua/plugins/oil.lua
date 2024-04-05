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
        -- disable keybinds which collides with vim-tmux-navigator
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        -- remap reload action
        ["<C-r>"] = "actions.refresh",
      },
      view_options = {
        show_hidden = true,
      },
    },
  },

}
