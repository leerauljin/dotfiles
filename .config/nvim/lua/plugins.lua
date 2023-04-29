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

vim.cmd([[
    augroup packer_user_config
      autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])

local function plugins(use)
  -- core
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'lewis6991/impatient.nvim'
  use 'nathom/filetype.nvim'
  use 'folke/which-key.nvim'

  -- ui (core)
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'lukas-reineke/indent-blankline.nvim'

  -- editor (core)
  use 'windwp/nvim-autopairs'
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-repeat'
  use 'ggandor/lightspeed.nvim'
  use { 'tpope/vim-surround',
    event = "BufRead"
  }
  use { 'github/copilot.vim',
    event = 'VimEnter',
  }

  -- search engine
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'mrjones2014/legendary.nvim'
  use { 'nvim-telescope/telescope-bibtex.nvim',
    requires = {
      { 'nvim-telescope/telescope.nvim' },
    },
  }

  -- lsp & syntax highlighting
  use 'jose-elias-alvarez/null-ls.nvim'
  use { 'VonHeikemen/lsp-zero.nvim',
    requires = {
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
  }
  use { 'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  }
  use { 'jayp0521/mason-null-ls.nvim',
    after = 'nvim-treesitter' }

  -- editor (additional)
  use 'norcalli/nvim-colorizer.lua'
  use { 'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble', "TodoTelescope" },
  }
  use {
    'filipdutescu/renamer.nvim',
    branch = 'master',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- ui (additional)
  use 'goolord/alpha-nvim'
  use 'szw/vim-maximizer'
  use 'christoomey/vim-tmux-navigator'
  use 'Pocco81/true-zen.nvim'
  use 'ThePrimeagen/harpoon'
  use 'echasnovski/mini.bracketed'
  use { 'folke/trouble.nvim',
    event = 'VimEnter',
    cmd = { 'TroubleToggle', "Trouble" },
  }

  -- git
  use { 'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    wants = 'plenary.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use { 'TimUntersberger/neogit',
    cmd = 'Neogit',
  }

  -- lang
  use 'ray-x/go.nvim'
  use 'olexsmir/gopher.nvim'
  use 'lervag/vimtex'
  use 'nvim-orgmode/orgmode'
  use 'akinsho/org-bullets.nvim'
  -- use 'frabjous/knap'

  -- themes
  use "sainnhe/gruvbox-material"

  if packer_bootstrap then
    require('packer').sync()
  end
end

local packer = require 'packer'

packer.init(config)
packer.startup(plugins)
