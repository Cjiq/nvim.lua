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
wk.register({
  r = {
    name = "Reload",
    cp = { "<cmd>so ~/.config/nvim/after/plugin/copilot.lua | Copilot enable<cr>", "Restart copilot" },
    r = { "<cmd>so ~/.config/nvim/lua/cjiq/init.lua<cr>", "Reload nvim config" },
  },
  f = {
    name = "Find",
    f = { "<cmd>silent !tmux neww ~/.dotfiles/scripts/tmux-sessionizer<cr>", "Find project and start new tmux session" },
  },
  g = {
    name = "Golang / Git",
    t = {
      name = "Telescope",
      s = { "<cmd>Telescope git_status<cr>", "Git status" },
    },
    s = { "<cmd>Git<cr>", "Git status" },
    c = { "<cmd>Git commit -v -q<cr>", "Git commit" },
    p = { "<cmd>Git push<cr>", "Git push" },
  },
  w = { "<cmd>FormatWrite<cr>", "Format current buffer" },
}, { prefix = "<leader>", mode = { "n" } })
