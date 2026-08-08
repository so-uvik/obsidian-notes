vim.g.mapleader = " "

vim.opt.scrolloff = 8
vim.opt.textobjects = true
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.keymap.set('n', 'L', ':nexttab<CR>', { desc = 'Next tab' })
vim.keymap.set('n', 'H', ':prevtab<CR>', { desc = 'Previous tab' })
-- <leader><Space>: native quick switcher (find/create note)
vim.keymap.set('n', '<leader><Space>', function()
  vim.cmd('obcommand switcher:open')
end, { desc = 'Find or create note' })
