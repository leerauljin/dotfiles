local ok, alpha = pcall(require, "alpha")
if not ok then return end

local dashboard = require "alpha.themes.dashboard"

-- dynamic header padding
local fn = vim.fn
local marginTopPercent = 0.3
local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }

local options = {

    header = {
        type = "text",
        -- from oxocarbon
        val = {
            "         _..._         _..._         _..._         _..._         _..._         ",
            "       .:::::::.     .::::. `.     .::::  `.     .::'   `.     .'     `.       ",
            "      :::::::::::   :::::::.  :   ::::::    :   :::       :   :         :      ",
            "      :::::::::::   ::::::::  :   ::::::    :   :::       :   :         :      ",
            "      `:::::::::'   `::::::' .'   `:::::   .'   `::.     .'   `.       .'      ",
            "        `':::''       `'::'-'       `'::.-'       `':..-'       `-...-'        ",
        },
        opts = {
            position = "center",
            hl = "Number",
        },
    },

    buttons = {
        type = "group",
        val = {
            dashboard.button("SPC SPC", "  Find File  ", ":Telescope find_files<CR>"),
            dashboard.button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
            dashboard.button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
            dashboard.button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
            dashboard.button("SPC h t", "  Themes  ", ":Telescope themes<CR>"),
        },
        opts = {
            spacing = 1,
        },
    },
    headerPaddingTop = { type = "padding", val = headerPadding },
    headerPaddingBottom = { type = "padding", val = 2 },
}


alpha.setup {
    layout = {
        options.headerPaddingTop,
        options.header,
        options.headerPaddingBottom,
        options.buttons,
        options.headerPaddingBottom,
    },
    opts = {},
}
