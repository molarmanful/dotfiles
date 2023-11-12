local lspconfig = require "lspconfig"

local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

return function(lsps)
  for _, lsp in ipairs(lsps) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
  lspconfig.racket_langserver.setup {}

  require("mason-lspconfig").setup {
    ensure_installed = lsps,
  }
end
