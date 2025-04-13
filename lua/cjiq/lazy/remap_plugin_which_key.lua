return {
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 800
      local wk = require("which-key")
      wk.setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
      if wk ~= nil then
        wk.add({
          { "<leader>q", "<cmd>q<cr><cmd>tabclose<cr>", desc = "Close" },
          -- { "<leader>t", group = "Trouble / Tab" },
          { "<leader>tq", "<cmd>tabclose<cr>", desc = "Tab close" },
          { "<leader>f", group = "Find" },
          { "<leader>i", "<C-a>", desc = "Increment" },
          { "<leader>d", "<C-x>", desc = "Decrement" },
          {
            "<leader>ff",
            "<cmd>silent !tmux neww ~/.dotfiles/scripts/tmux-sessionizer<cr>",
            desc = "Find project and start new tmux session",
          },
          { "<leader>gic", "<cmd>Git commit -v -q<cr>", desc = "Git commit" },
          { "<leader>gip", "<cmd>Git push<cr>", desc = "Git push" },
          { "<leader>gis", "<cmd>Git<cr>", desc = "Git status" },
          { "<leader>gt", group = "Telescope" },
          { "<leader>gts", "<cmd>Telescope git_status<cr>", desc = "Git status" },
          { "<leader>r", group = "Reload" },
          {
            "<leader>rcp",
            "<cmd>so ~/.config/nvim/after/plugin/copilot.lua | Copilot enable<cr>",
            desc = "Restart copilot",
          },
          { "<leader>rr", "<cmd>so ~/.config/nvim/lua/cjiq/init.lua<cr>", desc = "Reload nvim config" },
          { "<leader>w", "<cmd>FormatWrite<cr>", desc = "Format current buffer" },
          { "<leader>p", group = "Project" },
          { "<leader>pv", vim.cmd.Ex, desc = "Open netrw" },
          { "<leader>pss", "<cmd>Lazy<cr>", desc = "Open Lazy" },
          { "<leader>po", "<cmd>Neotree<cr>", desc = "Open Treeview" },
        })
      end
    end,
  },
}
