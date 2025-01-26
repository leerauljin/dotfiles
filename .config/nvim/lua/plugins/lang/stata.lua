return {
  {
    "leerauljin/do-stata.nvim",
    opts = { stata_ver = "StataMP" },
    ft = { "stata" }
  },
  {
    "poliquin/stata-vim",
    ft = { "stata" },
    config = function()
      local Rule = require('nvim-autopairs.rule')
      local autopairs = require('nvim-autopairs')
      autopairs.remove_rule('`')
      autopairs.add_rule(Rule("`", "'", "stata"))
      autopairs.add_rule(Rule("`", "`", "-stata"))
    end,
  }
}
