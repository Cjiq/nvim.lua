require("cjiq")

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Indents and tab spacing
local tabwidth = 2
vim.o.expandtab = true
vim.o.tabstop = tabwidth
vim.o.shiftwidth = tabwidth
vim.o.numberwidth = tabwidth

vim.opt.incsearch = true

vim.opt.colorcolumn = "80"

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Default split behavior
vim.o.splitright = true
vim.o.splitbelow = true
