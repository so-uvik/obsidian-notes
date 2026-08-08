vim.g.mapleader = " "

vim.opt.scrolloff = 8
vim.opt.textobjects = true
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.keymap.set('n', 'L', ':nexttab<CR>', { desc = 'Next tab' })
vim.keymap.set('n', 'H', ':prevtab<CR>', { desc = 'Previous tab' })
