local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
})


-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'buffer'},
    {name = 'luasnip'},
  },
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-Space>'] = cmp.mapping.confirm({select = false}),

    -- Navigate between snippet placeholder
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)

  local wk = require("which-key")
  wk.register({
    v = {
      d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Diagnostic in new window" },
      ws = { "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", "List all symbols in current ws" },
      ca = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action at cursor" },
      rr = { "<cmd>lua vim.lsp.buf.references()<cr>", "All references at cursor" },
      rn = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol at cursor" },
      gd = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto definition" },
    },
    d = {
      name = "diagnostic",
      n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic" },
      p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous diagnostic" },
    }
  }, { prefix = "<leader>", buffer = bufnr })

end)

lsp.setup()
