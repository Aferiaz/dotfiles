return {
  -- TODO: Add descriptions for each plugin for easy search with grep
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main   = "ibl",
  --   config = function()
  --     require('ibl').setup()
  --   end,
  -- },

  {
    "m4xshen/hardtime.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      disable_mouse = false,
    },
  },

  {
    "tris203/precognition.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    version = "*",
    -- TODO: Add custom for divider
    opts = {},
    -- TODO: Integrate with snacks picker
  },

  {
    "junegunn/vim-easy-align",
    keys = {
      {'ga', '<Plug>(EasyAlign)', mode = 'x', desc = "Visual Easy Align"},
      {'ga', '<Plug>(EasyAlign)', mode = 'n', desc = "Normal Easy Align"}
    },
  },
}
