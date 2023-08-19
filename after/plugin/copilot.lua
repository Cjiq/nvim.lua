
local load_copilot = function ()
  -- vim.g.copilot_no_tab_map = true
  -- vim.api.nvim_set_keymap("i", "<C-Space>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
end
vim.defer_fn(load_copilot, 100)
