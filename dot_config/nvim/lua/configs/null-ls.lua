local null_ls = require 'null-ls'

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

null_ls.setup {
  debug = true,
  sources = {
    lint.fish,
    lint.gdlint,
    formatting.fish_indent,
    formatting.gdformat,
  },
  on_attach = require 'util.saveform',
}
