vim.treesitter.language.register("markdown", { "quarto", "rmd" })

local runner = require("quarto.runner")
vim.keymap.set("n", "<leader>na", ":QuartoActivate<cr>", { desc = "activate", silent = true })
vim.keymap.set("n", "<leader>np", ":QuartoPreview<cr>", { desc = "preview", silent = true })
vim.keymap.set("n", "<leader>nq", ":QuartoClosePreview<cr>", { desc = "close preview", silent = true })
vim.keymap.set("n", "<leader>nc", runner.run_cell,  { desc = "run cell", silent = true })
vim.keymap.set("n", "<leader>nr", runner.run_above, { desc = "run cell and above", silent = true })
vim.keymap.set("n", "<leader>nA", runner.run_all,   { desc = "run all cells", silent = true })
vim.keymap.set("n", "<leader>nl", runner.run_line,  { desc = "run line", silent = true })
vim.keymap.set("n", "<leader>nR", function()
  runner.run_all(true)
end, { desc = "run all cells of all languages", silent = true })
