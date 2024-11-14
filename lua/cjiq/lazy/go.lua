return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "folke/which-key.nvim",
    },
    opts = {},
    config = function()
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require("go.format").goimport()
        end,
        group = format_sync_grp,
      })
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      require("go").setup({
        lsp_cfg = {
          capabilities = capabilities,
        },
      })
      require("which-key").add({
        { "<leader>g", group = "Golang / Git" },
        { "<leader>gat", "<cmd>GoAddTag<cr>", desc = "Add tags to struct" },
        { "<leader>gm", group = "Mod" },
        { "<leader>gmt", "<cmd>GoModTidy<cr>", desc = "Go Mod Tidy" },
        { "<leader>gr", "<cmd>GoRun<cr>", desc = "Run" },
        { "<leader>gt", "<cmd>GoTest<cr>", desc = "Run tests" },
        { "<leader>cr", "<cmd>GoRename<cr>", desc = "Go Rename" },
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      bind = true,
      handler_opts = {
        border = "rounded",
      },
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
}
