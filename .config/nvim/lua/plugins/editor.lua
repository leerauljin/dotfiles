return {
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    main = 'ibl',
    opts = {
      indent = {
        char = '┊'
      }
    }
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      options = {
        disable_filetype = { 'TelescopePrompt', 'vim' },
        check_ts = true,
      }
    },
    config = function(_, opts)
      local autopairs = require('nvim-autopairs')
      autopairs.setup(opts)

      -- make cmp and autopairs work together
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
  },
  {
    'numToStr/Comment.nvim',
    event = 'BufRead',
    opts = {},
  },
  'tpope/vim-repeat',
  'ggandor/lightspeed.nvim',
  {
    'tpope/vim-surround',
    event = 'BufRead',
  },
  {
    'NvChad/nvim-colorizer.lua',
    event = 'BufRead',
    opts = {
      user_default_options = {
        AARRGGBB = true,
      }
    }
  },
  {
    'filipdutescu/renamer.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      title = '',
      border_chars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
    keys = {
      {
        '<F2>',
        function()
          require('renamer').rename()
        end,
        desc = 'rename'
      }
    },
  },
  'echasnovski/mini.bracketed',
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = { use_default_keymaps = false, },
    keys = {
      { '<leader>m', function() require('treesj').toggle() end, desc = 'split/join' }
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      open_mapping = [[<c-`>]],
      shade_terminals = false,
    }
  },
  -- git
  {
    'lewis6991/gitsigns.nvim',
    event = 'VimEnter',
    opts = {},
  },
}
