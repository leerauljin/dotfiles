local config = {
  profile = {
    enable = true,
    threshold = 0
  },
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  },
}

-- vim.cmd([[
--     augroup packer_user_config
--       autocmd!
--      autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup END
-- ]])

local plugins = {
  -- core
  'wbthomason/packer.nvim',
  'nvim-lua/plenary.nvim',
  'lewis6991/impatient.nvim',
  'folke/which-key.nvim',

  -- ui (core)
  'kyazdani42/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-tree.lua',
  'lukas-reineke/indent-blankline.nvim',

  -- editor (core)
  'windwp/nvim-autopairs',
  'numToStr/Comment.nvim',
  'tpope/vim-repeat',
  'ggandor/lightspeed.nvim',
  {
    'tpope/vim-surround',
    event = "BufRead"
  },
  {
    'github/copilot.vim',
    event = 'VimEnter',
  },

  -- search engine
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  'nvim-telescope/telescope-ui-select.nvim',
  'mrjones2014/legendary.nvim',
  {
    'nvim-telescope/telescope-bibtex.nvim',
    dependencies = {
      { 'nvim-telescope/telescope.nvim' },
    },
  },

  -- lsp & syntax highlighting
  'jose-elias-alvarez/null-ls.nvim',
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    dependencies = { 'jayp0521/mason-null-ls.nvim', }
  },

  -- editor (additional)
  'norcalli/nvim-colorizer.lua',
  {
    'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble', "TodoTelescope" },
  },
  {
    'filipdutescu/renamer.nvim',
    branch = 'master',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- ui (additional)
  'goolord/alpha-nvim',
  'szw/vim-maximizer',
  'christoomey/vim-tmux-navigator',
  'Pocco81/true-zen.nvim',
  'ThePrimeagen/harpoon',
  'echasnovski/mini.bracketed',
  {
    'folke/trouble.nvim',
    event = 'VimEnter',
    cmd = { 'TroubleToggle', "Trouble" },
  },

  -- git
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    wants = 'plenary.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'TimUntersberger/neogit',
    cmd = 'Neogit',
  },

  -- lang
  'ray-x/go.nvim',
  'olexsmir/gopher.nvim',
  'lervag/vimtex',
  'nvim-orgmode/orgmode',
  'akinsho/org-bullets.nvim',

  -- themes
  "sainnhe/gruvbox-material",
}

local lazy = require 'lazy'

lazy.setup(plugins)
