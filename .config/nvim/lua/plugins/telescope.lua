return {
  -- search engine
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "debugloop/telescope-undo.nvim",
    },
    cmd = "Telescope",
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = telescope.extensions.file_browser.actions

      -- configure telescope
      telescope.setup({
        defaults = {
          prompt_prefix = "",
          selection_caret = "  ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          results_title = false,
          prompt_title = false,
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              width = 0.6,
              height = 0.4,
            },
            preview_cutoff = 120,
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { "node_modules" },
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { "truncate" },
          winblend = 0,
          border = true,
          -- borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          color_devicons = false,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          mappings = {
            n = { ["q"] = actions.close },
          },
        },
        pickers = {
          buffers = {
            mirror = false,
            initial_mode = "insert",
            layout_strategy = "vertical",
            previewer = false,
          },
        },
        extensions = {
          file_browser = {
            -- theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            grouped = true,
            initial_mode = "normal",
            mappings = {
              ["n"] = {
                ["H"] = fb_actions.goto_parent_dir,
                ["L"] = actions.select_default,
              }
            },
          },
        },
      })

      telescope.load_extension("file_browser")
      telescope.load_extension("ui-select")
      telescope.load_extension("undo")
    end,
  },
}
