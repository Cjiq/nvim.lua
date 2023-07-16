local load_bufferline= function ()
  vim.opt.termguicolors = true
  require("bufferline").setup({
    options = {
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = true,
      close_icon = 'X',
      close_command = "bdelete! %d",
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
    },
  })
end
vim.defer_fn(load_bufferline, 100)
