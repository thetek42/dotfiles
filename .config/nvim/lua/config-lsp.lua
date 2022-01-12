local lsp = require 'lspconfig'

local capabilities = require 'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())



--- C ---

lsp.ccls.setup {
  capabilities = capabilities,
}



--- JAVASCRIPT / TYPESCRIPT ---

lsp.quick_lint_js.setup {
  capabilities = capabilities,
}



--- LATEX ---

lsp.texlab.setup {
  capabilities = capabilities,
}



--- LUA ---

local lua_runtime_path = vim.split(package.path, ';')
table.insert(lua_runtime_path, 'lua/?.lua')
table.insert(lua_runtime_path, 'lua/?/init.lua')

lsp.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = lua_runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = {
        enable = false,
      },
    },
  },

  capabilities = capabilities,
}



--- PYTHON ---

lsp.pylsp.setup {}

