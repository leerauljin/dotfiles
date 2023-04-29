local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    ignore_install = {},
    ensure_installed = {'org'},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = {'org'},
        disable = { "markdown", 'latex' },
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    auto_install = true,
}
