return {
  {
    'goolord/alpha-nvim',
    opts = function()
      local dashboard               = require 'alpha.themes.dashboard'

      dashboard.section.header.val  = {
        [[                                  __]],
        [[     ___     ___    ___   __  __ /\_\    ___ ___]],
        [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
        [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
        [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      }
      dashboard.section.buttons.val = {

        dashboard.button('SPC f f', '  Find File  ', ':Telescope find_files<CR>'),
        dashboard.button('SPC f o', '  Recent File  ', ':Telescope oldfiles<CR>'),
        dashboard.button('SPC f g', '  Find Word  ', ':Telescope live_grep<CR>'),
        dashboard.button('SPC b m', '  Bookmarks  ', ':Telescope marks<CR>'),
        dashboard.button('SPC h t', '  Themes  ', ':Telescope themes<CR>'),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = 'AlphaButtons'
        button.opts.hl_shortcut = 'AlphaShortcut'
      end
      -- dashboard.section.header.opts.hl = "Keyword"
      -- dashboard.section.buttons.opts.hl = "AlphaButtons"
      -- dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.opts.layout[1].val = 5
      return dashboard.opts
    end,
  },
}
