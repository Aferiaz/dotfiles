local ps_vscode = {layout = {preset = "vscode"}}
local ps_dropd = {layout = {preset = "dropdown"}}
return {
  "folke/snacks.nvim",
  keys = {
    {"<leader>ff", function() Snacks.picker.files({cwd = vim.fn.getcwd(0)}) end, desc = "Find Files"},
    {"<leader>fg", function() Snacks.picker.grep({cwd = vim.fn.getcwd(0)}) end, desc = "Grep"},
    {"<leader>fm", function() Snacks.picker.marks(ps_vscode) end, desc = "Marks"},
    {"<leader>fc", function() Snacks.picker.colorschemes(ps_dropd) end, desc = "Colorschemes"},
    {"<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages"},
    {"<leader>fr", function() Snacks.picker.registers() end, desc = "Registers"},
    {"<leader>fb", function() Snacks.picker.buffers(ps_vscode) end, desc = "Buffers"},
  },
}
