local cmp = require('cmp')
local luasnip = require('luasnip')

local check_back_space = function()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local tab = function(fallback)
  if vim.fn.pumvisible() == 1 then
    vim.fn.feedkeys(t('<C-n>'), 'n')
  elseif luasnip.expand_or_jumpable() then
    vim.fn.feedkeys(t('<Plug>luasnip-expand-or-jump'), '')
  elseif check_back_space() then
    vim.fn.feedkeys(t('<Tab>'), 'n')
  else
    fallback()
  end
end

local shift_tab = function(fallback)
  if vim.fn.pumvisible() == 1 then
    vim.fn.feedkeys(t('<C-p>'), 'n')
  elseif luasnip.jumpable(-1) then
    vim.fn.feedkeys(t('<Plug>luasnip-jump-prev'), '')
  else
    fallback()
  end
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(tab, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(shift_tab, { 'i', 's' })
  },
  sources = {
    -- cmp-nvim-lsp
    { name = 'nvim_lsp' },
    -- cmp-buffer
    { name = 'buffer' },
    -- cmp_luasnip
    { name = 'luasnip' }
  },
})
