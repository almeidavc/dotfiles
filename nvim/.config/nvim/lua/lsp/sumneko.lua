local lspconfig = require('lspconfig')

local M = {}

-- path to sumneko installation
local sumneko_root = vim.fn.getenv('HOME') .. '/.local/share/lua-language-server/'
local sumneko_bin = sumneko_root .. 'bin/macos/lua-language-server'
local settings = {
  Lua = {
    runtime = { version = 'LuaJIT' },
    diagnostics = {
      globals = {'vim'},
    },
  },
}

M.setup = function(on_attach, capabilities, flags)
  lspconfig.sumneko_lua.setup({
    cmd = { sumneko_bin, '-E', sumneko_root .. 'main.lua' },
    on_attach = on_attach,
    capabilities = capabilities,
    flags = flags,
    settings = settings
  })
end

return M
