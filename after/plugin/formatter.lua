function format_prettier()
  local bufName = "'" .. vim.api.nvim_buf_get_name(0) .. "'"
  return {
    exe = "npx",
    args = {"prettier", "--stdin-filepath", bufName},
    stdin = true
  }
end

local format_sync_grp = vim.api.nvim_create_augroup("FormatterFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.ts,*.tsx",
  callback = function()
    vim.cmd("FormatWrite")
  end,
  group = format_sync_grp,
})

require('formatter').setup {
  logging = true,
  filetype = {
    typescript = { format_prettier },
    typescriptreact = { format_prettier },
  }
}
