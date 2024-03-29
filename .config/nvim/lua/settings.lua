local cmd = vim.cmd
local opt = vim.opt
local fn = vim.fn
local g = vim.g
local api = vim.api
local indent = 2

cmd "syntax enable"
cmd "filetype plugin indent on"
cmd "colorscheme molokai"

-- Global Options
opt.background = "dark"
opt.backup = false
opt.compatible = false
opt.completeopt = "menu,menuone,noselect"
opt.guifont = "FiraCode_NF"
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.lazyredraw = true
opt.mouse = "v"
opt.showcmd = false
opt.showmatch = true
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 500
opt.ttimeoutlen = 100
opt.termguicolors = true
opt.undodir = fn.getenv("HOME") .. "/.config/nvim/undodir"
opt.wildmode = "longest,list"

-- Buffer Local Options
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = indent
opt.smartindent = true
opt.swapfile = false
opt.tabstop = indent
opt.undofile = true

-- Window Local Options
opt.cursorline = true
opt.number = true
opt.signcolumn = "yes"
opt.wrap = true

-- Leader
g.mapleader = " "

-- Set : to command globally so it always works
api.nvim_set_keymap("n", ";", ":", {noremap = true})
api.nvim_set_keymap("n", ":", ";", {noremap = true})
