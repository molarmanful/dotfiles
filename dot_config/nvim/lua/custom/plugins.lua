return {

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ensure_installed = {
            "lua-language-server",
            "html-lsp",
            "prettierd",
            "stylua",
            "svelte-language-server",
            "ormolu",
            "haskell-language-server",
            "unocss-language-server",
            "eslint-lsp",
            "shellcheck",
            "bash-language-server",
            "semgrep",
            "black",
            "julia-lsp",
            "json-lsp",
            "jsonlint",
            "marksman",
            "markdownlint",
            "pylint",
            "rust-analyzer",
            "beautysh",
            "shellharden",
            "stylelint-lsp",
            "write-good",
            "yaml-language-server",
            "yamllint",
            "yamlfix",
            "unocss-language-server",
            "gopls",
          },
        },
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          automatic_installation = true,
        },
      },
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
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
      ensure_installed = {
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
        "zig",
        "scala",
        "haskell",
        "julia",
        "markdown",
        "markdown_inline",
        "toml",
        "yaml",
        "rust",
        "bash",
        "java",
      },
    },
  },

  {
    "github/copilot.vim",
    lazy = false,
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
