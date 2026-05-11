-- lua/config/options.lua
-- Options are loaded before lazy.nvim startup
-- LazyVim defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

-- Line numbers
opt.relativenumber = true -- relative line numbers (great for vim motions)
opt.number = true -- show current line number (hybrid with relativenumber)

-- Indentation
opt.tabstop = 4 -- 4 spaces per tab
opt.shiftwidth = 4 -- 4 spaces per indent
opt.expandtab = true -- spaces not tabs

-- Wrapping
opt.wrap = false -- no line wrap by default (toggle with <leader>uw)

-- Search
opt.ignorecase = true -- case-insensitive search
opt.smartcase = true -- unless uppercase is used

-- Appearance
opt.scrolloff = 8 -- keep 8 lines visible above/below cursor
opt.colorcolumn = "100" -- soft column guide at 100 chars

-- Ignore LazyVim load order warning
vim.g.lazyvim_check_order = false
