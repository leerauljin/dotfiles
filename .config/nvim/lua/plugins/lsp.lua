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

      local py_config = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        }
      }

      local cmp = require('cmp')
      local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-e>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil,
      })



      local nvim_cmp_conf = {
        documentation = {
          border = 'single',
          -- border = "none",
          winhighlight = "Normal:NormalFloat,FloatBorder:NormalFloat",
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
        'pyright',
        'rust_analyzer'
      }

      lsp.configure('lua_ls', lua_config)
      lsp.configure('pyright', py_config)

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

      local ls = require("luasnip")
      -- TODO make below work
      -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-snippets" } })

      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node

      ls.add_snippets("tex", {
        s("cp", {
          t("\\citep{"), i(1, "citekey"), t("}"), i(0)
        }),
        s("ct", {
          -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
          t("\\citet{"), i(1, "citekey"), t("}"), i(0)
        }),
        s("trigger", {
          t({ "After expanding, the cursor is here ->" }), i(1),
          t({ "", "After jumping forward once, cursor is here ->" }), i(2),
          t({ "", "After jumping once more, the snippet is exited there ->" }), i(0),
        })
      })
    end,
  },
  'jose-elias-alvarez/null-ls.nvim',
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    dependencies = { 'jayp0521/mason-null-ls.nvim', }
  },
}
