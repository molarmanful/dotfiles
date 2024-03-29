local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

null_ls.setup {
  debug = true,
  sources = {
    lint.fish,
    formatting.fish_indent,
  },
  on_attach = require "custom.util.saveform",
}
