return {
  {
    "chrisbra/csv.vim",
    dependencies = {
      "folke/which-key.nvim",
    },
    config = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>na", "<cmd>%ArrangeColumn<cr>", desc = "Arrange CSV columns" },
        { "<leader>nr", "<cmd>%UnArrangeColumn<cr>", desc = "UnArrange CSV columns" },
      })
    end,
  },
}
