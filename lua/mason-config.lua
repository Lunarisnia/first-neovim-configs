require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls" }
})

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- Lua
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

-- GoPls
lspconfig.gopls.setup {
  cmd = { "gopls", "serve" },
  filetypes = {"go", "gomod"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
	unusedparams = true,
      },
      staticcheck = true,
    }
  }
}
