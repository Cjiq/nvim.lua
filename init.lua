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
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Handle listchars
vim.o.listchars = "tab:»·,trail:·,extends:→,precedes:←,nbsp:␣"

-- Default split behavior
vim.o.splitright = true
vim.o.splitbelow = true

vim.filetype.add({
  extension = {
    templ = "templ",
  },
})

-- vim.cmd([[
--   let g:netrw_list_hide = netrw_gitignore#Hide()
--   let b:csv_arrange_align = 'l*'
--   let g:csv_strict_columns = 1
--   let g:csv_autocmd_arrange = 0
-- ]])

local in_wsl = os.getenv("WSL_DISTRO_NAME") ~= nil

if in_wsl then
  vim.g.clipboard = {
    name = "wsl clipboard",
    copy = { ["+"] = { "clip.exe" }, ["*"] = { "clip.exe" } },
    paste = { ["+"] = { "nvim_paste" }, ["*"] = { "nvim_paste" } },
    cache_enabled = true,
  }
end

-- Tailwind fold

local custom_format = function()
  if vim.bo.filetype == "templ" then
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local cmd = "templ fmt " .. vim.fn.shellescape(filename)

    vim.fn.jobstart(cmd, {
      on_exit = function()
        -- Reload the buffer only if it's still the current buffer
        if vim.api.nvim_get_current_buf() == bufnr then
          vim.cmd("e!")
        end
      end,
    })
  else
    vim.lsp.buf.format()
  end
end
local format_sync_grp = vim.api.nvim_create_augroup("FormatterFormat", {})
vim.api.nvim_create_autocmd(
  { "BufWritePre" },
  { pattern = { "*.templ" }, callback = custom_format, group = format_sync_grp }
)
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

-- Define an autocmd group to avoid duplication
vim.api.nvim_create_augroup("CsvFileSettings", { clear = true })

-- Create an autocmd within the group
vim.api.nvim_create_autocmd("FileType", {
  group = "CsvFileSettings",
  pattern = "csv",
  command = "setlocal cursorline",
})
