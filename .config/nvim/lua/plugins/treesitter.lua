return {

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    cmd = { "TSUpdateSync" },
    keys = {
      { "<C-space>", desc = "Init and increment treesitter selection" },
      { "<bs>",      desc = "Decrement treesitter selection" },
    },
    opts = {
      ensure_installed = {
        -- devops
        "bash",
        "terraform",
        -- web
        "html",
        "css",
        "javascript",
        "typescript",
        -- markup
        "markdown",
        "yaml",
        -- backend
        "go",
        "rust",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      autopairs = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },

}
