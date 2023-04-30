return {
  -- core
  'kyazdani42/nvim-web-devicons',
  {
    'nvim-lualine/lualine.nvim',
    opts = function()
      local modes = {
        ['n']   = ' ',
        ['no']  = ' ',
        ['nov'] = ' ',
        ['noV'] = ' ',
        ['no'] = ' ',
        ['niI'] = ' ',
        ['niR'] = ' ',
        ['niV'] = ' ',

        ['i']   = ' ',
        ['ic']  = ' ',
        ['ix']  = ' ',
        ['s']   = ' ',
        ['S']   = ' ',

        ['v']   = ' ',
        ['V']   = ' ',
        ['']   = ' ',
        ['r']   = '﯒ ',
        ['r?']  = ' ',
        ['c']   = ' ',
        ['t']   = ' ',
        ['!']   = ' ',
        ['R']   = ' ',
      }

      local function get_mode()
        local mode_code = vim.api.nvim_get_mode().mode
        if modes[mode_code] == nil then
          return mode_code
        end
        return modes[mode_code]
      end

      return {
        options = {
          icons_enabled = true,
          theme = 'gruvbox-material',
          section_separators = '',
          component_separators = '',
          globalstatus = true,
        },
        sections = {
          lualine_a = { get_mode },
          lualine_b = {},
          lualine_c = { 'branch', 'diff', 'diagnostics' },
          lualine_x = { { 'filetype', icon_only = true }, 'filename', 'location' },
          lualine_y = {},
          lualine_z = {}
        },
      }
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    cmd = "NvimTreeToggle",
    config = {
      filters = {
        dotfiles = false,
        custom = { ".DS_Store", ".git" }
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
        side = "left",
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
        highlight_opened_files = "name",
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
  }
}
