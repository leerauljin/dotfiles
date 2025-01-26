return {
  -- icons
  'kyazdani42/nvim-web-devicons',

  -- status line
  {
    'nvim-lualine/lualine.nvim',
    opts = function()
      local gruv_harder = require 'lualine.themes.gruvbox-material'
      local harder_bg = '#1d2021'
      gruv_harder.normal.b.bg = harder_bg
      gruv_harder.normal.c.bg = harder_bg

      return {
        options = {
          icons_enabled = true,
          theme = gruv_harder,
          section_separators = '',
          component_separators = '',
          globalstatus = true,
        },
        sections = {
          lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
          lualine_b = {},
          lualine_c = { 'branch', 'diff', 'diagnostics' },
          lualine_x = { 'filename', 'location' },
          lualine_y = {},
          lualine_z = {}
        },
      }
    end,
  },

  -- file tree
  {
    'nvim-tree/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    opts = {
      filters = {
        dotfiles = false,
        custom = { '.DS_Store', '.git' }
      },
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = false,
      },
      view = {
        adaptive_size = true,
        side = 'left',
        width = 20,
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 400,
      },
      filesystem_watchers = {
        enable = true,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      renderer = {
        -- highlight_git = false,
        highlight_opened_files = 'name',
        root_folder_label = false,
        indent_markers = {
          enable = true,
        },
        icons = {
          webdev_colors = false,
          show = {
            file = false,
            folder = true,
            folder_arrow = false,
            git = true,
          },
        },
      },
    }
  },

  {
    'stevearc/oil.nvim',
    opts = {
      keymaps = {
        ["H"] = "actions.parent",
        ["L"] = "actions.select",
        ["J"] = "actions.open_cwd",
      }
    },
    keys = {
      { '<leader>j', function() require("oil").open() end, mode = { "n" }, desc = "open parent directory" },
    },
  },

  -- tmux & windows
  'szw/vim-maximizer',
  'christoomey/vim-tmux-navigator',

  -- zen mode
  {
    'Pocco81/true-zen.nvim',
    opts = {
      modes = {
        ataraxis = {
          minimum_writing_area = { width = 100, height = 44 }
        }
      },
      integrations = {
        tmux = false,
        kitty = {
          -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
          enabled = false,
          font = '+3'
        },
        lualine = true -- hide nvim-lualine (ataraxis)
      },
    },
    keys = {
      { '<leader>ta', ":TZAtaraxis<CR>",    mode = { "n" },      desc = "ataraxis" },
      { '<leader>tm', ":TZMinimalist<CR>",  mode = { "n" },      desc = "minimalist" },
      { '<leader>tn', ":'<,'>TZNarrow<CR>", mode = { "n", "v" }, desc = "narrow" },
    },
  },
  -- diagnostics
  {
    'folke/trouble.nvim',
    event = 'VimEnter',
    cmd = { 'TroubleToggle', 'Trouble' },
    opts = {
      height = 5,
      auto_preview = false,
      use_diagnostic_sings = true,
    },
  },
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    event = 'VimEnter',
    opts = {
      text = { spinner = 'dots_snake' },
      window = { blend = 0 },
    },
  }
}
