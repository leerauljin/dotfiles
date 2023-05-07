local map = vim.keymap.set -- for conciseness

return {
  {
    'lukas-reineke/indent-blankline.nvim',
    event = "BufRead",
    config = {
      show_current_context = true,
      show_current_context_start = false,
    },
  },
  {
    'windwp/nvim-autopairs',
    event = "BufRead",
    opts = function()
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
      return {
        options = {
          disable_filetype = { "TelescopePrompt", "vim" },
        }
      }
    end,
  },
  {
    'numToStr/Comment.nvim',
    event = "BufRead",
    opts = function()
      require("Comment").setup()
    end,
  },
  'tpope/vim-repeat',
  'ggandor/lightspeed.nvim',
  {
    'tpope/vim-surround',
    event = "BufRead",
  },
  {
    'github/copilot.vim',
    event = 'VimEnter',
  },
  {
    'NvChad/nvim-colorizer.lua',
    event = "BufRead",
    config = {
      user_default_options = {
        AARRGGBB = true,
      }
    }
  },
  {
    'filipdutescu/renamer.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = {
      title = '',
      border_chars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    }
  },
  'echasnovski/mini.bracketed',

  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = { '<space>m' },
    opts = function()
      require('treesj').setup({
        use_default_keymaps = false
      })
      map('n', '<leader>m', require('treesj').toggle, { desc = "split/join" })
    end
  },
  {
    'RRethy/vim-illuminate',
    event = "BufRead",
    config = function()
      require("illuminate").configure()
    end,
  },


  -- git
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    wants = 'plenary.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
