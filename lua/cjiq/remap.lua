vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pss", vim.cmd.PackerSync)
vim.keymap.set("n", "<leader>.", vim.cmd.vsp)
vim.keymap.set("n", "<leader>-", vim.cmd.hsp)
vim.keymap.set("n", "<leader>x", vim.cmd.hsp)
vim.keymap.set("n", "<C-i>", vim.cmd.bprev)
vim.keymap.set("n", "<C-o>", vim.cmd.bnext)

-- Nice move selected text up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Do not paste over current reg when pasting in v-mode
vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "J", "mzJ`z")

local wk = require("which-key")
wk.add({
  { "<leader>f", group = "Find" },
  {
    "<leader>ff",
    "<cmd>silent !tmux neww ~/.dotfiles/scripts/tmux-sessionizer<cr>",
    desc = "Find project and start new tmux session",
  },
  { "<leader>g", group = "Golang / Git" },
  { "<leader>gc", "<cmd>Git commit -v -q<cr>", desc = "Git commit" },
  { "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
  { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
  { "<leader>gt", group = "Telescope" },
  { "<leader>gts", "<cmd>Telescope git_status<cr>", desc = "Git status" },
  { "<leader>r", group = "Reload" },
  { "<leader>rcp", "<cmd>so ~/.config/nvim/after/plugin/copilot.lua | Copilot enable<cr>", desc = "Restart copilot" },
  { "<leader>rr", "<cmd>so ~/.config/nvim/lua/cjiq/init.lua<cr>", desc = "Reload nvim config" },
  { "<leader>w", "<cmd>FormatWrite<cr>", desc = "Format current buffer" },
})
