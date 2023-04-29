local g = vim.g
local o = vim.o
local viewer = "zathura"

g.vimtex_view_method = viewer
g.vimtex_view_general_viewer = viewer
g.tex_conceal = 'abdmg'
g.vimtex_quickfix_mode = 0
o.conceallevel = 0
o.spell=true
o.spelllang = 'en'
o.textwidth = 0

g.vimtex_toc_config = {
    mode = 1,
    fold_enable = 0,
    hide_line_numbers = 1,
    resize = 0,
    refresh_always = 1,
    show_help = 0,
    show_numbers = 1,
    split_pos = 'leftabove',
    split_width = 30,
    tocdeth = 3,
    indent_levels = 1,
    todo_sorted = 1,
}

