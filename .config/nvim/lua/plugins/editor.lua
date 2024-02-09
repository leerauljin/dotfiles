local map = vim.keymap.set -- for conciseness

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
    event = 'BufRead',
    config = function()
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())

      local Rule = require('nvim-autopairs.rule')
      local npairs = require('nvim-autopairs')

      npairs.setup(
        {
          options = {
            disable_filetype = { 'TelescopePrompt', 'vim' },
            check_ts = true,
          }
        })
      npairs.remove_rule('`')
      npairs.add_rule(Rule("`", "'", "stata"))
      npairs.add_rule(Rule("`", "`", "-stata"))
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
    -- setup taken from redrikaverpil/dotfiles
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          accept = false, -- disable built-in keymapping
        },
      })

      -- hide copilot suggestions when cmp menu is open
      -- to prevent odd behavior/garbled up suggestions
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if cmp_status_ok then
        cmp.event:on("menu_opened", function()
          vim.b.copilot_suggestion_hidden = true
        end)

        cmp.event:on("menu_closed", function()
          vim.b.copilot_suggestion_hidden = false
        end)
      end
    end,
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
    }
  },
  'echasnovski/mini.bracketed',

  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = { '<space>m' },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false
      })
      map('n', '<leader>m', require('treesj').toggle, { desc = 'split/join' })
    end
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
