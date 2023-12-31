local servers = {
  gopls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

local on_attach = function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  vim.diagnostic.config { float = { border = "rounded" }, }
  local group = vim.api.nvim_create_augroup("Line diagnostics", { clear = true })
  vim.api.nvim_create_autocmd("CursorHold", {
    callback = vim.diagnostic.open_float,
    group = group,
  })

  nmap("K", vim.lsp.buf.hover, "Hover Documentation")

  nmap("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
  nmap("<leader>ca", vim.lsp.buf.code_action, "Perform code action")

  nmap("gd", vim.lsp.buf.definition, "Goto definition")
  nmap("gD", vim.lsp.buf.declaration, "Goto declaration")
  nmap("gi", vim.lsp.buf.implementation, "Goto implementation")
  nmap("td", vim.lsp.buf.type_definition, "Goto type definition")

  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })

  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format()
    end
  })
end

return {

  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      window = {
        blend = 0,
      },
    }
  },

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

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers)
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
          })
        end,
      })

      require('lspconfig.ui.windows').default_options.border = 'single'
    end,
  },

}
