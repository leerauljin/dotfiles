return {
  {
    "jmbuhr/otter.nvim",
    opts = {
      buffers = {
        set_filetype = true,
        write_to_disk = true,
      },
    },
  },
  {
    "quarto-dev/quarto-nvim",
    cmd = { "QuartoActivate", "QuartoPreview" },
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
    },
    opts = {
      codeRunner = {
        enabled = true,
        default_method = "iron",
        never_run = { "yaml" },
      },
    },
  },
  {
    "Vigemus/iron.nvim",
    event = "VeryLazy",
    config = function()
      local iron = require("iron.core")
      local view = require("iron.view")
      local common = require("iron.fts.common")

      iron.setup({
        config = {
          scratch_repl = true,
          repl_definition = {
            sh = {
              command = { "zsh" },
            },
            python = {
              command = { "ipython", "--no-autoindent", "-i" },
              format = common.bracketed_paste,
              block_deviders = { "# %%", "#%%", "```" },
            },
            r = {
              command = { "radian" },
              format = common.bracketed_paste,
              block_deviders = { "```" },
            },
            stata = {
              command = { "stata-mp" },
              format = common.bracketed_paste,
              block_deviders = { "```" },
            },
          },
          repl_filetype = function(_, ft)
            return ft
          end,
          repl_open_cmd = view.split.vertical.botright(50),
        },
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      })
    end,
  },
}
