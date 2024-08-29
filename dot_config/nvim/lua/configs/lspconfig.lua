local lspconfig = require 'lspconfig'
local set = vim.keymap.set

local configs = require 'nvchad.configs.lspconfig'
local on_attach = function(client, bufnr)
  configs.on_attach(client, bufnr)
  set('n', 'gd', '<cmd> Telescope lsp_definitions <CR>', { desc = 'telescope Find LSP definitions' })
  set('n', 'gr', '<cmd> Telescope lsp_references <CR>', { desc = 'telescope Find LSP references' })
end
local capabilities = configs.capabilities

local overrides = {
  yamlls = {
    settings = {
      yaml = {
        schemas = {
          ['https://json.schemastore.org/github-workflow.json'] = '/.github/workflows/*',
        },
      },
    },
  },

  eslint = {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        command = 'EslintFixAll',
      })
    end,
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
      'vue',
      'html',
      'markdohn',
      'json',
      'jsonc',
      'yaml',
      'toml',
      'xml',
      'gql',
      'graphql',
      'astro',
      'svelte',
      'css',
      'less',
      'scss',
      'pcss',
      'postcss',
    },
    settings = {
      -- rulesCustomizations = {
      --   { rule = 'style/*',   severity = 'off', fixable = true },
      --   { rule = 'format/*',  severity = 'off', fixable = true },
      --   { rule = '*-indent',  severity = 'off', fixable = true },
      --   { rule = '*-spacing', severity = 'off', fixable = true },
      --   { rule = '*-spaces',  severity = 'off', fixable = true },
      --   { rule = '*-order',   severity = 'off', fixable = true },
      --   { rule = '*-dangle',  severity = 'off', fixable = true },
      --   { rule = '*-nehline', severity = 'off', fixable = true },
      --   { rule = '*quotes',   severity = 'off', fixable = true },
      --   { rule = '*semi',     severity = 'off', fixable = true },
      -- },
    },
  },
}

return function(lsps)
  for _, lsp in ipairs(lsps) do
    if lsp == 'tsserver' then
      goto continue
    end

    local res = {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    for k, v in pairs(overrides[lsp] or {}) do
      res[k] = v
    end
    lspconfig[lsp].setup(res)

    ::continue::
  end

  require('mason-lspconfig').setup {
    ensure_installed = lsps,
  }
end
