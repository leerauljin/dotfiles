local status, go = pcall(require, "go")
if (not status) then return end

go.setup()

-- Run gofmt + goimport on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})
