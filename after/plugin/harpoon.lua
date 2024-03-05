local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>b", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

local wk = require("which-key")
wk.register({
  j = { function() ui.nav_file(1) end, "Harpoon file 1" },
  k = { function() ui.nav_file(2) end, "Harpoon file 2" },
  l = { function() ui.nav_file(3) end, "Harpoon file 3" },
  ö = { function() ui.nav_file(4) end, "Harpoon file 4" },
}, { prefix = "<leader>", mode = {"n"} })
