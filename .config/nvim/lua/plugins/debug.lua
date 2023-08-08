return {
  "williamboman/mason.nvim",
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", function()
        require("dap").toggle_breakpoint()
      end },
      { "<leader>dc", function()
        require("dap").continue()
      end },
      { "<leader>dsi", function()
        require("dap").step_into()
      end },
      { "<leader>dso", function()
        require("dap").step_over()
      end },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "delve", "python" },
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
        python = function(config)
          config.adapters = {
            type = "executable",
            command = "python",
            args = {
              "-m",
              "debugpy.adapter",
            },
          }
          require('mason-nvim-dap').default_setup(config)
        end,
      },
    },
  },
}
