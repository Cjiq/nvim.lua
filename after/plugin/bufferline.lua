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
          return "err("..count..")" .. " test"
      end,
      max_name_length = 30,
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
      left_mouse_command = function(buf)
        -- buffer %d
        local winid = vim.api.nvim_get_current_win()
        local bufwin_id = vim.fn.bufwinid(buf)
        local curr_buf = vim.api.nvim_get_current_buf()
        print("window " .. winid .. " buf " .. buf .. " bufwin_id " .. bufwin_id .. " curr buf " .. curr_buf)
        if winid ~= bufwin_id then
          vim.api.nvim_win_set_buf(winid, buf)
        elseif bufwin_id ~= -1 then
          return
        end
        vim.cmd("buffer " .. buf)
      end
    },
  })
end
vim.defer_fn(load_bufferline, 100)
