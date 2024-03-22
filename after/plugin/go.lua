local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('go').setup({
  lsp_cfg = capabilities,
})

local wk = require("which-key")
wk.register({
  g = {
    name = "Golang / Git",
    at = { "<cmd>GoAddTag<cr>", "Add tags to struct" },
    t = { "<cmd>GoTest<cr>", "Run tests" },
    r = { "<cmd>GoRun<cr>", "Run" },
  }
}, { prefix = "<leader>", mode = {"n"} })
