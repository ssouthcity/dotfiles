return {

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>ff",  "<CMD>Telescope find_files<CR>",   desc = "Fuzzy find files in cwd" },
      { "<leader>fg",  "<CMD>Telescope live_grep<CR>",    desc = "Fuzzy find string in cwd" },
      { "<leader>fk",  "<CMD>Telescope grep_string<CR>",  desc = "Find visual selection in cwd" },
      { "<leader>gc",  "<CMD>Telescope git_commits<CR>",  desc = "View git commits" },
      { "<leader>gfc", "<CMD>Telescope git_bcommits<CR>", desc = "View git commits for the current buffer" },
      { "<leader>gb",  "<CMD>Telescope git_branches<CR>", desc = "View git branches" },
      { "<leader>gs",  "<CMD>Telescope git_status<CR>",   desc = "View git changes per file" },
    },
    config = function()
      local telescope = require("telescope")
      local themes = require("telescope.themes")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          path_display = { "truncate" },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          ["ui-select"] = {
            themes.get_dropdown()
          },
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
    end,
  },

}
