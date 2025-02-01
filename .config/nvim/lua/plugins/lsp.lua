return {
  { "neovim/nvim-lspconfig", },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,
      },
    },
  },
}
