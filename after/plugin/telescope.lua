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
        ["<C-v>"] = require('telescope.actions').select_vertical,
        ["<C-h>"] = require('telescope.actions').select_horizontal,
      },
    },
  },
}

-- vim.keymap.set('n', '<leader>dff', "<cmd>cd ~/.dotfiles | :Telescope find_files hidden=true<cr>", {})

local tmux_sessionizer = function()
  vim.cmd("silent !tmux neww ~/.dotfiles/scripts/tmux-sessionizer")
  local selected_cwd = vim.fn.readfile("/dev/shm/tmux-selected-cwd")[1]
  if selected_cwd == "" or selected_cwd == nil then
    return
  end
  vim.cmd("cd " .. selected_cwd)
end


local wk = require("which-key")
wk.register({
  f = {
    name = "Find",
    f = { tmux_sessionizer, "Find project and start new tmux session" },
    g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
    b = { "<cmd>Telescope buffers<cr>", "List buffers" },
    h = { "<cmd>Telescope help_tags<cr>", "Find tags" },
    G = { "<cmd>Telescope git_files<cr>", "Find in Git" },
    d = { "<cmd>cd ~/.dotfiles | :Telescope find_files hidden=true<cr>", "Find dotfiles" }
  },
}, { prefix = "<leader>", mode = {"n"} })
