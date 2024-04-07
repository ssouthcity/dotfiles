return {

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function(opts)
      local autopairs = require("nvim-autopairs")
      autopairs.setup(opts)

      local cmp = require("cmp")
      local autopairs_cmp = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", autopairs_cmp.on_confirm_done())
    end
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  },

}
