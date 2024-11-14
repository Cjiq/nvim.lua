return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "folke/which-key.nvim",
    },
    config = function()
      require("refactoring").setup({})
      require("which-key").add({
        { "<leader>r", group = "Refactoring", mode = "v" },
        { "<leader>rf", "<cmd>Refactor extract<cr>", desc = "Extract function", mode = "v" },
      })
    end,
  },
}
