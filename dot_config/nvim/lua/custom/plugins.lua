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
  "clojure_lsp",
  "perlnavigator",
}

local fmts = {
  "prettierd",
  "black",
  "pylint",
  "stylua",
  "fixjson",
  "markdownlint",
  "mdformat",
  "shfmt",
  "shellharden",
  "write-good",
  "yamllint",
  "yamlfix",
  "gci",
  "golines",
  "hadolint",
  "zprint",
  "clang-format",
  "actionlint",
  "fourmolu",
  "perlimports",
  "perltidy",
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
  "perl",
  "markdown",
  "markdown_inline",
  "toml",
  "yaml",
  "rust",
  "bash",
  "java",
  "clojure",
  "fish",
}

return {

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {},
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require "custom.configs.lspconfig" (lsps)
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    config = function()
      require "custom.configs.null-ls"
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    opts = require "custom.configs.mason-null-ls" (fmts),
  },

  {
    "scalameta/nvim-metals",
    ft = { "scala", "sbt", "java" },
    config = require "custom.configs.nvim-metals",
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
      require "custom.configs.treesitter" (opts)
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
    priority = 100,
    lazy = false,
    opts = {
      use_git_branch = true,
      autoload = true,
    },
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
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
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

  {
    "gpanders/nvim-parinfer",
    ft = { "clojure", "scheme", "lisp" },
  },

  {
    "Olical/conjure",
    ft = { "clojure", "fennel", "python" },
    dependencies = {
      "PaterJason/cmp-conjure",
    },
    config = function()
      require("conjure.main").main()
      require("conjure.mapping")["on-filetype"]()
    end,
  },

  {
    "lukas-reineke/headlines.nvim",
    ft = { "markdown", "rmd", "norg", "org" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
  },

  {
    "preservim/vim-markdown",
    ft = { "markdown" },
    branch = "master",
  },

  -- {
  --   "olimorris/codecompanion.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-telescope/telescope.nvim",
  --   },
  --   lazy = false,
  --   config = function()
  --     require("codecompanion").setup {
  --       adapters = {
  --         anthropic = require("codecompanion.adapters").use("anthropic", {
  --           env = {
  --             api_key = "ANTHROPIC_KEY",
  --           },
  --           schema = {
  --             model = {
  --               default = "claude-3-5-sonnet-20240620",
  --             },
  --           },
  --         }),
  --       },
  --       strategies = {
  --         chat = "anthropic",
  --         inline = "anthropic",
  --         tool = "anthropic",
  --       },
  --     }
  --   end,
  -- },
}
