vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pss", ":Lazy<CR>")
vim.keymap.set("n", "<leader>.", vim.cmd.vsp)
vim.keymap.set("n", "<leader>-", vim.cmd.hsp)
vim.keymap.set("n", "<leader>x", vim.cmd.hsp)
vim.keymap.set("n", "<C-i>", vim.cmd.bprev)
vim.keymap.set("n", "<C-o>", vim.cmd.bnext)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>wj", ":resize -5<cr>")
vim.keymap.set("n", "<leader>wk", ":resize +5<cr>")
vim.keymap.set("n", "<leader>w-", ":sp<cr>")
vim.keymap.set("n", "<leader>w.", ":vsp<cr>")

-- Nice move selected text up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Do not paste over current reg when pasting in v-mode
vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

-- Map Esc in terminal mode to go back to normal mode
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
