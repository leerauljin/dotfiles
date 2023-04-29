local ok, wk = pcall(require, 'which-key')
if not ok then return end


local conf = {
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "  ", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },

    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },

    window = {
        border = 'single',
        position = 'bottom',
    },

    layout = {
        spacing = 6, -- spacing between columns
    },

    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>",
        "call", "lua", "^:", "^ " },


    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        i = { "j", "k" },
        n = { "d", "y", "c" },
        v = { "j", "k" },
    },
}

wk.setup(conf)

local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}
local nopts = {
    mode = "n", -- Normal mode
    prefix = "",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

local vopts = {
    mode = "v", -- Visual mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

local leader_maps = {
    s = { ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", "replace word" },
    S = { ":%s/<C-r><C-w>/<C-r>0/g<CR>", "replace word with register" },
    x = { "<cmd>!chmod +x %<CR>", "chmod +x" },
    p = { vim.lsp.buf.format, "prettify" },
    c = { "<cmd>Telescope spell_suggest<cr>", "suggest spell" },
    q = {
        name = "+quit",
        l = { "<cmd>SessionLoad<cr>", "reload last session" },
        L = { "<cmd>Telescope persisted<cr>", "choose last session" },
        s = { ":xa <CR>", "save all files and quit" },
        q = { ":qa <CR>", "quit all" },
        Q = { ":qa! <CR>", "quit all without saving" },

    },
    ["<leader>"] = { "<cmd>Telescope find_files<cr>", "find files" },
    f = {
        name = "+file",
        s = { ":w <CR>", "save file" },
        n = { ":e ", "new file" },
        S = { ":w ", "save file as" },
        R = { ":sav ", "rename file" },
        a = { ":wa <CR>", "save all files" },
        f = { "<cmd>Telescope find_files<cr>", "find files" },
        b = { "<cmd>Telescope file_browser<cr>", "open file browser" },
        o = { "<cmd>Telescope oldfiles<cr>", "open recent file" },
        w = { "<cmd>Telescope live_grep<cr>", "live grep" },
    },
    [","] = { "<cmd>Telescope buffers<cr>", "switch buffer" },
    ['<TAB>'] = {":bnext <CR>", "next buffer"},
    ['<S-TAB>'] = {":bprev <CR>", "previous buffer"},
    b = {
        name = "+buffer",
        b = { "<cmd>Telescope buffers<cr>", "switch buffer" },
        n = { "<cmd> enew <CR>", "new buffer" },
        s = { ":w <CR>", "save buffer" },
        S = { ":wa <CR>", "save all buffers" },
        q = { ":bd <CR>", "kill buffer" },
        Q = { ":bd! <CR>", "kill buffer without saving" },
        r = { ":bufdo :e <CR>", "refresh buffers" },
        m = { "<cmd>Telescope marks<cr>", "search marks" },
    },
    w = {
        name = "+windows",
        v = { "<C-w>v", "split window vertically" },
        s = { "<C-w>s", "split window horizontally" },
        e = { "<C-w>=", "eqaulize split window" },
        q = { ":close<CR>", "close window" },
        m = { ":MaximizerToggle<CR>", "maximize split window" },

        h = { "<C-w>h", "window left" },
        l = { "<C-w>l", "window right" },
        j = { "<C-w>j", "window down" },
        k = { "<C-w>k", "window up" },

        ["+"] = { "<C-w>+", "increase height" },
        ["-"] = { "<C-w>-", "decrease height" },
        [">"] = { "<C-w>>", "increase width" },
        ["<"] = { "<C-w><", "decrease width" },
    },
    h = {
        name = "+help",

        t = { ":Telescope colorscheme<cr>", "change colorscheme" },
        h = { ":Telescope help_tags<cr>", "search help tags" },
        k = { ":Telescope keymaps<cr>", "search keymaps" },
        s = { ":PackerSync<CR>", "sync packages" },
        p = { ":PackerProfile<CR>", "packer profile" },
        l = { ":LspRestart<CR>", "restart lsp" },
    },
    t = {
        name = "+toggle",
        l = { ":set nu! rnu!<CR>", "toggle line number" },
        L = { ":set rnu!<CR>", "toggle relative number" },
        d = { ":TroubleToggle<CR>", "toggle trouble lsp diagnostics" },
        t = { ":TodoTrouble<CR>", "toggle todo list" },
        e = { ":NvimTreeToggle<cr>", "file explorer" },
    },
    g = {
        name = "+git",
        g = { ":Neogit kind=split<cr>", "open neogit (split)" },
        G = { ":Neogit<cr>", "open neogit (fullscreen)" },
        c = { ":Neogit commit<cr>", "git commit" },
    },
    r = { ":Telescope bibtex<cr>", "find citation" }

}

wk.register(leader_maps, opts)

local normal_maps = {
    g = {
        h = { "^", "begining of line" },
        l = { "$", "end of line" },
        r = { "<cmd>lua require('renamer').rename()<cr>", "rename" },
        d = { "<cmd>Lspsaga peek_definition<CR>", "peek definition" },
        k = { function() vim.diagnostic.open_float() end, "open diagnostic" },
        a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code action" },
    },
    m = {"%"},
}
wk.register(normal_maps, nopts)


-- harpoon
local ok, _ = pcall(require, 'harpoon')
if not ok then return end

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local harpoon_maps = {
    j = {
        name = "+harpoon",
        j = { mark.add_file, "add file" },
        q = { ui.toggle_quick_menu, "quick menu" },
        a = { function() ui.nav_file(1) end, "harpoon to file 1" },
        s = { function() ui.nav_file(2) end, "harpoon to file 2" },
        d = { function() ui.nav_file(3) end, "harpoon to file 3" },
        f = { function() ui.nav_file(4) end, "harpoon to file 4" },
    },
}
wk.register(harpoon_maps, opts)


local ok, _ = pcall(require, 'true-zen')
if not ok then return end
local zen_maps = {
    t = {
        a = { ":TZAtaraxis<CR>", 'ataraxis' },
        m = { ":TZMinimalist<CR>", 'minimalist' },
        n = { ":'<,'>TZNarrow<CR>", 'narrow' },
    }
}

local zen_vmaps = {
    t = {
        n = { ":'<,'>TZNarrow<CR>", 'narrow' },
    }
}

wk.register(zen_maps, opts)
wk.register(zen_vmaps, vopts)
