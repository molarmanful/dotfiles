local metals = require "metals"
local config = metals.bare_config()

config.settings = {
  showImplicitArguments = true,
}

config.capabilities = require("cmp_nvim_lsp").default_capabilities()

config.on_attach = require "custom.util.saveform"

local metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = metals_group,
  pattern = { "scala", "sbt" },
  callback = function()
    require("metals").initialize_or_attach(config)
  end,
})
