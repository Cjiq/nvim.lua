harpoon = require("harpoon")
local load_bufferline= function ()
  vim.opt.termguicolors = true
  require("bufferline").setup({
    options = {
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = true,
      close_icon = 'X',
      close_command = "bdelete! %d",
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = true,
      -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
          return "("..count..")" .. " test"
      end,
      name_formatter = function(buf)
        local marks = harpoon.get_mark_config().marks
        for idx = 1, #marks do
          local m = marks[idx]
          if string.find(buf.path, m.filename) then
            -- os.execute("echo "..m.filename .. " >> debug.log") -- log to file
            return "(h"..idx .. ") " .. buf.name
          end
        end
        return buf.name
      end,
    },
  })
end
vim.defer_fn(load_bufferline, 100)
