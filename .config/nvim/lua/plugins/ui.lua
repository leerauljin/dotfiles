return {
  -- icons
  'kyazdani42/nvim-web-devicons',

  -- status line
  {
    'nvim-lualine/lualine.nvim',
    opts = function()
      local custom_base16 = require 'lualine.themes.base16'
      custom_base16.normal.c.fg = '#464646'

      return {
        options = {
          icons_enabled = true,
          theme = custom_base16,
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
    config = function()
      require("oil").setup({
        keymaps = {
          ["H"] = "actions.parent",
          ["L"] = "actions.select",
          ["J"] = "actions.open_cwd",
        }
      })
      vim.keymap.set("n", "<leader>j", require("oil").open, { desc = "Open parent directory" })
    end,
  },

  -- tmux & windows
  'szw/vim-maximizer',
  'christoomey/vim-tmux-navigator',

  -- zen mode
  {
    'Pocco81/true-zen.nvim',
    config = function()
      local zen = require('true-zen')
      local opts = {
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
      }

      zen.setup(opts)

      local wk = require('which-key')
      wk.register({
        t = {
          a = { ":TZAtaraxis<CR>", 'ataraxis' },
          m = { ":TZMinimalist<CR>", 'minimalist' },
          n = { ":'<,'>TZNarrow<CR>", 'narrow' },
        }
      }, { prefix = "<leader>" })
      wk.register({
        t = {
          n = { ":'<,'>TZNarrow<CR>", 'narrow' },
        }
      }, { prefix = "<leader>", mode = "v" })
    end
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

  -- dashboard
  {
    'goolord/alpha-nvim',
    opts = function()
      local dashboard               = require 'alpha.themes.dashboard'

      dashboard.section.header.val  = {
        [[                                  __]],
        [[     ___     ___    ___   __  __ /\_\    ___ ___]],
        [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
        [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
        [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      }
      dashboard.section.buttons.val = {

        dashboard.button('SPC SPC', '  Find File  ', ':Telescope find_files<CR>'),
        dashboard.button('SPC f o', '  Recent File  ', ':Telescope oldfiles<CR>'),
        dashboard.button('SPC f w', '  Find Word  ', ':Telescope live_grep<CR>'),
        dashboard.button('SPC b m', '  Bookmarks  ', ':Telescope marks<CR>'),
        dashboard.button('SPC h t', '  Themes  ', ':Telescope themes<CR>'),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = 'AlphaButtons'
        button.opts.hl_shortcut = 'AlphaShortcut'
      end
      -- dashboard.section.header.opts.hl = "Keyword"
      -- dashboard.section.buttons.opts.hl = "AlphaButtons"
      -- dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.opts.layout[1].val = 5
      return dashboard.opts
    end,
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
