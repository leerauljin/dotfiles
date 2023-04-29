local status, tree = pcall(require, "nvim-tree")
if (not status) then return end

tree.setup {
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
