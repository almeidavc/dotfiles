vim.g.material_style = 'deep ocean'

require('material').setup({
  italics = {
    comments = true
  }
})

vim.cmd[[colorscheme material]]
