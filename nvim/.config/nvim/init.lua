-- Map space to leader
vim.api.nvim_set_keymap('n', '<space>', '<nop>', {})
vim.api.nvim_set_keymap('v', '<space>', '<nop>', {})
vim.g.mapleader = " "

require('options')
require('mappings')
require('plugins')
require('theme')
