local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = {
  "lua_ls",
  "html",
  "cssls",
  "stylelint_lsp",
  "metals",
  "svelte",
  "hls",
  "unocss",
  "eslint",
  "bashls",
  "jsonls",
  "rust_analyzer",
  "yamlls",
  "marksman",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
