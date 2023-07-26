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
        "pyright",
      },
    },
    init = function()
      local capabilities = require("cmp_nvim_lsp").capabilities
      require("mason-lspconfig").setup_handlers({
        function (server_name) 
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            settings = {
              pyright = {
                venvPath = "venv",
              },
              gopls = {
                analyses = {
                  unusedparams = true,
                },
              },
            },
          })
        end,
      })
    end,
  },
}
