return {
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "folke/which-key.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("diffview").setup()
      local wk = require("which-key")
      wk.add({
        { "<leader>gi", group = "Golang / Git" },
        { "<leader>gid", "<cmd>DiffviewOpen<cr>", desc = "Git diffview" },
      })
    end,
  },

  { -- undotree
    "mbbill/undotree",
    dependencies = {
      "folke/which-key.nvim",
    },
    config = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle UndoTree" },
      })
    end,
  },
}
