return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    opts = function()
      local ts = require("nvim-treesitter.configs")
      ts.setup {
        ignore_install = {},
        ensure_installed = { 'org' },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'org' },
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
    end
  },
}
