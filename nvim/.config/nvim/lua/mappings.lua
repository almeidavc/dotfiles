local map = vim.api.nvim_set_keymap

map('i', 'jk', '<Esc>', { noremap = true })
map('n', '<BS>', '<C-^>', { noremap = true })

-- Move between windows
map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })

-- nvim-tree
map('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true })

-- Clear last search
map('n', '<leader>/', [[:let @/ = ""<CR>]], { noremap = true })
