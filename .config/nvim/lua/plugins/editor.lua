return {
  {
    'lukas-reineke/indent-blankline.nvim',
    event = "BufRead",
    options = {
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
    'norcalli/nvim-colorizer.lua',
    event = "BufRead",
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
  -- git
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    wants = 'plenary.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
