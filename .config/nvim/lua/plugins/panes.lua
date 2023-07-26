return {
  "christoomey/vim-tmux-navigator",
  {
    "szw/vim-maximizer",
    init = function()
      vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
    end,
  },
}
