return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    main = "ibl",
    opts = {
      indent = {
        char = "┊",
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      options = {
        disable_filetype = { "TelescopePrompt", "vim" },
        check_ts = true,
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    opts = {},
  },
  "tpope/vim-repeat",
  "ggandor/lightspeed.nvim",
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufRead",
    opts = {
      user_default_options = {
        AARRGGBB = true,
      },
    },
  },
  {
    "filipdutescu/renamer.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      title = "",
      border_chars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
    keys = {
      {
        "<F2>",
        function()
          require("renamer").rename()
        end,
        desc = "rename",
      },
    },
  },
  "echasnovski/mini.bracketed",
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { use_default_keymaps = false },
    keys = {
      {
        "<leader>m",
        function()
          require("treesj").toggle()
        end,
        desc = "split/join",
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<c-`>]],
      shade_terminals = false,
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "mystylua" },
        python = { "isort", "black" },
        quarto = { "injected" },
        r = { lsp_format = "fallback" },
      },
      formatters = {
        mystylua = {
          command = "stylua",
          args = { "--indent-type", "Spaces", "--indent-width", "2", "-" },
        },
      },
    },
    keys = {
      {
        "<leader>p",
        function()
          require("conform").format()
        end,
        desc = "format",
      },
    },
  },
  -- git
  {
    "lewis6991/gitsigns.nvim",
    event = "VimEnter",
    opts = {},
  },
}
