
-- Install Packer in bg if not installed.
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- My plugins here
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Packer
  use "sindrets/diffview.nvim"

  use { 'mhartington/formatter.nvim' }

  use('tanvirtin/monokai.nvim')

  use('mhartington/formatter.nvim')

  -- Bufferline
  use {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons'
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use('theprimeagen/harpoon')

  use('mbbill/undotree')

  use('tpope/vim-fugitive')
  use('tpope/vim-surround')
  use('terrortylor/nvim-comment')

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
}

use 'ray-x/go.nvim'
use 'ray-x/guihua.lua' -- recommended if need floating window support
use 'neovim/nvim-lspconfig'


use 'alexghergh/nvim-tmux-navigation'

-- Lua
use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 600
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

use("github/copilot.vim")

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
  require('packer').sync()
end
end)

