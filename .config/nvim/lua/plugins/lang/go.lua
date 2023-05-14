return {
  {
    "ray-x/go.nvim",
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
  },
  {
    'olexsmir/gopher.nvim',
    ft = 'go'
  },
}
