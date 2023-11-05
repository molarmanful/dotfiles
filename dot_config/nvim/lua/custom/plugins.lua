local lsps = {
  "lua_ls",
  "html",
  "svelte",
  "unocss",
  "eslint",
  "bashls",
  "marksman",
  "rust_analyzer",
  "stylelint_lsp",
  "yamlls",
  "unocss",
  "hls",
  "gopls",
}

local fmts = {
  "prettierd",
  "black",
  "stylua",
  "semgrep",
  "fixjson",
  "markdownlint",
  "mdformat",
  "pylint",
  "beautysh",
  "shellcheck",
  "shellharden",
  "write-good",
  "yamllint",
  "yamlfix",
  "gci",
  "golines",
}

local syns = {
  "vim",
  "lua",
  "html",
  "css",
  "javascript",
  "typescript",
  "tsx",
  "json",
  "svelte",
  "c",
  "go",
  "zig",
  "scala",
  "haskell",
  "markdown",
  "markdown_inline",
  "toml",
  "yaml",
  "rust",
  "bash",
  "java",
}

return {

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "ormolu",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require "custom.configs.lspconfig"(lsps)
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "custom.configs.null-ls"
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    opts = {
      ensure_installed = fmts,
      automatic_installation = true,
      handlers = {
        gci = function() end,
        golines = function()
          local null_ls = require "null-ls"
          local h = require "null-ls.helpers"
          null_ls.register(h.make_builtin {
            name = "golines",
            method = null_ls.methods.FORMATTING,
            filetypes = { "go" },
            generator_opts = {
              command = "golines",
              args = { "--base-formatter", "gci", "--", "$FILENAME" },
              to_stdin = true,
            },
            factory = h.formatter_factory,
          })
        end,
      },
    },
  },

  {
    "scalameta/nvim-metals",
    lazy = false,
    config = function()
      require "custom.configs.nvim-metals"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = syns,
    },
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "custom.configs.cmp"
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  {
    "olimorris/persisted.nvim",
    opts = {
      use_git_branch = true,
      autoload = true,
    },
    lazy = false,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = require "custom.configs.telescope",
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = true,
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "sindrets/diffview.nvim",
    },
    config = true,
  },
}
