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
  "dockerls",
  "yamlls",
  "unocss",
  "hls",
  "gopls",
  "clangd",
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
  "hadolint",
  "clang-format",
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
    opts = require "custom.configs.mason-null-ls"(fmts),
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
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    opts = {
      ensure_installed = syns,
      autotag = {
        enable = true,
      },
    },
    config = function(_, opts)
      require "custom.configs.treesitter"(opts)
    end,
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
    "nvim-telescope/telescope-file-browser.nvim",
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
    "ggandor/flit.nvim",
    lazy = false,
    opts = {},
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "sindrets/diffview.nvim",
    },
    config = true,
  },

  {
    "NvChad/nvterm",
    opts = {
      behavior = {
        auto_insert = false,
      },
    },
  },
}
