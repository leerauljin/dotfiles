local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')

-- configure telescope
telescope.setup {
    defaults = {
        prompt_prefix = "",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        -- sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        results_title = false,
        prompt_title = false,
        layout_config = {
            horizontal = {
                prompt_position = "bottom",
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
            initial_mode = "normal",
            layout_strategy = "vertical",
            previewer = false,
        }
    },
    extensions = {
        file_browser = {
            -- theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
        },
        bibtex = {
            global_files = { "/Users/seonjinlee/Dropbox/200_Academic/240_Writings/249_Resources/zotero.bib" }
        }
    },
}

telescope.load_extension("file_browser")
telescope.load_extension("ui-select")
telescope.load_extension("bibtex")
