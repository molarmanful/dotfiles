local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

null_ls.setup {
  debug = true,
  sources = {
    formatting.raco_fmt,
    formatting.racket_fixw,
  },
  on_attach = require "custom.util.saveform",
}
