return {
  { -- Comment out sections of code with gc
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup()
    end,
  },
  {
    "ralismark/opsort.vim",
    dependencies = {
      "tpope/vim-repeat",
    },
  },
  { -- Copilot
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-Space>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },
  -- Diffview
}
