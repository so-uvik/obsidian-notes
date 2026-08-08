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

-- <leader>e: toggle left sidebar
vim.keymap.set('n', '<leader>e', function()
  vim.cmd('obcommand app:toggle-left-sidebar')
end, { desc = 'Toggle left sidebar' })

-- <leader>bd: close current tab — native Ctrl+W is untouched, this just adds an alternative
vim.keymap.set('n', '<leader>bd', function()
  vim.cmd('obcommand workspace:close')
end, { desc = 'Close current tab' })

-- <leader>bo: close every tab other than the current one
vim.keymap.set('n', '<leader>bo', function()
  vim.cmd('obcommand workspace:close-others')
end, { desc = 'Close other tabs' })
