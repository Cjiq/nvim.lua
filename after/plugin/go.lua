
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})

require('go').setup()

local wk = require("which-key")
wk.register({
  g = {
    name = "Golang",
    at = { "<cmd>GoAddTag<cr>", "Add tags to struct" },
  }
}, { prefix = "<leader>", buffer = bufnr })
