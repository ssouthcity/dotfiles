return {

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
      top_down = false,
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    },
  },

  {
    'mrded/nvim-lsp-notify',
    dependencies = { 'rcarriga/nvim-notify' },
    config = function(opts)
      require("lsp-notify").setup(vim.tbl_deep_extend("force", opts, {
        notify = require("notify"),
      }))
    end,
  },

}
