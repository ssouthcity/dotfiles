return {

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "<LEADER>tw",
        function() require("trouble").toggle("workspace_diagnostics") end,
        desc = "Toggle Trouble diagnostics window"
      },
      {
        "<LEADER>td",
        function() require("trouble").toggle("document_diagnostics") end,
        desc = "Toggle Trouble document diagnostics"
      }
    },
    opts = {},
  },

}
