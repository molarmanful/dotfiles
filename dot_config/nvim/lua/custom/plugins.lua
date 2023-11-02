local plugins = {

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "stylelint-lsp",
        "prettier",
        "stylua",
        "metals",
        "svelte-language-server",
        "hls",
        "unocss-language-server",
        "eslint",
        "shellcheck",
        "bash-language-server",
      },
    },
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
    config = function()
      require "plugins.configs.telescope"
      require "custom.configs.telescope"
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
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
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "sindrets/diffview.nvim",
    },
    config = true,
  },
}

return plugins
