local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
-- vim.keymap.set('n', '<leader-p>', builtin.git_files, {})

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
        ["<C-c>"] = require('telescope.actions').close,
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      },
    },
  },
}

vim.keymap.set('n', '<leader>dff', "<cmd>cd ~/.dotfiles | :Telescope find_files hidden=true<cr>", {})

local wk = require("which-key")
wk.register({
  f = {
    name = "Find",
    f = { "<cmd>silent !tmux neww ~/.dotfiles/scripts/tmux-sessionizer<cr>", "Find project and start new tmux session" },
    g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
    b = { "<cmd>Telescope buffers<cr>", "List buffers" },
    h = { "<cmd>Telescope help_tags()<cr>", "Find tags" },
    d = { "<cmd>cd ~/.dotfiles | :Telescope find_files hidden=true<cr>", "Find dotfiles" }
  }

}, { prefix = "<leader>", mode = {"n"} })
