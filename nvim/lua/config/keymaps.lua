local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- In terminal mode, C-; gets you out of termianl to normal mode
vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)
