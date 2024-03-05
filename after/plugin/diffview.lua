require('diffview').setup()

local wk = require("which-key")
wk.register({
  g = {
    d = { "<cmd>DiffviewOpen<cr>", "Git diff" },
  },
}, { prefix = "<leader>", mode = {"n"} })


