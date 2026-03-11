vim.g.mapleader = " "

-- Window Navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "Move focus to the left window" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "Move focus to the right window" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = "Move focus to the lower window" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = "Move focus to the upper window" })

-- Better Indenting (stay in visual mode after indenting)
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Line Numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- System Clipboard
vim.opt.clipboard = "unnamedplus"

-- SRE / Developer Experience
vim.opt.scrolloff = 8         -- Keep 8 lines above/below cursor
vim.opt.updatetime = 50       -- Faster completion & diagnostic response
vim.opt.mouse = "a"           -- Enable mouse support (just in case)
vim.opt.termguicolors = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
