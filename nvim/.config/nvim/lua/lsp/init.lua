local null_ls = require('lsp.null-ls')
local sumneko = require('lsp.sumneko')
local tsserver = require('lsp.tsserver')
local html = require('lsp.html')
local cssls = require('lsp.cssls')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

  -- Format on save
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec([[
      augroup LspFormatOnSave
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      augroup END
    ]], false)
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local flags = { debounce_text_changes = 150 }

local servers = {
  null_ls,
  sumneko,
  tsserver,
  html,
  cssls
}

local function setup_servers()
  for _, server in pairs(servers) do
    server.setup(on_attach, capabilities, flags)
  end
end

setup_servers()
