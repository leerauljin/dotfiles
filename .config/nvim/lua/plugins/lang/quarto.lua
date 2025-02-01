return {
  {
    "jmbuhr/otter.nvim",
    opts = {
      buffers = {
        set_filetype = false,
        write_to_disk = true,
      },
    },
    config = function(_, opts)
      require('otter').setup(opts)
      vim.treesitter.language.register("markdown", { "quarto", "rmd" })
    end
  },
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
    },
    opts = {},
    keys = {
      { "<leader>na", ":QuartoActivate<cr>",     desc = "activate" },
      { "<leader>np", ":QuartoPreview<cr>",      desc = "preview" },
      { "<leader>nq", ":QuartoClosePreview<cr>", desc = "quiet preview" },
    }
  },
}
