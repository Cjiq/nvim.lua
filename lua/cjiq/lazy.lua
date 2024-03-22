require("lazy").setup({
  -- My plugins here
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'cjiq/tailwind-fold.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    -- ft = { 'html', 'svelte', 'astro', 'vue', 'typescriptreact', 'php', 'blade', 'templ'},
  },

  -- Vim debug tools
  'mfussenegger/nvim-dap',
  'theHamsta/nvim-dap-virtual-text',
  { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} },

  "sindrets/diffview.nvim",

  { 'mhartington/formatter.nvim' },

  -- 'tanvirtin/monokai.nvim',
  { "rose-pine/neovim", name = "rose-pine" },

  'mhartington/formatter.nvim',

  -- Bufferline
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  },

  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},

  'theprimeagen/harpoon',

  'mbbill/undotree',

  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'terrortylor/nvim-comment',

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  },


  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },

'alexghergh/nvim-tmux-navigation',

-- Lua
{
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
},

"github/copilot.vim",

---- Automatically set up your configuration after cloning packer.nvim
---- Put this at the end after all plugins
})

