return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      background = "mocha",
      transparent_background = true,
      show_end_of_buffer = true,
      styles = {
        comments = "italic",
        functions = "bold",
        conditionals = "italic",
      },
      default_integrations = true,
      integrations = {
        treesitter = true,
        gitsigns   = true,
        alpha      = true,
        snacks     = {
          enabled = true,
          indent_scope_color = "",
        },
        indent_blankline = {
          enabled = true,
          scope_color = "",
          colored_indent_levels = true,
        },
        render_markdown = true,
        which_key = true,
      },
    },
    config = function()
      vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
