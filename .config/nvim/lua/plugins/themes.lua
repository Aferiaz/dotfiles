return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "latte",
      background = "latte",
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
        -- indent_blankline = {
          -- enabled = true,
          -- scope_color = "",
          -- colored_indent_levels = true,
        -- },
        render_markdown = true,
        which_key = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
              ok = { "italic" },
          },
          underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
              ok = { "underline" },
          },
          inlay_hints = {
              background = true,
          },
        },
        blink_cmp = {
          style = 'bordered',
        },
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
