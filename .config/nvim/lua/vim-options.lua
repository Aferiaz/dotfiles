-- Tab Options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set colorcolumn=80")
vim.cmd("set textwidth=80 linebreak")
vim.cmd("set conceallevel=1")
vim.cmd("set number")
vim.wo.relativenumber = true
-- Map Leader
vim.g.mapleader = " "
-- Keymaps
vim.api.nvim_set_keymap('v', '<C-c>', '"*y', { noremap = true, silent = true})

