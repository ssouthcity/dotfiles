return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = { border = "rounded" },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      ensure_installed = {
        "gopls",
        "lua_ls",
        "pyright",
        "rust_analyzer",
      },
    },
    init = function()
      local capabilities = require("cmp_nvim_lsp").capabilities
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            settings = {
              gopls = {
                analyses = {
                  unusedparams = true,
                },
              },
              Lua = {
                runtime = {
                  version = "LuaJIT",
                },
                diagnostics = {
                  globals = { "vim", "require" },
                },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                },
                telemetry = { enable = false },
              },
              pyright = {
                venvPath = "venv",
              },
            },
          })
        end,
      })
    end,
  },
}
