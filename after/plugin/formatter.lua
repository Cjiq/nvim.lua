-- Utilities for creating configurations
local util = require "formatter.util"

local format_on_save = vim.api.nvim_create_augroup("FormatAutoGroup", {})
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.ts,*.tsx,*.js,*.jsx",
  callback = function()
    vim.cmd("FormatWrite")
  end,
  group = format_sync_grp,
})

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {}
