return {
  {
    'folke/which-key.nvim',
    config = function()
      local wk = require('which-key')
      local conf = {
        layout = {
          spacing = 6, -- spacing between columns
        },

        triggers_blacklist = {
          i = { "j", "k" },
          n = { "d", "y", "c" },
          v = { "j", "k" },
        },
      }

      wk.setup(conf)

      -- leader maps
      wk.register({
        s = { ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", "replace word" },
        S = { ":%s/<C-r><C-w>/<C-r>0/g<CR>", "replace word with register" },
        x = { "<cmd>!chmod +x %<CR>", "chmod +x" },
        p = { vim.lsp.buf.format, "prettify" },
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
        ['<TAB>'] = { ":bnext <CR>", "next buffer" },
        ['<S-TAB>'] = { ":bprev <CR>", "previous buffer" },
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
        u = { ":Telescope undo<cr>", "undo history" },
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
          l = { ":Lazy<CR>", "lazy" },
          r = { ":LspRestart<CR>", "restart lsp" },
        },
        t = {
          name = "+toggle",
          l = { ":set nu! rnu!<CR>", "toggle line number" },
          L = { ":set rnu!<CR>", "toggle relative number" },
          d = { ":TroubleToggle<CR>", "toggle trouble lsp diagnostics" },
          e = { ":NvimTreeToggle<cr>", "file explorer" },
        },
        g = {
          name = "+git",
          g = { ":Neogit kind=split<cr>", "open neogit (split)" },
          G = { ":Neogit<cr>", "open neogit (fullscreen)" },
          c = { ":Neogit commit<cr>", "git commit" },
        },
      }, { prefix = "<leader>" })

      -- normal mode map
      wk.register({
        g = {
          h = { "^", "begining of line" },
          l = { "$", "end of line" },
          r = { "<cmd>lua require('renamer').rename()<cr>", "rename" },
          k = { function() vim.diagnostic.open_float() end, "open diagnostic" },
          a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code action" },
        },
        m = { "%" },
      })
    end
  },
}
