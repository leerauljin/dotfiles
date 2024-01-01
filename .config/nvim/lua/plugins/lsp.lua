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
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
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
      local cmp_action = require('lsp-zero').cmp_action()
      local cmp_mappings = lsp.defaults.cmp_mappings({
        ["<Tab>"] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        ['<C-e>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
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
          format = function(entry, vim_item)
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
