local servers = {
  gopls = {
    gopls = {
      gofumpt = true,
    },
  },
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  yamlls = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        kubernetes = "/k8s/*",
      },
    },
  },
  -- Azure extended the standard for yaml schemas, requiring an additional language server
  azure_pipelines_ls = {
    filetypes = { "yaml" },
    settings = {
      yaml = {
        schemas = {
          ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "*",
        },
      },
    },
  },
}

return {


  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      { "williamboman/mason-lspconfig.nvim", dependencies = "williamboman/mason.nvim" },
      { "hrsh7th/cmp-nvim-lsp",              dependencies = "hrsh7th/nvim-cmp" },

      "folke/neodev.nvim",
    },
    config = function()
      require("neodev").setup()

      local cmp_lsp = require("cmp_nvim_lsp")
      local mason_lspconfig = require("mason-lspconfig")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = cmp_lsp.default_capabilities(capabilities)

      mason_lspconfig.setup()

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
          })
        end,
      })

      require("lspconfig.ui.windows").default_options.border = "single"
    end,
  },

}
