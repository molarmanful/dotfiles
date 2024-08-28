local lspconfig = require "lspconfig"

local configs = require "nvchad.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local overrides = {
  yamlls = {
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        },
      },
    },
  },
}

return function(lsps)
  for _, lsp in ipairs(lsps) do
    local res = {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    for k, v in pairs(overrides[lsp] or {}) do
      res[k] = v
    end
    lspconfig[lsp].setup(res)
  end

  require("mason-lspconfig").setup {
    ensure_installed = lsps,
  }
end
