local opt = vim.opt

opt.number = true -- show the current line number
opt.relativenumber = true -- show the relative line number

opt.splitbelow = true -- when splitting a window, a new one appears below
opt.splitright = true -- when splitting a window, a new one appears on the right

opt.expandtab = true -- replace TAB with spaces
opt.tabstop = 4 -- how many spaces are going to replace TAB.

opt.clipboard = "unnamedplus" -- enable neovim to access system clipboard

opt.scrolloff = 999 -- cursor line is always in the middle of the window
