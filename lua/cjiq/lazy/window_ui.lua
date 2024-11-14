return {
  { -- Bufferline
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      vim.diagnostic.config({ update_in_insert = true })
      local harpoon = require("harpoon")
      local load_bufferline = function()
        require("bufferline").setup({
          options = {
            close_icon = "X",
            close_command = "bdelete! %d",
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            diagnostics = "nvim_lsp",
            -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
              return "err(" .. count .. ")" .. " test"
            end,
            max_name_length = 30,
            name_formatter = function(buf)
              local marks = harpoon.get_mark_config().marks
              for idx = 1, #marks do
                local m = marks[idx]
                if string.find(buf.path, m.filename) then
                  -- os.execute("echo "..m.filename .. " >> debug.log") -- log to file
                  return "(h" .. idx .. ") " .. buf.name
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
            end,
          },
        })
      end
      local custom_bufferline = function(buf)
        for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
          if vim.api.nvim_win_get_config(winid).zindex then
            return
          end
        end
        local custom_load_tabs = function()
          vim.wo.winbar = _G.nvim_bufferline()
          vim.cmd("set showtabline=0")
        end
        vim.defer_fn(custom_load_tabs, 120)
        -- vim.cmd(":LspRestart")
      end
      vim.api.nvim_create_autocmd({ "BufEnter" }, { callback = custom_bufferline })

      local buf_enter_grp = vim.api.nvim_create_augroup("BufEnterGroup", {})
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = custom_bufferline,
        group = buf_enter_grp,
      })
      vim.defer_fn(load_bufferline, 100)
    end,
  },
  { -- Lualine
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      local load_lualine = function()
        require("lualine").setup({})
      end
      vim.defer_fn(load_lualine, 100)
    end,
  },

  { -- Color Scheme
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({ variant = "main" })
      vim.cmd("colorscheme rose-pine")
    end,
  },
}
