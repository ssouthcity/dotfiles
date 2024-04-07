return {

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>a", function() require("harpoon"):list():append() end },
      { "<C-e>",     function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end },

      { "<C-K>",     function() require("harpoon"):list():prev() end },
      { "<C-J>",     function() require("harpoon"):list():next() end },
    },
    opts = {},
  },

}
