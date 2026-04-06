local opt = vim.opt

opt.number = true -- show the current line number
opt.relativenumber = true -- show the relative line number

opt.splitbelow = true -- when splitting a window, a new one appears below
opt.splitright = true -- when splitting a window, a new one appears on the right

opt.expandtab = true -- replace TAB with spaces
opt.shiftwidth = 4 -- how many spaces are going to replace TAB.
opt.tabstop = 4 -- how many spaces are going to replace TAB.

opt.clipboard = "unnamedplus" -- enable neovim to access system clipboard

opt.scrolloff = 999 -- cursor line is always in the middle of the window

opt.virtualedit = "block" -- In block mode, the cursor can be positioned where there is no actual character.

opt.inccommand = "split" -- show the results of :s in the split view

opt.ignorecase = true -- ignore case in search patterns 

opt.termguicolors = true -- set term gui colors (most terminals support this)

opt.showtabline = 1 -- always show tabs

opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

opt.cursorline = true -- highlight the current line

opt.wrap = false -- display lines as one long line

opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
