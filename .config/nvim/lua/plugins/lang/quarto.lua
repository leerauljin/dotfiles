return {
  {
    "jmbuhr/otter.nvim",
    opts = {
      buffers = {
        set_filetype = true,
        write_to_disk = true,
      },
    },
    config = function(_, opts)
      require("otter").setup(opts)
      vim.treesitter.language.register("markdown", { "quarto", "rmd" })
    end,
  },
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
    },
    opts = {
      codeRunner = {
        enabled = true,
        default_method = "molten",
        never_run = { "yaml" },
      },
    },
    keys = {
      { "<leader>na", ":QuartoActivate<cr>", desc = "activate" },
      { "<leader>np", ":QuartoPreview<cr>", desc = "preview" },
      { "<leader>nq", ":QuartoClosePreview<cr>", desc = "quiet preview" },
    },
  },
}
