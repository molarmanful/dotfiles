return function(self)
  local config = require("metals").bare_config()

  config.settings = {
    showImplicitArguments = true,
  }

  config.capabilities = require("cmp_nvim_lsp").default_capabilities()

  config.on_attach = require "custom.util.saveform"

  local metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = self.ft,
    callback = function()
      require("metals").initialize_or_attach(config)
    end,
    group = metals_group,
  })
end
