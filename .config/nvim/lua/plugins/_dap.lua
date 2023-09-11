return {
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
  init = function()
    require("dap")

    local sign = vim.fn.sign_define

    sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
    sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
  end,
  dependencies = {

    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = "mason.nvim",
      opts = {
        ensure_installed = { "debugpy", "delve" },
        automatic_installation = true,
        handlers = {
          function(config)
            require("mason-nvim-dap").default_setup(config)
          end,
        },
      },
    },

    {
      "rcarriga/nvim-dap-ui",
      opts = { floating = { border = "rounded" } },
      config = function(_, opts)
        local dap = require("dap")
        local dapui = require("dapui")

        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end

        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end

        dapui.setup(opts)
      end
    },

  },
}
