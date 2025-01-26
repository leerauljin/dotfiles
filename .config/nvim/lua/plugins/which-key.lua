return {
  {
    'folke/which-key.nvim',
    config = function()
      local wk = require('which-key')
      local conf = {
        layout = {
          spacing = 6, -- spacing between columns
        },

        -- triggers_blacklist = {
        --   i = { "j", "k" },
        --   n = { "d", "y", "c" },
        --   v = { "j", "k" },
        -- },
      }

      wk.setup(conf)

      wk.add({
        -- leader maps
        -- basics
        { "<leader><TAB>", ":bnext <CR>", desc = "next buffer" },
        { "<leader><S-TAB>", ":bprev <CR>", desc = "previous buffer" },
        { "<leader>,", "<cmd>Telescope buffers<cr>", desc = "switch buffer" },
        { "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "find files" },
        { "<leader>s", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", desc = "replace word" },
        { "<leader>S", ":%s/<C-r><C-w>/<C-r>0/g<CR>", desc = "replace word with register" },
        { "<leader>p", vim.lsp.buf.format, desc = "prettify" },
        { "<leader>u", ":Telescope undo<cr>", desc = "undo history" },
        { "<leader>x", "<cmd>!chmod +x %<CR>", desc = "chmod +x" },
        { "<leader>n", "<cmd>lua require('renamer').rename()<cr>", desc = "rename" },

        -- buffer
        { "<leader>b", group = "buffer" },
        { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "switch buffer" },
        { "<leader>bm", "<cmd>Telescope marks<cr>", desc = "search marks" },
        { "<leader>bn", "<cmd> enew <CR>", desc = "new buffer" },
        { "<leader>bq", ":bd <CR>", desc = "kill buffer" },
        { "<leader>bQ", ":bd! <CR>", desc = "kill buffer without saving" },
        { "<leader>br", ":bufdo :e <CR>", desc = "refresh buffers" },
        { "<leader>bs", ":w <CR>", desc = "save buffer" },
        { "<leader>bS", ":wa <CR>", desc = "save all buffers" },

        -- file
        { "<leader>f", group = "file" },
        { "<leader>fa", ":wa <CR>", desc = "save all files" },
        { "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "open file browser" },
        { "<leader>fd", "<cmd>cd :%h <CR>", desc = "set file dir as working dir" },
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files" },
        { "<leader>fn", ":e ", desc = "new file" },
        { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "open recent file" },
        { "<leader>fR", ":sav ", desc = "rename file" },
        { "<leader>fs", ":w <CR>", desc = "save file" },
        { "<leader>fS", ":w ", desc = "save file as" },
        { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "live grep" },

        -- git
        { "<leader>g", group = "git" },
        { "<leader>gG", ":Neogit<cr>", desc = "open neogit (fullscreen)" },
        { "<leader>gc", ":Neogit commit<cr>", desc = "git commit" },
        { "<leader>gg", ":Neogit kind=split<cr>", desc = "open neogit (split)" },

        -- help
        { "<leader>h", group = "help" },
        { "<leader>hh", ":Telescope help_tags<cr>", desc = "search help tags" },
        { "<leader>hk", ":Telescope keymaps<cr>", desc = "search keymaps" },
        { "<leader>hl", ":Lazy<CR>", desc = "lazy" },
        { "<leader>hr", ":LspRestart<CR>", desc = "restart lsp" },
        { "<leader>ht", ":Telescope colorscheme<cr>", desc = "change colorscheme" },

        -- quit
        { "<leader>q", group = "quit" },
        { "<leader>ql", "<cmd>SessionLoad<cr>", desc = "reload last session" },
        { "<leader>qL", "<cmd>Telescope persisted<cr>", desc = "choose last session" },
        { "<leader>qq", ":qa <CR>", desc = "quit all" },
        { "<leader>qQ", ":qa! <CR>", desc = "quit all without saving" },
        { "<leader>qs", ":xa <CR>", desc = "save all files and quit" },

        -- toggle
        { "<leader>t", group = "toggle" },
        { "<leader>tL", ":set rnu!<CR>", desc = "toggle relative number" },
        { "<leader>td", ":TroubleToggle<CR>", desc = "toggle trouble lsp diagnostics" },
        { "<leader>te", ":NvimTreeToggle<cr>", desc = "file explorer" },
        { "<leader>tl", ":set nu! rnu!<CR>", desc = "toggle line number" },

        -- window
        { "<leader>w", group = "windows" },
        { "<leader>w+", "<C-w>+", desc = "increase height" },
        { "<leader>w-", "<C-w>-", desc = "decrease height" },
        { "<leader>w<", "<C-w><", desc = "decrease width" },
        { "<leader>w>", "<C-w>>", desc = "increase width" },
        { "<leader>we", "<C-w>=", desc = "eqaulize split window" },

        { "<leader>wh", "<C-w>h", desc = "window left" },
        { "<leader>wj", "<C-w>j", desc = "window down" },
        { "<leader>wk", "<C-w>k", desc = "window up" },
        { "<leader>wl", "<C-w>l", desc = "window right" },

        { "<leader>wm", ":MaximizerToggle<CR>", desc = "maximize split window" },
        { "<leader>wq", ":close<CR>", desc = "close window" },
        { "<leader>ws", "<C-w>s", desc = "split window horizontally" },
        { "<leader>wv", "<C-w>v", desc = "split window vertically" },
      },
      {
        mode = { "n" },
        { "gh", "^", desc = "begining of line" },
        { "gl", "$", desc = "end of line" },
        { "gk", function() vim.diagnostic.open_float() end, desc = "open diagnostic" },
        { "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "code action" },
        })
    end
  },
}
