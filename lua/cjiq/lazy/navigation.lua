return {
  { -- Harpoooooonnnnnn!!!!!!!
    "theprimeagen/harpoon",
    dependencies = {
      "folke/which-key.nvim",
    },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")
      -- vim.keymap.set("n", "<leader>b", mark.add_file)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
      local wk = require("which-key")
      wk.add({
        {
          "<leader>b",
          mark.add_file,
          desc = "Add current file to Harpoon",
        },
        {
          "<leader>e",
          ui.toggle_quick_menu,
          desc = "Open Harpoon Menu",
        },

        {
          "<leader>j",
          function()
            require("harpoon.ui").nav_file(1)
          end,
          desc = "Harpoon file 1",
        },
        {
          "<leader>k",
          function()
            require("harpoon.ui").nav_file(2)
          end,
          desc = "Harpoon file 2",
        },
        {
          "<leader>l",

          function()
            require("harpoon.ui").nav_file(3)
          end,
          desc = "Harpoon file 3",
        },
        {
          "<leader>ö",
          function()
            require("harpoon.ui").nav_file(4)
          end,
          desc = "Harpoon file 4",
        },
      })
    end,
  },
  { -- Tmux Navigation
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")
      nvim_tmux_nav.setup({
        disable_when_zoomed = true, -- defaults to false
      })

      vim.keymap.set("n", "<C-a>h", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set("n", "<C-a>j", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set("n", "<C-a>k", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set("n", "<C-a>l", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set("n", "<C-a>o", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set("n", "<C-a>Space", nvim_tmux_nav.NvimTmuxNavigateNext)
    end,
  },
}
