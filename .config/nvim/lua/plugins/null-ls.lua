return {
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'jayp0521/mason-null-ls.nvim', },
    opts = function()
      local null_ls = require("null-ls")
      local mason_null_ls = require("mason-null-ls")

      local sources = {
        -- yaml
        null_ls.builtins.formatting.yamlfmt,
        null_ls.builtins.diagnostics.yamllint,

        -- python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.diagnostics.flake8,
        -- null_ls.builtins.diagnostics.pylint,

        -- go
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.diagnostics.golangci_lint,

        -- markdown
        null_ls.builtins.diagnostics.write_good,
        null_ls.builtins.diagnostics.alex,
      }
      null_ls.setup {
        sources = sources
      }

      mason_null_ls.setup {
        automatic_setup = true,
        automatic_installation = true,
      }
    end
  },
}
