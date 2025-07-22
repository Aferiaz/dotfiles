return {
  -- NOTE: Treesitter
  { 
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy   = false,
    build  = ":TSUpdate",
    opts   = {
      ensure_installed = { 
        "lua", 
        "vimdoc",
        "markdown",
        "markdown_inline",
        "arduino",
        "bash",
        "cpp",
        "csv",
        "latex",
        "python",
        "tcl",
        "verilog",
        "perl",
      },
      sync_install = false, 
      auto_install = true,
    },
  },
  -- -- NOTE: Completion v1
  -- {
  --   "hrsh7th/nvim-cmp",
  --   version = false,
  --   event = "InsertEnter",
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --   },
  --   opts = function()
  --     local cmp = require("cmp")
  --     local defaults = require("cmp.config.default")()
  --     local auto_select = false
  --     return {
  --       completion = {
  --       },
  --       preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None, 
  --       mapping = cmp.mapping.preset.insert({
  --         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --         ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
  --         ["<C-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --         ["<CR>"] = cmp.mapping.confirm({
  --           select = auto_select,
  --           behavior = cmp.ConfirmBehavior.Insert,
  --         }),
  --         ["<Esc>"] = function(fallback)
  --           cmp.abort()
  --           fallback()
  --         end,
  --       }),
  --       sources = cmp.config.sources({
  --         { name = "path" },
  --         { name = "nvim_lua" },
  --         -- { name = "nvim_lsp" },
  --         { name = "treesitter" },
  --         { name = "obsidian.nvim" },
  --         { name = "buffer" },
  --       }),
  --
  --     }
  --   end,
  -- },
  -- NOTE: Completion v2
  {
    'saghen/blink.cmp',
    dependencies = { 
      'rafamadriz/friendly-snippets'
    },
    version = '1.*',
    opts = {
      -- INFO: See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { 
        preset = 'none',
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback'},
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback'},
        ['<C-y>'] = { 'select_and_accept', 'fallback_to_mappings'},
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
}
