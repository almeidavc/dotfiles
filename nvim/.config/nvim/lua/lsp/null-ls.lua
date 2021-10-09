local lspconfig = require('lspconfig')
local null_ls = require('null-ls')

local M = {}

local sources = {
  -- null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.formatting.prettierd
}

M.setup = function(on_attach)
  null_ls.config({ sources = sources })
  lspconfig['null-ls'].setup({
    on_attach = on_attach
  })
end

return M
