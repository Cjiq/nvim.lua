vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pss", vim.cmd.PackerSync)

-- Nice move selected text up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Do not paste over current reg when pasting in v-mode
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "J", "mzJ`z")

