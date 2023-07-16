
local load_lualine = function ()
  require('lualine').setup()
end
vim.defer_fn(load_lualine, 100)

