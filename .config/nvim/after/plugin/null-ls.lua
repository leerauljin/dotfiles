local ok1, null_ls = pcall(require, "null-ls")
if not ok1 then return end
local ok2, mason_null_ls = pcall(require, "mason-null-ls")
if not ok2 then return end

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


-- will setup any installed and configured sources above
null_ls.setup {
    sources = sources
}

mason_null_ls.setup {
    automatic_setup = true,
    automatic_installation = true,
}
