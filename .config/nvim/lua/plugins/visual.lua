return {
  {
    "goolord/alpha-nvim",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "catppuccin",
      },
    },
  },
}
