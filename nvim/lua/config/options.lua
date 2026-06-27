-- General editor options

-- Leader key (set before any mappings / plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- Line numbers: hybrid (absolute on current line, relative elsewhere)
opt.number = true
opt.relativenumber = true

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Misc
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.splitright = true
opt.splitbelow = true
