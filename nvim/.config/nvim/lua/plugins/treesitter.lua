require('nvim-treesitter.configs').setup {
  highlight = { enable = true },
  ensure_installed = {
      'lua',
      'javascript',
      'html',
      'css',
  },
}
