local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  lint.shellcheck,
  lint.write_good,
  lint.jsonlint,
  lint.yamllint,
  lint.markdownlint,
  lint.zsh,
  lint.pylint,
  formatting.black,
  formatting.prettierd,
  formatting.stylua,
  formatting.shellharden,
  formatting.yamlfix,
  formatting.beautysh,
  formatting.golines,
  formatting.mdformat,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = require "custom.util.saveform",
}
