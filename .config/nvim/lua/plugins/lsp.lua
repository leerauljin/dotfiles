return {
  -- lsp & syntax highlighting
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      -- required
      { 'neovim/nvim-lspconfig' },
      -- optional
      {
        'williamboman/mason.nvim',
      },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      -- required
      { 'hrsh7th/nvim-cmp', },
      { 'hrsh7th/cmp-nvim-lsp' },
      {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        run = "make install_jsregexp",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end
      },

      -- optional
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
    },
    opts = function()
      local ok, lsp = pcall(require, 'lsp-zero')
      if not ok then return end

      local kind_symbols = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
      }

      local function get_symbol(kind)
        local symbol = kind_symbols[kind]
        return symbol or ""
      end

      local lua_config = {
        settings = {
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        }
      }

      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
      end

      local cmp_mappings = lsp.defaults.cmp_mappings({
        ["<CR>"] = vim.NIL,

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
          -- elseif require("copilot.suggestion").is_visible() then
          --   require("copilot.suggestion").accept()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      local nvim_cmp_conf = {
        documentation = {
          border = 'single',
          -- border = "none",
          winhighlight = "Normal:NormalFloat,FloatBorder:NormalFloat",
        },
        completion = {
          completeopt = 'menu,menuone,noinsert'
        },
        mapping = cmp_mappings,
        -- VS Code style (icon first)
        formatting = {
          format = function(_, vim_item)
            vim_item.kind = string.format("%s %s", get_symbol(vim_item.kind), vim_item.kind)
            vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
            return vim_item
          end,
        },
      }

      local lsp_pref = {
        suggest_lsp_servers = false,
        set_lsp_keymaps = false,
      }

      lsp.preset('recommended')
      lsp.ensure_installed {
        'lua_ls',
        'pylsp',
      }

      lsp.configure('lua_ls', lua_config)

      lsp.set_preferences(lsp_pref)
      lsp.setup_nvim_cmp(nvim_cmp_conf)

      lsp.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })

      lsp.setup()

      vim.diagnostic.config {
        -- virtual_text = false,
        virtual_text = {
          prefix = '▪',
          severity = { min = vim.diagnostic.severity.WARN }
        },
        update_in_insert = true,
        float = {
          source = "if_many",
        },
      }
    end,
  },
}
