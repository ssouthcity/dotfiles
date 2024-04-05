return {

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "<leader>xx",
        function() require("trouble").toggle() end,
        desc = "Toggle Trouble",
      },
      {
        "<leader>xw",
        function() require("trouble").toggle("workspace_diagnostics") end,
        desc = "Toggle Trouble workspace"
      },
      {
        "<leader>xd",
        function() require("trouble").toggle("document_diagnostics") end,
        desc = "Toggle Trouble document"
      },
      {
        "<leader>xq",
        function() require("trouble").toggle("quickfix") end,
        desc = "Toggle Trouble quickfix"
      },
      {
        "<leader>xl",
        function() require("trouble").toggle("loclist") end,
        desc = "Toggle Trouble loclist",
      },
      {
        "gR",
        function() require("trouble").toggle("lsp_references") end,
        desc = "Toggle Trouble lsp references",
      },
    },
    opts = {},
  },

}
