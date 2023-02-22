local opt = vim.opt

vim.g.mapleader = " "
opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.spell = true
opt.wrap = false
opt.scrolloff = 10
opt.sidescrolloff = 10

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.list = true
opt.listchars = { tab = ". ", trail = "." }

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
opt.undofile = true
