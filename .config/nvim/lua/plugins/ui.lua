return {
  -- icons
  'kyazdani42/nvim-web-devicons',
  -- status line
  {
    'nvim-lualine/lualine.nvim',
    opts = function()
      return {
        options = {
          icons_enabled = true,
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
  -- tabline
  {
    'romgrk/barbar.nvim',
    init = function() vim.g.barbar_auto_setup = false end,
    event = 'BufRead',
    opts = {
      animation = false,
      auto_hide = 1,
      sidebar_filetypes = {
        NvimTree = true,
      },
      icons = {
        separator = { left = '', right = '' },
        inactive = {
          separator = { left = '', right = '' },
        },
        separator_at_end = false,
      }
    },
    keys = {
      { '<M-1>',     "<Cmd>BufferGoto 1<CR>" },
      { '<M-2>',     "<Cmd>BufferGoto 2<CR>" },
      { '<M-3>',     "<Cmd>BufferGoto 3<CR>" },
      { '<M-4>',     "<Cmd>BufferGoto 4<CR>" },
      { '<M-5>',     "<Cmd>BufferGoto 5<CR>" },
      { '<M-6>',     "<Cmd>BufferGoto 6<CR>" },
      { '<M-7>',     "<Cmd>BufferGoto 7<CR>" },
      { '<M-8>',     "<Cmd>BufferGoto 8<CR>" },
      { '<M-9>',     "<Cmd>BufferGoto 9<CR>" },
      { '<M-0>',     "<Cmd>BufferLast<CR>" },
      { '<leader>,', "<Cmd>BufferPick<CR>",  desc = "switch buffer" },
    },
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
    },
    keys = {
      { '<leader>te', ":NvimTreeToggle<CR>", mode = { "n", "v" }, desc = "file explorer" },
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
    'folke/zen-mode.nvim',
    opts = {
      window = {
        height = 0.85,
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0, -- turn off the statusline in zen mode
        },
        tmux = { enabled = false },
        kitty = {
          enabled = true,
          font = "+4", -- font size increment
        },
      },
    },
    keys = {
      { '<leader>tz', ":ZenMode<CR>", mode = { "n", "v" }, desc = "zen" },
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
