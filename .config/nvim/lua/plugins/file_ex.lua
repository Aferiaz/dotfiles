return {
  'stevearc/oil.nvim',
  opts = {
    columns = {
    "icon",
    "size",
    },
    delete_to_trash = true,
    view_options = {
      float = {
        max_width = 0.3,
        max_height = 0.3,
      },
    },
  },
  dependencies = {
    "echansnovski/mini.icons",
  },
  lazy = false,
  keys = {
    {
      '<C-n>', 
      function() 
        local bufname = vim.fn.bufname()
        if bufname == "" then
          require("oil").toggle_float(".")
        else
          require("oil").toggle_float(vim.fn.expand("%:p:h"))
        end
      end, 
      desc = "Toggle Oil Float", 
      noremap = true, 
      silent = true
    },
  },
}
