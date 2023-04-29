local status, lualine = pcall(require, "lualine")
if (not status) then return end

local modes = {
    ['n']   = ' ',
    ['no']  = ' ',
    ['nov'] = ' ',
    ['noV'] = ' ',
    ['no'] = ' ',
    ['niI'] = ' ',
    ['niR'] = ' ',
    ['niV'] = ' ',

    ['i']  = ' ',
    ['ic'] = ' ',
    ['ix'] = ' ',
    ['s']  = ' ',
    ['S']  = ' ',

    ['v']  = ' ',
    ['V']  = ' ',
    ['']  = ' ',
    ['r']  = '﯒ ',
    ['r?'] = ' ',
    ['c']  = ' ',
    ['t']  = ' ',
    ['!']  = ' ',
    ['R']  = ' ',
}
local function get_mode()
    local mode_code = vim.api.nvim_get_mode().mode
    if modes[mode_code] == nil then
        return mode_code
    end
    return modes[mode_code]
end

lualine.setup {
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
