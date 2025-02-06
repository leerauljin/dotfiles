return {
  -- themes
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_background = 'hard'
      vim.cmd('colorscheme gruvbox-material')
      vim.cmd('hi MiniCursorword guibg=#282828')
      vim.cmd('hi MiniCursorwordCurrent guibg=#3c3836')
    end
  },
}
