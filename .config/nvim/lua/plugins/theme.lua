return {
  -- themes
  -- {
  --   'sainnhe/gruvbox-material',
  --   lazy = false,
  --   config = function()
  --     vim.g.gruvbox_material_better_performance = 1
  --     vim.g.gruvbox_material_transparent_background = 1
  --     vim.g.gruvbox_material_background = 'hard'
  --     vim.cmd('colorscheme gruvbox-material')
  --   end
  -- },
  -- {
  --   'jesseleite/nvim-noirbuddy',
  --   lazy = false,
  --   dependencies = {
  --     "tjdevries/colorbuddy.nvim"
  --   },
  --   main = 'noirbuddy',
  --   opts = {}
  -- },
  {
    'RRethy/nvim-base16',
    lazy = false,
    main = 'base16-colorscheme',
    opts = {
      base00 = '#e6e6e6',
      base01 = '#cccccc',
      base02 = '#b9b9b9',
      base03 = '#ababab', -- comment
      base04 = '#cecece', -- line number
      base05 = '#464646',
      base06 = '#252525',
      base07 = '#101010',
      base08 = '#7c7c7c', -- variables
      base09 = '#999999', -- constant/number
      base0A = '#a0a0a0', -- construct/type
      base0B = '#000000', -- string
      base0C = '#868686', -- ?
      base0D = '#5e5e5e', -- functions
      base0E = '#ff5f57', -- keywords
      base0F = '#0069f1', -- punctuations
    }
  }
}
