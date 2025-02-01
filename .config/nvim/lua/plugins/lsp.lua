return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require('lspconfig').marksman.setup(
        { filetypes = { 'markdown', 'quarto' } }
      )
    end
  },
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
      automatic_installation = true,
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,
      },
    },
  },
}
